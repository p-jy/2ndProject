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
	
	.form{
		width: 550px;
		margin: 0 auto;
		transform: translateY(25%);
	}
	
	.loginLabel{
		color: #a3b398;
	}
	
	form {
		border: 3px solid #f1f1f1;
		width:550px;
	}
	
	.container2 {
		padding: 10% 8% 4% 8%;
	}
	
	.form-check{
		font-size: 13px;
	}
	
	.form-check [type=checkbox]{
		-ms-transform: scale(0.9); /* IE */

		-moz-transform: scale(0.9); /* FF */
		
		-webkit-transform: scale(0.9); /* Safari and Chrome */
		
		-o-transform: scale(0.9); /* Opera */
	}
	
	.loginBtn {
		background: #e0e0e0;
		padding: 15px 0;
		color: white;
		font-weight: bold;
	}
	
	.login{
		background: #81d742;
	}
	
	.loginBtn:hover {
		color: white;
	}
	
	.signupBtn {
		color: #9b9b9b;
	}
	
	.red {
		color: red;
		font-size: 12px;
	}
	
</style>
</head>
<body>
	<div class="container1">
		<div class="form">
			<div class="loginLabel d-flex justify-content-center mb-3">
				<h2>회원탈퇴</h2>
			</div>
			<form action="<c:url value="/deleteId"/>" method="post">
				<div class="container2">
					<div class="form-group">
						<label for="pw">비밀번호 확인</label>
						<input type="password" class="form-control" id="pw" name="me_pw">
					</div>
					<button type="submit" class="btn mt-3 col-12">비밀번호 확인</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
