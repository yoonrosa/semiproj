<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="../js/jquery-3.6.4.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<title>:: JavaScript 캘린더 ::</title>
<style type="text/css">
    a { color:pink;text-decoration:none; }
    .scriptCalendar { text-align:center; }
    .scriptCalendar > thead > tr > td { width:50px;height:50px; border-radius: 7px;}
    .scriptCalendar > thead > tr:first-child > td { font-weight:bold; }
    .scriptCalendar > thead > tr:last-child > td { background-color:#FFDC46; font-weight:bolder; color:black; }
    .scriptCalendar > tbody > tr > td { width:50px;height:50px;}
    .scriptCalendar > tbody > tr > td:hover {  font-size: 20px; font-weight:bolder; cursor: pointer;}
    .calendarBtn { cursor:pointer; } 
    #schedule:hover{ transform: translateY(-7px);  transition: transform 0.1s ease; }
    
       #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: #ffaa00;; font-weight: bold;}
   #menu-market{color: dimgray; font-weight: bold;}
   .group-border-bottom{border-bottom: 4px solid #ffaa00;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }
    
    
    
    /* 일정 1개 이상 표시 */
    .choiceDay {
     ddisplay: flex;
     justify-content: center;
     align-items: center;
     height: 50px;
     background-color: #f5f5f5;
     font-weight: bold;
     position: relative;
   }
   
    .choiceDay.has-event::after {
     background-image: radial-gradient(circle at center, transparent 8px, red 9px);
     background-size: 100% 100%;
     background-repeat: no-repeat;
   }
   
   .choiceDay.has-event::before {
     content: "";
     position: absolute;
     width: 16px;
     height: 16px;
     background-color: red;
     border-radius: 50%;
     top: 80%;
     left: 51%;
     transform: translate(-50%, -50%);
   }
   
    /* 삭제 버튼 css */
    .deleteButton {
       border-radius:30px;
       float:right;
    }
    
    .deleteButton:hover {
        transition: background-color 0.5s ease-in-out;
       color:white;
       background-color:black;
    }
    /*    <!-- 버튼 css --> */
   .button {
     width: 140px;
     height: 45px;
     font-family: 'Roboto', sans-serif;
     font-size: 15px;
     text-transform: uppercase;
     letter-spacing: 2.5px;
     font-weight: 500;
     color: #000;
     background-color: #fff;
     border: 3px solid gold;
     border-radius: 45px;
     box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
     transition: all 0.3s ease 0s;
     cursor: pointer;
     outline: none;
     }
   
   .button:hover {
     background-color: gold;
     box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
     color: #fff;
     transform: translateY(-7px);
   }
   
   .centerTrs{
      border-bottom:1px solid black;
   }
   
   .centerTds{
      text-align:center;  height: 50px; border-bottom:3px solid gold; width:1000px;
   }
   .leftTds{
      text-align:left; height: 50px; border-bottom:3px solid gold; 
   }
   
	#schedule{
		 margin-bottom:100px;
	}
   
   #cal{
   margin-left:250px;
   }
   
   
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>




</head>
<body>

<%@include file="../common/top.jsp" %>
<!-- 달력 -->
<div id="cal" style="position:relative; padding : 100px; display : inline-block; text-align: center;">
    <table class="scriptCalendar" style=" width: 600px; height:600px; ">
        <thead>
            <tr>
                <td class="calendarBtn" id="btnPrevCalendar" style="font-size:20px; font-weight:bold;">&#60;&#60;</td>
                <td style="font-size:26px;"colspan="5">
                    <span id="calYear">YYYY</span>년
                    <span id="calMonth">MM</span>월
                </td>
                <td class="calendarBtn" id="nextNextCalendar" style="font-size:20px; font-weight:bold;">&#62;&#62;</td>
            </tr>
            <tr>
                <td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
            </tr>
        </thead>
        <tbody id="parentBody"></tbody>
    </table>
</div>

