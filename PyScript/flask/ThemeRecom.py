from flask import Flask # 플라스크 클래스 임포트
from flask import request, redirect
import scipy.spatial.distance as distance 
import cx_Oracle
import numpy as np

app = Flask(__name__) # 내장변수 name을 이용해 서버를 구동시키는 객체 생성

def userRgb(requestForm):
    return sorted([tuple(map(int, i.split(','))) for i in requestForm.split(":")], key= lambda x:(x[0], x[1], x[2]))

def dbConnection():
    dsn = cx_Oracle.makedsn("project-db-stu.ddns.net", 1524, service_name = "XE")
    connection = cx_Oracle.connect(user = "gjai_4_3_0822", password="smhrd3", dsn=dsn, encoding="utf-8")
    cursor = connection.cursor()
    return cursor, connection

def ThemeRgb():
    cur, conn = dbConnection()
    resultLi = []
    for row in cur.execute("SELECT THEME_SEQ, THEME_COL1 , THEME_COL2 , THEME_COL3 , THEME_COL4 , THEME_COL5  FROM D_THEME dt"):
        resultLi.append({str(row[1]) : [tuple(map(int, i.split(","))) for i in row[1:]]})
        
    cur.close()
    conn.close()
    return resultLi

def calDistance(requestForm):
    usercol = userRgb(requestForm)
    themeExtract = ThemeRgb()
    
    for seq, themecol in themeExtract.items():
        themeExtract[seq] = [np.mean([distance.pdist(np.array([tc, uc])).min() for tc in themecol]) for uc in usercol]
    
    # print(themeExtract) #check
    result = sorted(themeExtract.items(), key=lambda x:x[1])
    
    return ":".join([i[0] for i in result[:8]])

@app.route("/ColorRecommend", methods=["GET",'POST'])
def ColorRecommend() :
    if request.method == 'POST' :
        # display(request.form)
        return "Error?";
    else :
        recommedTheme = calDistance(request.args['ColorData'])
        print(recommedTheme)
        return recommedTheme

if __name__ == "__main__" : # .py 파일에서 main함수 역할
    app.run()