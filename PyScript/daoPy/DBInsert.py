# 절대 실행하지 말 것
import os
import json
import cx_Oracle
import pandas as pd

from pprint import pprint

def dbConnection():
    dsn = cx_Oracle.makedsn("project-db-stu.ddns.net", 1524, service_name = "XE")
    connection = cx_Oracle.connect(user = "gjai_4_3_0822", password="smhrd3", dsn=dsn, encoding="utf-8")
    cursor = connection.cursor()
    return cursor, connection

def test():
    cur, connection = dbConnection()
    for row in cur.execute("select * from d_board"):
        print(row)
    
    cur.close()
    connection.close()

def InsertColorMap():
    with open("Colormap/Color_dimension.json", 'r', encoding="utf-8") as f:
        colordata = json.load(f)
        f.close()
    
    sql = "Insert into D_COLOR values(D_COLOR_SEQ.nextval ,:1, :2, :3, :4)"
    insertLi = [(colordata[str(i)]['Color'], colordata[str(i)]['RGB'], colordata[str(i)]['Hexadecimal'], 'admin@gjaischool.com') for i in range(1, len(colordata)+1)]
    
    cursor, connection = dbConnection()
    
    cursor.executemany(sql, insertLi)
    connection.commit()
    
    cursor.close()
    connection.close()
    print("Insert Complete")

def allExtension(JsonName):
    with open(JsonName, 'r', encoding="utf-8") as f:
        allExtensionData = json.load(f)
        f.close() 
    
    sql = "Insert into D_EXTENSION values(D_EXTENSION_SEQ.nextval, :1, :2, :3, :4, :5, :6, :7, :8)"
    insertLi = [(allExtensionData[str(i)]['ExtentionName'], allExtensionData[str(i)]['ExtentionProducer'], allExtensionData[str(i)]['ExtentionDetail'], 'admin@gjaischool.com', 
                 allExtensionData[str(i)]['ExtentionInstallCnt'], allExtensionData[str(i)]['ExtentionFile'],allExtensionData[str(i)]['ExtentionUrl'], 'A') for i in range(1, len(allExtensionData)+1)]
    
    cursor, connection = dbConnection()
    
    cursor.executemany(sql, insertLi)
    connection.commit()
    
    cursor.close()
    connection.close()
    print("Insert Complete")

def otherExtension(JsonName):
    with open(JsonName, 'r', encoding="utf-8") as f:
        allExtensionData = json.load(f)
        f.close() 
    
    sql = "Insert into D_EXTENSION values(D_EXTENSION_SEQ.nextval, :1, :2, :3, :4, :5, :6, :7, :8)"
    insertLi = [(allExtensionData[str(i)]['ExtentionName'], allExtensionData[str(i)]['ExtentionProducer'], allExtensionData[str(i)]['ExtentionDetail'], 'admin@gjaischool.com', 
                 allExtensionData[str(i)]['ExtentionInstallCnt'], allExtensionData[str(i)]['ExtentionFile'], allExtensionData[str(i)]['ExtentionUrl'], 'O') for i in range(1, len(allExtensionData)+1)]
    
    cursor, connection = dbConnection()
    
    cursor.executemany(sql, insertLi)
    connection.commit()
    
    cursor.close()
    connection.close()
    print("Insert Complete")

def InsertTheme(jsonPath):
    with open(jsonPath, 'r', encoding="utf-8") as f:
        jsonData = json.load(f)
        f.close()
    
    sql = "Insert into D_THEME (THEME_SEQ, THEME_NAME, THEME_LANG, THEME_FONT, THEME_COL1, THEME_COL2, THEME_COL3, THEME_COL4, THEME_COL5, THEME_PRODUCER, THEME_FILEPATH, THEME_URL, THEME_ICON, THEME_INSTALLCNT) values(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12, :13, :14)"
    
    insertLi = []
    for idx, data in enumerate(jsonData):
        insertLi.append(tuple([idx,
                               data['name'], # themename
                               data['imgpath'].split(".")[0].split("_")[2], # themelang
                               data['imgpath'].split(".")[0].split("_")[3], # themefont
                               *data['rgbVal'], # themergb
                               data['info'], # themeproducer
                               data['imgpath'], # themeimgpath
                               data['url'], # themeurl
                               data['Iconurl'], # themeicon
                               data['InstallCnt'] # themeinstallcount
                               ]))
    
    cur, conn = dbConnection()
    
    cur.executemany(sql, insertLi)
    conn.commit()
    
    cur.close()
    conn.close()
    print("Insert Complete")

def reInsertColorMap(jsonPath):
    with open(jsonPath, 'r', encoding="utf-8") as f:
        colordata = json.load(f)
        f.close()
    
    sql = "Insert into D_COLOR values(D_COLOR_seq.nextval, :1 ,:2, 'admin@gjaischool.com')"
    insertLi = sorted([(val['RGB'], val['Hexadecimal']) for val in colordata], key= lambda x:(int(x[0].split(",")[0]), int(x[0].split(",")[1]), int(x[0].split(",")[2])))
     
    cursor, connection = dbConnection()
    
    cursor.executemany(sql, insertLi)
    connection.commit()
    
    cursor.close()
    connection.close()
    print("Insert Complete")
    
if __name__ == "__main__":
    # allExtension("../Crawilng/allExtension.json")
    # otherExtension("../Crawilng/otherExtension.json")
    # InsertTheme()
    reInsertColorMap(os.path.join(r'C:\eGovFrame-4.0.0\First_Project\PyScript\Colormap', 'reColor_dimension.json'))
    print("Done")