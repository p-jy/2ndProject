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
				<h2>로그인</h2>
			</div>
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
						<label class="form-check-label">
						<input type="checkbox" class="form-check-input" value="true" name="auto">자동 로그인
						</label>
					</div>
					<label id="checkIdPw" class="red mt-3"></label>
					<button type="submit" class="btn loginBtn col-12">로그인</button>
				</div>
			</form>
			<div class="d-flex justify-content-center">
				<a href="<c:url value="/signup"/>" class="btn signupBtn">회원가입</a>
			</div>
		</div>
			
	</div>
	
	<script type="text/javascript">
		$("#id, #pw").on('input', function(e){
			let id = $("#id").val();
			let pw = $("#pw").val();
			
			if(id == "") {
				$(".loginBtn").removeClass("login");
			}
			if(pw == "") {
				$(".loginBtn").removeClass("login");
			}
			
			if(id != "" && pw != "") {
				$(".loginBtn").addClass("login");
			}
		})
	</script>
	
	<script type="text/javascript">
		$(".loginBtn").click(function(e){
			$("#checkIdPw").text("");
			let id = $("#id").val();
			let pw = $("#pw").val();
			
			let str;
			
			if(id == "") {
				e.preventDefault();
				str = "아이디를 입력해주세요."
				$("#checkIdPw").addClass("red");
			} else if(pw == "") {
				e.preventDefault();
				str = "비밀번호를 입력해주세요."
				$("#checkIdPw").addClass("red");
			} else {
				return;
			}
			$("#checkIdPw").text(str);
		});
	</script>
</body>
</html>
