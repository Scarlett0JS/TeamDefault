# 🥕 Default (디폴트)
<img src="img/메인.gif"  width="540" height="300" style="border-radius:15px;"/>


## 👀 서비스 소개
* 서비스명:
  *  Vscode 테마 추천 서비스
* 서비스설명:
  *  사용자가 선호하는 컬러와 이미지를 입력 받아 해당 컬러 및 이미지 내부 컬러와 유사한 컬러를 가지는 Vscode 테마 추천 서비스 
<br>

## 📅 프로젝트 기간
- 2022.08.16 ~ 2022.09.07 (3주)
<br>

## ⭐ 주요 기능

<details>

<summary>⭐색상 기반 테마 추천</summary>

<!-- summary 아래 한칸 공백 두어야함 -->
<img src=""  alt="여기에 메인 화면 입력"/>
<img src=""  alt="여기에 색상 선택화면 입력"/>
<img src=""  alt="여기에 추천 화면 입력"/>

- 유저는 메인페이지에서 Color Select 버튼을 통해 색상 선택 화면으로 이동할 수 있음.
- 색상 선택 페이지에서 5개의 선호 컬러 및 자신의 주 사용 언어를 선택하고 버튼을 클릭하면 해당 색상과 유사한 색상을 가진 테마 8개를 추천 받을 수 있음
- 추천 받은 페이지에서 테마 이름을 클릭하면 테마 상세보기 페이지로 이동함
- https://www.notion.so/1acc4fa14ba64faab8cace798c2adc7b#d7f451a54e1c4109941fea1c60223ee2
  
</details>

<details>

<summary>⭐이미지 기반 테마 추천</summary>

<!-- summary 아래 한칸 공백 두어야함 -->
<img src=""  alt="여기에 메인 화면 입력"/>
<img src=""  alt="여기에 이미지 선택화면 입력"/>
<img src=""  alt="여기에 추천 화면 입력"/>

- 유저는 메인페이지에서 Select image 버튼을 통해 로컬에 저장된 자신이 좋아하는 이미지를 선택할 수 있음.
- 이미지 선택 후 자신의 주 사용 언어를 선택하고 버튼을 클릭하면 이미지 내부에 주요 색상 5종과 유사한 색상을 가진 테마 8개를 추천 받을 수 있음.
- 추천 받은 페이지에서 테마 이름을 클릭하면 테마 상세보기 페이지로 이동함.
- https://www.notion.so/1acc4fa14ba64faab8cace798c2adc7b#708cb75f000e4659b4ff3330be8a3e50
</details>


<details>

<summary>로그인, 로그아웃</summary>

<!-- summary 아래 한칸 공백 두어야함 -->
<img src=""  alt="여기에 로그인 창 입력"/>

- 사용자가 가입한 아이디와 비밀변호를 정확히 입력하면 로그인 할 수 있음
- 가입하지 않은 아이디 입력 혹은 비밀번호를 정확히 입력하지 않을 시 경고 창을 띄우며 입력란을 초기화함
- 카카오 API를 이용하여 간편 로그인 기능 구현
- 카카오로 간편 로그인한 회원은 자동으로 회원 가입됨
- 로그인한 회원의 회원 정보는 세션에 저장되어 유지되며 로그아웃 버튼을 클릭시 세션을 초기화하며 로그아웃 됨
  
</details>

<details>

<summary>회원가입</summary>

<!-- summary 아래 한칸 공백 두어야함 -->
<img src=""  alt="여기에 회원가입 창 입력"/>

- 사용자는 아이디, 패스워드, 닉네임을 입력하면 회원가입 할 수 있음
- 이미 가입된 아이디, 패스워드와 패스워드 확인이 일치하게 입력하지 않을 시 혹은 입력 값 중 하나라도 공백을 입력한다면 각각 알림창을 띄워 사용자의 올바른 입력을 유도함
  
</details>

<details>

<summary>커뮤니티 게시판</summary>

<!-- summary 아래 한칸 공백 두어야함 -->
<img src=""  alt="여기에 게시판 입력"/>
<img src=""  alt="여기에 상세보기 입력"/>
<img src=""  alt="여기에 글쓰기 입력"/>

