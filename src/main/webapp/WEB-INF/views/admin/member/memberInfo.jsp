<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 상세정보</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 2rem;
            background-color: #f9f9f9;
            color: #333;
        }
        .popup-header {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            margin-bottom: 1rem;
        }
        .user-icon {
            width: 50px;
            height: 50px;
            margin-right: 1rem;
        }
        p {
            margin: 0.8rem 0;
        }
        button {
            background-color: #d7c9a6;
            color: white;
            border: none;
            padding: 0.7rem 1.5rem;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #bba78a;
        }
        #btn_container{
            text-align: center;
        }
        select {
            padding: 0.5rem;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
    </style>

</head>
<body>
    <header class="popup-header">
        <h3>사용자 상세 정보</h3>
    </header>
    넘어온 맴버 : ${member}

    <main>
        <p><strong>사용자번호:</strong> ${member.memberNo}</p>
        <p><strong>아이디:</strong> ${member.memberId}</p>
        <p><strong>이름:</strong> ${member.memberName}</p>
        <p><strong>이메일:</strong> ${member.email}</p>
        <p><strong>연락처:</strong> ${member.phone}</p>
        <p><strong>역할:</strong>
            <select id="role-selector" onchange="updateRole()">
                <option value="학생" ${member.role == '학생' ? 'selected' : ''}>학생</option>
                <option value="강사" ${member.role == '강사' ? 'selected' : ''}>강사</option>
            </select>
        </p>
        <div id="btn_container">
            <button onclick="window.close()">닫기</button>
        </div>
    </main>

    <script>
        function updateRole() {
            const selectedRole = document.getElementById("role-selector").value;
            fetch(`\${pageContext.request.contextPath}/admin/updateRole`,{

            }).then(response =>response.text())
            .then(data=>{
				console.log(data);
			})
            
            
            //alert(`역할이 '${selectedRole}'(으)로 변경되었습니다.`);
            // 서버로 전송 로직이 필요한 경우 여기에 작성
            // 예: AJAX 또는 Fetch API 활용
        }
    </script>
</body>
</html>