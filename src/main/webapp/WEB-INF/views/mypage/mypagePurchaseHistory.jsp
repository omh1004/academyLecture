<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath }" />
<html>
<head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <meta charset="UTF-8">
    <title>구매내역</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1000px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden; /* 내용이 잘리지 않도록 처리 */
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #362D4B;
            font-weight: bold;
        }
        table {
            width: 100%; /* 테이블이 container 크기에 맞도록 설정 */
            border-collapse: collapse;
            table-layout: fixed; /* 모든 열의 너비가 균일하도록 설정 */
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
            word-wrap: break-word; /* 내용 줄바꿈 */
            overflow-wrap: break-word; /* 긴 단어 줄바꿈 */
        }
        th {
            background-color: #362D4B;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
/*         .no-data {
            text-align: center;
            padding: 20px;
            color: #999;
        } */
    </style>
</head>
<body>
    <div class="container">
        <h2>구매내역</h2>
        <table>
            <thead>
                <tr>
                    <th>결제번호</th>
                    <th>강의 ID</th>
                    <th>결제상태</th>
                    <th>결제금액</th>
                    <th>결제일</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty purchaseHistory}">
                        <c:forEach var="payment" items="${purchaseHistory}">
                            <tr>
                                <td>${payment.paymentId}</td>
                                <td>${payment.lectureId}</td>
                                <td>${payment.paymentStatus}</td>
                                <td>${payment.amount}</td>
                                <td>${payment.paymentDate}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5" class="no-data">구매내역이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
