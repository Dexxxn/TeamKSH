<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<title>alert.jsp에서 alert 출력한 후 리디렉션하기</title>
</head>
<body>
<!-- https://bmangrok.tistory.com/entry/Spring-%EC%82%AC%EC%9A%A9%EC%9E%90%EC%97%90%EA%B2%8C-alert%EB%A5%BC-%EC%B6%9C%EB%A0%A5%ED%95%98%EA%B3%A0-redirect-%ED%95%98%EA%B8%B0-Controller%EC%97%90%EC%84%9C -->
	<script type="text/javascript">
	/* 	var msg = "${msg}";
		var url = "${url}"; */
		
		var msg = "<c:out value='${msg}'/>";
		var url = "<c:out value='${url}'/>";
		alert(msg);
		document.location.href = url;
	</script>
</body>
</html>
