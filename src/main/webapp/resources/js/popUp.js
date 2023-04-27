// 팝업창 열기/닫기
function openPopup(){
	const div = document.getElementById('removePopup');
	div.style.display = "block";
}
function removePopup(){
	const div = document.getElementById('removePopup');
	div.style.display = "none";
}

//select값 넘기기
$(document).ready(function(){

	$("#dept").on("change",function(){
		//alert("aaa")
		var deptValue = $("select[name='s_dept']").val();
		alert(deptValue);
		console.log(deptValue);
		list({dept:deptValue});
	})

	function list(param){// list함수 선언 시작
		
		var dept = param.dept;
		alert(dept);
		console.log(dept)
		
		// controller에서 콜백(리턴)한 값이 data에 저장
		$.getJSON("/replies/"+dept+".json",function(data){
			console.log(data)	
			
			
		});
	}// list함수 선언 끝		
			
})

