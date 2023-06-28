<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap demo</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <style>
  
     #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: dimgray; font-weight: bold;}
   #menu-market{color: #ffaa00; font-weight: bold;}
   .market-border-bottom{border-bottom: 4px solid #ffaa00;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }
  
    .thumbnail {
      text-align: center;
      border: 1px solid #333;
      padding: 10px;
      margin: 10px;
    }
    .thumbnail.rounded-3 {
      height: 300px;
      background-color: #fff1a0
    }
      .gTitle{text-align:center; text-decoration:underline;}
/*    .groupCARD{width:350px; margin-left:auto; margin-right:auto; margin-top:20px; margin-bottom:20px;} */
/*    .groupName{font-size: 30px; font-weight:bold;} */
/*    .groupInt{heigt:100px;} */
   
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
   
   .category{margin-left:100px; margin-right: 100px;}
   .categorys{width: 70px; cursor: pointer;  padding-top: 25px; padding-bottom: 20px;}
     .category-name{font-size: 13px; text-decoration: none; color: black;} /* 카테고리 항목 글자크기 */
     .fa-solid{font-size: 25px;} /* 아이콘 크기 */
     .categorys:hover{color: #ffaa00;}
     .categorys:active {color: #ff0044;}
     
     .myProductList{
        width: 300px; text-align: center; 
        margin-left: 200px; margin-right: 200px;
        font-size: 25px;
        margin-top: 40px; margin-bottom: 30px;
        padding-bottom: 5px;
        border-bottom: 2px solid gray;
        }
    @font-face {
	    font-family: 'omyu_pretty';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
	}
	
	h2{
		font-family: 'omyu_pretty';
			font-size: 27px;
	}
     
     
</style>
</head>
<body>
   <!-- header -->
   <%@include file = "../common/top.jsp" %>
   
   
   <!-- 내가 등록한 상품 표시부분 div -->
   

   <div class="bottom">
        <div class="myhome-menu">
           <!-- 내가 등록한 상품 표시부분 div -->
      <div class="myProductList">
         <h2>내가 등록한 상품<h2>
      </div>
           <c:forEach items="${ list }" var="a" >      
            <div class="market-pro">   
               <table>   
                  <tr>
                     <td>
                        <table class="smGroupTable"
                              onclick="location.href='${contextPath}/Product.market?productId='+${ a.productNo }">
                           <tr>
                              <td>
                                 <div class="market-cate"><i class="bi bi-list"> </i>카테고리<i class="bi bi-chevron-compact-right"></i>${ a.productCategory }</div>
                              </td>
                           </tr>
                           <tr>
                              <td class="groupPic">
                                 <c:forEach items="${aList }" var="al">
                                    <c:if test="${ a.productNo eq al.boardNo and al.attmLevel eq '0'}">
                                       <img src="${ contextPath }/resources/uploadFiles/${al.renameName}" class="gThumnail">
                                    </c:if>
                                 </c:forEach>
                              </td>
                           </tr>
                           
                           <tr>
                              <td class="market-name">${ a.productName }</td>
                           </tr>
                           <tr>
                              <td class="market-price">${ a.productPrice }원</td>
                           </tr>
                        </table>
                     </td>
                  </tr>
               </table>
            </div>
         </c:forEach>
      </div>
     </div>


   <%@include file = "marketFooter.jsp" %>

</body>
</html>