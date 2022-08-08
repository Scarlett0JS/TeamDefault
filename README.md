# Vscode Theme Recommendation Site
--------------

Vscode 테마 추천 서비스 제공 웹사이트 구성

### Git clone
> 1. github desktop 실행 -> file -> clone repository
> 2. URL -> https://github.com/PringlesHair/First_Project.git
> 3. Local_path를 전자정부프레임워크 디렉토리로 설정 -> clone
--------------
### Java web project import
> 1. 새로운 워크스페이스 에서 clone한 repository import
>> - file -> import -> general -> existing projects into workspace -> Browse 
>> - First_Project 폴더 선택 후 projects에 SoulTheme, Servers가 체크되어 있는지 확인 후 finish
> 2. Server 
>> - window -> preference -> Server -> Server Runtime Environments -> 기존 서버 삭제
>> - Add -> 전자정부프레임워크 내부 bin 폴더에서 Apache tomcat import (v8.5)
>> - 이클립스 Servers 탭에서 새로운 서버 생성 후 port번호 바꿔줌 (8089)
> 3. Web Project
>> - import 한 project 우클릭 -> properties
>> - project facets -> dynamic Web module v3.1 로 변경 후 체크, Java, JavaScript 체크
>> - 우측 탭에서 Runtimes 클릭 Apache tomcat 8.5 체크 -> apply -> apply and close
>> - [reference](https://ucong-9796.tistory.com/162)
> 4. Test
>> - TestLoginFrom.java 실행 -> id, password 입력후 -> 입력한 값이 출력되는 화면까지 넘어가는지 체크
> - DB 관련 추가 예정
> - python requirement 생성 예정
>    - ```pip install -r requirements.txt```
>    - anaconda setting temp templete
>       - conda update conda
>       - conda update -all
>       - conda install -c conda-forge pyautogui
>       - conda install -c conda-forge opencv
>       - conda install -c anaconda pillow
--------------
### Eclipse Setting
> - gitignore 설정
>   - Eclipse -> window -> preference -> team -> ignored resources
>   - add pattern
>       - .project
>       - .settings/
>       - target/
