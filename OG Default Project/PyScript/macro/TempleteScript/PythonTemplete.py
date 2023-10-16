from selenium import webdriver as wb
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver import ActionChains
import os, json, time

class CrawlingApp:
    def __init__(self):
        self.__url = "https://map.kakao.com/"
        self.__options = wb.ChromeOptions()
        self.__options.add_argument("headless")
        self.__browser = wb.Chrome('chromedriver.exe', options=self.__options)
        self.__CrawlingDitionary = {}
    
    def SearchAllRastarant(self, userEntry):
        self.__browser.get(self.__url)
        self.__browser.find_element(By.ID, 'dimmedLayer').click()
        inputArea = self.__browser.find_element(By.XPATH, '//*[@id="search.keyword"]')
        ActionChains(self.__browser).click(inputArea).send_keys(userEntry.dest_keyword).send_keys(Keys.ENTER).perform()
        time.sleep(1)
        self.__browser.find_element(By.XPATH,'//*[@id="info.search"]').click()
        time.sleep(1)
        pageCnt = self.__browser.find_element(By.XPATH, '//*[@id="info.search"]/div').text.strip().split('\n')[1:-1]
        
        while len(pageCnt) % 5 == 0:
            for page in range(1, pageCnt+1):
                self.__browser.find_element(By.XPATH, f'//*[@id="info.search.{page}"]').click()
                time.sleep(1)
            self.__eatarySearch()
            self.__browser.find_element(By.XPATH, '//*[@id="info.search"]').click()
            pageCnt = self.__browser.find_element(By.XPATH, '//*[@id="info.search"]/div').text.strip().split('\n')[1:-1]
        for page in range(1, pageCnt+1):
            self.__browser.find_element(By.XPATH, f'//*[@id="info.search.{page}"]').click()
            time.sleep(1)
        return self.__CrawlingDitionary
    
    def toJson(self, userPath):
        dest_dict = {}
        for key, val in self.__CrawlingDitionary.items():
            tmp = val.get_MapData()
            dest_dict[key] = {'Name' : tmp[0], 'SubCategory' : tmp[1], 'Star' : tmp[2], 'ReviewCnt' : tmp[3], 'Address' : tmp[4], 'PhoneNumber' : tmp[5]}
        with open(os.path.join(userPath, 'Map.json'), 'w', encoding='utf-8') as f:
            json.dump(dest_dict, f, ensure_ascii= False)
    
    def __eatarySearch(self):
        return None