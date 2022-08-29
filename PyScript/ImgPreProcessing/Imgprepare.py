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
            
def shutilImg(pyscrpitPath, folder):
    img_path = os.path.join(pyscrpitPath, 'ThemeImg')
    img_li = [i for i in os.listdir(img_path) if i.endswith('.png')]

    for img in tqdm(img_li):
        folderName = os.path.split(folder)[-1]
        themeName, themeinfo, themelang, themefont = [i for i in img.split(".")[0].split("_")]
        
        if folderName == 'ThemeImg_Origin':
            shutil.copy(os.path.join(img_path, img), os.path.join(folder, img))
            
        elif folderName == 'ThemeImg_Crop':
            cropImg = Image.open(os.path.join(img_path, img))
            cropImg = cropImg.crop((0,105,800,705))
            cropImg.save(os.path.join(folder, img))
            
        else:
            Preimg = Image.open(os.path.join(img_path, img))
            Preimg = Preimg.crop((0,105,1200,990))
            Preimg.save(os.path.join(folder, img))
    
def extractThemeColor(jsonPath, preproFolder, extractFolder):
    with open(jsonPath, "r", encoding="utf-8") as f:
        JsonData = json.load(f)
    
    for theme in JsonData:
        img = cv2.imread(os.path.join(preproFolder, theme['filename'])) # 수정
        imgrgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        imgrgb_pixel = imgrgb.reshape((-1, 3))
        
        imgKm = KMeans(n_clusters=5).fit(imgrgb_pixel)
        centers = imgKm.cluster_centers_
        
        theme['rgbVal'] = [",".join(map(str, val)) for val in sorted([list(map(int, i)) for i in centers], key=lambda x: (x[0], x[1], x[2]))]
        
        plt.figure(0, figsize=(10, 2))
        
        for idx, each_col in enumerate(centers):
            plt.subplot(1,5,idx+1)
            plt.axis(False)
            
            temp = np.zeros((100,100,3), dtype="uint8")
            temp[:,:,:] = each_col
            plt.imshow(temp)
            
        plt.subplots_adjust(left=0, bottom=0, right=1, top=1, wspace=0.1, hspace=0)
        plt.savefig(os.path.join(extractFolder ,theme['filename']),
                    bbox_inches='tight', pad_inches=0)
    
    resultpath = os.path.split()
    newName = resultpath[-1].split(".")[0] + "extract" + ".json"
    with open(os.path.join(resultpath[0], newName), "r", encoding="utf-8") as f2:
        json.dump(JsonData, f2, ensure_ascii=False)
        
def imgConcat(concatFolder, cropFolder, extractFolder):
    cropImgLi = sorted([i for i in os.listdir(cropFolder) if i.endswith(".png")])
    extractImgLi = sorted([i for i in os.listdir(extractFolder) if i.endswith(".png")])
    
    for crop, extract in zip(cropImgLi, extractImgLi):
        cropImg = cv2.imread(os.path.join(cropFolder, crop))
        extractImg = cv2.imread(os.path.join(extractFolder, extract))
        extractImg = cv2.resize(extractImg, (cropImg.shape[1], 30))
        
        addv = cv2.vconcat([cropImg, extractImg])   
        cv2.imwrite(os.path.join(concatFolder, crop), addv)
    

if __name__ == "__main__":
    pyscriptPath = r"C:\eGovFrame-4.0.0\First_Project\PyScript"
    
    # 최종 저장될 이미지 폴더
    dest_path = os.path.join(pyscriptPath, 'Final_ThemeImg')
    if not os.path.exists(dest_path):
        os.mkdir(dest_path)
    
    # 이미지 폴더 내부 (origin, crop, prepro, extract, concat)
    folderLi = makeNeedFolder(dest_path)
    for folder in folderLi:
        shutilImg(pyscriptPath, folder)
    # shutil.rmtree(os.path.join(os.getcwd(), 'macro', 'ThemeImg_tmp')) # macro 돌린 파일은 삭제
    
    # 테마 이미지에서 컬러 추출하기
    extractThemeColor(os.path.join(pyscriptPath, 'macro', 'Final_ThemeInfo.json'), folderLi[2], folderLi[3]) 
    
    # 테마 크롭 이미지와 추출한 컬러 합치기
    imgConcat(folderLi[-1], folderLi[1], folderLi[3])
    
    