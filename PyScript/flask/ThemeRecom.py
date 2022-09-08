from configparser import Interpolation
from flask import Flask # 플라스크 클래스 임포트
from flask import request, redirect
from sklearn.cluster import KMeans
import scipy.spatial.distance as distance 
import cx_Oracle
import numpy as np
import cv2
import os

app = Flask(__name__) # 내장변수 name을 이용해 서버를 구동시키는 객체 생성

def userRgb(requestCol):
    return sorted([tuple(map(int, i.split(','))) for i in requestCol], key= lambda x:(x[0], x[1], x[2]))

def userImg(img):
    destPath = r"C:\\eGovFrame-4.0.0\\First_Project\\projectImg\\userImg"
    for i in os.listdir(destPath):
        if i == img:
            return os.path.join(destPath, i)

def dbConnection():
    dsn = cx_Oracle.makedsn("project-db-stu.ddns.net", 1524, service_name = "XE")
    connection = cx_Oracle.connect(user = "gjai_4_3_0822", password="smhrd3", dsn=dsn, encoding="utf-8")
    cursor = connection.cursor()
    return cursor, connection

def ThemeRgb(lang):
    cur, conn = dbConnection()
    resultLi = []
    
    sql = f"SELECT THEME_SEQ, THEME_COL1 , THEME_COL2 , THEME_COL3 , THEME_COL4 , THEME_COL5 FROM D_THEME dt WHERE THEME_FONT = 'JetBrains Mono' AND THEME_LANG = '{lang}' ORDER BY THEME_INSTALLCNT DESC"
        
    for row in cur.execute(sql):
        resultLi.append((str(row[0]),[tuple(map(int, i.split(","))) for i in row[1:]]))
        
    cur.close()
    conn.close()
    return resultLi

def calDistance(requestForm):
    requestCol, requestLang = requestForm.split(":")[:-1], requestForm.split(":")[-1]
    usercol = userRgb(requestCol)
    themeExtract = ThemeRgb(requestLang)
    
    resultLi = []
    
    for theme in themeExtract:
        resultLi.append((theme[0], np.mean([min([distance.pdist(np.array([tc, uc])).min() for tc in theme[1]]) for uc in usercol])))
    
    result = sorted(resultLi, key=lambda x:x[1])
    return ":".join([i[0] for i in result[:8]])

def imread(filename, flags=cv2.IMREAD_COLOR, dtype=np.uint8):
    try:
        n = np.fromfile(filename, dtype)
        img = cv2.imdecode(n, flags)
        return img
    except Exception as e:
        print(e)
        return None

def ImgToTheme(lang, img):
    imgpath = userImg(img)
    Img = imread(imgpath)
    Imgrgb = cv2.cvtColor(Img, cv2.COLOR_BGR2RGB)
    h, w, c = Imgrgb.shape
    
    if h > 600 or w > 800:
        if h > 600 and w > 800:
            Imgrgb = cv2.resize(Imgrgb, dsize=(800, 600), interpolation=cv2.INTER_AREA)
        elif h > 600:
            Imgrgb = cv2.resize(Imgrgb, dsize=(w, 600), interpolation=cv2.INTER_AREA)
        elif w > 800:
            Imgrgb = cv2.resize(Imgrgb, dsize=(800, h), interpolation=cv2.INTER_AREA)
            
    imgrgb_pixel = Imgrgb.reshape((-1, 3))
    imgKm = KMeans(n_clusters=5).fit(imgrgb_pixel)
    centers = imgKm.cluster_centers_
    
    themeExtract = ThemeRgb(lang)
    
    resultLi = []
    
    for theme in themeExtract:
        resultLi.append((theme[0], np.mean([min([distance.pdist(np.array([tc, uc])).min() for tc in theme[1]]) for uc in centers])))
    
    result = sorted(resultLi, key=lambda x:x[1])
    
    os.remove(imgpath)
    
    return ":".join([i[0] for i in result[:8]])

@app.route("/ColorRecommend", methods=["GET",'POST'])
def ColorRecommend() :
    if request.method == 'POST' :
        # display(request.form)
        return "Error";
    else :
        print(request.args['ColorData'])
        recommedTheme = calDistance(request.args['ColorData'])
        print(recommedTheme)
        return recommedTheme

@app.route("/ImgRecommend", methods=["GET", "POST"])
def ImgRecommend():
    if request.method == 'POST':
        print(request.form)
        return "Error"
    else:
        print(request.args)
        recommendTheme = ImgToTheme(request.args['lang'], request.args['userImg'])
        print(recommendTheme)
        return recommendTheme

if __name__ == "__main__" :
    app.run()