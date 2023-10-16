let destPath = "/projectImg/reFinal_ThemeImg/ThemeImg_Concat_F/"
let temp = "/projectImg/reFinal_ThemeImg/ThemeImg_Concat_F/Abyss_vscode_JavaScript_Fira code_1_2.png"

let test = temp.split("/")
let imgLi = test[test.length - 1].split(".")[0].split("_")

if (imgLi.length > 4) {
    let backword = "_" + imgLi.slice(4).join("_") + ".png"
    let result = destPath + [imgLi[0], imgLi[1], "java", imgLi[3]].join("_") + backword
    console.log(result)
}else{
    let result = destPath + [imgLi[0], imgLi[1], "java", imgLi[3]].join("_") + ".png"
    console.log(result)
}

// console.log("_" + img.slice(4).join("_"))