# :pushpin: 게이머즈
> 게이머를 위한 레이드 일정 관리 시스템
> 데모사이트 링크

</br>

## 1. 제작 기간 & 참여 인원
- 2023년 10월 30일 ~ 11월 30일
- 팀 프로젝트
- 팀장 : 정찬호
- 팀원 : 장우준,이경렬,김다원,최호철
</br>

## 2. 사용 기술
#### `Back-end`
  - Java 17
  - Apache Tomcat 9.0
  - JSP/Servlet
  - Oracle SQL Developer
  - JavaScript
  - MyBatis
#### `Front-end`
  - JavaScript
  - CSS
  - Fullcalendar.api
  - jQuery
  - Ajax
  - json
  - HTML

</br>

## 3. ERD 설계
![E-R Diagram](https://github.com/2023-SMHRD-IS-BigData2/p_gamers/assets/145329977/0dbb59d8-30e6-40af-950c-ae632d2ecc37)




## 4. 핵심 기능
이 서비스의 핵심 기능은 컨텐츠 등록 기능입니다.  
사용자는 단지 컨텐츠의 카테고리를 선택하고, URL만 입력하면 끝입니다.  
이 단순한 기능의 흐름을 보면, 서비스가 어떻게 동작하는지 알 수 있습니다.  

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

  
### 4.1. 전체 흐름

![image](https://github.com/2023-SMHRD-IS-BigData2/p_gamers/assets/145330168/d80b1fa2-1bdf-4e3d-9278-13055e65e94b)

</details>

## 5. 핵심 트러블 슈팅
<details>
  레이드 파티의 가장 중요한 기능은 의사소통이라고 생각합니다.
  의사소통을 하기위한 실시간 채팅방을 만들기 위해 멀티 스레드와 소켓을 공부하여 개발 하였으나,
  프로젝트 기간이 부족하여 각 레이드 파티간 게시글형식으로 채팅시스템을 구현하였습니다. 
</details>

## 6. 그 외 트러블 슈팅
<details>
<summary>Google Calendar 연동</summary>
<div markdown="1">

- Google Calendar 연동에 어려움을 겪어, Fullcalendar.api로 대체해 달력 틀 제공
- ![image](https://github.com/2023-SMHRD-IS-BigData2/p_gamers/assets/145330168/b3636e87-d505-4ccb-998e-5aec77ed82e3)

</div>
</details>



## 6. 회고 / 느낀점
>프로젝트 개발 회고 글: https://zuminternet.github.io/ZUM-Pilot-integer/
