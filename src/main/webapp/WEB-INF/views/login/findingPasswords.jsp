<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.min.js"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* Keeping all previous styles exactly the same */
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background:
		url('${pageContext.request.contextPath}/resources/images/space.jpg')
		center/cover, #000;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
}

.container {
	display: flex;
	background: rgba(16, 16, 35, 0.8);
	border-radius: 15px;
	border: 2px solid #472ED6;
	width: 800px;
	height: 400px;
}

.left-panel {
	flex: 1;
	padding: 30px;
	display: flex;
	flex-direction: column;
}


.right-panel {
    flex: 1;
    padding: 20px; /* 기존 30px에서 줄이ffsscf기sshmbjnkhjnkhjs aaa*/
    border-left: 1px solid #472ED6;
    position: relative;
    margin-top: -10px; /* 추가: 위로 올리기 */
}

.logo {
	font-size: 24px;
	margin-bottom: 50px;
}

.icon-container {
	background: rgba(0, 0, 0, 0.3);
	padding: 20px;
	border-radius: 10px;
	text-align: center;
	margin-top: 50px;
}

.icon {
	color: #4CAF50;
	font-size: 48px;
}

h1 {
	font-size: 24px;
	margin-bottom: 30px;
}

.subtitle {
	color: #aaa;
	margin-bottom: 30px;
	font-size: 14px;
}

.input-group {
	display: flex;
	gap: 10px;
	margin: 8px 0;
}

.input-wrapper {
	width: 280px;
}

input {
	width: 100%;
	padding: 12px;
	border: none;
	border-radius: 8px;
	background: rgba(255, 255, 255, 0.1);
	color: white;
	box-sizing: border-box;
}

button {
	padding: 12px 24px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	background: rgba(255, 255, 255, 0.1);
	color: white;
	white-space: nowrap;
	width: 120px;
}

.primary {
	background: #4CAF50;
}



.nav-buttons {
    position: absolute;
    bottom: 15px; /* 기존 1px에서 20px으로 수정 */
    left: 30px;
    right: 40px;
    display: flex;
    justify-content: space-between;
}


.error {
	margin-top: 10px;
	font-size: 12px;
	color: red; /* 에러 메시지는 빨간색 */
}

.checkNum-input input {
	background: rgba(255, 255, 255, 0.1);
	color: white;
}

.checkNum-input button {
	background: #4CAF50;
	color: white;
	border: none;
	border-radius: 8px;
}
</style>

</head>
<body>

	<div class="container">
		<div class="left-panel">
			<div class="logo">
				<img
					src="${pageContext.request.contextPath}/resources/images/footer-logo.png"
					alt="univora" class="logo-img" width="220" height="40">
			</div>
			<div class="icon-container">
				<div class="icon">🔒</div>
				<div style="margin-top: 10px;">비밀번호를 잊으셨나요?</div>
			</div>
		</div>
		<div class="right-panel">
			<h1>Finding Passwords</h1>
			<div class="subtitle">본인확인 이메일로 인증</div>
			<p style="color: #aaa; font-size: 14px;">
				본인확인 이메일 주소와 일치한 이메일 주소가 같아야,<br>인증번호를 받을 수 있습니다.
			</p>



			<form id="emailVerificationForm" action="${path }/login/checkmember.do">
				<!-- 이메일 입력 -->

				<div class="input-wrapper">
					<input type="text" name="id" placeholder="ID">
				</div>


				<!-- 이메일 입력 -->
				<div class="input-group">
					<div class="input-wrapper">
						<input type="email" name="email" placeholder="EMAIL" required>
					</div>
					<button type="button" onclick="sendEmail()">인증번호 발송</button>
				</div>


				<!-- 인증번호 입력 -->
				<div class="input-group checkNum-input">
					<div class="input-wrapper">
						<input type="text" name="checkNum" placeholder="인증번호 6자리 숫자 입력"
							disabled>
					</div>
					<button type="button" onclick="verifyCode()">인증</button>
				</div>

				<small class="error" style="color: red;"></small>
				<!-- 에러 메시지 표시 영역 -->



				<!-- 다음 단계로 넘어가는 버튼 -->
				<div class="nav-buttons">
					<button type="button" onclick="goBack()">이전</button>
					<button type="submit" disabled>다음</button>
				</div>
			</form>
		</div>
	</div>


	<script>
	
	
  const sendEmail = () => {
    const email = document.querySelector('input[name="email"]').value.trim();
    const errorElement = document.querySelector('.error');
    const checkNumInput = document.querySelector('input[name="checkNum"]');
    const verifyButton = document.querySelector('.checkNum-input button');

    if (!email) {
      errorElement.textContent = "이메일 주소를 입력해주세요.";
      errorElement.style.color = "red";
      return;
    }

    $.ajax({
      url: `${path}/login/sendcodebyemail.do`,
      type: "POST",
      data: { email: email },
      success: function (response) {
        if (response.success) {
          errorElement.textContent = "인증번호가 발송되었습니다. 이메일을 확인하세요.";
          errorElement.style.color = "white";

          checkNumInput.disabled = false;
          verifyButton.disabled = false;
        } else {
          errorElement.textContent = response.message || "인증번호 발송에 실패했습니다. 다시 시도하세요.";
          errorElement.style.color = "red";

          checkNumInput.disabled = true;
          verifyButton.disabled = true;
        }
      },
      error: function () {
        errorElement.textContent = "서버 요청 중 문제가 발생했습니다. 다시 시도해주세요.";
        errorElement.style.color = "red";

        checkNumInput.disabled = true;
        verifyButton.disabled = true;
      },
    });
  };

  const verifyCode = () => {
    const email = document.querySelector('input[name="email"]').value;
    const checkNum = document.querySelector('input[name="checkNum"]').value;
    const errorElement = document.querySelector('.error');
    const nextBtn = document.querySelector('button[type="submit"]');

    if (!checkNum) {
      errorElement.textContent = "인증번호를 입력해주세요.";
      errorElement.style.color = "red";
      return;
    }

    $.ajax({
      url: `${pageContext.request.contextPath}/login/verifycode.do`,
      type: "POST",
      data: { email: email, checkNum: checkNum },
      success: function (response) {
        if (response.success) {
          errorElement.textContent = "인증번호가 확인되었습니다.";
          errorElement.style.color = "white";
			
          
       	  // 인증 성공 시 비밀번호 변경 페이지로 이동
          // window.location.href = `${pageContext.request.contextPath}/login/changepassword.do`;
          
          nextBtn.disabled = false;
        } else {
          errorElement.textContent = response.message || "인증번호가 일치하지 않습니다.";
          errorElement.style.color = "red";
          
          nextBtn.disabled = true; 
        }
      },
      error: function () {
        errorElement.textContent = "서버 요청 중 문제가 발생했습니다. 다시 시도해주세요.";
        errorElement.style.color = "red";
      },
    });
  };
</script>

<style>


input:disabled, button:disabled {
    background-color: #555; /* 어두운 회색 배경 */
    color: #aaa; /* 텍스트 흐릿한 회색 */
    border: 1px solid #444; /* 어두운 회색 테두리 */
    cursor: not-allowed; /* 금지 표시 커서 */
}

</style>

</body>

</html>