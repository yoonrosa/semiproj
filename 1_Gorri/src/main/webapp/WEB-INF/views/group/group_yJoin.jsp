<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->

<title>Insert title here</title>
<style>
   #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: #ffaa00;; font-weight: bold;}
   #menu-market{color: dimgray; font-weight: bold;}
   .group-border-bottom{border-bottom: 4px solid #ffaa00;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }


/*등록 게시글 없을때*/
   .no-content, .no-login{margin-bottom:-250px; margin: 0 auto; text-align: center;}
   .no-content-icon, .no-login-icon{font-size: 80px; color:#ffaa00; margin-top: 80px; margin-bottom: 30px;}
   .no-content-text{margin-bottom: -250px; }
   .no-login-text{margin-bottom: -250px; }
   
   

<!-- 페이징 css-->
   #pageTable{
   
      width:300px;
      margin-top:2100px;
      margin-left:300px;
      margin-right:300px;
      border: none;
   }
   .paging{
      text-decoration:none;
      font-size:25px;
      font-weight:bold;
      color:grey;
   }
   
   .paging:hover{
      text-decoration:none;
      font-size:25px;
      font-weight:bold;
      color:#ffab00;
   }
   .selectPage{
      text-decoration:none;
      font-size:25px;
      font-weight:bold;
      color:black;
   }
   .selectPage:hover{
      text-decoration:none;
      font-size:25px;
      font-weight:bold;
      color:black;
      cursor:default;
   }

   table{border-collapse: collapse; text-align: center;}
   tr{height: 40px; border-bottom: 1px solid lightgray;}
   .top{background-color:  rgba(250, 170, 0, 0.3);}
   .no{width: 80px;}
   .title{width: 680px;}
   .writer{width: 100px;}
   .date{width: 150px;}
   .count{width: 80px;}


   body {background:white;}
   #wrap {width:1000px; height:900px; margin:0 auto; color:gray; text-align:center;}
   #side {float: left; margin-right:200px; width:300px; height:600px; line-height:600px; background:pink; border-radius: 2em;}
   #tung {float:left; width:100px; height:600px; line-height:600px; background:white; } 
   #contents {float: left; width: 600px; height:600px; line-height:600px; background:lightgray; border-radius: 2em;}
   
   
   #left{ width:400px; height:600px;  margin:auto; background-color:pink;}
   #right{ width:500px; height:600px; margin-left:500px; background-color:gray; }
    #center{ width:100px; height:600px; margin:auto;}
/*    .container {margin-right:400px;} */
   
/*    <!-- 버튼 css --> */

.button {
  width: 140px;
  height: 45px;
  font-family: 'Roboto', sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

.button:hover {
  background-color: #FFAA00;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  color: #fff;
  transform: translateY(-7px);
}

#writeBoard {
   margin-left:870px;
   
}

.trHover:hover{
background: rgba(255, 170, 0, 0.1);
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
<%@include file="../common/top.jsp" %>
<br><br><br><h3 style="text-align:center"><b name="groupName">${ list[0].membershipName }</b></h3>



<hr style="border:solid 10px black; margin:auto; width:30%; border-width:2px;"> <!-- 모임명 중앙 선 -->
<br><br><br>

   <table width="60%" style="margin-top:200px; margin:auto; text-align:center; "> 
       <tr>
           <td>
              <div style="border:3px solid #FFAA00; width:380px; height:600px; border-radius:2em;" > <!-- 1번째 블럭 -->
                 <div style="border:5px solid #FFAA00; border-radius:8em;  margin:auto; margin-top:30px; width:210px; height:210px; overflow:hidden">
                    <img src="${ contextPath }/resources/uploadFiles/${a.renameName}" style="210px; height:210px;">
                 </div> <!-- 사진 블럭 -->
                 <br>
                 <div>
                    <p>멤버수(${ list[0].capacity})</p> 
                 </div>
                 
                 <br><p img src="">${ list[0].category }</p> <!-- 설정한 카테고리에 맞는 카테고리와 아이콘 보임 -->
                 <div 
                    style="border-radius:2em; margin:0 auto; width:290px; height:100px; 
                    border:1px solid #FFAA00; padding:35px;">${ list[0].membershipContent }</div> <!-- 모임 소개 글 --> 
                    
                    <!-- 가입자O/관리자X 화면 -->
                    <c:if test="${adminStatus <= 0 && status > 0}">
                   	<br><button id="hostProfile" class="button" style=""><b>모임장 프로필</button>
               		</c:if>
               
               <!-- 가입자X 화면  -->
                      <c:if test="${!empty loginUser}">
                         <c:if test="${status <= 0}">
                            <br><button class="button" onclick="location.href='${contextPath}/groupJoin.gr?membershipNo=${membershipNo}&page=${page}'"><b>가입하기</button>
                         </c:if>   
                      </c:if>
                   
                     <!-- 가입자O/관리자O 화면 -->
                      <c:if test="${adminStatus > 0}">
                     <br><br><a href="${ contextPath }/groupUpdate.gr?membershipNo=${ membershipNo }&page=${page}"><button class="button"><b>모임 수정</button></a>
                  &nbsp; &nbsp; <a href="${ contextPath }/groupAdmin.gr?membershipNo=${ membershipNo }&page=${page}"><button class="button"><b>회원 관리</button></a>   
                 </c:if>
                     
                 </div> <!-- 1번째 블럭 끝  -->
              </td> <!-- 1번째 블럭 끝 -->
           
           
           <td><div style="background-color:white; width:120px; height:600px;"></div></td> <!-- 2번째 블럭  -->
           <td> <!-- 3번째 블럭 -->
              <div style=" border:3px solid #FFAA00; position:relative; width:500px; height:600px; border-radius: 2em;">
                 <h4 style="text-align:center;"><br>모임 일정 확인</h4><hr style="width:80%; margin:auto"></p>
<%--                  <div style="transform:scale(0.6); position:absolute; margin:0 auto;"><%@include file="calendar.jsp" %></div> --%>
                 <div style="transform:scale(0.6); position:absolute; margin:0 auto;"><%@include file="calendar2.jsp" %></div>
                   
                   <!-- 모임 가입 여부에 따라 일정 보기 버튼 유무 -->
                    <c:if test="${status > 0}">
                      <button class="button" id="calUI" style="margin-top:450px;"><b>일정 보기</button></a>    
               </c:if>
              </div>
           </td>
       </tr>
   </table> <!-- 모임 소개, 달력 블럭 끝  -->
   
   <!-- 게시글  -->
   <br><br><br>
   <div style="position:relative;">
      <!-- 미가입자/가입자 화면 나누기 : 글 작성하기  -->
       <c:if test="${status > 0}">
          <div>
             <button class="button" id="writeBoard" style="margin-left:1100px">작성하기</button>
          </div>
      </c:if> 
      <br>
      <table style="margin:0 auto; id="bList">
         <thead>
            <tr class="top">
               <th class="no">번호</th>
               <th class="title">제목</th>
               <th class="writer">작성자</th>
               <th class="date">작성일자</th>
            </tr>
         </thead>
         
         
         <c:if test="${ empty boardList }">
         <div class="no-content">
            <div class="no-content-icon"><i class="bi bi-emoji-wink-fill"></i></div>
            <div class="no-content-text">등록한 게시글이 없습니다.</div>
         </div>
         <style>
            #pageTable {
               display: none;
            }
         </style>
       </c:if>
                  
      <tbody id="tbody">
      <c:if test="${ !empty boardList }">
            <c:forEach items="${ boardList }" var="b">
               <tr class="trHover" style="border-bottom: 2px solid lightgray;">
                    
                   <td>${ b.boardNo }</td>
                   <td>${ b.title }</td>
                   <td>${ b.usersId }</td>
                   <td>${ b.modifyDate }</td>
               </tr>
            </c:forEach>
        </c:if>
         </tbody>  
      </table>
      <br>
<!--        미가입자/가입자 화면 나누기 : 글 작성하기  -->
<%--        <c:if test="${status > 0}"> --%>
<!--           <div> -->
<!--              <button class="button" id="writeBoard" style="margin-left:1100px">작성하기</button> -->
<!--           </div> -->
<%--       </c:if>  --%>
      <br><br>
      <!-- 페이징 -->
      <table align="center" id="pageTable">
      <tr>
         <!-- 앞으로 가기 -->
         <c:url var="goBack" value="${ loc }">
                   <c:param name="page" value="${ pi.currentPage-1 }"></c:param>
                   <c:param name="membershipNo" value="${list[0].membershipNo }"></c:param> 
             </c:url>   
         <td>
            <c:if test="${ pi.currentPage > 1 }">
               <a class="paging" href="${ goBack }">&laquo;</a>
            </c:if>
            <c:if test="${ pi.currentPage <= 1 }">
               <a class="paging" style="color:lightgrey; cursor:default;" >&laquo;</a>
            </c:if>   
         </td>
         <!-- 페이지 -->
         <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
            <c:url var="goNum" value="${ loc }">
                     <c:param name="page" value="${ p }"></c:param>
                      <c:param name="membershipNo" value="${list[0].membershipNo }"></c:param>
                  </c:url>
                  
                  <c:if test="${ pi.currentPage eq p }">
                  <td>
                     <a class="selectPage">${ p }</a>
                  </td>
                  </c:if>
                  <c:if test="${ !( pi.currentPage eq p ) }">
                  <td>
                     <a class="paging" href="${goNum}">${ p }</a>
                  </td>
                  </c:if>
         </c:forEach>
         <!-- 뒤로가기 -->
         <c:url var="goNext" value="${ loc }">
                   <c:param name="page" value="${ pi.currentPage+1 }"></c:param>
                    <c:param name="membershipNo" value="${list[0].membershipNo }"></c:param> 
             </c:url>   
         <td>
            <c:if test="${ pi.currentPage < pi.endPage }">
               <a class="paging" href="${ goNext }">&raquo;</a>
            </c:if>
            <c:if test="${ pi.currentPage >= pi.endPage }">
               <a class="paging" style="color:lightgrey; cursor:default;">&raquo;</a>
            </c:if>
         </td>
      </tr>
   </table>
   </div>
   <br><br><br><br><br><br><br><br><%@include file="../common/footer.jsp" %>
   
   
   <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered">
       <div class="modal-content">
         <div class="modal-header">
           <h1 class="modal-title fs-5" id="exampleModalLabel2">가입 후 이용해주세요.</h1>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
            <i class="bi bi-emoji-frown-fill"></i><br>
                가입 후 조회하실 수 있습니다.
         </div>
         <br>
         <div class="modal-footer">
           <button type="button" class="btn btn-n" data-bs-dismiss="modal">확인</button>
<!--            <button type="button" class="btn btn-y" id="deleteReply2">삭제하기</button> -->
         </div>
       </div>
     </div>
   </div>
   
   
   
   <script>
      
      
//       //게시글 상세보기 
//          window.onload = () => {
//             const tbody = document.getElementById('tbody');
//             console.log(tbody);
//             const tds = tbody.querySelectorAll('td');
//             console.log(tds);
//             if(${ status > 0 }) { //가입 여부에 따라 게시글 상세 보기 가능 여부 
//                 for(const td of tds) {
//                     console.log(td);
//                     td.addEventListener('click', function() { 
//                        const trTds = this.parentElement.children;
//                        console.log("asdf : " + trTds);
//                        const boardNo = trTds[0].innerText; //bId 
//                        console.log(boardNo);
//                        const usersId = trTds[2].innerText; //writer
//                        const groupNo = ${list[0].membershipNo };
//                        location.href='${ contextPath}/groupDetailBoard.gr?boardNo=' + boardNo + '&page=' + ${pi.currentPage};
                       
//                  });
//               }    
//             }
            
            
          
      //게시글 상세보기 
         window.onload = () => {
            const tbody = document.getElementById('tbody');
            console.log(tbody);
            const tds = tbody.querySelectorAll('td');
            console.log(tds);
            if(${ status > 0 }) { //가입 여부에 따라 게시글 상세 보기 가능 여부 
                for(const td of tds) {
                    console.log(td);
                    td.addEventListener('click', function() { 
                       const trTds = this.parentElement.children;
                       console.log("asdf : " + trTds);
                       const boardNo = trTds[0].innerText; //bId 
                       console.log(boardNo);
                       const usersId = trTds[2].innerText; //writer
                       const groupNo = ${list[0].membershipNo };
                       location.href='${ contextPath}/groupDetailBoard.gr?boardNo=' + boardNo + '&page=' + ${pi.currentPage};
                       
                 });
              }    
            } else {
               
//             }
            for(const td of tds) {
               td.addEventListener('click', function() {
                    $('#exampleModal2').modal('show');
//                     alert('가입 후 조회하실 수 있습니다.')
                 })
            }  
            
            }
              
//        달력 보기 
         document.getElementById("calUI").addEventListener("click", function() {
         console.log('asdf')
         const groupNo = ${list[0].membershipNo };
          location.href = "${contextPath}/calendar.gr?groupNo=" + groupNo ;
          });
            
        
//      글 작성하기 버튼 누르면 글 작성 페이지로 이동 -> 
        document.getElementById("writeBoard").addEventListener("click", function() {
           console.log(${list[0].membershipNo})
            window.location.href = "${contextPath}/groupBoardWrite.gr?membershipNo=" + ${list[0].membershipNo} + "&page=" + ${pi.currentPage};
          });
        
      }
      
      document.getElementById("hostProfile").addEventListener("click", ()=>{
    	  location.href="${contextPath}/moveMinihome.gr?membershipNo=${membershipNo}";
      })
         
   </script>
   
   
</body>
</html>