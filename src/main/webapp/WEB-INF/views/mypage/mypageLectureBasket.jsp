<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <meta charset="UTF-8">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
        }

        body {
            background-color: #f5f5f5;
        }

        .header {
            background-color: white;
            padding: 1rem;
            border-bottom: 1px solid #e0e0e0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: #2d2b38;
        }

        .search-bar {
            flex-grow: 1;
            margin: 0 2rem;
            position: relative;
        }

        .search-bar input {
            width: 100%;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            border: none;
            background-color: #f0f0f0;
        }

        .profile-icon {
            width: 40px;
            height: 40px;
            background-color: #2d2b38;
            border-radius: 50%;
        }

        .cart-title {
            font-size: 1.5rem;
            padding: 2rem;
            border-bottom: 1px solid #e0e0e0;
        }

        .course-item {
            display: flex;
            align-items: center;
            padding: 2rem;
            border-bottom: 1px solid #e0e0e0;
            background-color: white;
        }

        .course-image {
            width: 180px;
            height: 120px;
            background-color: #2d2b38;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 2rem;
        }

        .course-info {
            flex-grow: 1;
        }

        .course-title {
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
        }

        .course-instructor {
            color: #666;
        }

        .course-price {
            font-size: 1.2rem;
            font-weight: bold;
        }

        .buyer-info {
            padding: 2rem;
            margin-top: 2rem;
        }

        .buyer-info h2 {
            font-size: 1.3rem;
            margin-bottom: 1rem;
        }

        .info-field {
            display: grid;
            grid-template-columns: 150px 1fr;
            margin-bottom: 1rem;
            align-items: center;
        }

        .checkout-button {
            display: block;
            width: 100%;
            padding: 1rem;
            background-color: #2d2b38;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1.1rem;
            cursor: pointer;
            margin-top: 2rem;
        }

        .footer {
            background-color: #2d2b38;
            color: white;
            padding: 2rem;
            margin-top: 4rem;
        }

        .java-logo {
            color: white;
            font-size: 2rem;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="logo">univora</div>
        <div class="search-bar">
            <input type="text" placeholder="배우고 싶은 지식을 이야기해주세요">
        </div>
        <div class="profile-icon"></div>
    </header>

    <div class="cart-title">수강바구니</div>

    <div class="course-item">
        <div class="course-image">
            <div class="java-logo">☕</div>
        </div>
        <div class="course-info">
            <div class="course-title">유병승의 자바입문 - 코드로 시작하는 자바 첫걸음</div>
            <div class="course-instructor">bs</div>
        </div>
        <div class="course-price">₩ 17,000,000</div>
    </div>

    <div class="buyer-info">
        <h2>구매자 정보</h2>
        <div class="info-field">
            <span>이름</span>
            <span>상균</span>
        </div>
        <div class="info-field">
            <span>이메일</span>
            <span>user01234@user01234.com</span>
        </div>
        <div class="info-field">
            <span>휴대폰 번호</span>
            <span>010-1234-1234</span>
        </div>
        
        <button class="checkout-button">결제하기</button>
    </div>
    <script>
        document.querySelector('.checkout-button').addEventListener('click', function() {
            alert('결제 프로세스가 시작됩니다.');
        });
    </script>
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>   
</body>
</html>