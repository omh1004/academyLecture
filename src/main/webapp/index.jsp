<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<link rel="stylesheet" href="${path}/resources/css/index.css">	
<body style="background-image: url('${pageContext.request.contextPath}/resources/images/우주.jpg');">

<section>

  <div class="login-container">
    <h1>univora</h1>
    <input type="text" placeholder="Id or Email" />
    <input type="password" placeholder="Password" />
    <button>LOGIN</button>
    <a href="#">FORGOT YOUR PASSWORD?</a>
  </div>
</body>
</html>

</section>