from selenium import webdriver as wb
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
import json
import os

class exApp:
    def __init__(self):
        self.url = "https://marketplace.visualstudio.com/search?target=VSCode&category=All%20categories&sortBy=Installs"
        self.options = wb.ChromeOptions()
        self.options.add_argument("--start-maximized")
        self.browser = wb.Chrome('chromedriver.exe', options=self.options)
        self.dest_dict = {}
        
        
    def startApp(self):
        self.browser.get(self.url)
        time.sleep(3)
        
        
        inputArea = self.browser.find_element(By.XPATH, '//*[@id="vss_5"]/div/input')
        ActionChains(self.browser).click(inputArea).send_keys("Live Server").send_keys(Keys.ENTER).perform()
        time.sleep(5)
        
if __name__ == "__main__":
    test = exApp()
    test.startApp()

