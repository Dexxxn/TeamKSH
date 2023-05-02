<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상세 일정 팝업</title>
	<link rel="stylesheet" href="resources/css/popUp.css" />
	<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/0f537ad086.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- 팝업창 -->
<div class="date_popUp">
	<div class="title">
		<span>상세 일정</span>
		<i class="fas fa-regular fa-xmark" style="color: white; float: right;"></i>
	</div>
	<form>	
		<!-- 일정 정보 -->
		<div class="calendar_select">
			<div class="item_title">
				<i class="fa-solid fa-square fa-2xs"></i> <b>스케줄 정보</b>
			</div>		
			<div class="item">
				<div class="label">날짜</div>			
				<div class="value">
					<input type="text" name="date">
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
						<option value="">회진</option>
						<option value="">외부 일정</option>														
						<option value="">휴무</option>
					</select>
				</div>				
			</div>
			<div class="item">	
				<div class="label">시간</div>
				<div class="value">    
				    <select name="s_startTime">
						<option value="">09:00</option>
						<option value="">09:30</option>
						<option value="">10:00</option>
						<option value="">10:30</option>
						<option value="">11:00</option>
						<option value="">11:30</option>
						<option value="">12:00</option>
						<option value="">12:30</option>
						<option value="">14:00</option>
						<option value="">14:30</option>
						<option value="">15:00</option>
						<option value="">15:30</option>
						<option value="">16:00</option>
						<option value="">16:30</option>
						<option value="">17:00</option>
						<option value="">17:30</option>														
					</select> ~
				    <select name="s_endTime">
						<option value="">09:30</option>
						<option value="">10:00</option>
						<option value="">10:30</option>
						<option value="">11:00</option>
						<option value="">11:30</option>
						<option value="">12:00</option>
						<option value="">12:30</option>
						<option value="">14:00</option>
						<option value="">14:30</option>
						<option value="">15:00</option>
						<option value="">15:30</option>
						<option value="">16:00</option>
						<option value="">16:30</option>
						<option value="">17:00</option>
						<option value="">17:30</option>														
					</select>
				</div>
			</div>
			<div class="item">	
				<div class="label">메모</div>	
				<div>
					<textarea></textarea>
				</div>	
			</div>			
		</div>
		<!-- 환자 정보 -->
		<div class="calendar_select">
			<div class="item_title">
				<i class="fa-solid fa-square fa-2xs"></i> <b>예약자 정보</b>			
			</div>
			<div class="item">
				<div class="label">이름</div>			
				<div class="value">
					장희영
				</div>
			</div>			
			<div class="item">
				<div class="label">연락처</div>			
				<div class="value">
					010-1234-1234
				</div>
			</div>
			<div class="item">
				<div class="label">생년월일</div>			
				<div class="value">
					${detail.patientVO.p_no}
				</div>
			</div>
			<div class="item">
				<div class="label">진료 내역</div>			
				<div class="value">
					초진 / 재진 <a href="#">차트 보기</a>
				</div>
			</div>									
		</div>
		<div align="center">
			<input class="button first" type="submit" value="수정">
			<input class="button second" type="submit" value="삭제">
		</div>	
	</form>	
</div>
</body>
</html>