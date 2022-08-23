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
    
    insertLi = []  
    for idx in range(1, len(colordata)+1):
        insertLi.append("into Colormap values (" + 'get_colorSeq,' +
                        ",".join(["\'" + i[1].replace("\'", "") + "\'" for i in colordata[str(idx)].items() if i[0] != "HSV"]) +
                        ")") 
    
    cursor, connection = dbConnection()
    
    sql = "Insert All " + " ".join(insertLi) + " select * from dual"
        
    cursor.execute(sql)
    connection.commit()
    
    cursor.close()
    connection.close()
    print("Insert Complete")

def InsertExtension():
    #================mostUtil
    with open("Extension_Crawilng/popluar_Extention.json", 'r', encoding="utf-8") as f:
        util_Extention = json.load(f)
        f.close()
    
    insertLi = []
    
    for idx in range(1, len(util_Extention)+1):
        if util_Extention[str(idx)]['exName'].find("[Deprecated]") == -1:
            insertLi.append("into Extension (ExtensionNum, ExtensionName, ExtensionProducer, ExtensionDetail, ExtensionUrl) values ( get_extensionSeq," +
                            ",".join(["\'" + i.replace("\'", "") + "\'" for i in util_Extention[str(idx)].values()]) + ",'Util')")
    
    cursor, connection = dbConnection()
    
    sql = "Insert All " + " ".join(insertLi) + " select * from dual"
    
    cursor.execute(sql)
    connection.commit()
    
    cursor.close()
    connection.close()
    
    print("Insert util complete")
    #================mostPopluar

    df = pd.read_excel("Extension_Crawilng/extensions.xlsx")
    
    insertLi = []
    
    for idx, val in df.iterrows():
        insertLi.append("into Extension (ExtensionNum, ExtensionName, ExtensionProducer, ExtensionDetail, ExtensionUrl) values ( get_extensionSeq," + 
                        ",".join(["\'" + i.replace("\'", "") + "\'" for i in val.values[1:]]) + ",'Popular')")
    
    cursor, connection = dbConnection()
    
    sql = "Insert All " + " ".join(insertLi) + " select * from dual"
    
    cursor.execute(sql)
    connection.commit()
    
    cursor.close()
    connection.close()
    
    print("Insert Popular complete")
    
if __name__ == "__main__":
    InsertExtension()