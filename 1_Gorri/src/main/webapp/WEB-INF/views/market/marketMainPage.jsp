<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<title>마켓 메인페이지</title>
<style>
   
   .cate-table{
      margin:0 auto; width: 90%; text-align:center;
      border-top: 1.5px solid darkgray; border-bottom: 1.5px solid darkgray;
      }
      
   .category{margin-left:100px; margin-right: 100px;}
   .categorys{width: 70px; cursor: pointer;  padding-top: 25px; padding-bottom: 20px;}
     .category-name{font-size: 13px; text-decoration: none; color: black;} /* 카테고리 항목 글자크기 */
     .fa-solid{font-size: 25px;} /* 아이콘 크기 */
     .categorys:hover{color: #ffaa00;}
     .categorys:active {color: #ff0044;}
   .categorys:hover .category-name{color: #ffaa00;}
   
   .btn-hover:hover {
      background-color: #ffaa00;
      box-shadow: 0px 15px 20px rgba(0, 0, 0, 0.1);
      color: #fff;
      transform: translateY(-2px);
    }
   
   .bottom{width: 100%; 
      display: flex; 
      justify-content: center; 
      align-items : center;
      }
      
   .myhome-menu{
      width: 700px;
      display: flex; 
      flex-wrap: wrap;
      }
    
    .market-pro{
       border:2px solid #ffab00; border-radius:2em; 
       margin-left: 12px; margin-right: 12px;
       margin-top: 15px; margin-bottom: 15px;
       }
   
   .groupPic{ /*이미지 늘어나지 않게 중간 기준으로 비율 안맞는 부분 잘라지게 해야함*/
      width:320px;
      height:250px;
      position:relative;
      overflow:hidden;
      }

   .gThumnail{
      max-width:100%; 
      max-height:100%;
       width: 100%;
         height: 100%;
       object-fit: cover;
      }
    .gThumnail:hover{transform: scale(1.05);} 
      
      
   .market-cate{margin-left: 15px; margin-top: 10px; margin-bottom: 5px;}   
      
   .market-name{
      height:40px;
      font-size:25px;
      font-weight:bold;
      text-align:left;
      padding-left:20px;
   }
   .market-price{
      height:35px;
      font-size:15px;
      font-weight: bold;
      text-align:right;
      padding-right:20px;
      padding-bottom: 15px;
   }


   #pageTable{
      width:300px;
      margin-top:100px;
      margin : 0 auto;
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
    @font-face {
	    font-family: 'omyu_pretty';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
	}
	
	.omyu{
		font-family: 'omyu_pretty';
			font-size: 27px;
	}
       #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: dimgray; font-weight: bold;}
   #menu-market{color: #ffaa00; font-weight: bold;}
   .market-border-bottom{border-bottom: 4px solid #ffaa00;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }
    
</style>
</head>
<body>

   <!-- 조각코드 -->
   <%@include file = "../common/top.jsp" %>
   <%@include file = "marketSearch.jsp" %>
   <br>


   <!-- 등록상품, 상품등록 버튼 -->
   <div class="container">
      <div class="row align-items-center">

            <!-- 2 buttons aligned in the middle -->
            <div class="col d-flex justify-content-center">
                <button type="button" class="btn btn-outline-success btn-hover omyu" style="background-color:#ffab00; color:white; border:1px solid #ffab00" 
                onclick="location.href='${ pageContext.servletContext.contextPath }/MyProductBoard.market'">내가 등록한 상품</button>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-outline-success btn-hover omyu" style="background-color:#ffab00; color:white; border:1px solid #ffab00"
                onclick="location.href='${ pageContext.servletContext.contextPath }/Register.market'">상품 등록</button>
            </div>
      </div>
   </div>
   <br>


   <!-- 카테고리 조각코드 시작 -->
   <br>
      <div class="category">
      <table class="cate-table">
         <tr>
            <td class="margin"></td>
            <td class="categorys" onclick=""><i class="fa-solid fa-paintbrush"></i><br><a class="category-name">예술</a></td>
            <td class="categorys"><i class="fa-solid fa-baseball"></i><br><a class="category-name">운동</a></td>
            <td class="categorys"><i class="fa-solid fa-utensils"></i><br><a class="category-name">음식</a></td>
            <td class="categorys"><i class="fa-solid fa-suitcase-rolling"></i><br><a class="category-name">여행</a></td>
            <td class="categorys"><i class="fa-solid fa-pencil"></i><br><a class="category-name">창작</a></td>
            <td class="categorys"><i class="fa-solid fa-graduation-cap"></i><br><a class="category-name">자기계발</a></td>
            <td class="margin"></td>
         </tr>
      </table>
   </div>
     <br>
     
     
     <!-- 카테고리 조각코드 종료 -->
     <script type="text/javascript">
        /*카테고리별 선택 알고리즘. 
        그리고 클릭 시, 각 카테고리의 text에 맞게 어디로 링크 넘어가게끔. */
        window.onload =() => {
           const categories = document.querySelectorAll("td.categorys");
           const contextPath = "${ pageContext.servletContext.contextPath }";
           
           for(const cate of categories){
              cate.addEventListener('click',function(){
                 const category = this.querySelector('a').innerText.trim();
                 location.href="'${contextPath}/MainPage.market?category=' + category";
              })
           }
        }
     </script>
  
     <div class="bottom">
        <div class="myhome-menu">
           <c:forEach items="${ plist }" var="p" >      
            <div class="market-pro">   
               <table>   
                  <tr>
                     <td>
                        <table class="smGroupTable"
                              onclick="location.href='${contextPath}/Product.market?productId='+${ p.productNo }+'&page='+${pi.currentPage}">
                           <tr>
                              <td>
                                 <div class="market-cate"><i class="bi bi-list"> </i>카테고리<i class="bi bi-chevron-compact-right"></i>${ p.productCategory }</div>
                              </td>
                           </tr>
                           <tr>
                              <td class="groupPic">
                                 <c:forEach items="${ alist }" var="a">
                                    <c:if test="${ p.productNo eq a.boardNo and a.attmLevel eq 0 }">
                                       <c:if test="${ fn:containsIgnoreCase(a.renameName, 'jpg') or fn:containsIgnoreCase(a.renameName, 'png')}">
                                           <img src="${ contextPath }/resources/uploadFiles/${ a.renameName}" class="gThumnail">
                                       </c:if>
                                    </c:if>
                                 </c:forEach>
                              </td>
                           </tr>
                           
                           <tr>
                              <td class="market-name">${ p.productName }</td>
                           </tr>
                           <tr>
                              <td class="market-price">${ p.productPrice }원</td>
                           </tr>
                        </table>
                     </td>
                  </tr>
               </table>
            </div>
         </c:forEach>
      </div>
     </div>
     
     <br>
     <br>
     <br>
     <br>
     
     <table align="center" id="pageTable">
      <tr>
         <!-- 앞으로 가기 -->
         <c:url var="goBack" value="${ loc }">
                   <c:param name="page" value="${ pi.currentPage-1 }"></c:param>
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
                     <c:param name="page" value="${ p }"/>
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
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<%@include file = "marketFooter.jsp" %>
</body>
</html>