- 커뮤니티 게시판은 인기글 게시판, 언어별(Python, Java, Html...) 게시판으로 구분됨
- 인기글 게시판은 전체 게시글을 조회수별로 정렬하여 보여줌, 언어별 게시판은 해당 카테고리별 게시글을 시간순으로 정렬하여 보여줌
- 게시판에서 게시글 제목을 클릭하면 게시글 상세보기 페이지로 이동하며 게시글에 좋아요를 누를 수 있음
- 로그인한 회원은 글 쓰기 및 자신이 쓴 글에 대한 수정, 삭제 권한을 가짐.
- 로그인한 회원은 댓글 쓰기 및 자신이 쓴 댓글에 대한 삭제 권한을 가짐.
- 게시판은 한번에 최대 20개의 게시글을 볼 수 있으며 더 많은 게시글을 보기 위해서는 페이지를 통해 이동해야함
- 유저는 한 화면상에서 최대 5개의 페이지를 클릭할 수 있고, 버튼을 통해 한번에 +-5페이지를 이동할 수 있음
  
</details>

<details>

<summary>테마 게시판</summary>

<!-- summary 아래 한칸 공백 두어야함 -->
<img src=""  alt="여기에 게시판 입력"/>
<img src=""  alt="여기에 상세보기 입력"/>

- 테마 게시판은 Vscode에서 제공하는 테마 플러그인 설치시 적용할 수 있는 테마들을 테마 이름으로 구분된 형태로 확인할 수 있음.
- 테마 게시판에서 테마 이름을 클릭시 테마 상세보기 페이지로 이동함.
- 테마 상세보기 페이지는 기본적으로 테마 제작자, 테마 설치 횟수 유저들의 좋아요 개수등을 확인 할 수 있음
- 테마 상세보기 페이지에서 유저는 언어별, 폰트별 다른 테마 적용화면을 확인할 수 있음
- 테마 상세보기 페이지에서 유저는 좋아요 버튼을 통해 테마에 좋아요를 누를 수 있으며 이미 한번 좋아요한 테마에 좋아요를 클릭시 좋아요 취소됨.
- 테마 상세보기 페이지에서 유저는 인스톨 버튼을 통해 테마 설치 페이지로 이동할 수 있음.
- 테마 게시판은 한번에 최대 16개의 게시글을 볼 수 있으며 더 많은 게시글을 보기 위해서는 페이지를 통해 이동해야함
- 유저는 한 화면상에서 최대 5개의 페이지를 클릭할 수 있고, 버튼을 통해 한번에 +-5페이지를 이동할 수 있음.
  
</details>

<details>

<summary>마이 페이지</summary>

<!-- summary 아래 한칸 공백 두어야함 -->
<img src=""  alt="여기에 이미지 입력"/>

- 로그인한 사용자는 헤더의 메뉴를 통해 마이 페이지로 이동할 수 있음.
- 회원가입을 통해 가입한 회원은 마이페이지에서 닉네임과 패스워드를 수정할 수 있으며 회원 탈퇴 할 수 있음. 카카오 로그인한 회원은 마이페이지에서 회원 탈퇴만 가능함.
- 회원은 마이페이지 좌측 버튼을 통해 자신이 좋아요한 테마 및 작성한 게시글을 볼 수 있음.
- 좋아요한 테마는 한번에 최대 4개의 테마를 보여주며 더 많은 테마에 좋아요를 했을 시 하단의 버튼을 누르면 더 많은 테마를 확인 할 수 있으며 테마명을 클릭하면 테마 상세보기 페이지로 이동함
- 작성한 게시글은 제목, 작성일자, 조회수, 좋아요 수 등의 간략한 정보를 확인 할 수 있으며, 제목을 클릭시 상세보기 페이지로 이동함
  
</details>

<details>

<summary>테마 검색 기능</summary>

<!-- summary 아래 한칸 공백 두어야함 -->
<img src=""  alt="여기에 이미지 입력"/>

- 사용자는 메인페이지의 검색란에서 키워드를 통해 해당 키워드를 가진 테마를 검색 할 수 있음.
- 해당 키워드를 가진 테마가 있다면 최대 8종류가 보여지고 테마명을 클릭하면 테마 상세보기 페이지로 이동할 수 있음
  