<!-- 일정 -->
<div id="schedule" style=" box-shadow: 0 2px 6px rgba(0, 0, 0, 0.9);  position:relative; width:500px;position:absolute; margin-top:12%; height:400px; padding:30px;border:6px solid gold; border-radius:2em; display:none ">
   <div style="text-align:center;"><label  id="scheduleToday" style="font-size: 20px; text-align: center; font-weight: bold;"></label></div>
      <br>
      <div style="margin:auto">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <input type="hidden" name="groupNo" value="${groupNo }" >
         <input type="text" id="scheduleContent" style="width:200px; border:3px solid gold; border-radius : 30px; height:41px" >
         &nbsp;&nbsp;<button class="button" type="submit" id="insertSchedule">일정 추가</button>
         <br><br>
            <table>
               <tbody id="tbodyId">
                 <c:forEach items="${ thisSched }" var="ts">
<%--                  <input type="hidden" value="${ts.schNo }" name="schNo"> --%>
                    <tr>
                      <td class="centerTds">${ts.calContent }
                         <div style="text-align:right; margin-top:-20px;">
                         <button type="button" class="deleteButton" name="schNo" data-schNo="${ts.schNo }">삭제</button>
                         
                         </div>
                      </td>
                    </tr>
                </c:forEach>
               </tbody>
          </table>
      </div>
</div>


<%@include file="../common/footer.jsp" %>

<!-- 함수  -->
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        buildCalendar();
        
        document.getElementById("btnPrevCalendar").addEventListener("click", function(event) {
            prevCalendar();
        });
        
        document.getElementById("nextNextCalendar").addEventListener("click", function(event) {
            nextCalendar();
        });
    });

    var toDay = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 toDay에 Date 객체를 넣어줌
    var nowDate = new Date();  // @param 전역 변수, 실제 오늘날짜 고정값
    
    /**
     * @brief   이전달 버튼 클릭시
     */
    function prevCalendar() {
        this.toDay = new Date(toDay.getFullYear(), toDay.getMonth() - 1, toDay.getDate());
        buildCalendar();    // @param 전월 캘린더 출력 요청
    }

    /**
     * @brief   다음달 버튼 클릭시
     */
    function nextCalendar() {
        this.toDay = new Date(toDay.getFullYear(), toDay.getMonth() + 1, toDay.getDate());
        buildCalendar();    // @param 명월 캘린더 출력 요청
    }

    /**
     * @brief   캘린더 오픈
     * @details 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다.
     */
    function buildCalendar() {

        let doMonth = new Date(toDay.getFullYear(), toDay.getMonth(), 1); //이번 달 첫 날짜 
        
        let lastDate = new Date(toDay.getFullYear(), toDay.getMonth() + 1, 0); //이번 달 마지막 날짜 
        
        let tbCalendar = document.querySelector(".scriptCalendar > tbody"); //tbody
        
        document.getElementById("calYear").innerText = toDay.getFullYear();                       // @param YYYY월
        document.getElementById("calMonth").innerText = autoLeftPad((toDay.getMonth() + 1), 2);   // @param MM월
           

        // @details 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다.
        while(tbCalendar.rows.length > 0) {
            tbCalendar.deleteRow(tbCalendar.rows.length - 1);
        }

        // @param 첫번째 개행
        let row = tbCalendar.insertRow();
        // @param 날짜가 표기될 열의 증가값
        let dom = 1;
      
        // @details 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
        //               7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.
        let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();

        // @param 달력 출력
        // @details 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
        for(let day = 1 - doMonth.getDay(); daysLength >= day; day++) {
           
            let column = row.insertCell();
            // @param 평일( 전월일과 익월일의 데이터 제외 )
            if(Math.sign(day) == 1 && lastDate.getDate() >= day) {

                // @param 평일 날짜 데이터 삽입
                column.innerText = autoLeftPad(day, 2);

                // @param 일요일인 경우
                if(dom % 7 == 1) {
                    column.style.color = "#FF4D4D";
                }

                // @param 토요일인 경우
                if(dom % 7 == 0) {
                    column.style.color = "#4D4DFF";
                    row = tbCalendar.insertRow();   // @param 토요일이 지나면 다시 가로 행을 한줄 추가한다.
                }

            }

            // @param 평일 전월일과 익월일의 데이터 날짜변경
            else {
                let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
                column.innerText = autoLeftPad(exceptDay.getDate(), 2);
                column.style.backgroundColor = "#FFFFE6";
            }

            // @brief   전월, 명월 음영처리
            // @details 현재년과 선택 년도가 같은경우
            if(toDay.getFullYear() == nowDate.getFullYear()) {

                // @details 현재월과 선택월이 같은경우
                if(toDay.getMonth() == nowDate.getMonth()) {

                    // @details 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
                    if(nowDate.getDate() > day && Math.sign(day) == 1) {
                        column.style.backgroundColor = "#FFFFE6";
                        column.style.cursor = "pointer";
                        
                  
                        column.onclick = function(){ calendarChoiceDay(this);}
                    }

                    // @details 현재일보다 이후이면서 현재월에 포함되는 일인경우
                    else if(nowDate.getDate() < day && lastDate.getDate() >= day) {
                        column.style.backgroundColor = "#FFFFE6";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this);}
                    }

                    // @details 현재일인 경우
                    else if(nowDate.getDate() == day) {
                        column.style.backgroundColor = "#FFFFE6";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }
                    }

                // @details 현재월보다 이전인경우
                } else if(toDay.getMonth() < nowDate.getMonth()) {
                    if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#FFFFE6";
                        column.onclick = function(){ calendarChoiceDay(this);}
                    }
                }

                // @details 현재월보다 이후인경우
                else {
                    if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#FFFFE6";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }
                    }
                }
            }

            // @details 선택한년도가 현재년도보다 작은경우
            else if(toDay.getFullYear() < nowDate.getFullYear()) {
                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                    column.style.backgroundColor = "#FFFFE6";
                }
            }

            // @details 선택한년도가 현재년도보다 큰경우
            else {
                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
//                     column.style.backgroundColor = "#FFFFFF";
                    column.style.cursor = "pointer";
                    column.onclick = function(){ calendarChoiceDay(this); }
                }
            }
            dom++;
