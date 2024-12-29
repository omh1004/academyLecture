<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템 메세지</title>
</head>
<body>
	<script>
		alert('${msg}'); /* msg 키 가지고 있는애가 있으면 가져와. */
		location.replace('${pageContext.request.contextPath}${loc}'); /* loc 키값 있으면 불러와. */
	</script>

</body>
</html>