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
	<form id="date_submit" action="" method="get">	
		<div id="calendar_insert">
			<div class="item">
				<div class="label">날짜</div>			
				<div class="value">
					<input id="selectedDate" type="text" name="date">
				</div>
			</div>	
			<div class="item">
				<div class="label">과목</div>			
				<div class="value">    
				    <select name="dept">
						<option value="">선택</option>
						<option value="">정형외과</option>
						<option value="">신경외과</option>														
						<option value="">내과</option>
					</select>
				</div>

			</div>
			<div class="item">	
				<div class="label">의사명</div>
				<div class="value">    
				    <select name="name">
						<option value="">선택</option>
						<!-- for문 시작 --><!-- 상단 코드 필요 -->
						<c:forEach items="${medical}" var="medical">
		                    <option value="">${medical.s_name}</option>
		                </c:forEach>
					</select>
				</div>		
			</div>
			<div class="item">	
				<div class="label">일정 종류</div>
				<div class="value">    
				    <select name="datetype">
						<option value="">선택</option>
						<option value="">수술</option>
						<option value="">회진</option>
						<option value="">외부 일정</option>														
						<option value="">휴무</option>
					</select>
				</div>				
			</div>
			<div class="item">	
				<div class="label">시간</div>
				<div class="value">    
				    <select name="datetime">
						<option value="">선택</option>
						<option value="">오전(09:00~)</option>
						<option value="">오후(14:00~)</option>														
					</select>
				</div>
			</div>
			<div class="item">	
				<div class="label">메모</div>	
				<div>
					<textarea name="memo" placeholder="기타 추가 사항 입력."></textarea>
				</div>	
			</div>			
		</div>	
	</form>	
	<div align="center">
		<input class="button first" type="submit" value="확인" id="date_submit">
		<input class="button second" type="button" value="취소">
	</div>
</div>

</body>
</html>