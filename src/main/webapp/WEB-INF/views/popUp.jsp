<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
	<meta charset="UTF-8">
	<title>일정 추가, 상세 일정 팝업</title>
	<link rel="stylesheet" href="resources/css/popUp.css" />
	<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/0f537ad086.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- 팝업창 -->
<div class="date_popUp">
	<div style="background-color:blue;">
		<span style="color: white">일정 등록</span>
		<i class="fas fa-regular fa-xmark" style="color: white; float: right;"></i>
	</div>
	<form>	
		<!-- 캘린더 자리 -->
		<div id="calendar">
			<img src="resources/img/calendar.jpg">
		</div>
		<!-- INSERT 정보 -->
		<div id="calendar_insert">
			<div class="item">
				<div class="label">날짜</div>			
				<div>
					2023.04.21(select해온 날짜)
				</div>
			</div>	
			<div class="item">
				<div class="label">과목</div>			
				<div class="value">    
				    <select name="type">
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
				    <select name="type">
						<option value="">선택</option>
						<option value="">정기원 원장님</option>
						<option value="">이성언 원장님</option>														
						<option value="">장희영 원장님</option>
					</select>
				</div>		
			</div>
			<div class="item">	
				<div class="label">일정 종류</div>
				<div class="value">    
				    <select name="type">
						<option value="">선택</option>
						<option value="">수술</option>
						<option value="">외부 일정</option>														
						<option value="">휴무</option>
					</select>
				</div>				
			</div>
			<div class="item">	
				<div class="label">시간</div>
				<div class="value">    
				    <select name="type">
						<option value="">선택</option>
						<option value="">오전(09:00~)</option>
						<option value="">오후(14:00~)</option>														
					</select>
				</div>
			</div>
			<div class="item">	
				<div class="label">메모</div>	
				<div>
					<textarea>메모</textarea>
				</div>	
			</div>			
		</div>
		<div>
			<input class="button" type="submit" value="확인">
			<input class="button" type="button" value="취소">
		</div>	
	</form>	
</div>

</body>
</html>