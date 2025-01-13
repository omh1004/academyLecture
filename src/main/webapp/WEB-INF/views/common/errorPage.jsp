<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>오류 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .error-container {
            text-align: center;
            background-color: #fff;
            padding: 30px 50px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 24px;
            color: #ff4d4f;
        }

        p {
            font-size: 16px;
            margin: 10px 0 20px;
            color: #555;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            font-size: 14px;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>오류가 발생했습니다</h1>
        <p><%= request.getAttribute("errorMsg") != null ? request.getAttribute("errorMsg") : "알 수 없는 오류가 발생했습니다. 나중에 다시 시도해주세요." %></p>
        <a href="javascript:history.back()" class="btn btn-secondary">이전 페이지로</a>
        <a href="<%= request.getContextPath() %>/main/login.do" class="btn">홈으로 이동</a>
    </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>