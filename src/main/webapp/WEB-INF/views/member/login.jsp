<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	
	.container1 {
		min-height: 730px;
	}
	
	form {
		border: 3px solid #f1f1f1;
		width:550px;
		transform: translateY(40%);
		margin: 0 auto;
	}
	
	.container2 {
		padding: 5%;
	}
	
	
	
	.loginBtn {
		
	}
	
	
	
</style>
</head>
<body>
	<div class="container1">
		<form action="<c:url value="/login"/>" method="post">
			<div class="container2">
				<div class="form-group">
					<label for="id">아이디</label>
					<input type="text" class="form-control" id="id" name="me_id" value="${id}">
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label>
					<input type="password" class="form-control" id="pw" name="me_pw">
				</div>
				<div class="form-check">
					<label class="form-check-label ml-4">
					<input type="checkbox" class="form-check-input" value="true" name="auto">자동로그인
					</label>
				</div>
				<button type="submit" class="btn loginBtn mt-4">로그인</button>
			</div>
		</form>
	</div>
</body>
</html>