//             console.log('this 는  : ' + column.classList.add('has-event'));
        }
    }

    /**blobk
    
     * @brief   날짜 선택
     * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
     */
    function calendarChoiceDay(column) {
//        column.classList.add('has-event')
       //this 클릭했을 때 이벤트 발생 => ajax 조회 값 가져오기 
       this.addEventListener('click', function(buttonClickHandler) {
           document.getElementById('schedule').style.display = 'inline-block'; //클릭하면 일정란 보이기 
           document.getElementById('scheduleToday').innerHTML = document.getElementById("calMonth").innerText + '월' + document.getElementsByClassName("choiceDay")[0].innerText + '일';

           
           $.ajax({
              url: '${contextPath}/selectSche.gr',
              data: {
                 calContent:document.getElementById('scheduleContent').value,
                groupNo:${groupNo},
                schDate:document.getElementById('scheduleToday').innerText
              },
              success: data => {
                 //조회했을 때 조회한 개수가 3개 이상이면 버튼 비활성화 
                 console.log(data.length)
                 document.getElementById('scheduleContent').value = ''; 
                 const tbodyId = document.getElementById('tbodyId');
                 tbodyId.innerHTML = '';
                 for(sched of data) {
                    
                    //tr, td 생성 후 클래스 적용 
                    const tr = document.createElement('tr');
                    tr.classList.add("centerTrs");
                    
                    const writerTd = document.createElement('td');
                    writerTd.classList.add("leftTds");
                    const writer = sched.calWriter;
                    writerTd.innerHTML = writer;
                    
                    
                    const td = document.createElement('td');
                    td.classList.add("centerTds");
                    //td에 조회된 데이터 적용 
                    const calContent = sched.calContent;
                    td.innerHTML = calContent;
                    
                    //삭제 버튼
                    const button = document.createElement('button');
                  button.setAttribute('type', 'button');
                  button.setAttribute('data-schNo', sched.schNo) //버튼에 일정 번호 적용 
                  button.classList.add('deleteButton');
                  button.innerText = '삭제';
                  
                  button.onclick = function() {
                     const schNo = this.getAttribute('data-schNo'); //일정 번호 가져오기 
                     $.ajax({
                        url:'${contextPath}/delButton.gr',
                        data:{schNo:schNo},
                        success: data => {
                           console.log(data);
                        }, 
                        error: data => {
                           console.log(data);
                        }
                     })
                  } //삭제 버튼 클릭 이벤트 종료 
                  
                  td.appendChild(button);
                  
                    //요소 붙이기 
                    tr.append(writerTd);
                    tr.append(td);
                    tbodyId.append(tr);
                 }
              }, 
              error: data => {
                 console.log(data);
              }
           })
           
        })
        
        // @param  초기화 한다.
        if(document.getElementsByClassName("choiceDay")[0]) {
            // @see 금일인 경우
            if(document.getElementById("calMonth").innerText == autoLeftPad((nowDate.getMonth() + 1), 2) && document.getElementsByClassName("choiceDay")[0].innerText == autoLeftPad(toDay.getDate(), 2)) {
                document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFE6";  
            }
            
            // @see 금일이 아닌 경우
            else { 
                document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFE6";
               //체크 하지 않으면 다시 FFFFFF
            }
            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
        }

        // @param 선택일 체크 표시
        column.style.backgroundColor = "#FFAB00";

        // @param 선택일 클래스명 변경
        column.classList.add("choiceDay");
        
        
        
    }

    /**
     * @brief   숫자 두자릿수( 00 ) 변경
     * @details 자릿수가 한자리인 ( 1, 2, 3등 )의 값을 10, 11, 12등과 같은 두자리수 형식으로 맞추기위해 0을 붙인다.
     * @param   num     앞에 0을 붙일 숫자 값
     * @param   digit   글자의 자릿수를 지정 ( 2자릿수인 경우 00, 3자릿수인 경우 000 … )
     */
    function autoLeftPad(num, digit) {
        if(String(num).length < digit) {
            num = new Array(digit - String(num).length + 1).join("0") + num;
        }
        return num;
    }
   
