<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  <%@ page import="java.text.SimpleDateFormat" %>   --%> 
 <%@ page import="java.util.Date" %>   
 <%@ page import="java.time.LocalDateTime" %>   
 <%@ page  import="java.time.format.DateTimeFormatter" %>  
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="/resources/css/index.css">


<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="resources/js/main.js" type="text/javascript"></script>
<script src="resources/js/index.js" type="text/javascript"></script>
<script src="resources/js/popUp.js" type="text/javascript"></script>

<!-- api 한글로 -->
 <script src='fullcalendar/core/locales/ko.js'></script>

<!-- 기 내원환자 alert띄우기  -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


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
			    var monthlyTotal = data.length;
			    document.getElementById('monthly_total').value = '당월 전체: ' + monthlyTotal;
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
					eventDrop: function (info){
						console.log(info)
                        if(confirm("'"+ info.event.title +"' 일정을 수정하시겠습니까 ?")){

                        //var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                        var obj = new Object();
                        obj.s_doctor = info.event._def.title;	// 의사
                        obj.s_no = info.event._def.extendedProps.s_no;	// 의사
                        var startDate = new Date(info.event._instance.range.start);// 시작일자
                        var s_date = startDate.toISOString().substring(0, 10);	// 시작일자 날짜만
                        var s_startTime = startDate.toISOString().substring(11, 16);	// 시작일자 시간만
                        var endDate = new Date(info.event._instance.range.end);	// 종료일자
                        var s_endTime = endDate.toISOString().substring(11, 16);	// 종료일자 시간만
                        // s_no
                        obj.s_date = s_date;
                        obj.s_startTime = s_startTime;
                        obj.s_endTime = s_endTime;
                        console.log(obj);
                        }else{                            
                            location.reload();
                        }
                        $(function modifyData() {
                            $.ajax({
                                url: "/update",
                                method: "PATCH",
                                dataType: "json",
                                data: JSON.stringify(obj),
                                contentType: 'application/json',
                            })
                        })


                    },
					/* select: function(arg) {
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
					}, */
					
					// 상세일정 보기
					// 등록된 일정 클릭시,
					eventClick: function(arg) {
					console.log("#등록된 일정 클릭#");
					
					console.log(arg)
					console.log(arg.event);
					
					// extendedProps: 이벤트 객체의 속성을 직접 정의
					console.log(arg.event.extendedProps);
					var sno = arg.event.extendedProps.s_no;
						// 상세 팝업으로
						//location.href = "/popup2?s_no=" + sno;
						var x = window.screen.width/2 - 490 / 2;
						var y = window.screen.height/2 - 631 / 2;
						
						let options2 = "location=no,toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no,width=490, height=631, left=" + x + ",top=" + y;
						window.open("http://localhost:8080/popup2?s_no=" +sno,"_popup2", options2);
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
			    
			    $("#scheduleSelect_search_btn").click(function () {
	                var s_dept = $("#index_top_medical_dept").val(); // 선택한 진료과목
	                var s_name = $("#index_top_selectDept").val(); // 선택한 진료의
	                var s_type = $("select[name='s_type']").val(); // 선택한 일정 분류

	                // AJAX 요청을 통해 선택한 일정 데이터를 가져옴
	                $.getJSON("/doctorSchedule/" + s_dept + "/" + s_name + "/" + s_type + ".json", function (data) {
	                    var scheduleList = data;

	                    // 풀 캘린더의 이벤트 배열 생성
	                    var events = [];

	                    // 선택한 일정을 풀 캘린더의 이벤트 배열에 추가
	                    for (var i = 0; i < scheduleList.length; i++) {
	                        var schedule = scheduleList[i];
	                        var event = {
	                            title: schedule.title,
	                            start: schedule.start,
	                            end: schedule.end
	                            // 여기에 일정 정보를 추가할 수 있음
	                        };
	                        events.push(event);
	                    }

	                    // 풀 캘린더에 선택한 일정만 표시
	                    calendar.removeAllEvents(); // 기존의 모든 이벤트 제거
	                    calendar.addEventSource(events); // 선택한 일정 이벤트 추가
	                });
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
/*                 cell.onclick = function () {
                   var event = prompt("일정추가"); 

                } */
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
		<header> <div id="company_logo"><!-- <img src="resources/img/hospital_logo_ex.png" id="hospital_logo" > --></div> 
		</header>
		<aside>
			<div id="form_wrap">
			<form method="post">
			
			<!-- <div id="form_contents"> -->
					<%
					request.setCharacterEncoding("utf-8");
					LocalDateTime now = LocalDateTime.now();
					String formatDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"+"_"+"HHmmss"));
					%>
					<div id="company_logo"><img src="resources/img/hospital_logo_ex.png" id="hospital_logo" ></div>
			<div id="form_contents">
					  <input type="hidden" readonly value= <%="P_" +formatDate%>  name="p_chart" value="${patientInfo.p_chart}" />  	<!-- 차트번호 (현재datetime) -->
					<div class="label_detail"><label class="patient_form_label">환자이름</label>
						<input class="patient_form_input" id="p_name_IN" type="text" name="p_name" value="${patientInfo.p_name}" ></div>
						
					<div class="label_detail"><label class="patient_form_label">주민번호</label>
						<input class="patient_form_input" id="p_idNum_IN" type="text" name="p_no" value="${patientInfo.p_no}"></div>
					<div id="visit_radio_div">
							<input type="radio"  value="first"  name="p_visit" id="first_visit" checked ><span class="patient_visit_radio" onclick="showBTN_f()">초진</span>
							<input type="radio"  value="second" name="p_visit" id="second_visit" onclick="showBTN_s()"><span class="patient_visit_radio">재진</span>
						<input type="submit" value="등록" class="patient_form_btn rs_btn1"  formaction="/patientF" id="patientF">
						<input type="submit" value="조회" class="patient_form_btn rs_btn1"  formaction="/patientS" id="patientS">
						<button type="button" onclick="already_patient_Chk()" class="patient_form_btn rs_btn1">중복</button>
						<!-- <input type="reset" value="초기화" class="patient_form_btn rs_btn1"> -->
						<br>
					</div>
						<div class="label_detail"><label class="patient_form_label">연락처</label>
							<input class="patient_form_input" type="text" maxlength="11" name="p_phone" value="${patientInfo.p_phone}">
						</div>
						<div class="label_detail textarea_label_position">
							<label class="patient_form_label textarea_label">주소</label>
							<textarea class="patient_textarea" rows="3" cols="21" name="p_addr">${patientInfo.p_addr}</textarea>
						</div>
						
				</div><!-- form_contents끝 -->
	</form><!-- 폼이랑 사이드캘린더 따로 잡아야 함 -->
					<%@ include file = "sideCalendar.jsp" %>
					
		<form method="post">
			<!-- 캘린더 아래 나머지 입력폼  -->
			<div id="sub_form">
				<input type="hidden" id="p_name_OUT" name="s_patient">  <!--출력되는 곳: 스케줄 테이블에 넣을 환자 이름  -->
				<input type="hidden" id="p_idNum_OUT" name="s_patientIdNum"> 
				<div class="label_detail"><label class="patient_form_label" >예약일자</label>
					<input class="rs_date" type="text" id="selectedDate" name="s_date" readonly value="${OC_reservation.s_date}">
				</div>
				<div class="label_detail"><label class="patient_form_label">예약시각</label>
					<!-- 시작시간 --><select class="rs_time" name="s_startTime">
				 	<option selected>${OC_reservation.s_startTime}</option> 
									<option>09:00</option><option>09:30</option><option>10:00</option><option>10:30</option><option>11:00</option><option>11:30</option><option>12:00</option>
									<option>12:30</option><option>14:00</option><option>14:30</option><option>15:00</option><option>15:30</option>
									<option>16:00</option><option>16:30</option><option>17:00</option>
					</select> ~
					<!-- 끝 시간 --><select class="rs_time" name="s_endTime">
					<option selected>${OC_reservation.s_endTime}</option>
									<option>09:30</option><option>10:00</option><option>10:30</option><option>11:00</option><option>11:30</option><option>12:00</option>
									<option>12:30</option><option>13:00</option><option>14:30</option><option>15:00</option><option>15:30</option>
									<option>16:00</option><option>16:30</option><option>17:00</option><option>17:30</option>
					</select>
				</div>
				
				<div class="label_detail"><label class="patient_form_label">진료과목</label>
					<!-- 과 --><select class="patient_form_select" name="index_s_dept" id="index_medical_dept">
								<option>선택</option>
								<option value="정형외과">정형외과</option>
								<option value="신경외과">신경외과</option>
								<option value="내과">내과</option>
							</select>
							
				</div>
				<div class="label_detail"><label class="patient_form_label">진료의사</label>
					<!-- 해당과의 의료진  --><select class="patient_form_select" name="s_doctor" id="index_selectDept">
										<option selected>${OC_reservation.s_doctor}</option>
							</select>
				</div>
				<div  class="label_detail textarea_label_position">
				<label class="patient_form_label textarea_label">진료내용</label>
					<textarea class="patient_textarea" rows="3" cols="21" name="s_memo" id="alert">${OC_reservation.s_memo}</textarea>
				</div>
				<div id="reservation_btn_set">
				<!--  <button type="button" id= "reservation_confirm_btn" onclick="no_reservation()">button</button> --><!--  예약조회 버튼이랑 기능 합쳐야,,,,  -->  
				 <!-- <input type="submit" value="예약 조회" class="patient_form_btn" id="reservation_confirm" formaction="/reservationCheck" onsubmit="return no_reservation()">  -->
				 <input type="submit" value="예약 조회" class="patient_form_btn" id="reservation_confirm" formaction="/reservationCheck"> 
				 <input type="submit" value="예약 등록" class="patient_form_btn" id="rs_btn2" formaction="/reserve"> 
				 <!-- <input type="button" value="새로고침" class="patient_form_btn" id="" onclick="location.href='/index'"> --><br><br><br><br><br><br><br>
				 </div>
			</div>
	</form>

			<!-- 진료 외 일정들 등록 전용 버튼 --><input onclick="openPopup()" id="other_schedule_register_btn" type="button" value="일정 등록">

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
				<div style="margin-left: auto;"><b>${login.s_name}</b>님 Have a good day!</div>
			</div>
			 
			<div id="navBar"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Outpatient Clinic Schedule Board</div>
			
			
    <!-- 이달 전체 건수 --><input type="text" id="monthly_total" placeholder="당월 전체 : " readonly>
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
			<button id="prevDateBtn" class="specificDate_btn"><</button>
			<input id="dateCheck" type="text" readonly>
			<button id="nextDateBtn" class="specificDate_btn">></button>
			<script>
    		function preDate() {
    			  var currentDate = new Date(document.getElementById('dateCheck').value);
    			  currentDate.setDate(currentDate.getDate() - 1);
    			  document.getElementById('dateCheck').value = currentDate.toISOString().substr(0, 10);
    			}

    			function nextDate() {
    			  var currentDate = new Date(document.getElementById('dateCheck').value);
    			  currentDate.setDate(currentDate.getDate() + 1);
    			  document.getElementById('dateCheck').value = currentDate.toISOString().substr(0, 10);
    			}

    			document.getElementById('prevDateBtn').addEventListener('click', preDate);
    			document.getElementById('nextDateBtn').addEventListener('click', nextDate);
    		</script>
    			<span class="doctor_schedule_select"><label class="doctor_schedule_label">진료과목</label>
					<!-- 과 -->
					<select class="top_optionSelect" name="index_top_s_dept" id="index_top_medical_dept">
						<option>선택</option>
						<option value="정형외과">정형외과</option>
						<option value="신경외과">신경외과</option>
						<option value="내과">내과</option>
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
				
						<button id="scheduleSelect_search_btn">검색</button>
			</div><!-- scheduleSelect -->
	</div><!-- right_top -->	

		
		<!-- 메인 캘린더 -->
		  	<div id='main_Calendar'></div>
		 </div>
	</div><!-- pageSide_right -->
	</div><!-- wrapper -->
</body>
</html>