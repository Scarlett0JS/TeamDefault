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

