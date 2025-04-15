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
						<input type="text" id="title" name="title" style="border: none; width: 100%;" placeholder="예) 밀가루 안먹기 등">
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
					<td><input type="checkbox" id="days" name="days" value="월">월</td>
					<td><input type="checkbox" id="days" name="days" value="화">화</td>
					<td><input type="checkbox" id="days" name="days" value="수">수</td>
					<td><input type="checkbox" id="days" name="days" value="목">목</td>
					<td><input type="checkbox" id="days" name="days" value="금">금</td>
					<td><input type="checkbox" id="days" name="days" value="토">토</td>
					<td><input type="checkbox" id="days" name="days" value="일">일</td>
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
					<td><input type="checkbox" id="days" name="categories" value="workout">운동</td>
					<td><input type="checkbox" id="days" name="categories" value="diet">식단</td>
					<td><input type="checkbox" id="days" name="categories" value="body">신체</td>
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
						<input type="text" id="period" name="period" style="border: none; width: 100%;" placeholder="예) 30일">
					</td>
				</tr>
			</tbody>
		</table>
		<div class="container">
			<button type="submit" class="btn btn-info">만들기</button>
		</div>
	</form>
</body>
</html>
