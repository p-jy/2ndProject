<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		transform: translateY(25%);
	}
	
	.mypageLabel{
		color: #a3b398;
	}
	
	form {
		border: 3px solid #f1f1f1;
		width:550px;
	}
	
	.container2 {
		padding: 10% 8% 4% 8%;
	}
	
	.updateBtn {
		background: #e0e0e0;
		padding: 15px 0;
		color: white;
		font-weight: bold;
	}
	
	.updateBtn:hover {
		color: white;
	}
	
	.error, .red {
		color: red;
	}
	
	.green {
		color: green;
	}
	
</style>
</head>
<body>
	<div class="container1">
		<div class="form">
			<div class="mypageLabel d-flex justify-content-center mb-3">
				<h2>마이페이지</h2>
			</div>
			<form action="<c:url value="/mypage"/>" method="post">
				<div class="container2">
					<div class="form-group">
						<label for="pw">새 비밀번호</label>
						<input type="password" class="form-control" id="pw" name="me_pw">
					</div>
					<div class="form-group">
						<label for="pw2">새 비밀번호 확인</label>
						<input type="password" class="form-control" id="pw2" name="me_pw">
					</div>
					<div class="form-group">
						<label for="name">닉네임</label>
						<input type="text" class="form-control" id="name" name="me_name" value="${user.me_name }">
						<label id="checkName" class="red"></label>
					</div>
					<button type="submit" class="btn updateBtn col-12">회원 정보 수정</button>
				</div>
			</form>
		</div>	
	</div>
	
	<script type="text/javascript">
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
	
	$("form").validate({
		rules : {
			me_pw : {
				regex : /^[a-zA-Z0-9!@#$]{6,20}$/
			},
			me_pw2 : {
				equalTo : pw
			},
			me_name : {
				required : true,
				regex : /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{2,10}$/
			}
		},
		messages : {
			me_pw : {
				regex : "비번은 영문, 숫자,특수문자(!@#$)만 가능하며, 6~20자입니다."
			},
			me_pw2 : {
				equalTo : "비번과 비번확인이 일치하지 않습니다."
			},
			me_name : {
				required : "필수 항목입니다.",
				regex : "닉네임은 한글, 영문, 숫자만 가능하며, 2~10자입니다."
			}
		},
		//유효성 검사 체크 후 전송하기 직전에 확인하고 싶을 때 사용. return true 전송
		submitHandler : function(){
			return checkName();
		}
	})
	$.validator.addMethod("regex", function(value, element, regex){
		var re = new RegExp(regex);
		return this.optional(element) || re.test(value);
	}, "정규표현식을 확인하세요.");
	</script>
</body>
</html>
