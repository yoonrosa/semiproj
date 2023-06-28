<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Gorri의 소중한 상품 : ${ p.productName }</title>
<style>

   #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: dimgray; font-weight: bold;}
   #menu-market{color: #ffaa00; font-weight: bold;}
   .market-border-bottom{border-bottom: 4px solid #ffaa00;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }


   /* 제일 겉에 마켓 상세 범위 */
   .div{
      width : 70%;  min-width: 800px;
      margin-left: auto; margin-right: auto;} /* 가운데정렬 */
   .center-div{margin-left: auto; margin-right: auto; width : 95%; }

   
   /* section 1: 상품 사진, 이름, 가격, 구매버튼 부분 */
   .section1{ 
      width: 960px;
      display: flex; 
      justify-content: center;
      margin-top: 50px; /* 위에 메뉴탭이랑 여백 */
      }
   .sec1-img{text-align: center; width: 350px;}
   
   .div-big{ /* 큰 상품이미지-div */
      display: flex; 
      justify-content: center;
      align-items : center;
      margin-bottom: 10px;
      }
   .img-big{width: 350px; height: 350px;} /* 큰 상품이미지*/
   .img-mini{width: 60px; height: 60px; cursor: pointer;} /* 작은 상품이미지*/
   .img-mini:hover{border: 2.5px solid #fa0;}
   
   .info{width : 400px; padding: 20px; margin-top: 10px; margin-left: 10px;} /* 상품 이미지 옆에 판매정보관련 */
   .title{
      font-weight: bold; color: black; 
      padding-left: 15px; text-decoration: none; cursor:default;}
   .tltle:hover{color: black;}
   .class0{font-weight: bold; font-size: 20px;}
   .class1{margin-top: 20px; font-size: 18px; cursor: default;}
   .left{text-align: left; color: gray;}
   .right{text-align: right;}
   
   .class-btn{text-align: center; margin-top: 40px;}

   
   /* section 2: 판매자가 입력한 상품 상세정보 입력부분 */
   .product-info{font-weight: bold; font-size: 20px; margin-top: 10px; margin-bottom: 20px;}
   .product-text{
      padding-left: 15px; padding-right: 15px;
      text-align: justify; /* 양쪽정렬 */
      white-space: pre-line; /* 엔터 인식 */
      }
   
   /* 구매버튼 관련 설정*/
   .button {
      width: 140px; height: 45px;
      font-family: ;
      font-size: 11px;
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
      margin: 5px;
      }
   .button:hover {
      background-color: #ffaa00;
      box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
      color: #fff;
      transform: translateY(-7px);
      }
   .like{width: 45px; font-size: 15px;}
   .btn-left{margin-left: 88%; margin-top: 20px;}
   
   
   /* 중간 줄*/ 
    .line{ 
       border : 1px solid gray; width: 100%; 
       margin-left:auto; margin-right:auto; margin-top: 40px; margin-bottom: 40px;}

   
   /* 상품 문의, 구매 후기 게시판 관련*/
   .section4, .section5{ 
      width: 100%;
      justify-content: center;
      margin-top: 50px; /* 위에 메뉴탭이랑 여백 */
       margin-left: 0 auto; margin-right: 0 auto;
      }
   table{border-collapse: collapse; text-align: center; width: 100%;}
   table tr{height: 40px; border-bottom: 1px solid lightgray;}
   .top{background-color: rgba(250, 170, 0, 0.3);}
   .no{width: 80px;}
   .title{width: 500px;}
   .writer{width: 100px;}
   .date{width: 150px;}
   .count{width: 80px;}
   
   
   
   /* 삭제 확인 */
   .modal-body{text-align: center;}
   .bi-emoji-frown-fill{font-size: 60px; color: #fa0;}
   .footer{
      display: flex; 
      justify-content: center;
      align-items : center;
      margin-top: 30px; margin-bottom: 30px;
      padding-top: 20px;
      border-top: 1px solid lightgray;
   }
   
   /* 문의, 후기 게시판*/
   .rows{cursor: default;}
   .inquireCt{padding: 01px;}
   
   
   .rows:hover {
    cursor: pointer;
    background-color: lightgray;
     }

     /* Style when the table row is clicked */
     .rows:active {
    background-color: darkgray;
    color: white;
    }
    
    #reviewInsert{width: 400px; height: 200px; resize: none;}
   
</style>
</head>

            <!--
            controller에서 다음을 받아옵니다.'
            p : 상품 객체
            page : 이전의 pagenation
            seller : 판매자 객체
            productInq : 상품 문의
            productReview : 상품 리뷰
            -->
<body>
   <%@ include file="../common/top.jsp" %>
   <br>
   <div class="div"> <!-- 제일 바깥쪽 여백 범위 위한 div -->
      <div class="center-div"> <!-- 얘네는 다 수직정렬 되야함 -->
         <div class="section1"> <!-- section 1: 상품 사진, 이름, 가격, 구매버튼 -->
            <div class="sec1 sec1-img">
               <div class="div-big">
                  <c:forEach items="${ alist }" var="a">
                     <c:if test="${ p.productNo eq a.boardNo && a.attmLevel == 0 }">
                        <c:if test="${ fn:containsIgnoreCase(a.renameName, 'jpg') or fn:containsIgnoreCase(a.renameName, 'png')}">
                              <img class="img-big" src="${ contextPath }/resources/uploadFiles/${ a.renameName}">
                  <!-- 상품의 섬네일 코드 -->
                        </c:if>
                     </c:if>
                  </c:forEach>
               </div>
               <div class="div-mini">
                  <c:forEach items="${ alist }" var="a">
                     <c:if test="${ p.productNo eq a.boardNo && a.attmLevel == 0 }">
                        <c:if test="${ fn:containsIgnoreCase(a.renameName, 'jpg') or fn:containsIgnoreCase(a.renameName, 'png')}">
                              <img class="img-mini" src="${ contextPath }/resources/uploadFiles/${ a.renameName}">
                  <!-- 상품의 섬네일 코드 -->
                        </c:if>
                     </c:if>
                  </c:forEach>
                  <c:forEach items="${ alist }" var="a">
                     <c:if test="${ p.productNo eq a.boardNo && a.attmLevel == 1 }">
                        <c:if test="${ fn:containsIgnoreCase(a.renameName, 'jpg') or fn:containsIgnoreCase(a.renameName, 'png')}">
                           <img class="img-mini" src="${ contextPath }/resources/uploadFiles/${ a.renameName}">
                  <!-- 상품의 다른 사진들 -->
                        </c:if>
                     </c:if>
                  </c:forEach>
               </div>
            </div>
            <div class="sec1 info">
               <div class="class0">${ p.productName }</div>
               <div class="class1 left"><i class="bi bi-list"> </i>카테고리<i class="bi bi-chevron-compact-right"></i>${ p.productCategory }</div>
               <div class="class1 right"><em class="title">가격 : </em><a> ${ p.productPrice }</a> 원</div>
               
               <!-- 내 제품이라면 수량 선택은 뜨지 않게 해야함. -->
               <c:if test="${ !empty loginUser && (loginUser.userId == p.productSellerId) }">
<!--                <div class="class1 right"><a class="title">수량 : </a><a><i class="bi bi-dash-square-fill"></i></a> 00 <a><i class="bi bi-plus-square-fill"></i></a></div> -->
               </c:if>
               
               <div class="class1 right"><em class="title">등록일 : </em><a>${ p.productModifyDate }</a></div>
               <div class="class-btn">
               
               <!-- 내 제품이라면, 수정하기/삭제하기 버튼이 나와야 하고, 상대라면, 구매하기 버튼만 나오게 한다. -->
               <c:if test="${ !empty loginUser && (loginUser.userId == p.productSellerId) }">   <!-- 내 상품을 클릭한 경우. -->
                  <button class="button" onclick="location.href='${contextPath}/updateproduct.market?productId=${p.productNo}'"><b>수정하기</b></button>
                  <button class="button" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1"><b>삭제하기</b></button>
               </c:if>
               <c:if test="${ empty loginUser || (loginUser.userId != p.productSellerId) }">   <!--  내 상품이 아닌 경우 -->
                  <button class="button"
                     onclick="location.href='${ pageContext.servletContext.contextPath }/BuyingPage.market?productId=${ p.productNo }'">
                  <b>구매하기</b></button>
<!--                   <button class="button like" onclick="location.href='#"><i class="bi bi-heart-fill"></i></button> -->
                     <!-- 좋아요 버튼은 빠짐 -->
               </c:if>
               
               
               </div>
            </div>
         </div>
      </div>
      <div class="line"></div>
         
      <!-- 상품정보 :상품의 이름,상품의 설명 들어감-->
      <div class="center-div"> <!-- 얘네는 다 수직정렬 되야함 --> 
         <div class="section2"> <!-- section 2: 판매자가 입력한 상품 상세정보 입력부분 -->
            <div class="product-info"><i class="bi bi-caret-right-fill"></i> 상품정보</div>
            <div class="product-text">
               ${ p.productContent }
            </div>
         </div>
      </div>   
         
      <div class="line"></div>
         

            <!-- 문의내역 -->
      <div class="center-div"> <!-- 얘네는 다 수직정렬 되야함 -->
         <div class="section4">
            <div class="product-info"><i class="bi bi-pencil-fill"></i> 상품 문의</div>

            <table>
                  <tr class="top">
                     <th class="no">번호</th>
                     <th class="writer">작성자</th>
                     <th class="title">문의내용</th>
                     <th class="date">작성일자</th>
                  </tr>
                  <tbody id="qna">
                  <c:forEach items="${ productInq }" var="p">
                     <tr class="rows" onclick="location.href='${contextPath}/ProductInquire.market?productId=${p.productNo}&inquireNo=${p.inquireNo}'">                  
                        <td>${ p.inquireNo }</td>
                        <td>${ p.buyerId }</td>
                        <td>${ p.inquireContent }</td>
                        <td>${ p.inquirePostDate }</td>
                     </tr>
                  </c:forEach>
                  </tbody>
            </table>
            <!-- 자기 상품 아니고, 로그인 했을 시에 문의등록 가능하게 하는 버튼 -->
            <c:if test="${ !empty loginUser && (loginUser.userId != p.productSellerId) }">
               <button type="button"  class="btn btn-outline-success btn-left" id="insertInquire"
                     style="background-color:#ffab00; color:white; border:1px solid #ffab00">문의 등록</button>
            </c:if>
            
         </div>
      </div>      
         
      <div class="line"></div>
         
      <!-- 후기 
         얘는 그냥 마이페이지에서만 작성할 수 있어서. 작성버튼 따로 없음.
         얘는 그냥 보여지는거임.-->
      <div class="center-div"> <!-- 얘네는 다 수직정렬 되야함 -->   
         <div class="section5">
            <div class="product-info"><i class="bi bi-pencil-fill"></i> 구매 후기</div>
               
            <table>
               <tr class="top">
                  <th class="no">번호</th>
                  <th class="writer">작성자</th>
                  <th class="title">내용</th>
                  <th class="date">작성일자</th>
               </tr>
               <tbody id="qnaTable">
                  <c:forEach items="${ productReview }" var="proRev">
                     <tr class="rowsAfter">
                        <td>${ proRev.reviewNo }</td>
                        <td>${ proRev.buyerId }</td>
                        <td>${ proRev.reviewContent }</td>
                        <td>${ proRev.reviewPostDate }</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
            <c:forEach items="${pay }" var="pay">
                  <c:if test="${loginUser.userId eq pay.buyerId}">
                     <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal2" class="btn btn-outline-success btn-left">리뷰 작성</a>
                  </c:if>
               </c:forEach>
         </div>
      </div>
   </div>
      
      
   <%@ include file="marketFooter.jsp" %>
   
   
   <!-- 삭제확인 알림 모달 -->
   <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
            <div class="modal-header">
               <h1 class="modal-title fs-5" id="exampleModalLabel">게시글 삭제</h1>
               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <i class="bi bi-emoji-frown-fill"></i><br><br>
                    삭제하기 버튼을 누르면 게시글이 즉시 삭제 됩니다.<br>
                    정말 삭제하시겠습니까?
            </div>
            <div class="footer">
               <div><button type="button" class="button btn-n" data-bs-dismiss="modal">취소</button></div>
                 <div><button type="button" class="button btn-y" onclick="location.href='${contextPath}/deleteProduct.market?productId='+btoa(${ p.productNo })">삭제하기</button></div>
            </div>
         </div>
      </div>
   </div>

   <!-- 문의 등록 클릭 시 입력란 --> 
   <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="exampleModalLabel">상품 문의</h5>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <form action="insertInquire.market">
              <div class="modal-body">
                 <br>
                <textarea name="inquireContent" id="inquireCt" class="edit-text" style="border-radius: 1em; width:400px; height:400px; resize: none;" placeholder="&nbsp; 문의 내용을 입력해주세요. "></textarea>
            </div>
            <div class="footer">
              <button type="button" class="button" id="submit-btn" data-bs-dismiss="modal">문의 등록</button>
              <button type="button" class="button" id="cancel-bnt" data-bs-dismiss="modal">취소</button>
            </div>
         </form>
        
       </div>
     </div>
   </div>
   
<!--    리뷰 작성 모달 -->
   <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
            <div class="modal-header">
               <h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 작성</h1>
               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
               리뷰를 작성하시겠습니까?
               <c:forEach items="${pay }" var="pay">
                  <input type="hidden" name="payProductNo" value="${ pay.productNo }">
               </c:forEach>
               <textarea name="reviewWrite" id="reviewInsert" maxlength="200"></textarea>
            </div>
            <div class="footer">
               <div><button type="button" class="button btn-n" data-bs-dismiss="modal" id="reviewSubmit">리뷰 작성</button></div>
                 <div><button type="button" class="button btn-y" data-bs-dismiss="modal">취소</button></div>
            </div>
         </div>
      </div>
   </div>
   
   
   
   
   
   <!-- 이미지 클릭 위한 스크립트 -->
   <script>
   
      window.onload = function() {
          let bigPic = document.querySelector('.img-big');
          let smallPics = document.querySelectorAll('.img-mini');
      
          for(let i = 0; i < smallPics.length; i++) {
              smallPics[i].onclick = changepic;
          }
      
          function changepic() {
              let smallPicsAttribute = this.getAttribute('src');
              bigPic.setAttribute('src', smallPicsAttribute);
          }
      }
      
   </script>

   <script>
   //문의 등록 클릭 시 모달 창 뜨기 
       $('#insertInquire').click(function() {
          $('#exampleModal').modal('show');
       });
   
   const ths = document.getElementsByClassName('top')[0].children;
   //문의 등록과 조회
   const productNo = ${p.productNo};
   console.log(productNo);
   document.getElementById('submit-btn').addEventListener('click', function() {
      const inquireContent = document.getElementById('inquireCt').value;
      console.log('asdf' + inquireContent);
      $.ajax({
         url:'${contextPath}/insertInquire.market',
         data: {
            inquireContent:inquireContent,
            productNo:productNo
         }
         ,success: (data) => {
            $.ajax({
               url:'${contextPath}/selectInquire.market',
               data:{productNo:productNo},
               success: (data) => {
                  const tableBody = document.getElementById('tableBody');

                  document.getElementById('qna').innerHTML = '';
                  const qna = document.getElementById('qna')
                  
                  for(const datas of data) {
   
                     const inquireNo = datas.inquireNo;
                     const buyerId = datas.buyerId;
                     const inquireContent = datas.inquireContent;
                     const inquirePostDate = datas.inquirePostDate;
                  
                     const row = document.createElement('tr');
                     row.classList.add('rows');
                       
                      var inquireNoCell = document.createElement('td');
                      inquireNoCell.innerText = inquireNo;

                      var buyerIdCell = document.createElement('td');
                      buyerIdCell.innerText = buyerId;

                      var inquireContentCell = document.createElement('td');
                      inquireContentCell.innerText = inquireContent;

                      var inquirePostDateCell = document.createElement('td');
                      inquirePostDateCell.innerText = inquirePostDate;

                      row.append(inquireNoCell);
                      row.append(buyerIdCell);
                      row.append(inquireContentCell);
                      row.append(inquirePostDateCell);
                      
                      qna.append(row);
                       document.getElementById('inquireCt').value = '';
                  }
               }
            })
         }
         ,error: (data) => {
            console.log(data);
         }
      }) 
   })
   
   const reviewSubmit = document.getElementById('reviewSubmit');
   reviewSubmit.addEventListener('click', ()=>{
      $.ajax({
         url: '${contextPath}/insertReview.market',
         data: {
            reviewContent: document.getElementById('reviewInsert').value,
            productNo: productNo
         },
         success: data =>{
            console.log(data);
            console.log("등록 성공");
            $.ajax({
               url: '${contextPath}/selectReview.market',
               data: {
                  productNo: productNo
               },
               success: data =>{
                  console.log("조회 성공");
                  console.log(data);
                  const qnaTable = document.getElementById('qnaTable');
                  qnaTable.innerHTML = '';
                  
                  for(const re of data){
                     const tr = document.createElement('tr');
                     
                     const reviewNum = document.createElement('td');
                     reviewNum.innerText = re.reviewNo;

                     const bId = document.createElement('td');
                     bId.innerText = re.buyerId;
                     
                     const reContent = document.createElement('td');
                     reContent.innerText = re.reviewContent;
                     
                     const rePostDate = document.createElement('td');
                     rePostDate.innerText = re.reviewPostDate;
                     
                     tr.append(reviewNum);
                     tr.append(bId);
                     tr.append(reContent);
                     tr.append(rePostDate);

                     qnaTable.append(tr);
                  }
                  document.getElementById('reviewInsert').value = '';
               },
               error: data=>{
                  console.log(data);
                  console.log("조회 실패");
               }
            })
         },
         error: data=>{
            console.log("등록 실패");
            console.log(data);
         }
      })
   })
   
   
   </script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>