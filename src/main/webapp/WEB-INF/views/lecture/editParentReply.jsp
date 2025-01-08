<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>부모 댓글 수정</title>
</head>
<body>
    <h2>부모 댓글 수정</h2>
    <form action="${pageContext.request.contextPath}/lecture/editParentReply.do" method="post">
        <input type="hidden" name="reviewNo" value="${review.reviewNo}">
        <input type="hidden" name="lectureNo" value="${lectureNo}">
        <textarea name="reviewContent" rows="5" cols="50">${review.reviewContent}</textarea>
        <button type="submit">수정</button>
    </form>
</body>
</html>
