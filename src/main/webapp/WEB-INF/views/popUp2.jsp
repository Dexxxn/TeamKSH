<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상세 일정 팝업</title>
	<link rel="stylesheet" href="resources/css/popUp.css" />
	<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/0f537ad086.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="/resources/js/popUp.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<!-- 팝업창 -->
<div id="schedule_popUp2">
	<div class="title">
		<span>상세 일정</span>
		<i onclick="removePopup2()" class="fas fa-regular fa-xmark" style="color: white; float: right;"></i>
	</div>
	<form name="detailSchedule" onsubmit="return confirm('일정을 변경하시겠습니까?');" id="detailForm">	
		<!-- 일정 정보 -->
		<div class="calendar_select">
			<div class="item_title">
				<i class="fa-solid fa-square fa-2xs"></i> <b>스케줄 정보</b>
			</div>		
			<div class="item">
				<div class="label">날짜</div>			
				<div class="value">
					<input type="text" name="s_date" value="${detail.s_date}">
				</div>
			</div>	
			<div class="item">
				<div class="label">과목</div>			
				<div class="value">  
					${detail.medicalVO.s_dept}  
<%-- 				<select name="type">
				    	<option selected>${detail.medicalVO.s_dept}</option>
						<option value="">선택</option>
						<option value="">정형외과</option>
						<option value="">신경외과</option>														
						<option value="">내과</option>
					</select> --%>
				</div>
			</div>
			<div class="item">	
				<div class="label">의사명</div>
				<div class="value">   
					${detail.s_doctor}님
<%-- 				<select name="type">
				    	<option selected>${detail.s_doctor}</option>
						<option value="">선택</option>
						<option value="">정기원 원장님</option>
						<option value="">이성언 원장님</option>														
						<option value="">장희영 원장님</option>
					</select> --%>
				</div>		
			</div>
			<div class="item">	
				<div class="label">일정 종류</div>
				<div class="value"><input type="hidden" name="s_type" value="${detail.s_type}">
					<c:if test="${detail.s_type=='OC'}">
						진료
					</c:if>
					<c:if test="${detail.s_type=='OR'}">
						수술
					</c:if> 
					<c:if test="${detail.s_type=='R'}">
						회진
					</c:if>
					<c:if test="${detail.s_type=='S'}">
						외부 일정
					</c:if>
					<c:if test="${detail.s_type=='H'}">
						휴무
					</c:if>
				</div>				
			</div>
			<c:if test="${detail.s_type!='H'}">
			<div class="item" id="timeSelect">	
				<div class="label">시간</div>
				<div class="value">    
				    <select name="s_startTime">
				    	<option selected>${detail.s_startTime}</option>
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
						<option selected>${detail.s_endTime}</option>
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
			</c:if>
			<div class="item">	
				<div class="label">메모</div>	
				<div>
					<textarea name="s_memo">${detail.s_memo}</textarea>
				</div>	
			</div>			
		</div>
		<!-- 환자 정보 -->
		
		<!-- s_patient가 null이면 -->
		
		<div class="calendar_select">
			<div class="item_title">
				<i class="fa-solid fa-square fa-2xs"></i> <b>예약자 정보</b>			
			</div>
			<div class="item">
				<div class="label">이름</div>			
				<div class="value">
					${detail.patientVO.p_name}
				</div>
			</div>			
			<div class="item">
				<div class="label">연락처</div>			
				<div class="value">
					${detail.patientVO.p_phone}
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
					<c:if test="${detail.patientVO.p_visit=='F'}">
						초진
					</c:if> 
					<c:if test="${detail.patientVO.p_visit=='S'}">
						재진
					</c:if>
					<c:if test="${detail.patientVO.p_chart!=null}">
						<a href="#">차트 보기</a><!-- ${detail.patientVO.p_chart} -->
					</c:if>
				</div>
			</div>
			<input type="hidden" name="s_no" value="${detail.s_no}">									
		</div>
		<div align="center">
			<input class="button first" type="submit" value="수정" formaction="/popup2/modify">
			<input class="button second" type="button" value="삭제" id="deleteBtn">
		</div>	
	</form>	
</div>

<script>
	$(document).ready(function(){
		$("#deleteBtn").on("click",function(){
			$("#detailForm").attr("action", "/popup2/remove").submit();
	        // 팝업창이 닫히면서 데이터가 넘어가지 않는 현상 방지
			setTimeout(function() {   
	            window.close();					// 현재 팝업창 Close
	         }, 100);
			window.opener.location.reload();    // 부모창 reload				
			alert("일정이 정상적으로 삭제되었습니다.");  
		})
	});
</script>

</body>
</html>