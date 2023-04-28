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
		//alert(deptValue);
		//console.log(deptValue);
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
			
			$("#selectDept").html(str);
			
		});
	}// list함수 선언 끝		
			
	// 휴무 옵션 선택시 시간 선택 못하게
/*	$("#selectH").on("click",function(){
		//alert("aaa")
		$("option[value='H']").val();
		var x = $("select[name='s_dept']").val();
	});*/
	
    $('#type').on('change', function () {
    	var x = $("select[name='s_type']").val();
    	//alert(x);
        if (x == 'H') {
            $('#timeSelect').css('visibility', 'hidden');
        } else {
            $('#timeSelect').css('visibility', 'visible ');
        }
    });    
})

