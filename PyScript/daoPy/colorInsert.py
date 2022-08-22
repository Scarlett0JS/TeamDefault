import os
import json
import cx_Oracle

def dbConnection():
    dsn = cx_Oracle.makedsn("project-db-stu.ddns.net", 1524, service_name = "XE")
    connection = cx_Oracle.connect(user = "gjai_4_3_0822", password="smhrd3", dsn=dsn, encoding="utf-8")
    cur = connection.cursor()
    return cur

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
        insertLi.append("(" + ",".join(["\'" + i + "\'" for i in colordata[str(idx)].values()]) + ")") 
    
    cur = dbConnection()
    
    sql = "Insert into Colormap values " + ",".join(insertLi)
    
    print(sql)
    
# with open("Colormap/Color_dimension.json", 'r', encoding="utf-8") as f:
#     colordata = json.load(f)
#     f.close()
    
#     insertLi = []
#     for idx in range(1, len(colordata)+1):
#         insertLi.append("(" + ",".join(["\'" + i + "\'" for i in colordata[str(idx)].values()]) + ")")
        
#     print(",".join(insertLi))

if __name__ == "__main__":
    InsertColorMap()