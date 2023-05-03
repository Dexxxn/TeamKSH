<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  <%@ page import="java.text.SimpleDateFormat" %>   --%> 
 <%@ page import="java.util.Date" %>   
 <%@ page import="java.time.LocalDateTime" %>   
 <%@ page  import="java.time.format.DateTimeFormatter" %>  
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>index</title>

<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@600&display=swap" rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet" href="resources/css/sideCalendar.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/aside.css">


<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="resources/js/main.js" type="text/javascript"></script>
<script src="resources/js/aside.js" type="text/javascript"></script>

<!-- api 한글로 -->
 <script src='fullcalendar/core/locales/ko.js'></script>




<script>
/* 메인캘린더 js  */

	document.addEventListener('DOMContentLoaded', function() {
		$(function () {
			var request = $.ajax({
			    url: "/monthPlan", // 변경하기
			    method: "GET",
			    dataType: "json"
			});
			
			request.done(function (data) {
			    console.log(data); // log 로 데이터 찍어주기.
	    
			    var calendarEl = document.getElementById('main_Calendar');
	
			    var calendar = new FullCalendar.Calendar(calendarEl, {
			     	headerToolbar: {
				        left: 'prev,next today',
				        center: 'title',
				        right: 'dayGridMonth,timeGridWeek,timeGridDay'
			      	},
			      	
 					locale: "ko",
					navLinks: true, // can click day/week names to navigate views
					selectable: true,
					selectMirror: true,
					select: function(arg) {
					console.log(arg);
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
					
					// 상세일정 보기
					// 등록된 일정 클릭시,
					eventClick: function(arg) {
					 
					console.log("#등록된 일정 클릭#");
					console.log(arg.event);
						// 상세 팝업으로
						location.href = "/popup2";
/* 						if (confirm('일정을 삭제하시겠습니까?')) {
							arg.event.remove()
						} */
					},
					
					// 얘는 뭐지
					editable: true,
					dayMaxEvents: true, // allow "more" link when too many events
					dateClick: function(info) {
					    var dateStr = info.dateStr;
					    document.getElementById('dateCheck').value = dateStr;
					}, 
					 
			      // data 로 값이 넘어온다. log 값 전달.  
			      events: data
			    });
			
				calendar.render();
			}); 
			request.fail(function( jqXHR, textStatus ) {
				alert( "Request failed: " + textStatus );
			});
		});
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
</head>
<body>
<div id="container">
	<div id="pageSide_left">
		<header><div id="company_logo"><img src="resources/img/hospital_logo_ex.png" id="hospital_logo" ></div>
		</header>
		<aside>
			<div id="form_wrap">
			<form method="post">
			
					<div id="form_contents">
					<%
					request.setCharacterEncoding("utf-8");
					LocalDateTime now = LocalDateTime.now();
					String formatDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"+"_"+"HHmmss"));
					%>
					  <input type="hidden" readonly value= <%="P_" +formatDate%>  name="p_chart" value="${patientInfo.p_chart}" />  	<!-- 차트번호 (현재datetime) -->
					<div class="label_detail"><label class="patient_form_label">환자이름</label>
						<input class="patient_form_input" id="p_name_IN" type="text" name="p_name" value="${patientInfo.p_name}" ></div>
						
					<div class="label_detail"><label class="patient_form_label">주민번호</label>
						<input class="patient_form_input" type="text" name="p_no" value="${patientInfo.p_no}"></div>
					<div id="visit_radio_div">
							<input type="radio"  value="first"  name="p_visit" id="first_visit" checked ><span class="patient_visit_radio" onclick="showBTN_f()">초진</span>
							<input type="radio"  value="second" name="p_visit" id="second_visit" onclick="showBTN_s()"><span class="patient_visit_radio">재진</span>
						<input type="submit" value="등록" class="patient_form_btn rs_btn1"  formaction="/patientF" id="patientF">
						<input type="submit" value="조회" class="patient_form_btn rs_btn1"  formaction="/patientS" id="patientS">
						<input type="reset" value="초기화" class="patient_form_btn rs_btn1">
						<br>
					</div>
						<div class="label_detail"><label class="patient_form_label">연락처</label>
							<input class="patient_form_input" type="text" name="p_phone" value="${patientInfo.p_phone}">
						</div>
						<div class="label_detail textarea_label_position">
							<label class="patient_form_label textarea_label">주소</label>
							<textarea class="patient_textarea" rows="3" cols="21" name="p_addr">${patientInfo.p_addr}</textarea>
						</div>
						
				</div>
	</form><!-- 폼이랑 사이드캘린더 따로 잡아야 함 -->
					<%@ include file = "sideCalendar.jsp" %>
					
		<form method="post" action="/reserve">
			<!-- 캘린더 아래 나머지 입력폼  -->
			<div id="sub_form">
				<input type="hidden" id="p_name_OUT" name="s_patient" value="">  <!--출력되는 곳: 스케줄 테이블에 넣을 환자 이름  -->
				<div class="label_detail"><label class="patient_form_label" >예약일자</label>
					<input class="rs_date" type="text" id="selectedDate" name="s_date" readonly>
				</div>
				<div class="label_detail"><label class="patient_form_label">예약시각</label>
					<!-- 시작시간 --><select class="rs_time" name="s_startTime">
									<option>09:00</option><option>09:30</option><option>10:00</option><option>10:30</option><option>11:00</option><option>11:30</option><option>12:00</option>
									<option>12:30</option><option>13:00</option><option>13:30</option><option>14:00</option><option>14:30</option><option>15:00</option><option>15:30</option>
									<option>16:00</option><option>16:30</option><option>17:00</option>
					</select> ~
					<!-- 끝 시간 --><select class="rs_time" name="s_endTime">
									<option>09:30</option><option>10:00</option><option>10:30</option><option>11:00</option><option>11:30</option><option>12:00</option>
									<option>12:30</option><option>13:00</option><option>13:30</option><option>14:00</option><option>14:30</option><option>15:00</option><option>15:30</option>
									<option>16:00</option><option>16:30</option><option>17:00</option><option>17:30</option>
					</select>
				</div>
				
				<div class="label_detail"><label class="patient_form_label">진료과목</label>
					<!-- 과 --><select class="patient_form_select" name="index_s_dept" id="index_medical_dept">
								<option>선택</option>
								<option value="A">정형외과</option>
								<option value="B">신경외과</option>
								<option value="C">내과</option>
							</select>
				</div>
				<div class="label_detail"><label class="patient_form_label">진료의사</label>
					<!-- 해당과의 의료진  --><select class="patient_form_select" name="s_doctor" id="index_selectDept">
								<!-- <option>김태원 원장님</option>
								<option>엄경수 원장님</option> -->
							</select>
				</div>
				<div  class="label_detail textarea_label_position">
				<label class="patient_form_label textarea_label">진료내용</label>
					<textarea class="patient_textarea" rows="3" cols="21" name="s_memo"></textarea>
				</div>
				 <input type="submit" value="예약 등록" class="patient_form_btn" id="rs_btn2"> 
				 <input type="button" value="새로고침" class="patient_form_btn" id="" onclick="location.href='/aside'"><br><br><br><br><br><br><br>
			</div>
	</form>

			<!-- 진료 외 일정들 등록 전용 버튼 --><input id="other_schedule_register_btn" type="button" value="일정 등록" onclick="location.href='/popup'" >
			<!-- 진료 외 일정들 등록 전용 버튼 --><input type="button" value="상세 일정" onclick="location.href='/popup2'" >
		</div> <!-- end of "form_wrap"  -->
		</aside>
	</div><!-- pageSide_left -->


	<div id="pageSide_right">
	<!-- 메인캘린더 상단 -->
	<div id="right_top">
			<!-- 네비게이션 바 -->
			<div id="nav_btn_set">
				<div class="nav_btn" id="schedule_nav_btn"><a href="#;" class="nav_anchor">schedule</a></div>
				<div class="nav_btn" id="notice_nav_btn"><a href="notice" class="nav_anchor">notice</a></div>
			</div>
			<div id="navBar"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Outpatient Clinic Schedule Board</div>
			
			
    <!-- 이달 전체 건수 --><input type="text" id="monthly_total" placeholder="당월 전체 : n건" readonly>
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
    
    
    		<div class="scheduleSelect">
			<button class="specificDate_btn"><</button><input id="dateCheck" type="text" readonly><button class="specificDate_btn">></button>
    			<span class="doctor_schedule_select"><label class="doctor_schedule_label">진료과목</label>
					<!-- 과 -->
					<select class="top_optionSelect" name="index_top_s_dept" id="index_top_medical_dept">
						<option>선택</option>
						<option value="A">정형외과</option>
						<option value="B">신경외과</option>
						<option value="C">내과</option>
					</select>
				</span>
				<span class="doctor_schedule_select"><label class="doctor_schedule_label">진료의</label>
					<!-- 해당과의 의료진  -->
					<select class="top_optionSelect" name="s_name" id="index_top_selectDept">
						<!-- <option>엄경수 원장님</option><option>김태원 원장님</option> -->
					</select>
				</span>
				<span class="doctor_schedule_select"><label class="doctor_schedule_label">일정</label>
					<!-- 일정 분류-->
						 <select class="top_optionSelect" name="s_type">
						<option>선택</option>
						<option value="OC">외래진료</option>
						<option value="OR">수술</option>
						<option value="R">회진</option>
						<option value="S">외부 일정</option>														
						<option value="H">휴무</option>
					</select>
					
				</span>
				
						<input type="submit" value="검색" id="scheduleSelect_search_btn">
			</div><!-- scheduleSelect -->
	</div><!-- right_top -->	

		
		<!-- 메인 캘린더 -->
		  	<div id='main_Calendar'></div>
		 </div>
	</div><!-- pageSide_right -->
	</div><!-- wrapper -->

</body>
</html>