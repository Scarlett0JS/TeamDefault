import os
import shutil
from PIL import Image
from tqdm import tqdm

def makefolder(needs_li):
    for folder in needs_li:
        if not os.path.exists(folder):
            os.mkdir(folder)
            
def makeNeedFolder(dest_path):
    origin_path = os.path.join(dest_path, 'ThemeImg_Origin')
    crop_path = os.path.join(dest_path, 'ThemeImg_Crop')
    pro_path = os.path.join(dest_path, 'ThemeImg_Prepro')

    needs_li = [origin_path, crop_path, pro_path]
    makefolder(needs_li)
    
    return os.listdir(dest_path)
            
def shutilImg(dest_path, folderName):
    img_path = os.path.join(os.getcwd(), 'macro', 'ThemeImg_tmp')
    img_li = [i for i in os.listdir(img_path) if i.endswith('.png')]

    for img in tqdm(img_li):
        themeName, lang, font = [i for i in img.split(".")[0].split("_")]
        
        themeName_path = os.path.join(dest_path, themeName)
        
        if folderName == 'ThemeImg_Origin':
            shutil.copy(os.path.join(img_path, img), os.path.join(dest_path, img))
        elif folderName == 'ThemeImg_Crop':
            needs_li = [themeName_path]
            makefolder(needs_li)
            
            cropImg = Image.open(os.path.join(img_path, img))
            cropImg = cropImg.crop((0,105,800,705))
            cropImg.save(os.path.join(themeName_path, img))
        else:
            needs_li = [themeName_path]
            makefolder(needs_li)
            
            Preimg = Image.open(os.path.join(img_path, img))
            Preimg = Preimg.crop((0,105,1200,990))
            Preimg.save(os.path.join(themeName_path, img))
    

if __name__ == "__main__":    
    cur_path = os.path.join(os.getcwd(), 'ThemeImg')
    if not os.path.exists(cur_path):
        os.mkdir(cur_path)
    
    folderLi = makeNeedFolder(cur_path) # ['ThemeImg_Crop', 'ThemeImg_Origin', 'ThemeImg_Prepro']
    for dest in folderLi:
        shutilImg(os.path.join(cur_path, dest), dest)
    shutil.rmtree(os.path.join(os.getcwd(), 'macro', 'ThemeImg_tmp'))
    
    