<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.left{
	margin-left: 100px;
}
.right{
	margin-right: 100px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm jumbotron navbar-light">
		<ul class="navbar-nav left">
			<li class="nav-item active">
				<a class="nav-link" href="<c:url value="/"/>">홈</a>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/group/list"/>">그룹</a>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/statistics"/>">통계</a>
			</li>
		</ul>
		<ul class="navbar-nav ml-auto right">
			<c:if test="${user == null}">
				<li class="nav-item">
					<a class="nav-link" href="<c:url value="/login"/>">로그인</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-link" href="<c:url value="/signup"/>">회원가입</a>
				</li>
			</c:if>
			
			<c:if test="${user != null }">
	        	<li class="nav-item">
		          <a class="nav-link" href="<c:url value="/mypage"/>">마이 페이지</a>
		        </li>
	        	<li class="nav-item">
		          <a class="nav-link" href="<c:url value="/logout"/>">로그아웃</a>
		        </li>
		    </c:if>
			
		</ul>
	</nav>
</body>
</html>
