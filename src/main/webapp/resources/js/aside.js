// 스케줄 테이블로 진료예약 등록 시 활용할 input창

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