</script>

<!-- insert 눌렀을 때 -->
<script>
   document.getElementById('insertSchedule').disabled = true; //입력하지 않으면 비활성화 
   document.getElementById('scheduleContent').addEventListener('keyup', function(){
      if (this.value.trim() == '') { //키가 입력 된 이후 입력창이 비어있을 때 버튼 비활성화
         document.getElementById('insertSchedule').disabled = true;
      } else { //키가 입력 된 이후 입력창이 채워져 있을 때 버튼 활성화 
         document.getElementById('insertSchedule').disabled = false;
      }
   })
   
   
   document.getElementById('insertSchedule').addEventListener('click', function() {
      const lu = '${logUser}'
      
      if(tbodyId.children.length == 3){
         alert('최대 3개의 일정까지 등록할 수 있습니다.');
      } else{
         $.ajax({
            url:'${contextPath}/insertCalendar.gr',
            data: {
               calContent:document.getElementById('scheduleContent').value,
               groupNo:${groupNo},
               schDate:document.getElementById('scheduleToday').innerText,
               writer:lu
            },
            success: data => {
               document.getElementById('insertSchedule').disabled = true;
               tbodyId.innerHTML = '';
               
               for(const sche of data) {
                  const tr = document.createElement('tr');
                  tr.classList.add("centerTrs");
                  
                  const contentTd = document.createElement('td');
                  contentTd.classList.add("centerTds");
                  //Td에 값 넣기 
                  contentTd.innerText = sche.calContent;
                  
                  const scheWriter = document.createElement('td');
                    scheWriter.classList.add("leftTds");
                    scheWriter.innerHTML = sche.calWriter;
                  
                    tr.append(scheWriter);
                    tr.append(contentTd);
                  
                  tbodyId.append(tr);
               }
               document.getElementById('scheduleContent').value = ''; 
            },
               
            error: data => {
               console.log(data);
            }
         })
      }

   })
   
   const deleteButton = document.getElementsByClassName('deleteButton');
   for(delBt of deleteButton) {
      delBt.addEventListener('click', function() {
         console.log('asdfsadfasdf');
      })
   }
</script>







</body>
</html>