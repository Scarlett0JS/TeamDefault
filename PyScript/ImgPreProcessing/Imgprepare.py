from sklearn.cluster import KMeans
from PIL import Image
from tqdm import tqdm
import matplotlib.pyplot as plt
import numpy as np
import itertools
import cv2
import shutil
import json
import os

def makefolder(needs_li):
    for folder in needs_li:
        if not os.path.exists(folder):
            os.mkdir(folder)
            
def makeNeedFolder(dest_path):
    origin_path = os.path.join(dest_path, 'ThemeImg_Origin')
    crop_path = os.path.join(dest_path, 'ThemeImg_Crop')
    pro_path = os.path.join(dest_path, 'ThemeImg_Prepro')
    extract_path = os.path.join(dest_path, 'ThemeImg_Extract')
    concat_path = os.path.join(dest_path, 'ThemeImg_Concat')

    needs_li = [origin_path, crop_path, pro_path, extract_path, concat_path]
    makefolder(needs_li)
    
    return needs_li
            
def shutilImg(pyscrpitPath, folder, jsonPath):
    img_path = os.path.join(pyscrpitPath, 'macro', 'ThemeImg')
    
    with open(jsonPath, 'r', encoding="utf-8") as f:
        jsonData = json.load(f)
    
    img_li = [i["imgpath"] for i in jsonData]    
    
    for img in tqdm(img_li):
        folderName = os.path.split(folder)[-1]
        
        if folderName == 'ThemeImg_Origin':
            shutil.copy(os.path.join(img_path, img), os.path.join(folder, img))
            
        elif folderName == 'ThemeImg_Crop':
            cropImg = Image.open(os.path.join(img_path, img))
            cropImg = cropImg.crop((0,105,800,705))
            cropImg.save(os.path.join(folder, img))
            
        elif folderName == 'ThemeImg_Prepro':
            Preimg = Image.open(os.path.join(img_path, img))
            Preimg = Preimg.crop((0,105,1200,990))
            Preimg.save(os.path.join(folder, img))
    
    print("shutilImg Done")
    
def extractThemeColor(jsonPath, preproFolder, extractFolder):
    with open(jsonPath, "r", encoding="utf-8") as f:
        JsonData = json.load(f)
    
    for theme in tqdm(JsonData):
        img = cv2.imread(os.path.join(preproFolder, theme['imgpath']))
        imgrgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        imgrgb_pixel = imgrgb.reshape((-1, 3))
        
        imgKm = KMeans(n_clusters=5).fit(imgrgb_pixel)
        centers = imgKm.cluster_centers_
        
        theme['rgbVal'] = [",".join(map(str, val)) for val in sorted([list(map(int, i)) for i in centers], key=lambda x: (x[0], x[1], x[2]))]
    
        plt.figure(0, figsize=(10, 2))
        
        for idx, each_col in enumerate(centers):
            plt.subplot(1,8,idx+1)
            plt.axis(False)
            
            temp = np.zeros((100,100,3), dtype="uint8")
            temp[:,:,:] = each_col
            plt.imshow(temp)
            
        plt.subplots_adjust(left=0, bottom=0, right=1, top=1, wspace=-0.1, hspace=0)
        plt.savefig(os.path.join(extractFolder ,theme['imgpath']), bbox_inches='tight', pad_inches=0)
        plt.close()
    
    resultpath = os.path.split(jsonPath)
    newName = resultpath[-1].split(".")[0] + "extract" + ".json"
    with open(os.path.join(resultpath[0], newName), "w", encoding="utf-8") as f2:
        json.dump(JsonData, f2, ensure_ascii=False)
    
    print("extractThemeColor Done")
    
def imgConcat(concatFolder, cropFolder, extractFolder):
    cropImgLi = sorted([i for i in os.listdir(cropFolder) if i.endswith(".png")])
    extractImgLi = sorted([i for i in os.listdir(extractFolder) if i.endswith(".png")])
    
    for crop, extract in zip(cropImgLi, extractImgLi):
        cropImg = cv2.imread(os.path.join(cropFolder, crop))
        extractImg = cv2.imread(os.path.join(extractFolder, extract))
        extractImg = cv2.resize(extractImg, (cropImg.shape[1], 30))
        
        addv = cv2.vconcat([cropImg, extractImg])   
        cv2.imwrite(os.path.join(concatFolder, crop), addv)
    
    print("imgConcat done")

if __name__ == "__main__":
    pyscriptPath = r"C:\Users\aischool\Desktop\First_Project-main\PyScript"
    
    # # 최종 저장될 이미지 폴더
    dest_path = os.path.join(pyscriptPath, 'reFinal_ThemeImg')
    if not os.path.exists(dest_path):
        os.mkdir(dest_path)
    
    # # 이미지 폴더 내부 (origin, crop, prepro, extract, concat)
    folderLi = makeNeedFolder(dest_path)
    for folder in folderLi:
        shutilImg(pyscriptPath, folder, os.path.join(pyscriptPath, 'macro', 'reFinal_ThemeInfoImgCrawl.json'))
    # shutil.rmtree(os.path.join(os.getcwd(), 'macro', 'ThemeImg')) # macro 돌린 파일은 삭제
    
    # # 테마 이미지에서 컬러 추출하기
    extractThemeColor(os.path.join(pyscriptPath, 'macro', 'reFinal_ThemeInfoImgCrawl.json'), folderLi[2], folderLi[3]) 
    
    # # 테마 크롭 이미지와 추출한 컬러 합치기
    imgConcat(folderLi[-1], folderLi[1], folderLi[3])
    
    