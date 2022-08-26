var beforeColor1;
var beforeColor2;
var beforeColor3;
var beforeColor4;
var beforeColor5;
 //이전에 선택된 컬러 저장 할 변수

//HTML 로딩이 끝난 후
window.onload = function () {
   init();
}

function init() {
   //2차원 배열 파레트 데이터
   var pallete = [["#FFBB00", "#FFE400", "#ABF200", "#1DDB16", "#00D8FF", "#0054FF", "#0100FF", "#5F00FF", "#FF00DD", "#FF007F", "#000000", "#FFFFFF"],
   ["#FAECC5", "#FAF4C0", "#E4F7BA", "#CEFBC9", "#D4F4FA", "#D9E5FF", "#DAD9FF", "#E8D9FF", "#FFD9FA", "#FFD9EC", "#F6F6F6", "#EAEAEA"],
   ["#FFE08C", "#FAED7D", "#CEF279", "#B7F0B1", "#B2EBF4", "#B2CCFF", "#B5B2FF", "#D1B2FF", "#FFB2F5", "#FFB2D9", "#D5D5D5", "#BDBDBD"],
   ["#F2CB61", "#E5D85C", "#BCE55C", "#86E57F", "#5CD1E5", "#6799FF", "#6B66FF", "#A566FF", "#F361DC", "#F361A6", "#A6A6A6", "#8C8C8C"],
   ["#CCA63D", "#C4B73B", "#9FC93C", "#47C83E", "#3DB7CC", "#4374D9", "#4641D9", "#8041D9", "#D941C5", "#D9418C", "#747474", "#5D5D5D"],
   ["#997000", "#998A00", "#6B9900", "#2F9D27", "#008299", "#003399", "#050099", "#3F0099", "#990085", "#99004C", "#4C4C4C", "#353535"],
   ["#670000", "#662500", "#664B00", "#665C00", "#476600", "#22741C", "#005766", "#002266", "#030066", "#2A0066", "#660058", "#660033"],
   ["#FF0000", "#FF5E00", "#FFD8D8", "#FAE0D4", "#FFA7A7", "#FFC19E", "#F15F5F", "#F29661", "#CC3D3D", "#CC723D", "#980000", "#993800"], 
   ];
   var tag = "";
   for (i = 0; i < pallete.length; i++) {
      for (j = 0; j < pallete[i].length; j++) { 
         tag += "<div id=" + pallete[i][j] + " class='cocircle' onclick='colorSet(this)'></div>";
      }
   }
   //파레트 파싱
   document.getElementById("cocorow").innerHTML = tag;

   //색상 입히기
   var colorBox = document.getElementsByClassName("cocircle");
   for (i = 0; i < colorBox.length; i++) {
      colorBox[i].style.background = colorBox[i].id;
   }
}

// onclick event
function colorSet(target1) {
   document.querySelector("body > div:nth-child(4) > div > div:nth-child(1) > div > div").style.background = target1.id;

   if (beforeColor1 != undefined && beforeColor1 != null) { // 
      document.getElementById(beforeColor1).className = document.getElementById(beforeColor1).className.replace(" active", "");
   }

   // 클릭한 색상 보여주는 기능
   document.getElementById(target1.id).className += " active";
   beforeColor1 = target1.id;
}