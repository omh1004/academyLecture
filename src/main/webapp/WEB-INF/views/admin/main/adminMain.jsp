<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사용자 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/main/adminMain.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

</head>
<body>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<header class="admin-header">
		<h1>학부모 커뮤니티 관리자 페이지</h1>
		<nav>
			<ul>
				<li>사용자관리</li>
				<li>게시글관리</li>
				<li>댓글관리</li>
			</ul>
		</nav>
	</header>

	<main>
		<section id="users">
			<h2>사용자 관리</h2>
			<table>
				<thead>
					<tr>
						<th>id</th>
						<th>이름</th>
						<th>이메일</th>
						<th>상세정보</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</section>
		<section id="posts">
			<h2>게시글 관리</h2>
			<nav>
			</nav>
			<table id="inquiry-table">
				<thead>
					<tr>
						<th>문의 번호</th>
						<th>문의한 회원id</th>
						<th>문의 유형</th>
						<th>문의 제목</th>
						<th>문의 내용</th>
						<th>문의 날짜</th>
					</tr>
				</thead>
				<tbody>
 				
				</tbody>
			</table>
			<table id="declaration-table" style="display: none;">
				<thead>
					<tr>
						<th>신고글 id</th>
						<th>신고한 회원id</th>
						<th>신고 내용</th>
						<th>글 유형</th>
						<th>신고 유형</th>
						<th>신고 날짜</th>
						<th>처리상태</th>
						<th>신고처리</th>
					</tr>
				</thead>
				<tbody>
			
				</tbody>
			</table>
		</section>
	</main>
</body>
</html>
