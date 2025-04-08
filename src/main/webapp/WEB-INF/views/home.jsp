<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	form {
		border: 3px solid #f1f1f1;
	}
	
	.container {
		padding: 16px;
	}
	
	.form-group {
		width: 100%;
		padding: 12px 20px;
		margin: 8px 0;
		display: inline-block;
		border: 1px sold #ccc;
		box-sizing: border-box;
	}
	
	button {
		background-color: #04AA6D;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 100%;
	}
	
	button:hover {
		opacity: 0.8;
	}
	
	
	.button-container{
		display: flex;
		flex-wrap: wrap;
		padding: 20px;
	}
	
	.recordtitle{
		text-align: center;
		padding: 10px;
	}
	
	P{ 
		text-align: center;
		margin-top: 5px;
	}
	
</style>
</head>
<body>
	<div class="recordtitle">
		<h2>오늘의 활동을 등록해보세요.</h2>
	</div>
	
	<form action="" method="post">
		<label></label>
		<div class="button-container">
		  <a href="<c:url value='/record/diet' />" class="btn btn-outline-secondary btn-block">식단</a>
		  <a href="<c:url value='/record/inbody' />" class="btn btn-outline-secondary btn-block">신체</a>
		  <a href="<c:url value='/record/workout' />" class="btn btn-outline-secondary btn-block">운동</a>
		  <a href="<c:url value='/record/plan' />" class="btn btn-outline-secondary btn-block">계획</a>
		</div>
	</form>
	<form action="" method="post">
		<c:if test="${empty dietList}">
			<p>등록된 리스트가 없습니다.</p>
		</c:if>
		<c:forEach var="diet" items="${dietList}">
			<div class="form-group">
			  <label for="di_name">식단 이름 : </label>
			  <input type="text" class="form-control" id="di_name" value="${diet.di_name }">
			  <label for="di_date">식단한 날짜 : </label>
			  <input type="text" class="form-control" id="di_date" value="${diet.di_date }">
			  <label for="di_ampm">오전/오후 : </label>
			  <input type="text" class="form-control" id="di_ampm" value="${diet.di_ampm }">
			  <label for="di_time">식단한 시간 : </label>
			  <input type="text" class="form-control" id="di_time" value="${diet.di_time }">
			</div>
		</c:forEach>
	</form>
</body>
</html>