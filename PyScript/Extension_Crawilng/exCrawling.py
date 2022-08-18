from selenium import webdriver as wb
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from urllib.request import urlretrieve
from collections import Counter
import time
import json
import os

class exApp:
    def __init__(self):
        self.url = "https://marketplace.visualstudio.com/search?target=VSCode&category=All%20categories&sortBy=Installs"
        self.options = wb.ChromeOptions()
        self.options.add_argument("--start-maximized")
        self.browser = wb.Chrome('chromedriver.exe', options=self.options)
        self.browser.implicitly_wait(5)
        self.dest_dict = {}
        self.idx = 1
        
    def startApp(self, extentionLi, dest_folder):
        self.browser.get(self.url)
        time.sleep(3)
        
        for extention in extentionLi:  
            inputArea = self.browser.find_element(By.XPATH, '//*[@id="vss_5"]/div/input')
            ActionChains(self.browser).click(inputArea).send_keys(extention).send_keys(Keys.ENTER).perform()
            time.sleep(3)
            
            textArea = self.browser.find_element(By.XPATH, '//*[@id="row-1"]/div[1]/a/div/div[1]/div[2]/div[1]/span[1]')
            exName = textArea.text.strip()
            self.browser.find_element(By.XPATH, '//*[@id="row-1"]/div[1]/a/div/div[1]').click()
            time.sleep(3)
            
            producer = self.browser.find_element(By.XPATH, '//*[@id="section-banner"]/div/table/tbody/tr/td[2]/div/div[1]/div[1]/h2/a').text.strip()
            detail = self.browser.find_element(By.XPATH, '//*[@id="section-banner"]/div/table/tbody/tr/td[2]/div/div[2]').text.strip()
            exurl = self.browser.current_url
            
            # img save
            img_url = self.browser.find_element(By.XPATH, '//*[@id="vss_2"]/img').get_attribute('src')
            urlretrieve(img_url, os.path.join(dest_folder, f'{exName}.png'))
            
            # save
            self.dest_dict[self.idx] = {'exName' : exName, 'producer' : producer, 'detail' : detail, 'exUrl' : exurl}
            self.idx += 1
            
            self.browser.back()
            time.sleep(3)
            self.browser.find_element(By.XPATH, '//*[@id="vss_5"]/div/span[1]').click()
            time.sleep(3)
        
        self.toJson()
            
    def toJson(self):
        with open(os.path.join(os.getcwd(), 'popluar_Extention.json'), 'w', encoding='utf-8') as f:
            json.dump(self.dest_dict, f, ensure_ascii=False)
                
                
if __name__ == "__main__":
    with open('extention.txt', 'r', encoding='utf-8') as f:
        data = [i.strip() for i in f.readlines()]
        f.close()
    
    dataLi = [i[0] for i in Counter(data).most_common(21)]
    crawlApp = exApp()
    crawlApp.startApp(dataLi[1:], os.path.join(os.getcwd(), 'popularImg'))