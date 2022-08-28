# 절대 실행하지 말 것
import os
import json
import cx_Oracle
import pandas as pd

def dbConnection():
    dsn = cx_Oracle.makedsn("project-db-stu.ddns.net", 1524, service_name = "XE")
    connection = cx_Oracle.connect(user = "gjai_4_3_0822", password="smhrd3", dsn=dsn, encoding="utf-8")
    cursor = connection.cursor()
    return cursor, connection

def test():
    cur = dbConnection()
    for row in cur.execute("select * from colormap"):
        print(row)

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
    
if __name__ == "__main__":
    allExtension("../Crawilng/allExtension.json")
    otherExtension("../Crawilng/otherExtension.json")