</details>

<details>

<summary>익스텐션</summary>

<!-- summary 아래 한칸 공백 두어야함 -->
<img src=""  alt="여기에 이미지 입력"/>

- 사용자는 메인페이지 하단에서 Vscode의 유용한 익스텐션 정보를 확인 할 수 있음.
- 익스텐션 아이콘을 클릭 시 설치 페이지로 이동함
  
</details>

<details>

<summary>관리자 페이지</summary>

<!-- summary 아래 한칸 공백 두어야함 -->
<img src=""  alt="여기에 이미지 입력"/>

- 관리자 아이디로 로그인 시 헤더에서 관리자 페이지로 이동할 수 있음.
- 관리자는 모든 유저에 대한 삭제 권한을 가지며 유저 삭제를 할 수 있음.
  
</details>
<br>

## ⛏👨‍💻기술스택👩‍💻
<table>
    <tr>
        <th>구분</th>
        <th>내용</th>
    </tr>
    <tr>
        <td>사용언어</td>
        <td>
            <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white"/>
            <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=Python&logoColor=white">
            <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"/>
            <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"/>
            <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"/>
        </td>
    </tr>
        <tr>
        <td>프론트앤드</td>
        <td>
            <img src="https://img.shields.io/badge/BootStrap-7952B3?style=for-the-badge&logo=BootStrap&logoColor=white"/>
            <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
        </td>
    </tr>
    <tr>
        <td>백앤드</td>
        <td>
            <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> 
            <img src="https://img.shields.io/badge/Jsp-007396?style=for-the-badge&logo=java&logoColor=white"/>
            <img src="https://img.shields.io/badge/Ajax-007396?style=for-the-badge&logo=java&logoColor=white">
            <img src="https://img.shields.io/badge/jstl-007396?style=for-the-badge&logo=java&logoColor=white">
            <img src="https://img.shields.io/badge/MyBatis-007396?style=for-the-badge&logo=java&logoColor=white">
        </td>
    </tr>
    <tr>
        <td>서버환경</td>
        <td>
            <img src="https://img.shields.io/badge/Apache Tomcat-D22128?style=for-the-badge&logo=Apache Tomcat&logoColor=white"/>
            <img src="https://img.shields.io/badge/flask-000000?style=for-the-badge&logo=flask&logoColor=white">
        </td>
    </tr>
    <tr>
        <td>개발도구</td>
        <td>
            <img src="https://img.shields.io/badge/VSCode-007ACC?style=for-the-badge&logo=VisualStudioCode&logoColor=white"/>
            <img src="https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=Eclipse&logoColor=white"/>
            <img src="https://img.shields.io/badge/Jupyter-F37626?style=for-the-badge&logoColor=white"/>
            <img src="https://img.shields.io/badge/dbeaver-003B57?style=for-the-badge&logoColor=white"/>
            <img src="https://img.shields.io/badge/sql developer-003B57?style=for-the-badge&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>데이터베이스</td>
        <td>
            <img src="https://img.shields.io/badge/Oracle 11g-F80000?style=for-the-badge&logo=Oracle&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>라이브러리</td>
        <td>
            <img src="https://img.shields.io/badge/Anaconda-44A833?style=for-the-badge&logo=Anaconda&logoColor=white">        
            <img src="https://img.shields.io/badge/Selenium-43B02A?style=for-the-badge&logo=Selenium&logoColor=white">
            <img src="https://img.shields.io/badge/opencv-5C3EE8?style=for-the-badge&logo=opencv&logoColor=white">
            <img src="https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=NumPy&logoColor=white">
            <img src="https://img.shields.io/badge/pandas-150458?style=for-the-badge&logo=pandas&logoColor=white">
            <img src="https://img.shields.io/badge/Scikit learn-F7931E?style=for-the-badge&logo=Scikit-learn&logoColor=white">
        </td>
    </tr>
    <tr>
        <td>협업도구</td>
        <td>
            <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
            <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"/>
            <img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=notion&logoColor=white">
            <img src="https://img.shields.io/badge/slack-4A154B?style=for-the-badge&logo=slack&logoColor=white">
            <img src="https://img.shields.io/badge/discord-5865F2?style=for-the-badge&logo=discord&logoColor=white">
        </td>
    </tr>
    
