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
