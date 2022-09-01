from flask import Flask # 플라스크 클래스 임포트
from flask import request, redirect
import scipy.spatial.distance as distance 
import cx_Oracle
import numpy as np

app = Flask(__name__) # 내장변수 name을 이용해 서버를 구동시키는 객체 생성

def userRgb(requestCol):
    return sorted([tuple(map(int, i.split(','))) for i in requestCol], key= lambda x:(x[0], x[1], x[2]))

def dbConnection():
    dsn = cx_Oracle.makedsn("project-db-stu.ddns.net", 1524, service_name = "XE")
    connection = cx_Oracle.connect(user = "gjai_4_3_0822", password="smhrd3", dsn=dsn, encoding="utf-8")
    cursor = connection.cursor()
    return cursor, connection

def ThemeRgb(lang):
    cur, conn = dbConnection()
    resultLi = []
    
    sql = f"SELECT THEME_SEQ, THEME_COL1 , THEME_COL2 , THEME_COL3 , THEME_COL4 , THEME_COL5 FROM D_THEME dt WHERE THEME_FONT = 'JetBrains Mono' AND THEME_LANG = '{lang}' ORDER BY THEME_SEQ "
        
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

@app.route("/ColorRecommend", methods=["GET",'POST'])
def ColorRecommend() :
    if request.method == 'POST' :
        # display(request.form)
        return "Error?";
    else :
        recommedTheme = calDistance(request.args['ColorData'])
        return recommedTheme

if __name__ == "__main__" :
    app.run()