</table>


<br>

## ⚙ 시스템 아키텍처(구조) 예시 
![서비스 아키텍처](https://user-images.githubusercontent.com/25995055/169925538-15867bd9-aa0b-42fc-a39b-88981e926e51.png)
<br>

## 📌 SW유스케이스
![image](https://user-images.githubusercontent.com/25995055/178401023-9a015e66-aa6e-4d74-8564-9b1f9d306649.png)
<br>

## 📌 서비스 흐름도
![image](https://user-images.githubusercontent.com/25995055/178401048-d6484bda-a2d7-40e1-998b-2bd195cd9f89.png)
<br>

## 📌 E-R Diagram
<img src="img/default_erd.png" style="border-radius:15px"/>
<br>

<!-- ## 🖥 화면 구성 -->
<!-- 시연영상 잘라서  -->

## 👨‍👩‍👦‍👦 팀원 역할
<table>
  <tr>
    <!-- 정충근 -->
    <td align="center"><img src="https://item.kakaocdn.net/do/fd49574de6581aa2a91d82ff6adb6c0115b3f4e3c2033bfd702a321ec6eda72c" width="100" height="100"/></td>
    <!-- 안지수 -->
    <td align="center"><img src="img/안지수.png" width="100" height="100" style="border-radius:50%"/></td>
    <!-- 강성훈 -->
    <td align="center"><img src="img/강성훈.png" width="100" height="100" style="border-radius:50%"/></td>
    <!-- 양서현 -->
    <td align="center"><img src="https://i.pinimg.com/236x/ed/bb/53/edbb53d4f6dd710431c1140551404af9.jpg" width="100" height="100"/></td>
    <!-- 김은지 -->
    <td align="center"><img src="img/김은지.png" width="100" height="100"/></td>
    <!-- 김화영 -->
    <td align="center"><img src="img/김화영.png" width="100" height="100"/></td>
  </tr>
  <tr>
    <td align="center"><strong>정충근</strong></td>
    <td align="center"><strong>안지수</strong></td>
    <td align="center"><strong>강성훈</strong></td>
    <td align="center"><strong>양서현</strong></td>
    <td align="center"><strong>김은지</strong></td>
    <td align="center"><strong>김화영</strong></td>
  </tr>
  <tr>
    <!-- 정충근 -->
    <td align="center"><b>Frontend</b></td>
    <!-- 안지수 -->
    <td align="center"><b>Frontend</b></td>
    <!-- 강성훈 -->
    <td align="center"><b>Backend</b></td>
    <!-- 양서현 -->
    <td align="center"><b>Backend</b></td>
    <!-- 김은지 -->
    <td align="center"><b>Deep Learning</b></td>
    <!-- 김화영 -->
    <td align="center"><b>Deep Learning</b></td>
  </tr>
  <tr>
    <!-- 정충근 -->
    <td align="center"><a href="https://github.com/PringlesHair" target='_blank'>github</a></td>
    <!-- 안지수 -->
    <td align="center"><a href="https://github.com/Scarlett0JS" target='_blank'>github</a></td>
    <!-- 강성훈 -->
    <td align="center"><a href="https://github.com/tmxjvm5" target='_blank'>github</a></td>
    <!-- 양서현 -->
    <td align="center"><a href="https://github.com/pyth1007" target='_blank'>github</a></td>
    <!-- 김은지 -->
    <td align="center"><a href="https://github.com/eunji78" target='_blank'>github</a></td>
    <!-- 김화영 -->
    <td align="center"><a href="https://github.com/dotoritoring" target='_blank'>github</a></td>
  </tr>
</table>

## 🤾‍♂️ 트러블슈팅
개념: 문제 해결을 위해 문제의 원인을 논리적이고 체계적으로 찾는 일이며 제품이나 프로세스의 운영을 재개
프로젝트 진행하는 동안 발생했던 이슈 중 가장 기억에 남았던 문제와 해결 프로세스 나열(2~5가지 정도)
  
* 문제1<br>
 문제점 설명 및 해결방안
 
* 문제2<br>
 문제점 설명 및 해결방안
