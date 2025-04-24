<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.js"></script>
<style type="text/css">
	
	.error, .red {
		color: red;
	}
	
	.green {
		color: green;
	}
	
</style>
</head>
<body>
	<h1>그룹 만들기</h1>
	<form action="<c:url value="/group/make"/>" method="post">		
		<div class="form-group mt-3">
			<label for="title" class="form-label">그룹이름</label>
			<input type="text" class="form-control" id="groupName" name="gr_name">
		</div>
		
		<div class="form-group mt-3">
			
			<!-- 
			<label class="form-label">공개 여부(Y,N)을 입력하세요.</label>
			<label class="form-label">Y => 공개, N => 비공개</label>
			<input type="text" class="form-control" id="public" name="gr_public">
			 -->
			<label class="form-label">공개 여부(Y,N)을 선택하세요.</label>
			<input type="radio"  id="public_y" name="gr_public"  value="Y" checked>Y
			<input type="radio"  id="public_n" name="gr_public" value="N">N
			
		</div>
		
		<div class="form-group mt-3" id="passwordField">
			<label for="pw" class="form-label">비밀번호(4자리)</label>
			<input type="text" class="form-control" id="groupPw" name="gr_pw">	
		</div>
		
		
		<div class="form-group mt-3">
			<label class="form-label">소개글</label>
			<textarea class="form-control" id="intro" name="gr_introduction" rows="10"></textarea>
		</div>
		<div class="form-group mt-3">
			<label class="form-label">공유할 기록</label><br>
		    <label><input type="checkbox" name="sharerecordList[0].sr_mc_num" value="1"> 운동</label>
		    <label><input type="checkbox" name="sharerecordList[1].sr_mc_num" value="2"> 식단</label>
		    <label><input type="checkbox" name="sharerecordList[2].sr_mc_num" value="3"> 신체</label>
		    <label><input type="checkbox" name="sharerecordList[3].sr_mc_num" value="4"> 생활</label>
		</div>
		<div class="form-group mt-3">
			<label class="form-label">규칙</label>
			<input type="text" class="form-control" id="rule" name="ruleList[0].rl_rule">			 
			<input type="text" class="form-control" id="rule" name="ruleList[1].rl_rule">
			<input type="text" class="form-control" id="rule" name="ruleList[2].rl_rule">
			<input type="text" class="form-control" id="rule" name="ruleList[3].rl_rule">
			<input type="text" class="form-control" id="rule" name="ruleList[4].rl_rule">
			
		</div>
		<div class="form-group mt-3">
			<label class="form-label">시작일</label>
			<input type="text" class="form-control" id="startdate" name="gr_start_date">
		</div>
		<div class="form-group mt-3">
			<label class="form-label">진행 기간</label>
			<input type="text" class="form-control" id="period" name="gr_period" required>
		</div>
		
		<div class="form-group mt-3">
			<label class="form-label">최대정원</label>
			<input type="text" class="form-control" id="person" name="gr_personnel">
		</div>
		<div class="form-group mt-3">
		  <label class="form-label">그룹목표</label>
		  <div class="border rounded p-3" style="height: 200px; overflow-y: auto;">
		    <c:forEach items="${subCate}" var="subcate">
		      <div class="form-check">
		        <input class="form-check-input" type="checkbox" 
		               name="goals" value="${subcate.sc_name}" 
		               id="goal_${subcate.sc_num}">
		        <label class="form-check-label" for="goal_${subcate.sc_num}">
		          ${subcate.sc_name}
		        </label>
		      </div>
		    </c:forEach>
		  </div>
		</div>
		
		<button type="submit" class="btn btn-outline-info mt-3 col-12 content-center">그룹 만들기</button>
	</form>
	<script type="text/javascript">
		$("#pw").on('input', function(e){
			let pw = $("#pw").val();
			
			if(pw ==""){
				$(".btn-outline-info").removeClass("make");
			}
			
			if(pw !=""){
				$(".btn-outline-info").addClass("make");
			}
		});
		
		$("form").validate({
			rules :{
				me_pw : {
					required : true,
					regex : /^[a-zA-Z0-9!@#$]{0,4}$/
				}
				me_pw2 : {
					equalTo: pw
				}
			},
			messages : {
				me_pw : {
					required : "비밀번호를 입력하세요."
					regex : "비밀번호는 영문, 숫자, 특수문자만 가능하며, 최대 4자까지 입력가능합니다."
				}
				me_pw2 : {
					equalTo : "비밀번호와 비밀번호 확인이 일치하지 않습니다."
				}
			}
		})
	</script>
	
	<script type="text/javascript">
		 // DOM이 로딩되면 실행
	    window.onload = function() {
	        const radios = document.getElementsByName("gr_public");
	        const pwField = document.getElementById("passwordField");
	
	        function togglePasswordField() {
	            const selected = [...radios].find(r => r.checked).value;
	            if (selected === "N") {
	                pwField.style.display = "block";
	            } else {
	                pwField.style.display = "none";
	            }
	        }
	
	        // 라디오 버튼 변경 시마다 실행
	        radios.forEach(r => r.addEventListener("change", togglePasswordField));
	
	        // 초기 상태 반영
	        togglePasswordField();
	    };
	</script>
</body>
</html>