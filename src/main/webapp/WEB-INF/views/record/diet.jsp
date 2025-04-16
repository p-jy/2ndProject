<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	
</style>
</head>
<body>
<h1>식단 등록하기</h1>
	<form action="">
		<div class="form-group mt-3">
		  	<label for="di_Name">식단 이름 : </label>
		  	<input type="text" class="form-control" id="di_Name" value="${diet.di_Name }">
		</div>
		<div>
			<label for="di_Date">식단한 날짜 : </label>
		  	<input type="text" class="form-control" id="di_Date" value="${diet.di_Date }">
		</div>
		<div>
			<label for="di_AmPm">오전/오후 : </label>
		  	<input type="text" class="form-control" id="di_AmPm" value="${diet.di_AmPm }">
		</div>
		<div>
			<label for="di_Time">식단한 시간 : </label>
		 	<input type="text" class="form-control" id="di_Time" value="${diet.di_Time }">
		</div>
		<div class="button-container">
		  <a href="<c:url value='' />" class="btn btn-outline-secondary btn-block">등록하기</a>
		</div>
	</form>
	<div>
		${dietList }
	</div>
</body>
</html>