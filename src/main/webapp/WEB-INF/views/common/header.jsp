<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<nav class="navbar navbar-expand-sm jumbotron navbar-light">
		<a class="navbar-brand ml-3" href="<c:url value="/"/>">Logo</a>
		<ul class="navbar-nav">
			<li class="nav-item active">
				<a class="nav-link" href="<c:url value="/"/>">기록</a>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/group/list"/>">그룹</a>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/plan/make"/>">계획</a>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/statistics"/>">통계</a>
			</li>
			
			<c:if test="${user == null}">
				<li class="nav-item">
					<!-- <a class="nav-link" href="<c:url value="/login"/>">로그인</a> -->
					<a class="nav-link" data-bs-toggle="modal" data-bs-target="#loginModal" onclick="openLoginModal()" role="button">로그인</a>
				</li>
				<div id="loginModal" class="modal fade" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
						</div>
					</div>
				</div>
				
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
	<script>
		function openLoginModal() {
			$('.modal-content').load("<c:url value="/member/loginModal"/>");
			$('#loginModal').modal();
		}
	</script>
</body>
</html>
