<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
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

.red{
	color: red;
	font-size: 12px;
}

</style>
</head>
<body>
	<div class="modal-header">
		<h5 class="modal-title" id="insertModalLabel">계획 등록하기</h5>
		<button type="button" class="close mr-2" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">X</span>
		</button>
	</div>
	<div class="modal-body">
		<form class="form" method="post" action="/spring/plan/planModal" onsubmit="return validateCheckbox()">
			<div class="containers">
				<div class="f-container mb-3">
					<label for="pl_title" class="form-label">타이틀</label>
					<input type="text" class="form-control" name="pl_title" id="pl_title" placeholder="예) 밀가루 안먹기" required>
				</div>
				<div class="f-container">
					<div class="checkbox-group">
						<label class="form-label">요일</label>
						<div class="checkbox-options">
							<label class="checkbox-option">
								<input type="checkbox" id="days" name="dayList[0].dy_day" value="월">월
							</label>
							<label class="checkbox-option">
								<input type="checkbox" id="days" name="dayList[1].dy_day" value="화">화
							</label>
							<label class="checkbox-option">
								<input type="checkbox" id="days" name="dayList[2].dy_day" value="수">수
							</label>
							<label class="checkbox-option">
								<input type="checkbox" id="days" name="dayList[3].dy_day" value="목">목
							</label>
							<label class="checkbox-option">
								<input type="checkbox" id="days" name="dayList[4].dy_day" value="금">금
							</label>
							<label class="checkbox-option">
								<input type="checkbox" id="days" name="dayList[5].dy_day" value="토">토
							</label>
							<label class="checkbox-option">
								<input type="checkbox" id="days" name="dayList[6].dy_day" value="일">일
							</label>
							<label id="checkbox" class="red">
							</label>
						</div>
					</div>
				</div>
				<div class="f-container mb-3">
					<div class="radio-group">
						<label class="form-label">분류</label>
						<div class="radio-options">
							<label class="radio-option">
								<input type="radio" id="diet" name="pl_mc_num" value="1">식단
							</label>
							<label class="radio-option">
								<input type="radio" id="workout" name="pl_mc_num" value="2">운동
							</label>
							<label class="radio-option">
								<input type="radio" id="inbody" name="pl_mc_num" value="3">신체
							</label>
							<label class="radio-option">
								<input type="radio" id="life" name="pl_mc_num" value="6">생활
							</label>
						</div>
					</div>
				</div>
				<div class="f-container mb-3">
					<label for="pl_period" class="form-label">기간</label>
					<input type="text" class="form-control" name="pl_period" id="pl_period" placeholder="예) 30" required>
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
		function validateCheckbox() {
			const checkboxes = document.querySelectorAll('input[name^="dayList"]');
			let isChecked = false;
			
			checkboxes.forEach((checkbox)=> {
				if(checkbox.checked) {
					isChecked = true;
				}
			});
			
			let str;
			if(!isChecked) {
				str = "요일을 하나 이상 선택해주세요.";
				$("#checkbox").addClass("red");
			} else {
				str = "";
				$("#checkbox").removeClass("red");
			}
			$("#checkbox").text(str);
			
			return isChecked;
		}
		
		
	</script>
</body>
</html>