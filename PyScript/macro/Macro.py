import pyautogui
import time
import os

class MacroApp:
    def __init__(self):
        self.themeName = ["one", "two", "three", "four"]
        self.script_li = ["Python", "HTML", "JavaScript"]
        self.font_li = ['JetBrains Mono', 'D2coding', 'Noto Sans KR', 'Consolas']
        self.theme_click = (800,90)
        self.script_X = 340
        self.script_Y = 50
        self.font_XY = (810,412)
        self.flag = True
        
    def fontChoose(self, imgPath, theme, script):
        for font in self.font_li:
            pyautogui.hotkey('ctrl', ',')
            pyautogui.moveTo(*self.font_XY)
            time.sleep(0.5)
            pyautogui.doubleClick()
            pyautogui.click()
            pyautogui.press('delete')
            pyautogui.typewrite(font)
            pyautogui.hotkey('ctrl', 's')
            time.sleep(0.5)
            pyautogui.hotkey('ctrl', 'w')
            pyautogui.screenshot(os.path.join(imgPath, f"{theme}_{script}_{font}.png"))
            time.sleep(3)
    
    def themeChoose(self):
        pyautogui.hotkey('ctrl', 'k', 't')
        time.sleep(0.3)
        if self.flag:
            pyautogui.moveTo(*self.theme_click)
            pyautogui.click()
            self.flag = False
        else:
            pyautogui.press('down')
            pyautogui.press('enter')
        time.sleep(1)
    
    def startApp(self, imgPath):
        for theme in self.themeName:
            # themeChoose
            self.themeChoose()
            
            # scripChoose
            for script in self.script_li:
                pyautogui.moveTo(self.script_X, self.script_Y)
                pyautogui.click()
                
                # fontChoose
                self.fontChoose(imgPath, theme, script)
                self.script_X += 130
            self.script_X = 340
            
if __name__ == "__main__":
    imgPath = os.path.join(os.getcwd(), 'ThemeImg')
    if not os.path.exists(imgPath):
        os.mkdir(imgPath)
    
    test = MacroApp()
    test.startApp(imgPath)