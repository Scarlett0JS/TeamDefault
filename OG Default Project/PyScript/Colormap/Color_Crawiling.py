from selenium import webdriver as wb
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup as bs
import pandas as pd
import time
import json

url = "https://myyac.tistory.com/133"
options = wb.ChromeOptions()
options.add_argument("--start-maximized")
browser = wb.Chrome('chromedriver.exe', options=options)
browser.implicitly_wait(5)
dest_dict = {}
key_li = ['Color', 'HSV', 'RGB', 'Hexadecimal']

browser.get(url)

for idx in range(1, 166):
    colorTxt = browser.find_element(By.XPATH, f'//*[@id="mArticle"]/div[2]/div[2]/div/table/tbody/tr[{idx}]')
    rows = colorTxt.text.strip().split()
    
    coloridx = 0
    for i in range(len(rows)):
        if rows[i].isdigit():
            coloridx = i
            break
    input_rows = [" ".join(rows[:coloridx]), ",".join([rows[coloridx], rows[coloridx+1], rows[coloridx+2]]), 
                  ",".join([rows[coloridx+3],rows[coloridx+4],rows[coloridx+5]]), rows[-1]]
    
    dest_dict[idx] = dict(zip(key_li, input_rows))

browser.close()

with open("Color_dimension.json", "w", encoding="utf-8") as f:
    json.dump(dest_dict, f, ensure_ascii=False)