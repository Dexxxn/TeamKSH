// 팝업창 열기/닫기
function removePopup(){
	const div = document.getElementById('schedule_popUp');
	window.close();
}
function removePopup2(){
	const div = document.getElementById('schedule_popUp2');
	window.close();
}

function openPopup(){
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	var x = (window.screen.width /2) - (610 / 2);
	var y = (window.screen.height /2) - (431 / 2);
	
    let options = "location=no,toolbar=no,scrollbars=no,titlebar=no,resizable=no,status=no,menubar=no,width=610, height=431, left=" + x + ",top=" + y;	
    window.open("http://localhost:8080/popup","_popup", options);		
}

$(document).ready(function(){
	$("#addButton").on("click",function(){
		$("#addSchedule").submit();
        // 팝업창이 닫히면서 데이터가 넘어가지 않는 현상 방지
		setTimeout(function() {   
            window.close();
         }, 100);
		window.opener.location.reload();    // 부모창 reload
		//window.close();   				// 현재 팝업창 Close
		alert("일정이 정상적으로 등록되었습니다.");
	})
});

$(document).ready(function(){
	 $("form[name='detailSchedule']").submit(function(event){
        // 팝업창이 닫히면서 데이터가 넘어가지 않는 현상 방지
		setTimeout(function() {   
            window.close();
         }, 100);
		window.opener.location.reload();    // 부모창 reload
		//window.close();   				// 현재 팝업창 Close
		alert("일정이 정상적으로 등록되었습니다.");
	})
});

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

