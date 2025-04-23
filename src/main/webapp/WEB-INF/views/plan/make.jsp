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
							<input type="text" id="title" name="title" value="${plan.pl_title}" placeholder="예) 밀가루 안먹기 등">
						</div>
					</td>
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
					<td><input type="checkbox" id="days1" name="days" value="월">월</td>
					<td><input type="checkbox" id="days2" name="days" value="화">화</td>
					<td><input type="checkbox" id="days3" name="days" value="수">수</td>
					<td><input type="checkbox" id="days4" name="days" value="목">목</td>
					<td><input type="checkbox" id="days5" name="days" value="금">금</td>
					<td><input type="checkbox" id="days6" name="days" value="토">토</td>
					<td><input type="checkbox" id="days7" name="days" value="일">일</td>
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
					<td><input type="checkbox" id="option1" name="workout" value="${plan.pl_mc_num}" class="only-one"></td>
				</tr>
				<tr>
					<td><label for="option2">식단</label></td>
					<td><input type="checkbox" id="option2" name="diet" value="${plan.pl_mc_num}" class="only-one"></td>
				</tr>
				<tr>
					<td><label for="option3">신체</label></td>
					<td><input type="checkbox" id="option3" name="body" value="${plan.pl_mc_num}" class="only-one"></td>
				</tr>
				<tr>
					<td><label for="option4">생활</label></td>
					<td><input type="checkbox" id="option4" name="life" value="${plan.pl_mc_num}" class="only-one"></td>
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
							<input type="text" id="period" name="period" value="${plan.pl_period}" placeholder="예) 30">
						</div>
					</td>
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
	
</body>
</html>
