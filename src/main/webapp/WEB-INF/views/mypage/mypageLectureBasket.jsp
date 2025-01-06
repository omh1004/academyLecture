<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

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
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
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

		<!-- iamport.payment.js -->
		<h2>IAMPORT 결제 데모</h2>
		<li>
			<!-- 	<button id="iamportPayment" type="button">결제테스트</button> -->
			<button class="pay-button" onclick="requestPayment()">결제테스트</button>
			<button class="checkout-button">결제하기</button>
		</li>
	</div>
	<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
	<script>
	
    document.querySelector('.checkout-button').addEventListener('click', function () {
        // PortOne SDK 초기화
    	requestPayment();
    });
        async function requestPayment() {
			const requestData={
	         	    storeId: "store-3bc36c78-6806-4618-9eb6-a4543ab8b481", // 고객사 storeId로 변경해주세요.
	         	    channelKey: "channel-key-9f12fe14-e2c6-4789-9a14-adbde33a2914", // 콘솔 결제 연동 화면에서 채널 연동 시 생성된 채널 키를 입력해주세요.
	         	    paymentId: `payment-${crypto.randomUUID()}166664`,
	         	    orderName: "나이키 와플 2222트레d이너 3",
	         	    totalAmount: 1000,
	         	    currency: "CURRENCY_KRW",
	         	    payMethod: "CARD",
	         	    customer: {
	         	      fullName: "포트원",
	         	      phoneNumber: "010-0000-1234",
	         	      email: "test@portone.io",
	         	    }};
        	const response = PortOne.requestPayment(requestData).then(response => {
	   			console.log(response)
				fetch(`${pageContext.request.contextPath}/payment/complete`,{
				//header에 대한 설정 -> method방식, 인증 관련 속성, contentType 등 설정
				headers:{
					/* "Content-type":"application/x-www-form-urlencoded" */
					"Content-type":"application/json"
				},
				method:"POST",
				/* body:"data=testdata&number=20" */
				body:JSON.stringify(
						{pamentId:response.paymentId
						,transactionType:response.transactionType
						,txId:response.txId
						,customer:requestData.customer
						,totalAmound: 1000
						})
				
				}).then(response=>response.text())
				.then(data=>{
					console.log(data);
				})
	   		
	   		});
	   		
         	    
         	    
	   	  if (response.code !== undefined) {
	   	    // 오류 발생
	   	    return alert(response.message);
	   	  }
	   	  
	   	  
	   	  
	   	  console.log(response);
	   	  console.log(response.paymentId);

	   	  // /payment/complete 엔드포인트를 구현해야 합니다. 다음 목차에서 설명합니다.
	   	  /* const notified = await fetch(`${pageContext.request.contextPath}/payment/complete`, {
	   	    method: "POST",
	   	    headers: { "Content-Type": "application/json" },
	   	    // paymentId와 주문 정보를 서버에 전달합니다
	   	    body: JSON.stringify({
	   	    	paymentId: response.paymentId,
	   	      // 주문 정보...
	   	    }),
	   	  }); */
        }
	   	
/*         
        const portone = PortOne.init('imp23541524'); // PortOne에서 발급받은 가맹점 코드로 대체하세요 */
        // 결제 요청
       
    
 // 서버로 결제 결과 전송
   // 결제 성공 데이터를 서버로 전달
/*         function sendPaymentToServer(paymentResponse) {
			consol.log(paymentResponse);
			debugger;
            fetch('${pageContext.request.contextPath}/mypage/lecturebacket/paymentVerification.do', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(paymentResponse)
            })
            .then(res => res.json())
            .then(result => {
                if (result.success) {
                    alert('결제가 성공적으로 처리되었습니다.줄여서 결성');
                } else {
                    alert('서버 검증 실패: ' + result.message);
                }
            })
            .catch(err => console.error('Error:', err));
        } */
</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>