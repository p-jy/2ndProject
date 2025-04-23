<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<style type="text/css">
		.container{
			width: 100%;
		}
		.btn{
			 width: 100%;
			 margin-top : 100px;
		}
		.title{
			text-align: center;
		}
		.table, .dayOfWeek, .division, .processPeriod  {
			width: 100%;
			table-layout: fixed;
			border-collapse: separate; 
      		border-spacing: 10px; 
		}
		.table th, .table td, .dayOfWeek th, .dayOfWeek td, .division th, .division td, .processPeriod th, .processPeriod td {
			border: none;
			vertical-align: middle;
			padding: 10px;
		}
		.table th, .dayOfWeek th, .division th, .processPeriod th {
			height: 50px;
		}
		.st input {
		  border: none;
		  width: 100%;
		}
	</style>
</head>
<body>
	<div class="title">
		<h1>계획 만들기</h1>
	</div>
	<form action="<c:url value = "/plan/make"/>" method="post">
		<table class="table">
			<thead>
				<tr>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="st">
							<input type="text" id="title" name="pl_title" placeholder="예) 밀가루 안먹기 등">
						</div>
					</td>
				</tr>
				<tr>
				  <td><span id="title-error" style="color: red;"></span></td>
				</tr>
			</tbody>
		</table>
		<table class="dayOfWeek">
			<thead>
				<tr>
					<th>요일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="checkbox" id="days" name="dy_day" value="월">월</td>
					<td><input type="checkbox" id="days" name="dy_day" value="화">화</td>
					<td><input type="checkbox" id="days" name="dy_day" value="수">수</td>
					<td><input type="checkbox" id="days" name="dy_day" value="목">목</td>
					<td><input type="checkbox" id="days" name="dy_day" value="금">금</td>
					<td><input type="checkbox" id="days" name="dy_day" value="토">토</td>
					<td><input type="checkbox" id="days" name="dy_day" value="일">일</td>
				</tr>
				<tr>
				  <td colspan="7"><span id="day-error" style="color: red;"></span></td>
				</tr>
			</tbody>
		</table>
		<table class="division">
			<thead>
				<tr>
					<th>분류</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><label for="option1">운동</label></td>
					<td><input type="checkbox" id="option1" name="pl_mc_num" value="1" class="only-one"></td>
				</tr>
				<tr>
					<td><label for="option2">식단</label></td>
					<td><input type="checkbox" id="option2" name="pl_mc_num" value="2" class="only-one"></td>
				</tr>
				<tr>
					<td><label for="option3">신체</label></td>
					<td><input type="checkbox" id="option3" name="pl_mc_num" value="3" class="only-one"></td>
				</tr>
				<tr>
					<td><label for="option4">생활</label></td>
					<td><input type="checkbox" id="option4" name="pl_mc_num" value="4" class="only-one"></td>
				</tr>
				<tr>
				  <td colspan="2"><span id="division-error" style="color: red;"></span></td>
				</tr>
			</tbody>
		</table>
		<table class="processPeriod">
			<thead>
				<tr>
					<th>진행 기간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="st">
							<input type="text" id="period" name="pl_period" placeholder="예) 30">
						</div>
					</td>
				</tr>
				<tr>
				  <td><span id="period-error" style="color: red;"></span></td>
				</tr>
			</tbody>
		</table>
		<div class="container">
			<button type="submit" class="btn btn-info btn-makeplan">만들기</button>
		</div>
	</form>
	
	<script type="text/javascript">
	 const checkboxes = document.querySelectorAll('.only-one');

	  checkboxes.forEach((checkbox) => {
	    checkbox.addEventListener('change', function () {
	      if (this.checked) {
	        checkboxes.forEach((cb) => {
	          if (cb !== this) cb.checked = false;
	        });
	      }
	    });
	  });
	</script>
	
	<script type="text/javascript">
		$(".btn-makeplan").click(function(e){
			//로그인 했다면 만들기 페이지로 입장
			if(${user != null}){
				return;
			}
			e.preventDefault();
			//로그인 안했다면 로그인 페이지로 이동
			if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하겠습니까?")){
				location.href="<c:url value="/login"/>";
			}
		})
	</script>
	
	<script>
	document.addEventListener("DOMContentLoaded", function () {
	const titleInput = document.getElementById("title");
	const daysCheckboxes = document.querySelectorAll("input[name='dy_day']");
	const divisionCheckboxes = document.querySelectorAll("input[name='pl_mc_num']");
	const periodInput = document.getElementById("period");
	const submitBtn = document.querySelector(".btn-makeplan");
	
	const titleError = document.getElementById("title-error");
	const dayError = document.getElementById("day-error");
	const divisionError = document.getElementById("division-error");
	const periodError = document.getElementById("period-error");
	
	// 실시간 유효성 제거
	titleInput.addEventListener("input", () => {
	if (titleInput.value.trim() !== "") {
		titleError.innerText = "";
		}
	});
	
	periodInput.addEventListener("input", () => {
	const val = periodInput.value.trim();
	if (val !== "" && !isNaN(val) && parseInt(val) > 0) {
		periodError.innerText = "";
		}
	});
	
	daysCheckboxes.forEach(cb => {
	cb.addEventListener("change", () => {
	if (document.querySelectorAll("input[name='dy_day']:checked").length > 0) {
			dayError.innerText = "";
			}
		});
	});
	
	divisionCheckboxes.forEach(cb => {
	cb.addEventListener("change", () => {
	if (document.querySelectorAll("input[name='pl_mc_num']:checked").length > 0) {
			divisionError.innerText = "";
			}
		});
	});
	
	// 제출 시 유효성 검사
	submitBtn.addEventListener("click", function (e) {
	let isValid = true;
	
	const title = titleInput.value.trim();
	const days = document.querySelectorAll("input[name='dy_day']:checked");
	const division = document.querySelectorAll("input[name='pl_mc_num']:checked");
	const period = periodInput.value.trim();
	
	// 초기화
	titleError.innerText = "";
	dayError.innerText = "";
	divisionError.innerText = "";
	periodError.innerText = "";
	
	if (title === "") {
		titleError.innerText = "제목을 입력해주세요.";
		isValid = false;
	}
	
	if (days.length === 0) {
		dayError.innerText = "요일을 하나 이상 선택해주세요.";
		isValid = false;
	}
	
	if (division.length === 0) {
		divisionError.innerText = "분류를 하나 선택해주세요.";
		isValid = false;
	}
	
	if (period === "") {
		periodError.innerText = "진행 기간을 입력해주세요.";
		isValid = false;
	} else if (isNaN(period) || parseInt(period) <= 0) {
		periodError.innerText = "유효한 숫자를 입력해주세요.";
		isValid = false;
	}
	
	if (!isValid) {
			e.preventDefault(); // 제출 막기
			}
		});
	});
</script>
</body>
</html>
