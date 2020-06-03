# 밀스의 방앗간 (web shopping mall)

![shoppingmall](https://user-images.githubusercontent.com/52827441/83596071-a92dfa80-a59e-11ea-858a-c9a3dc3788f5.gif)


마켓 컬리 웹사이트의 UI 를 모티브로 만든 떡 판매 웹 쇼핑몰   
[[실행 영상 >>](https://www.youtube.com/watch?v=URZqkt_aoKU)]

## About 밀스의 방앗간
#### 사용자 모드
- AJAX 통신을 이용한 로그인 및 검색어 자동완성 기능 구현
- 주문, 포인트, 장바구니, 리뷰 등 실제 웹 쇼핑몰의 상세 기능들 구현
#### 관리자 모드
- 등록된 제품들의 유통기한, 재고 그리고 폐기된 수량을 한 눈에 조회, 관리 가능
- 매장 전체 주문들의 상태와 매출을 한눈에 관리 가능

## 기술 스택
#### 백엔드
 - Java (JSP) / mySql
#### 프론트엔드
 - Vainilla js / html / css (sass)

## Commit 규칙
<ol>
 <li>
  작업 전과 완료 후(push 전), 항상 최신 버전의 origin/dev 를 fetch 하여 업데이트 여부 확인
  <ul>
    <li>명령어 : git fetch origin</li>
  </ul>
 </li>
 <li>
  origin/dev 업데이트가 있을 경우, 우선 local branch 와 merge 하기
  <ul>
   <li>명령어 : git merge 로컬브랜치명 origin/dev</li>
  </ul>
 </li>
 <li>
   push
   <ul>
    <li>명령어 : git push origin 로컬브랜치명</li>
   </ul>
 </li>
</ol>

### SQL 및 DB 설계도 바로가기[./WebContent/sql/](./WebContent/sql/)
