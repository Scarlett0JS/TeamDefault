from selenium import webdriver as wb
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup as bs
from PIL import ImageColor
import time
import json

url = "https://encycolorpedia.kr/named"
options = wb.ChromeOptions()
options.add_argument("--start-maximized")
browser = wb.Chrome('chromedriver.exe', options=options)
browser.implicitly_wait(5)

destLi = []
keyLi = ["RGB", "Hexadecimal"]

browser.get(url)

for idx in range(1,54):
    colorTxt = browser.find_element(By.XPATH, f"/html/body/section/ol/li[{idx}]/a")
    htmlVal = colorTxt.text.strip().split()[-1]
    rgbVal = ",".join(map(str, ImageColor.getcolor(htmlVal, "RGB")))
    
    destLi.append(dict(zip(keyLi, [rgbVal, htmlVal])))

with open("reColor_dimension.json", "w", encoding="utf-8") as f:
    json.dump(destLi, f, ensure_ascii=False)