from selenium import webdriver as wb
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from urllib.request import urlretrieve
from tqdm import tqdm
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
        self.dest_dict = {}
        self.InstallCnt = {}
        self.ThemeIcon = {}
        self.idx = 1
    
    # Nope
    def startApp(self, extentionLi, dest_folder):
        self.browser = wb.Chrome('chromedriver.exe', options=self.options)
        self.browser.implicitly_wait(5)
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
        
    def findInstallCnt(self, idx):
        installElement = f'//*[@id="section-banner"]/div/table/tbody/tr/td[2]/div/div[1]/div[{idx}]/span'
        if idx == 5:
            InstallCnt = 0
            IconUrl = "https://azemoh.gallerycdn.vsassets.io/extensions/azemoh/one-monokai/0.5.0/1602835241556/Microsoft.VisualStudio.Services.Icons.Default"
            return InstallCnt, IconUrl
        else:    
            try:
                InstallCnt = int(self.browser.find_element(By.XPATH, installElement).text.strip().split(" ")[0].replace(",", ""))
                IconUrl = self.browser.find_element(By.XPATH, '//*[@id="vss_2"]/img').get_attribute("src")
                return InstallCnt, IconUrl
            except:
                return self.findInstallCnt(idx+1)
    
    # Theme Install Conunt Crawilng
    def CrawlInstallCnt(self, JsonPath):
        with open(JsonPath, 'r', encoding="utf-8") as f:
            jsonData = json.load(f)            
        
        urlData = set([i['url'] for i in jsonData])
        
        for url in tqdm(urlData):
            
            service = Service(ChromeDriverManager(path="Driver").install())
            self.browser = wb.Chrome(service=service, options=self.options)
            
            self.browser.implicitly_wait(5)
            self.browser.get(url)
            time.sleep(2)
                      
            InstallCnt, IconUrl = self.findInstallCnt(1)
            self.InstallCnt[url] = InstallCnt
            self.ThemeIcon[url] = IconUrl
            
            self.browser.close()
            time.sleep(1)
        
        Json_data = self.openJson(JsonPath)
        
        for data in Json_data:
            data["InstallCnt"] = self.InstallCnt[data['url']]
            data["Iconurl"] = self.ThemeIcon[data['url']]
        
        destJsonPath = os.path.split(JsonPath)
        NewJsonPath = os.path.join(destJsonPath[0], destJsonPath[1].split(".")[0] + "Crawl" + ".json")
        
        self.toJson(NewJsonPath, Json_data)
    
    # Extension Crawling
    def CrawlExtension(self, JsonPath, FolderPath, destUrl):
        url = destUrl
        destJson = {}
        self.browser = wb.Chrome('chromedriver.exe', options=self.options)
        self.browser.implicitly_wait(5)
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
        with open(JsonPath, 'r', encoding="utf-8") as f:
            Json_data = json.load(f)
            f.close()
        return Json_data
    
if __name__ == "__main__":
    crawlApp = exApp()
    
    crawlApp.CrawlInstallCnt("../macro/reFinal_ThemeInfoImg.json")
    
    # needsLi = ["all", "otheres"]
    # folderLi = []
    # for folder in needsLi:
    #     folderPath = os.path.join(os.getcwd(), folder)
    #     if not os.path.exists(folderPath):
    #         os.mkdir(folderPath)
    #     folderLi.append(folderPath)
    
    # urlLi = ["https://marketplace.visualstudio.com/search?target=VSCode&category=All%20categories&sortBy=Installs",
    #          "https://marketplace.visualstudio.com/search?target=VSCode&category=Other&sortBy=Installs"]
    
    # jsonNameLi = ["allExtension.json", "otherExtension.json"]
    
    # for url, folder, jsonName in zip(urlLi, folderLi, jsonNameLi):
    #     crawlApp.CrawlExtension(jsonName, folder, url)
    