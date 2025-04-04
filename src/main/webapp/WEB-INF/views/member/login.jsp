<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	form {
		border: 3px solid #f1f1f1;
	}
	
	.container {
		padding: 16px;
	}
	
	.form-group {
		width: 100%;
		padding: 12px 20px;
		margin: 8px 0;
		display: inline-block;
		border: 1px sold #ccc;
		box-sizing: border-box;
	}
	
	button {
		background-color: #04AA6D;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 100%;
	}
	
	button:hover {
		opacity: 0.8;
	}
	
	
	
</style>
</head>
<body>
	<form action="<c:url value="/login"/>" method="post">
		<div class="container">
			<p><b>css 디자인 만드는 중 ㅠ 만들고나서 로그인 회원가입 넣겠습니다...!</b></p>
			<label for="id" class="form-label">아이디</label>
			<input type="text" placeholder="아이디를 입력하세요." id="id" name="me_id">
			
			<label for="pw" class="form-label">비밀번호</label>
			<input type="password" placeholder="비밀번호를 입력하세요." id="pw" name="me_pw">
			
			<button type="submit" class="btn mt-3">로그인</button>
		</div>
	</form>
</body>
</html>
