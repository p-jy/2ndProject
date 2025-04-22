<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
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
	.file-label>.base-img{
		display : block;
		width: 150px; height: 200px; border: 3px solid black;
		text-align: center; line-height: 190px; font-size: 50px
	}
	.file-label>img{
		display: none;
	}
	.file-label>input{
		display: none;
	}
</style>
</head>
<body>
<h1>식단 등록하기</h1>
	<form action="<c:url value="/record/diet"/>" method="post">
		<div class="d-flex">
			<label class="file-label mr-3">식단 사진 첨부하기
				<span class="base-img">+</span>
				<img class="sel-img" width="150" height="200">
				<input type="file" class="form-control" name="fileList" accept="image/*">
			</label>
		</div>
		<div class="form-group">
		  	<label for="di_name" class="form-label">식단 이름 : </label>
		  	<input type="text" class="form-control" name="di_name" id="di_name">
		</div>
		<div class="form-group">
			<label for="di_date" class="form-label">식단한 날짜 : </label>
		  	<input type="text" class="form-control" name="di_date" id="di_date">
		</div>
		<div class="form-group">
			<label for="di_amPm" class="form-label">오전/오후 : </label>
		  	<input type="text" class="form-control" name="di_amPm" id="di_amPm">
		</div>
		<div class="form-group">
			<label for="di_time" class="form-label">식단한 시간 : </label>
		 	<input type="text" class="form-control" name="di_time" id="di_time">
		</div>
		<button type="submit" class="btn btn-outline-secondary btn-block">등록하기</button>
	</form>
	<script>
		/* $("form").submit(function(e) {
		    e.preventDefault();
		    console.log(1);
		}); */
	</script>
</body>
</html>