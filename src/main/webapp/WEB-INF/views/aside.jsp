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

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="/resources/js/main.js" type="text/javascript"></script>


<script>


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
	      events: [
	        {
	          title: 'All Day Event',
	          start: '2023-01-01'
	        },
	        {
	          title: 'Long Event',
	          start: '2023-01-07',
	          end: '2023-01-10'
	        },
	        {
	          groupId: 999,
	          title: 'Repeating Event',
	          start: '2023-01-09T16:00:00'
	        },
	        {
	          groupId: 999,
	          title: 'Repeating Event',
	          start: '2023-01-16T16:00:00'
	        },
	        {
	          title: 'Conference',
	          start: '2023-01-11',
	          end: '2023-01-13'
	        },
	        {
	          title: 'Meeting',
	          start: '2023-01-12T10:30:00',
	          end: '2023-01-12T12:30:00'
	        },
	        {
	          title: 'Lunch',
	          start: '2023-01-12T12:00:00'
	        },
	        {
	          title: 'Meeting',
	          start: '2023-01-12T14:30:00'
	        },
	        {
	          title: 'Happy Hour',
	          start: '2023-01-12T17:30:00'
	        },
	        {
	          title: 'Dinner',
	          start: '2023-01-12T20:00:00'
	        },
	        {
	          title: 'Birthday Party',
	          start: '2023-01-13T07:00:00'
	        },
	        {
	          title: 'Click for Google',
	          url: 'http://google.com/',
	          start: '2023-01-28'
	        }
	      ]
	    });
	
	    calendar.render();
	  });
	
</script>
<style>

	/* 전체 */
	#container{display: flex; width:100%; height:100%; /* background-color:#f5f5f5; */}
	/* 로고 자리 */
	#company_logo{ width: 245px; height: 100px; /* background-color: #E6E6FA; */}
	#hospital_logo{width: 270px; height: 100px;}
	#pageSide_left{background-color: #f5f5f5; }
	
	#pageSide_right{/* background-color: #FAFAD2; */ }
	/* aside 조회등록 폼  */
	#form_wrap{
		margin-top: 10px;
		width: 260px;
		height: 1920px;
		margin-left: 10px;
		font-size: 13px;
		font-weight: bold;

		/* background-color: pink; */
	}
	
/* 	폼 타이틀 #form_wrap #patient_form_title{font-size: 16px; text-align: center; color: blue;} */
	
	#form_wrap .label_detail{ padding: 2px;}
	
	#form_wrap #form_contents{/* background-color: yellow; */}
	
	#form_wrap .patient_visit_radio{margin:6px;}
	
	#form_wrap .patient_form_btn{margin-left: 9px;}
	
	#form_wrap .patient_form_label{ display: inline-block; padding:2px; width:60px; font-size:13px; text-align: center; background-color: #f5f5f5;}
	
	#form_wrap .textarea_label{/* padding:2px; */}
	
	#form_wrap .patient_form_input{width:173px; padding: 1px; font-size:13px; font-weight: bold; }
	
	#form_wrap .patient_textarea{ resize: none; padding: 1px; font-weight: bold; } 
	
	#form_wrap #visit_radio_div{ margin-left:50px; padding: 3px;}
	
	/* aside 미니 캘린더  */
	  .calendar {
	    max-width: 230px;
	    height: 100px;
	    margin-left: 10px;
	/*     margin-top: 600px;  */
	/* background-color:yellow; */
	  } 
	
	
	/* main 캘린더 */
	#main_Calendar_wrap{
		width: 1580px;
		height: 500px;
		/* background-color: yellow; */
		margin-left: 30px;
	
		
	}
	
	#main_Calendar{ margin-top: 150px;}
	
	
</style>
</head>
<body>
<div id="container">
	<div id="pageSide_left">
		<header><div id="company_logo"><img src="/resources/img/hospital_logo_ex.png" id="hospital_logo" ></div></header>
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
		  	<div id='main_Calendar'></div>
		 </div>
	</div><!-- pageSide_right -->
</div><!-- wrapper -->
</body>
</html>