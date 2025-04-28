<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.js"></script>
<style type="text/css">
	.close {
	width: 8px;
}
.cancelBtn{
	width: 70px;
}
.insertBtn {
	width: 150px;
}
.radio-group {
	display: block;
	align-items: center;
	flex-wrap: wrap;
	gap: 10px;
}

.radio-group .form-label{
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
}

.form-label {
	margin-right: 10px;
	font-weight: bold;
	min-width: 80px;
}

.radio-option, .checkbox-option {
	display: flex;
	align-items: center;
	gap: 4px;
}

.radio-options, .checkbox-options{
	display: flex;
	flex-wrap: wrap;
	column-gap: 10px;
}

.form{
	padding: 20px;
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
	<div class="modal-header">
		<h5 class="modal-title" id="createModalLabel">그룹 만들기</h5>
		<button type="button" class="close mr-2" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">X</span>
		</button>
	</div>
	<div class="modal-body">
		<form class="form" method="post" action="/spring/group/createGroupModal">
			<div class="containers">
				<div class="f-container mb-3">
					<label for="gr_name" class="form-label">그룹명</label>
					<input type="text" class="form-control" name="gr_name" id="gr_name" placeholder="그룹명을 입력하세요." required>
				</div>
				<div class="f-container">
					<div class="radio-group">
						<label class="form-label">공개 여부</label>
						<div class="radio-options">
							<label class="radio-option">
								<input type="radio" name="gr_public" id="y" value="Y" checked onchange="togglePasswordField()"> Y
							</label>
							<label class="radio-option">
								<input type="radio" name="gr_public" id="n" value="N" onchange="togglePasswordField()"> N
							</label>
						</div>
					</div>
				</div>
				<div class="form-group mt-3" id="passwordField">
					<label for="pw" class="form-label">비밀번호</label>
					<input type="text" class="form-control" id="groupPw" name="gr_pw" placeholder="4자리의 숫자를 입력해주세요.">	
				</div>
				<div class="f-container mb-3">
					<label for="gr_introduction" class="form-label">그룹 소개</label>
					<input type="text" class="form-control" name="gr_introduction" id="gr_introduction" required>
				</div>
				<div class="f-container">
					<div class="checkbox-group">
						<label class="form-label">공유 기록</label>
						<label class="checkbox-option">
							<input type="checkbox" name="sharerecordList[0].sr_mc_num" value="1"> 운동
						</label>
						<label class="checkbox-option">
							<input type="checkbox" name="sharerecordList[0].sr_mc_num" value="2"> 식단
						</label>
						<label class="checkbox-option">
							<input type="checkbox" name="sharerecordList[0].sr_mc_num" value="3"> 신체
						</label>
						<label class="checkbox-option">
							<input type="checkbox" name="sharerecordList[0].sr_mc_num" value="4"> 생활
						</label>
					</div>
				</div>
				<div class="f-container mb-3">
					<label class="form-label">규칙</label>
					<input type="text" class="form-control" id="rule" name="ruleList[0].rl_rule" required>
					<input type="text" class="form-control" id="rule" name="ruleList[1].rl_rule">
					<input type="text" class="form-control" id="rule" name="ruleList[2].rl_rule">
					<input type="text" class="form-control" id="rule" name="ruleList[3].rl_rule">
					<input type="text" class="form-control" id="rule" name="ruleList[4].rl_rule">
				</div>
				<div class="f-container mb-3">
					<label for="gr_start_date" class="form-label">시작일</label>
					<input type="text" class="form-control" name="gr_start_date" id="gr_start_date" required>
				</div>
				<div class="f-container mb-3">
					<label for="gr_period" class="form-label">기간</label>
					<input type="text" class="form-control" name="gr_period" id="gr_period" placeholder="예) 30" required>
				</div>
				<div class="f-container">
					<div class="checkbox-group mb-3">
						<label class="form-label">목표</label>
						<c:forEach items="${subCate}" var="subcate">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="goals" value="${subcate.sc_name}" id="goal_${subcate.sc_num}">
						        <label class="form-check-label" for="goal_${subcate.sc_num}">${subcate.sc_name}</label>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<button type="submit" class="btn btn-outline-secondary btn-block insertBtn">등록하기</button>
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-danger cancelBtn" data-dismiss="modal">취소</button>
	</div>
	<script type="text/javascript">
		function togglePasswordField() {
			var publicRadioY = document.getElementById('y');
	        var passwordField = document.getElementById('passwordField');
	        
	        // 공개 여부가 Y일 때 비밀번호 입력 필드 표시
	        if (publicRadioY.checked) {
	            passwordField.style.display = 'block';
	        } else {
	            passwordField.style.display = 'none';
	        }
		}
	</script>
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
		$(function() {
			$("#gr_start_date").datepicker({
				dateFormat : 'yy-mm-dd', // 달력 날짜 형태
				showOtherMonths : true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
				showMonthAfterYear : true, // 년도 - 월 순서
				changeYear : true, // 년 선택 가능 옵션
				changeMonth : true
			// 월 선택 가능 옵션
			});
			$('#di_date').datepicker('setDate', 'today'); //초기값을 오늘 날짜로 설정
		});
		
		
	</script>
</body>
</html>