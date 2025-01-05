<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<meta charset="UTF-8">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		sans-serif;
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
			<span>이름</span> <span>상균</span>
		</div>
		<div class="info-field">
			<span>이메일</span> <span>user01234@user01234.com</span>
		</div>
		<div class="info-field">
			<span>휴대폰 번호</span> <span>010-1234-1234</span>
		</div>

		<button class="checkout-button">결제하기</button>
		<script type="text/javascript"
			src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<!-- iamport.payment.js -->
		<script type="text/javascript"
			src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		<div>
			<h2>IAMPORT 결제 데모</h2>
			<li>
				<button id="iamportPayment" type="button">결제테스트</button>
			</li>
		</div>


	</div>

	<script>
  
	function proceedPay() {
        $.ajax({
            url: '/payment/proceed',
            type: 'POST',
            async: true,
            dataType: "Json",
            data:
                $('#orderForm').serialize(),
            success: function (data) {
                if (data.cnt > 0) {
                    requestPay(data)
                } else {
                    alert(data.msg)
                }
            },
            error: function (e) {
                alert("에러")
            }
        });

    }

    function requestPay(data) {
        IMP.init("imp23541524"); // 예: imp00000000
        //IMP.request_pay(param, callback) 결제창 호출

        IMP.request_pay({ // param
            pg: "inicis.INIBillTst", //결제대행사 설정에 따라 다르며 공식문서 참고
            pay_method: "card", //결제방법 설정에 따라 다르며 공식문서 참고
            merchant_uid: "asdfasdfasd", //주문(db에서 불러옴) 고유번호
            name: "직거래",
            amount: "1",
            buyer_email: "ohchef2020@gmail.com",
            buyer_name: "김두환",
            //buyer_tel: "010-4242-4242",
            buyer_addr: "경기도 수원시",
            //buyer_postcode: "01181"
        }, function (rsp) { // callback
            if (rsp.success) {
                // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
                // jQuery로 HTTP 요청
                jQuery.ajax({
                    url: "/payment/verify/" + rsp.imp_uid,
                    method: "POST",
                }).done(function (data) {
                    // 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (iamport 서버검증)
                    if (rsp.paid_amount == data.response.amount) {
                        succeedPay(rsp.imp_uid, rsp.merchant_uid);
                    } else {
                        alert("결제 검증 실패");
                    }
                })
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
            }
        });
    }
  
    document.querySelector('.checkout-button').addEventListener('click', function () {
       requestPay();
    });
    
    
  
    
    
    </script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>