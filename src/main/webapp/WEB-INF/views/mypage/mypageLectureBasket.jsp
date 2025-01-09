<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<div class="cart-title">수강바구니</div>
	<c:forEach var="baskect" items="${basketList}">
		<div class="course-item">
			<div class="course-image">
				<div class="java-logo">☕</div>
			</div>
			<div class="course-info">
				<div class="course-title">${baskect.className}</div>
				<div class="course-instructor">${baskect.memberId}</div>
			</div>
			<div class="course-price">${baskect.price}</div>
		</div>
	</c:forEach>
	<div class="buyer-info">
		<h2>구매자 정보</h2>
		<div class="info-field">
			<span>이름</span> <span>${loginMember.memberId}</span>
		</div>
		<div class="info-field">
			<span>이메일</span> <span>${loginMember.email}</span>
		</div>
		<div class="info-field">
			<span>휴대폰 번호</span> <span>${loginMember.phone}</span>
		</div>

		<button class="checkout-button">결제하기</button>
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
	         	    paymentId: `pa-\${crypto.randomUUID()}`,
	         	    orderName: `[${basketList[0]['className']}] 외 ${basketList.size()-1} 건` ,
	         	    totalAmount: 1000,
	         	    currency: "CURRENCY_KRW",
	         	    payMethod: "CARD",
	         	    customer: {
	         	      fullName: "${loginMember.memberNo}",
	         	      phoneNumber: "${loginMember.phone}",
	         	      email: "${loginMember.email}",
	         	      lectureNo : "${lectureNodes}"
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
						{paymentId:response.paymentId
						,transactionType:response.transactionType
						,txId:response.txId
						,customer:requestData.customer.fullName
						,totalAmound: 1000
						,lectureNo: requestData.customer.lectureNo
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
        }
</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>