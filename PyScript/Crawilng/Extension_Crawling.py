from fileinput import filename
from selenium import webdriver as wb
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from urllib.request import urlretrieve
import time
import json
import os

class exApp:
    def __init__(self):
        self.options = wb.ChromeOptions()
        self.options.add_argument("--start-maximized")
        self.options.add_argument("--disable-blink-features=AutomationControlled")
        self.options.add_experimental_option("excludeSwitches", ["enable-automation"])
        self.options.add_experimental_option('useAutomationExtension', False)
        self.browser = wb.Chrome('chromedriver.exe', options=self.options)
        self.browser.implicitly_wait(5)
        self.dest_dict = {}
        self.InstallCntLi = []
        self.idx = 1
    
    # Nope
    def startApp(self, extentionLi, dest_folder):
        url = "https://marketplace.visualstudio.com/search?target=VSCode&category=All%20categories&sortBy=Installs"
        self.browser.get(url)
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
        
        self.toJson("popluar_Extention.json", self.dest_dict)
    
    # Theme Install Conunt Crawilng
    def CrawlInstallCnt(self, TextPath, JsonPath):
        with open(TextPath, 'r', encoding="utf-8") as f:
            data = ["https://marketplace.visualstudio.com/items?itemName=" + i.strip().split(":")[1] for i in f.readlines()]
        
        for url in data:
            self.browser.get(url)
            time.sleep(2)
            
            try:
                InstallCnt = self.browser.find_element(By.XPATH, '//*[@id="section-banner"]/div/table/tbody/tr/td[2]/div/div[1]/div[2]/span').text.strip()
                self.InstallCntLi.append(InstallCnt)
            except:
                self.InstallCntLi.append("")
            
            self.browser.close()
            time.sleep(1)
        
        Json_data = self.openJson(JsonPath)
        
        for idx, val in enumerate(Json_data):
            val["InstallCnt"] = self.InstallCntLi[idx]
        
        self.toJson(JsonPath, Json_data)
    
    # Extension Crawling
    def CrawlExtension(self, JsonPath, FolderPath, destUrl):
        url = destUrl
        destJson = {}
        self.browser.get(url)
        time.sleep(3)
        
        for idx in range(1, 7):
            ExtentionName = self.browser.find_element(By.XPATH, f'//*[@id="row-1"]/div[{idx}]/a/div/div[1]/div[2]/div[1]/span[1]')
            ExtentionNametext = ExtentionName.text.strip()
            ExtentionProducer = self.browser.find_element(By.XPATH, f'//*[@id="row-1"]/div[{idx}]/a/div/div[1]/div[2]/div[1]/span[1]').text.strip()
            ExtentionDetail = self.browser.find_element(By.XPATH, f'//*[@id="row-1"]/div[{idx}]/a/div/div[2]/div').text.strip()
            ExtentionInstallCnt = self.browser.find_element(By.XPATH, f'//*[@id="row-1"]/div[{idx}]/a/div/div[1]/div[2]/div[2]/span/span').text.strip()
            ExtentionImg = self.browser.find_element(By.XPATH, f'//*[@id="vss_{idx+6}"]/img').get_attribute('src')
            
            ExtentionName.click()
            time.sleep(2)
            
            ExtentionUrl = self.browser.current_url
            destJson[idx] = {"ExtentionName" : ExtentionNametext, "ExtentionProducer" : ExtentionProducer, 
                             "ExtentionDetail" : ExtentionDetail, "ExtentionInstallCnt" : ExtentionInstallCnt,
                             "ExtentionUrl" : ExtentionUrl, "ExtentionFile" : ExtentionImg}
            
            print(ExtentionNametext)
            
            self.browser.back()
            time.sleep(2)
            
        self.toJson(JsonPath, destJson)
        
    def toJson(self, JsonPath, destJson):
        with open(JsonPath, 'w', encoding='utf-8') as f:
            json.dump(destJson, f, ensure_ascii=False)
            f.close()
    
    def openJson(self, JsonPath):
        with open(JsonPath, 'w', encoding="utf-8") as f:
            Json_data = json.load(f)
            f.close()
        return Json_data
    
if __name__ == "__main__":
    crawlApp = exApp()
    
    # crawlApp.CrawlInstallCnt("./macro/test.txt" "./macro/Final.json")
    
    needsLi = ["all", "otheres"]
    folderLi = []
    for folder in needsLi:
        folderPath = os.path.join(os.getcwd(), folder)
        if not os.path.exists(folderPath):
            os.mkdir(folderPath)
        folderLi.append(folderPath)
    
    urlLi = ["https://marketplace.visualstudio.com/search?target=VSCode&category=All%20categories&sortBy=Installs",
             "https://marketplace.visualstudio.com/search?target=VSCode&category=Other&sortBy=Installs"]
    
    jsonNameLi = ["allExtension.json", "otherExtension.json"]
    
    for url, folder, jsonName in zip(urlLi, folderLi, jsonNameLi):
        crawlApp.CrawlExtension(jsonName, folder, url)
    
        