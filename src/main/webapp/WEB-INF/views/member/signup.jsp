<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<style type="text/css">
	
	.container1 {
		min-height: 730px;
	}
	
	.form{
		width: 550px;
		margin: 0 auto;
		transform: translateY(5%);
	}
	
	.signupLabel{
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
	
	.signupBtn {
		background: #e0e0e0;
		padding: 15px 0;
		color: white;
		font-weight: bold;
	}
	
	.signup{
		background: #81d742;
	}
	
	.signupBtn:hover {
		color: white;
	}
	
	.error, .red {
		color: red;
	}
	
	.green {
		color: green;
		font-size: 12px;
	}
	
</style>
</head>
<body>
	<div class="container1">
		<div class="form">
			<div class="signupLabel d-flex justify-content-center mb-3">
				<h2>회원가입</h2>
			</div>
			<form action="<c:url value="/signup"/>" method="post">
				<div class="container2">
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" id="id" name="me_id">
						<label id="checkId" class="red"></label>
					</div>
					<div class="form-group">
						<label for="pw">비밀번호</label>
						<input type="password" class="form-control" id="pw" name="me_pw">
					</div>
					<div class="form-group">
						<label for="pw2">비밀번호 확인</label>
						<input type="password" class="form-control" id="pw2" name="me_pw2">
					</div>
					<div class="form-group">
						<label for="name">닉네임</label>
						<input type="text" class="form-control" id="name" name="me_name">
						<label id="checkName" class="red"></label>
					</div>
					<div class="form-group">
						<label for="phone">전화번호</label>
						<input type="text" class="form-control" id="phone" name="me_phone">
						<label id="checkPhone" class="red"></label>
					</div>
					<button type="submit" class="btn signupBtn mt-3 col-12">회원가입</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$("#id, #pw, #name, #phone").on('input', function(e){
			let id = $("#id").val();
			let pw = $("#pw").val();
			let name = $("#name").val();
			let phone = $("#phone").val();
			
			if(id == "" || pw == "" || name == "" || phone == "") {
				$(".signupBtn").removeClass("signup");
			}
			
			if(id != "" && pw != "" && name != "" && phone != "") {
				$(".signupBtn").addClass("signup");
			}
		})
	</script>
	
	<script type="text/javascript">
	
		$("#id").on("input",function(e){
			checkId();
		});
		function checkId(){
			//입력한 아이디를 가져옴
			$("#checkId").text("");
			let id = $("#id").val();
	
			if(!/^[a-zA-Z0-9]{6,15}$/.test(id)){
				return false;
			}
			
			let res = false;
			//비동기 통신으로 아이디를 전송하고, 서버에서 보낸 결과를 이용하여 처리
			$.ajax({
				async : false, 
				url : '<c:url value="/check/id"/>', 
				type : 'post', 
				data : { id : id }, 
				success : function (data){
					if(data){
						res = true;	
					}
				}, 
				error : function(jqXHR, textStatus, errorThrown){
	
				}
			});
			let str;
			if(res){
				str = "사용 가능한 아이디입니다.";
				$("#checkId").addClass("green");
				$("#checkId").removeClass("red");
			}else{
				str = "이미 사용중인 아이디입니다.";
				$("#checkId").addClass("red");
				$("#checkId").removeClass("green");
			}
			$("#checkId").text(str);
			return res;
		}
		
		$("#name").on("input",function(e){
			checkName();
		});
		function checkName(){
			//입력한 이름을 가져옴
			$("#checkName").text("");
			let name = $("#name").val();
	
			if(!/^[ㄱ-ㅎ가-힣a-zA-Z0-9]{2,10}$/.test(name)){
				return false;
			}
			
			let res = false;
			
			$.ajax({
				async : false, 
				url : '<c:url value="/check/name"/>', 
				type : 'post', 
				data : { name : name }, 
				success : function (data){
					if(data){
						res = true;	
					}
				}, 
				error : function(jqXHR, textStatus, errorThrown){
	
				}
			});
			let str;
			if(res){
				str = "사용 가능한 닉네임입니다.";
				$("#checkName").addClass("green");
				$("#checkName").removeClass("red");
			}else{
				str = "이미 사용중인 닉네임입니다.";
				$("#checkName").addClass("red");
				$("#checkName").removeClass("green");
			}
			$("#checkName").text(str);
			return res;
		}
		
		$("#phone").on("input",function(e){
			checkPhone();
		});
		function checkPhone(){
			//입력한 이름을 가져옴
			$("#checkPhone").text("");
			let phone = $("#phone").val();
	
			if(!/^[0][1][0]-[0-9]{4}-[0-9]{4}$/.test(phone)){
				return false;
			}
			
			let res = false;
			
			$.ajax({
				async : false, 
				url : '<c:url value="/check/phone"/>', 
				type : 'post', 
				data : { phone : phone }, 
				success : function (data){
					if(data){
						res = true;	
					}
				}, 
				error : function(jqXHR, textStatus, errorThrown){
	
				}
			});
			let str;
			if(res){
				str = "사용 가능한 번호입니다.";
				$("#checkPhone").addClass("green");
				$("#checkPhone").removeClass("red");
			}else{
				str = "이미 등록된 번호입니다.";
				$("#checkPhone").addClass("red");
				$("#checkPhone").removeClass("green");
			}
			$("#checkPhone").text(str);
			return res;
		}
		
		$("form").validate({
			rules : {
				me_id : {
					required : true,
					regex : /^[a-zA-Z0-9]{6,15}$/
				},
				me_pw : {
					required : true,
					regex : /^[a-zA-Z0-9!@#$]{6,20}$/
				},
				me_pw2 : {
					equalTo : pw
				},
				me_name : {
					required : true,
					regex : /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{2,10}$/
				},
				me_phone : {
					required : true,
					regex : /^[0][1][0]-[0-9]{4}-[0-9]{4}$/
				}
			},
			messages : {
				me_id : {
					required : "아이디: 필수 항목입니다.",
					regex : "아이디는 영문, 숫자만 가능하며, 6~15자입니다."
				},
				me_pw : {
					required : "비밀번호: 필수 항목입니다.",
					regex : "비번은 영문, 숫자,특수문자(!@#$)만 가능하며, 6~20자입니다."
				},
				me_pw2 : {
					equalTo : "비번과 비번확인이 일치하지 않습니다."
				},
				me_name : {
					required : "닉네임: 필수 항목입니다.",
					regex : "닉네임은 한글, 영문, 숫자만 가능하며, 2~10자입니다."
				},
				me_phone : {
					required : "전화번호: 필수 항목입니다.",
					regex : "전화번호는 010-XXXX-XXXX 형식으로 입력하여야 합니다."
				}
			},
			//유효성 검사 체크 후 전송하기 직전에 확인하고 싶을 때 사용. return true 전송
			submitHandler : function(){
				return checkId();
			}
		})
		$.validator.addMethod("regex", function(value, element, regex){
			var re = new RegExp(regex);
			return this.optional(element) || re.test(value);
		}, "정규표현식을 확인하세요.");
	</script>
</body>
</html>
