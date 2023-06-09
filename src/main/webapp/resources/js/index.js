// 기 내원고객은 insert안되게 alert띄우기("기 내원환자입니다.")
function already_patient_Chk(){
			$.ajax({
				url : "/idChk", //ajax 통신 url
				type : "post", // http 방식
				dataType : "json",
				data : {"patientIdNum": $("#p_idNum_IN").val()}, // 파라미터 : 값
				success : function(data){
					
					if(data == 1){ // 1이면 중복
						alert("기 내원환자입니다.");
					}else if(data == 0){
						alert("등록가능");
					}
				}
			})
		}

// 예약등록 내역 없는 환자는 "예약 내역 없음"alert
$(document).ready(function () {
	 $("#reservation_confirm_btn").on("click", function no_reservation(){
		
//function no_reservation(){ //함수가 true를 반환하면 form이 제출됨
		$.ajax({
				url : "/no_reservation", //ajax 통신 url
				type : "post", // http 방식
				dataType : "json",
				data : {"nothing": $("#p_idNum_OUT").val()}, // 파라미터 : 값
				success : function(data){
					
					if(data == 0){ 
						//alert("예약 내역 없음.");
						var content = "예약 내역 없음";
						$('#alert').html(content); //textarea에 특정 내용 추가
						//}else if(data == 1){alert("예약 1건 있음")}
						//return false; //form 제출 취소
					}
					//return true; //form 제출
				}
			});
	 });
});
 
//}

// aside폼 fixed-> 가로로는 고정, 세로로만 스크롤 가능
$(function() {
  var marginLeft = parseInt( $("#form_wrap").css('margin-left') );
  $(window).scroll(function(e) {
    $("#form_wrap").css("margin-left", marginLeft - $(this).scrollLeft() );
  });
});


// radio버튼 click이벤트 발생시 특정 로직 구현('초진'='등록'버튼 (디폴트)/ '재진'='조회'버튼클릭시 버튼 바뀌기)

$(document).ready(function(){
	$("#second_visit").on('click', function(){ //재진 라디오 클릭시
		  const btn1 = document.getElementById('patientF');
		  const btn2 = document.getElementById('patientS');
		// 등록 버튼은 숨기고, 조회 버튼을 보이기
		btn1.style.display = 'none';
		btn2.style.display = 'block';
	});
});

$(document).ready(function(){
	$("#first_visit").on('click', function(){ //초진 라디오 클릭시
		const btn1 = document.getElementById('patientF'); //등록버튼
		const btn2 = document.getElementById('patientS'); //조회버튼
		// 등록 버튼은 보이고, 조회 버튼을 숨기기
		btn1.style.display = 'block';
		btn2.style.display = 'none';
	});
});



// 재진 환자 조회 후 '예약조회 시' 환자이름, 주민번호 DB로 같이 넘기기
$(document).ready(function(){
		$("reservation_confirm").on('click', function(){ // '예약조회' 버튼클릭  시
		var patientName = $("#p_name_IN").val();
		var patientIdNum = $("#p_idNum_IN").val();
		$('input[name=s_patient]').attr('value', patientName);
		$('input[name=s_patientIdNum]').attr('value',patientIdNum);
	});
});

// 재진 환자 조회 후 '예약등록 시' 환자이름, 주민번호 DB로 같이 넘기기
$(document).ready(function(){
	$("#index_medical_dept").on('click', function(){ // '예약등록' 버튼클릭  시
		var patientName = $("#p_name_IN").val();
		var patientIdNum = $("#p_idNum_IN").val();
		$('input[name=s_patient]').attr('value', patientName);
		$('input[name=s_patientIdNum]').attr('value',patientIdNum);
	});
});



//  환자이름 다른 폼에서 가져오기
$(document).ready(function(){

	// 입력란에 입력을 하면 입력내용에 내용이 출력

	// 1. #data 공간에서 keyup이라는 이벤트가 발생했을 때

	$("#p_name_IN").keyup(function(){

		// 2. #out 공간에 #data의 내용이 출력된다.

		$("#p_name_OUT").val($("#p_name_IN").val());
		

		
		// #out의 위치에 text로 데이터를 받는다.(setter)

		// 들어가는 데이터는 #data의 값(.val())이다. (getter)

		// 메서드 괄호 안에 아무것도 없으면 getter, 파라미터가 있으면 setter이다.

	});

});

// 주민번호 입력
$(document).ready(function(){
		$("#p_idNum_IN").keyup(function(){
			$("#p_idNum_OUT").val($("#p_idNum_IN").val());
		});
	
});



// 환자 초진 or 재진 클릭 

// #first_visit
// #second_visit

//환자 등록 폼 select값 넘기기
$(document).ready(function(){

	$("#index_medical_dept").on("change",function(){
		//alert("aaa")
		var deptValue = $("select[name='index_s_dept']").val();
		//alert(deptValue);
		console.log(deptValue);
		list({dept:deptValue});
	})

	function list(param){// list함수 선언 시작
		
		var dept = param.dept;
		//alert(dept);
		console.log(dept)
		
		// controller에서 콜백(리턴)한 값이 data에 저장
		$.getJSON("/popup/"+dept+".json",function(data){
			console.log(data)	
			
			var str="";
			
			str += "<option>"+"선택"+"</option>"
			for(var i=0; i<data.length; i++){
				str += "<option>"+data[i].s_name+"</option>"
			}
			
			$("#index_selectDept").html(str);
			
		});
	}// list함수 선언 끝		
			
})



// 상단부분 select값 넘기기
$(document).ready(function(){

	$("#index_top_medical_dept").on("change",function(){
		//alert("aaa")
		var deptValue = $("select[name='index_top_s_dept']").val();
		//alert(deptValue);
		console.log(deptValue);
		list({dept:deptValue});
	})

	function list(param){// list함수 선언 시작
		
		var dept = param.dept;
		//alert(dept);
		console.log(dept)
		
		// controller에서 콜백(리턴)한 값이 data에 저장
		$.getJSON("/popup/"+dept+".json",function(data){
			console.log(data)	
			
			var str="";
			
			str += "<option>"+"선택"+"</option>"
			for(var i=0; i<data.length; i++){
				str += "<option>"+data[i].s_name+"</option>"
			}
			
			$("#index_top_selectDept").html(str);
			
		});
	}// list함수 선언 끝		
			
})

