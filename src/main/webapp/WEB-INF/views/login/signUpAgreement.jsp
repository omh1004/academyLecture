<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/common/main.css">
<link rel="stylesheet" href="${path}/resources/css/login/signUp.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<section id="main-container" class="d-flex flex-column align-items-center">
<div class="container d-flex flex-column align-items-center justify-content-center">
	<form class="signup-container" action="${path}/login/signup.do" onsubmit="return validateAgreement()">
    	<div class="signup-title">약관 및 개인정보처리방침 동의</div>
      	<div class="agreement-item">
      		<div><strong>[필수]</strong>이용약관 동의</div>
      		<div class="agreement-content">
      			<div class="agreement-text overflow-auto">
      				<strong>제1장 총칙</strong>
		            <strong>제1조 [목적]</strong>
		            <p>본 약관은 학부모 커뮤니티 사이트 "에듀라"(이하 "서비스")가 제공하는 모든 서비스의 이용조건 및 절차, 이용자와 에듀라의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
		            
		            <strong>제2조 [정의]</strong>
		            <ol>
		                <li>에듀라: 학부모들이 자녀 교육과 관련된 정보 교류, 커뮤니티 활동, 교육 자료 제공 등의 서비스를 이용할 수 있도록 구축된 온라인 커뮤니티 플랫폼.</li>
		                <li>이용자: 본 약관에 따라 에듀라가 제공하는 서비스를 이용하는 개인.</li>
		                <li>가입: 에듀라가 제공하는 가입 신청 양식에 정보를 기입하고, 본 약관에 동의하여 서비스 이용 계약을 완료시키는 행위.</li>
		                <li>회원: 에듀라에 개인정보를 제공하여 회원 등록을 한 자로서, 에듀라가 제공하는 서비스를 이용할 수 있는 권한을 가진 개인.</li>
		                <li>비밀번호: 이용자와 회원의 ID가 일치하는지를 확인하고, 통신상의 개인 정보를 보호하기 위해 이용자가 설정한 문자와 숫자의 조합.</li>
		                <li>탈퇴: 회원이 이용계약을 종료시키는 행위.</li>
		                <li>서비스: 에듀라가 구현하는 단말기(PC, 모바일 등 각종 유무선 장치를 포함)와 관계없이 회원이 이용할 수 있는 커뮤니티 기능, 정보 제공, 게시판 운영 및 기타 관련 서비스를 의미.</li>
		            </ol>
		
		            <strong>제2장 서비스 제공 및 이용</strong>
		            <strong>제3조 [약관의 효력과 변경]</strong>
		            <ol>
		                <li>에듀라는 본 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.</li>
		                <li>본 약관은 이용자가 약관 내용에 동의하고 회원 가입을 완료한 시점부터 효력이 발생하며, 에듀라의 서비스 제공 및 회원의 서비스 이용에 본 약관이 우선적으로 적용됩니다.</li>
		                <li>에듀라는 관련 법률(전자상거래법, 약관의 규제에 관한 법률 등)을 준수하며, 필요 시 약관을 개정할 수 있습니다.</li>
		                <li>약관이 개정될 경우, 에듀라는 개정된 약관의 적용일자 및 개정 사유를 명시하여 서비스 초기 화면에 최소 7일 전 공지하며, 기존 회원에게는 전자우편으로 개정 내용을 전달합니다.</li>
		                <li>회원이 변경된 약관에 동의하지 않는 경우, 회원은 탈퇴를 통해 이용계약을 종료할 수 있으며, 개정 약관 시행일 이후에도 서비스를 계속 이용할 경우 개정 약관에 동의한 것으로 간주합니다.</li>
		            </ol>
		
		            <strong>제4조 [이용계약의 성립]</strong>
		            <ol>
		                <li>이용계약은 이용자가 에듀라가 제공하는 가입 신청 양식에 정보를 기입하고, 약관에 동의한 후 회원 가입을 완료함으로써 성립됩니다.</li>
		                <li>에듀라는 아래의 경우 이용계약을 거부하거나 취소할 수 있습니다:
		                    <ol>
		                        <li>타인의 명의를 사용하여 가입 신청을 한 경우.</li>
		                        <li>허위 정보를 기재하거나 제출한 경우.</li>
		                        <li>에듀라의 서비스 운영을 고의로 방해한 경우.</li>
		                        <li>기타 에듀라가 정한 가입 요건을 충족하지 못한 경우.</li>
		                    </ol>
		                </li>
		            </ol>
		
		            <strong>제3장 회원과 에듀라의 의무</strong>
		            <strong>제6조 [에듀라의 의무]</strong>
		            <ol>
		                <li>에듀라는 회원의 개인 정보를 보호하며, 동의 없이 제3자에게 제공하지 않습니다.</li>
		                <li>에듀라는 회원이 안전하게 서비스를 이용할 수 있도록 기술적 보안 조치를 제공합니다.</li>
		            </ol>
		
		            <strong>제7조 [회원의 의무]</strong>
		            <ol>
		                <li>회원은 다음과 같은 행위를 해서는 안 됩니다:
		                    <ul>
		                        <li>허위 정보 제공.</li>
		                        <li>타인의 정보 도용.</li>
		                        <li>에듀라 서비스 방해 행위.</li>
		                        <li>저작권 및 지적재산권 침해.</li>
		                        <li>외설적 또는 폭력적 콘텐츠 게시.</li>
		                    </ul>
		                </li>
		                <li>회원은 본 약관, 서비스 이용 안내 및 에듀라의 공지 사항을 준수해야 합니다.</li>
		            </ol>
				</div>
        	</div>
        	<div class="agree-radio-container">
        		<span>위 사항과 관련하여 이용자 약관에 동의하십니까?</span>
        		<div class="radio-group">
	                <label>
	                    <input type="radio" name="terms-agreement" value="agree" required> 동의
	                </label>
	                <label>
	                    <input type="radio" name="terms-agreement" value="disagree"> 동의안함
	                </label>
            	</div>
        	</div>
      	</div>
      	<div class="agreement-item">
      		<div><strong>[필수]</strong>개인정보 수집 및 이용 동의</div>
      		<div class="agreement-content">
      			<div class="agreement-text overflow-auto">
      				<strong>1. 수집목적</strong>
		            <ul>
		                <li>이용자 식별, 가입 및 서비스 이용</li>
		                <li>계약 이행 및 약관 변경 등의 고지를 위한 연락</li>
		                <li>본인의사 확인 및 민원 등의 고객 고충 처리</li>
		                <li>부정 이용 방지, 비인가 사용 방지 및 서비스 제공 및 계약의 이행</li>
		            </ul>
		
		            <strong>2. 수집항목</strong>
		            <ul>
		                <li><strong>이용자 정보:</strong> 이름, 아이디, 비밀번호, 이메일, 전화번호</li>
		                <li><strong>추가 정보:</strong> 주소, 생년월일</li>
		            </ul>
		
		            <strong>3. 보유기간</strong>
		            <p>회원 탈퇴 시까지</p>
				</div>
        	</div>
        	<div class="agree-radio-container">
        		<span>위 사항과 관련하여 이용자 약관 개인정보 수집 및 이용에 동의하십니까?</span>
        		<div class="radio-group">
	                <label>
	                    <input type="radio" name="privacy-agreement" value="agree" required> 동의
	                </label>
	                <label>
	                    <input type="radio" name="privacy-agreement" value="disagree"> 동의안함
	                </label>
            	</div>
        	</div>
      	</div>
      	<div class="agreement-item d-flex flex-row w-100">
       		
	       		<div>
	       			<strong>[필수]</strong>본인은 만 14세 이상입니다.	
	       		</div>
		       	<div class="radio-group">
	                <label>
	                    <input type="radio" name="age-agreement" value="agree" required> 예
	                </label>
	                <label>
	                    <input type="radio" name="age-agreement" value="disagree"> 아니오
	                </label>
	           	</div>
      	</div>
      	<button type="submit" class="signup-btn my-3">다음</button>
     </form>

</div>
</section>
<script>
    function validateAgreement() {
        const terms = document.querySelector('input[name="terms-agreement"]:checked');
        const privacy = document.querySelector('input[name="privacy-agreement"]:checked');
        const age = document.querySelector('input[name="age-agreement"]:checked');

        if (terms?.value === "agree" && privacy?.value === "agree" && age?.value === "agree") {
            return true;
        } else{
            alert("모든 필수 항목에 동의해야 다음 단계로 진행할 수 있습니다.");
            return false;
        }
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>