# 절대 실행하지 말 것
import os
import json
import cx_Oracle
import pandas as pd
from urllib import parse
from pprint import pprint

def dbConnection():
    dsn = cx_Oracle.makedsn("project-db-stu.ddns.net", 1524, service_name = "XE")
    connection = cx_Oracle.connect(user = "gjai_4_3_0822", password="smhrd3", dsn=dsn, encoding="utf-8")
    cursor = connection.cursor()
    return cursor, connection

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
        insertLi.append(tuple([idx, # THEME_SEQ
                               data['name'], # THEME_NAME
                               os.path.splitext(data['imgpath'])[0].split("_")[2], # THEME_LANG
                               os.path.splitext(data['imgpath'])[0].split("_")[3], # THEME_FONT
                               *data['rgbVal'], # themergb
                               data['info'], # THEME_PRODUCER
                               data['imgpath'], # THEME_FILEPATH
                               data['url'], # THEME_URL
                               data['Iconurl'], # THEME_ICON
                               data['InstallCnt'] # THEME_INSTALLCNT
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
    # allExtension(os.path.join(r"C:\eGovFrame-4.0.0\First_Project\PyScript\Crawilng", "allExtension.json"))
    # otherExtension(os.path.join(r"C:\eGovFrame-4.0.0\First_Project\PyScript\Crawilng", "otherExtension.json"))
    # reInsertColorMap(os.path.join(r'C:\eGovFrame-4.0.0\First_Project\PyScript\Colormap', 'reColor_dimension.json'))
    InsertTheme(os.path.join(r'C:\eGovFrame-4.0.0\First_Project\PyScript', 'reFinal_ThemeInfoImgCrawlextract_F.json'))
    print("Done")