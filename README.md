# UMC-6th-iOS-Study

WEAK 1
=======

Section 1
----------

* 앱 구성 요소 : Screen / Code / Data

    * Screen -> Code -> Data -> Screen

* 컴퓨터와 휴대폰의 차이 : 

    * Resource 제한, 관리를 철저히 해야함

    * 배터리 용량 제한

* 앱을 만드는 과정

    * Step 1. Idea → 검증 필요 (주변에 의견을 묻거나 SNS의 의견을 받음)

    * Step 2. Design 

    * Step 3. Development → 대부분의 시간을 사용

    * Step 4. Test

    * Step 5. Publish

    * Step 6. Market(마케팅)

    * Step 7. Update

* Developing Tools and Materials :

    * 1. Mac → Xcode

    * 2. Xcode → simulator

    * 3. Apple Developer Programs → 앱을 출시할 준비가 됐을 때 사용

    * 4. App Store Connect : 수익, 다운로드 수 등을 확인 가능

Secton 2
---------

* Step 1. Create and set up a new iOS project

* Step 2. Overview of Xcode
    
    * 1. 상단 표시줄    

    * 2. 내비게이터 창 

        * a. viewcontroller → 코드 작성 (이름은 변경 가능)

        * b. main → 디자인

        * c. view - debug area - show debug area → 디버깅 창 뜸

* Step 3. design apps in Xcode

    * 1. 우측 상단에 + 버튼 클릭 → Label, Image 등 삽입 가능 

    * 2. Size inspector 를 통해 좌표 설정 가능

    * 3. 좌표는 삽입한 객체의 좌상단 꼭짓점을 기준으로 계산됨

    * 4. 휴대폰의 좌상단, (0,0)인 지점 부터의 거리 

    * 5. Image view: 액자와 같은 역할

* Step 4. incorporate images assets into apps   

    * 1. Assets에 있는 이미지 파일을 Attributes Inspector에서 인식함, Image를 누르면 저장된 이미지를 확인할 수 있음

    * 2. 다양한 크기의 이미지를 생성할 때는 APP ICON GENERATOR를 or CANVA.COM

    * 3. canva.com에서 다운받은 이미지를 generator로 넘긴 후 appicon.appiconset에 들어가면 크기 별 이미지 있음

    * 4. 해당 파일을 xcode의 appicon.appiconset 파일과 대체

    * 5. 크기별로 이미지가 들어감

* Step 5. design and create custom apps icon

    * 1. Assets에 있는 아이콘 이미지 파일을 drag and drop

    * 2. 가끔 하나씩 빠져나와있는 경우가 있으니 그런 것들은 수동으로 조정할것

* Step 6. Run Simulator and the iPhone

    * 1. 재생 버튼을 누르면 시뮬레이터에서 실행됨

    * 2. 실제 아이폰에서 실행하려면 xcode와 아이폰의 소프트웨어 버전이 같아야함 (소수점까지)
