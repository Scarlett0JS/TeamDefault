let temp = "http://localhost:8089/FinalDefault/assets/img/reFinal_ThemeImg/ThemeImg_Concat/An%20Old%20Hope%20Light_dustinsanders_Python_JetBrains%20Mono.png".split("/")
let imgLi = temp[temp.length-1].split("%20").join(" ").split(".")[0].split("_")
let lang = "Java"

let result = [imgLi[0], imgLi[1], lang, imgLi[3]].join("_") + ".png"

console.log(result)