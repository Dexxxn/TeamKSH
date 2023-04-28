<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head> 
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>일정 추가 팝업</title>
	
	<link rel="stylesheet" href="resources/css/popUp.css" />
	<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/sideCalendar.css">
	<script src="https://kit.fontawesome.com/0f537ad086.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="/resources/js/popUp.js"></script>
</head>
<body>
<!-- 팝업창 -->
<div class="date_popUp">
	<div class="title">
		<span>일정 등록</span>
		<i class="fas fa-regular fa-xmark" style="color: white; float: right;"></i>
	</div>
	
	<!-- 캘린더 자리 -->
	<div id="miniCalendar">
		<%@ include file = "sideCalendar.jsp" %>
	</div>	
	<!-- INSERT할 정보 -->
	<form id="addSchedule" action="/add" method="get">	
		<div class="calendar_insert">
			<div class="item">
				<div class="label">날짜</div>			
				<div class="value">
					<input id="selectedDate" type="text" name="s_date">
				</div>
			</div>	
			<div class="item">
				<div class="label">과목</div>			
				<div class="value">    
				    <select name="s_dept" id="dept"><!--  onchange="location.href='/popup'" -->
						<option>선택</option>
						<option value="A">정형외과</option>
						<option value="B">신경외과</option>														
						<option value="C">내과</option>
					</select>
				</div>
			</div>
			<div class="item">	
				<div class="label">의사명</div>
				<div class="value">    
				    <select name="s_doctor" id="selectDept">						
<%--					<!-- for문 시작 --><!-- 상단 코드 필요 -->
						<c:forEach items="${medical}" var="medical">
		                    <option value="${medical.s_name}">${medical.s_name}</option>
		                </c:forEach> --%>
					</select>
				</div>
			</div>
			<div class="item">	
				<div class="label">일정 종류</div>
				<div class="value">    
				    <select name="s_type" id="type">
						<option>선택</option>
						<option value="OR">수술</option>
						<option value="R">회진</option>
						<option value="S">외부 일정</option>														
						<option value="H">휴무</option>
					</select>
				</div>				
			</div>
			<div class="item" id="timeSelect">	
				<div class="label">시간</div>
				<div class="value">    
				    <select name="s_startTime">
						<option value="09:00">09:00</option>
						<option value="09:30">09:30</option>
						<option value="10:00">10:00</option>
						<option value="10:30">10:30</option>
						<option value="11:00">11:00</option>
						<option value="11:30">11:30</option>
						<option value="12:00">12:00</option>
						<option value="12:30">12:30</option>
						<option value="14:00">14:00</option>
						<option value="14:30">14:30</option>
						<option value="15:00">15:00</option>
						<option value="15:30">15:30</option>
						<option value="16:00">16:00</option>
						<option value="16:30">16:30</option>
						<option value="17:00">17:00</option>
						<option value="17:30">17:30</option>														
					</select> ~
				    <select name="s_endTime">
						<option value="09:30">09:30</option>
						<option value="10:00">10:00</option>
						<option value="10:30">10:30</option>
						<option value="11:00">11:00</option>
						<option value="11:30">11:30</option>
						<option value="12:00">12:00</option>
						<option value="12:30">12:30</option>
						<option value="14:00">14:00</option>
						<option value="14:30">14:30</option>
						<option value="15:00">15:00</option>
						<option value="15:30">15:30</option>
						<option value="16:00">16:00</option>
						<option value="16:30">16:30</option>
						<option value="17:00">17:00</option>
						<option value="17:30">17:30</option>														
					</select>
				</div>
			</div>
			<div class="item">	
				<div class="label">메모</div>	
				<div>
					<textarea name="s_memo" placeholder="기타 추가 사항 입력."></textarea>
				</div>	
			</div>			
		</div>	
	</form>	
	<div align="center">
		<input class="button first" type="submit" value="확인" form="addSchedule">
		<input class="button second" type="button" value="취소">
	</div>
</div>

</body>
</html>