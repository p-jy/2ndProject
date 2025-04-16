<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.close{
		width: 8px;
	}
	.loginBtn{
		margin-left: 50%;
		width: 90px;
	}
	.signupBtn{
		width: 110px;
	}
	.cancelBtn{
		width: 70px;
	}
	.red {
		color: red;
		font-size: 12px;
	}
</style>
</head>
<body>
	<!-- 헤더 -->
	<div class="modal-header">
		<h5 class="modal-title" id="loginModalLabel">로그인</h5>
		<button type="button" class="close mr-2" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">X</span>
		</button>
	</div>
	<!-- 바디 -->
	<div class="modal-body">
		<form method="post">
			<div class="container2">
				<div class="form-group">
					<label for="id">아이디</label>
					<input type="text" class="form-control" id="id" placeholder="아이디를 입력하세요" name="me_id">
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label>
					<input type="password" class="form-control" id="pw" placeholder="비밀번호를 입력하세요" name="me_pw">
				</div>
				<div class="form-check ml-3">
					<label class="form-check-label">
					<input type="checkbox" class="form-check-input" value="true" name="auto">자동 로그인
					</label>
				</div>
				<div>
					<label id="checkIdPw" class="red ml-3"></label>
				</div>
				<button type="submit" class="btn btn-primary loginBtn login">로그인</button>
				<button type="button" class="btn btn-secondary signupBtn" onclick="location.href='/member/signup'">회원가입</button>
				
			</div>
		</form>
	</div>
	<!-- 푸터 -->
	<div class="modal-footer">
		<button type="button" class="btn btn-danger cancelBtn" data-dismiss="modal">취소</button>
	</div>
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
