from selenium import webdriver as wb
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from urllib.request import urlretrieve
from collections import Counter
import pyautogui
import time
import json
import os


url = "https://marketplace.visualstudio.com/search?term=theme&target=VSCode&category=All%20categories&sortBy=Relevance"

options = wb.ChromeOptions()
options.add_argument("--start-maximized")
options.add_argument('--disable-blink-features=AutomationControlled')
options.add_experimental_option("excludeSwitches", ["enable-automation"])
options.add_experimental_option('useAutomationExtension', False)
browser = wb.Chrome('chromedriver.exe', options=options)
First_Flag = True

browser.get(url)
time.sleep(3)
themeCnt = browser.find_elements(By.CSS_SELECTOR, "div.cover")

# while len(themeCnt) < 200:
#     browser.find_element(By.TAG_NAME, "body").send_keys(Keys.PAGE_DOWN)
#     time.sleep(0.8)
#     themeCnt = browser.find_elements(By.CSS_SELECTOR, "div.cover")

for idx in range(len(themeCnt)):
    theme = browser.find_elements(By.CSS_SELECTOR, "div.cover")[idx]
    theme.click()
    time.sleep(3)
    themeName = browser.find_element(By.XPATH, '//*[@id="section-banner"]/div/table/tbody/tr/td[2]/div/h1/span').text.strip()
    themeProducer = browser.find_element(By.XPATH, '//*[@id="section-banner"]/div/table/tbody/tr/td[2]/div/div[1]/div[1]/h2/a').text.strip()
    themeInstall = browser.find_element(By.XPATH, '//*[@id="section-banner"]/div/table/tbody/tr/td[2]/div/div[3]/div[1]/div/span[1]/button/div')
    themeInstall.click()
    if First_Flag:
        pyautogui.moveTo(1100, 650)
        pyautogui.click()
        time.sleep(0.3)
        pyautogui.moveTo(710, 162)
        pyautogui.click()
        time.sleep(0.1)
        pyautogui.moveTo(1100, 218)
        pyautogui.click()
        time.sleep(0.1)
        First_Flag = False
    pyautogui.moveTo(585,170)
    time.sleep(0.5)
    pyautogui.keyDown('alt')
    pyautogui.press('tab')
    pyautogui.keyUp('alt')
    time.sleep(0.5)
    browser.back()

time.sleep(100)

# //*[@id="section-banner"]/div/table/tbody/tr/td[2]/div/div[3]/div[1]/div/span[1]/a
