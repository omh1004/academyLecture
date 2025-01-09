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
			<h1>New Passwords</h1>
			<div class="subtitle">새로운 비밀번호를 설정해주세요.</div>
			<p style="color: #aaa; font-size: 14px;">
				최소 8자 이상,<br> 특수문자(!@#$%^&*) 중 1개 이상 포함,<br>대문자, 소문자, 숫자를 각각 1개 이상 포함해주세요
			</p>


			<form class="newpassword-input" method="post" action="${path }/login/newpasswordend.do" onsubmit="return fn_invalidate();">
      		<div class="checkPw-input">
	      		<input type="password" id="password" name="password" placeholder="새 비밀번호 입력">
	      		<div class="error"></div>
      		</div>
      		<div class="checkPw-input">
		      	<input type="password" id="confirm-password" placeholder="새 비밀번호 재입력">
		        <div class="error"></div>
      		</div>
      		<div class="page-btns">
	      		<button type="submit">비밀번호 변경</button>
      		</div>
      	</form>

		</div>
	</div>

<script>
  	/* 실시간 유효성 검사 */
  	const passwordInput = document.getElementById('password');
	const confirmPasswordInput = document.getElementById('confirm-password');
	const passwordError = passwordInput.nextElementSibling;
	const confirmPasswordError = confirmPasswordInput.nextElementSibling;
	
	function validatePassword() {
		  const passwordValue = passwordInput.value.trim();
		  const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$/; // 최소 8자, 특수문자, 대소문자, 숫자 포함
		  if (!passwordRegex.test(passwordValue)) {
		    passwordError.textContent = '비밀번호는 8자리 이상, 대소문자, 숫자, 특수문자(!@#$%^&*)를 각각 포함해야 합니다.';
		    return false;
		  }
		  passwordError.textContent = '';
		  return true;
		}

	function validateConfirmPassword() {
		  if (passwordInput.value.trim() !== confirmPasswordInput.value.trim()) {
		    confirmPasswordError.textContent = '비밀번호가 일치하지 않습니다.';
		    return false;
		  }
		  confirmPasswordError.textContent = '비밀번호가 일치합니다.';
		  confirmPasswordError.style.color = 'white';
		  return true;
		}
	
	passwordInput.addEventListener('input', validatePassword);
	confirmPasswordInput.addEventListener('input', validateConfirmPassword);
	
	
	const fn_invalidate=()=>{
		if (passwordInput.value.trim() === "") {
            alert("비밀번호를 입력해주세요.");
            passwordInput.focus();
            return false;
        }
        if (confirmPasswordInput.value.trim() === "") {
            alert("비밀번호 확인을 입력해주세요.");
            confirmPasswordInput.focus();
            return false;
        }
        if (passwordInput.value.trim() !== confirmPasswordInput.value.trim()) {
            alert("비밀번호가 일치하지 않습니다.");
            confirmPasswordInput.focus();
            return false;
        }
		
		return true;
	};
  </script>
  

</body>

</html>