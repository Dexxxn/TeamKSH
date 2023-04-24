<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>aside 작업 페이지-추후 메인으로 복붙 예정</title>

<!-- CSS -->
<link rel="stylesheet" href="resources/css/sideCalendar.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/aside.css">


<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="resources/js/main.js" type="text/javascript"></script>



<script>


/* 메인캘린더 js  */
	  document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('main_Calendar');
	
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	      },
	      
	      navLinks: true, // can click day/week names to navigate views
	      selectable: true,
	      selectMirror: true,
	      select: function(arg) {
	        var title = prompt('일정추가');
	        if (title) {
	          calendar.addEvent({
	            title: title,
	            start: arg.start,
	            end: arg.end,
	            allDay: arg.allDay
	          })
	        }
	        calendar.unselect()
	      },
	      eventClick: function(arg) {
	        if (confirm('일정을 삭제하시겠습니까?')) {
	          arg.event.remove()
	        }
	      },
	      editable: true,
	      dayMaxEvents: true, // allow "more" link when too many events
	     
	    });
	
	    calendar.render();
	  });  
	
	/* 네비게이션 달력 js */
	 var today = new Date();
        var aside_miniCalendar_date = new Date();
        function prevCalendar() {
            today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
            buildCalendar();  
        }
        function nextCalendar() {
            today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
            buildCalendar();
        }
        function buildCalendar(){
            var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
            var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
            var tbCalendar = document.getElementById("nav_calendar");
            var tbCalendarYM = document.getElementById("tbCalendarYM");
            tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";  
            while (tbCalendar.rows.length > 1) {          
                tbCalendar.deleteRow(tbCalendar.rows.length-1);                  
            }
            var row = null;
            row = tbCalendar.insertRow();             
            var cnt = 0;
            for (i=0; i<doMonth.getDay(); i++) {             
                cell = row.insertCell();
                cnt = cnt + 1;
            }            
            for (i=1; i<=lastDate.getDate(); i++) {              
                cell = row.insertCell();
                cell.innerHTML = i;
                cell.onclick = function () {
                    var event = prompt("일정추가");
                }
                cnt = cnt + 1;
                if (cnt %7 == 2){
                	cell.innerHTML= i + "월"
                }
                if (cnt %7 == 3){
                	cell.innerHTML= i + "화"
                }
                if (cnt %7 == 4){
                	cell.innerHTML= i + "수"
                }
                if (cnt %7 == 5){
                	cell.innerHTML= i + "목"
                }
                if (cnt %7 == 6){
                	cell.innerHTML= i + "금"
                }
                if (cnt % 7 == 1) {
                    cell.innerHTML = "<font color=#FF0000>" + i +"일"
                }    
                if (cnt%7 == 0){
                    cell.innerHTML = "<font color=solid>" + i + "토"                                                     
                }              
                if (today.getFullYear() == date.getFullYear()
                    && today.getMonth() == date.getMonth()
                    && i == date.getDate()) {
                    cell.bgColor = "#FAF58C";
                }
            } 
        }
        

  
</script>
<!--여기부터  -->


</head>
<body>
<div id="container">
	<div id="pageSide_left">
		<header><div id="company_logo"><img src="resources/img/hospital_logo_ex.png" id="hospital_logo" ></div>
		</header>
		<aside>
			<div id="form_wrap">
				<form>
					<!-- <p id="patient_form_title">진료예약 조회 및 등록 form</p><br> -->
					<div id="form_contents">
					<div class="label_detail"><label class="patient_form_label">환자이름</label><input class="patient_form_input" type="text"></div>
					<div class="label_detail"><label class="patient_form_label">주민번호</label><input class="patient_form_input" type="text"></div>
						<div id="visit_radio_div">
							<input type="radio" name="visit" value="first" checked><span class="patient_visit_radio">초진</span>
							<input type="radio" name="visit" value="second"><span class="patient_visit_radio">재진</span>
							<input type="button" value="조회/등록" class="patient_form_btn"><br>
						</div>
							<!-- <div  class="label_detail"><label class="patient_form_label">성별</label><input class="patient_form_input" type="text"></div> -->
							<div  class="label_detail"><label class="patient_form_label">연락처</label><input class="patient_form_input" type="text"></div>
							<div  class="label_detail"><label class="patient_form_label textarea_label">주소</label><textarea class="patient_textarea" rows="3" cols="21"></textarea></div>
							<div  class="label_detail"><label class="patient_form_label textarea_label">진료내용</label><textarea class="patient_textarea" rows="3" cols="21"></textarea></div><br>
					 <!--사이드캘린더 자리 include-->
					</div>
				</form><!-- 폼이랑 사이드캘린더 따로 잡아야 함 -->
					<%@ include file = "sideCalendar.jsp" %>
			</div> <!-- end of "form_wrap"  -->
		</aside>
	</div><!-- pageSide_left -->

	<div id="pageSide_right">
		 <div id="main_Calendar_wrap">
		 <!-- 네비게이션 달력 -->
		<p></p>
    <table id="nav_calendar" border="3" align="center" >
        <tr>
            <td class="nav_calendar_td"><label onclick="prevCalendar()"><</label></td>
            <td class="nav_calendar_td_YM" align="center" id="tbCalendarYM" colspan="5">
                yyyy년 m월
            </td>
            <td class="nav_calendar_td"><label onclick="nextCalendar()">></label></td>
        </tr>    
    </table>
    <script type="text/javascript" > buildCalendar(); </script>  
		  	<div id='main_Calendar'></div>
		 </div>
	</div><!-- pageSide_right -->
</div><!-- wrapper -->

</body>
</html>