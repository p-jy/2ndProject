<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
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
	.form-group2 {
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
	.inbodyTitle {
		text-align: left;
		padding: 12px;
		font-size: 20px;
		font-stretch: bold;
	}
	.score-btn{
		display: flex;
		align-items: center;
	}
	.radio{
		width: auto;
		margin: 10px;
	}
</style>
</head>
<body>
<div class="inbodyTitle">인바디 등록하기</div>
	<form action="<c:url value="/record/insertInbody"/>" method="post" enctype="multipart/form-data">
 		<div class="form-group">
			<label>사진 첨부하기</label>
			<input type="file" class="form-control" name="file"/>
		</div>
		<div class="form-group">
			<label for="ib_date" class="form-label">측정 날짜 : </label>
		  	<input type="text" class="form-control" name="ib_date" id="ib_date">
		</div>
		<div class="form-group">
		  	<label for="ib_weight" class="form-label">체중 : </label>
		  	<input type="text" class="form-control" name="ib_weight" id="ib_weight">
		</div>
		<div class="form-group">
			<label for="ib_smm" class="form-label">골격근량 : </label>
		 	<input type="text" class="form-control" name="ib_smm" id="ib_smm">
		</div>
		<div class="form-group">
			<label for="ib_bfm" class="form-label">체지방률 : </label>
		 	<input type="text" class="form-control" name="ib_bfm" id="ib_bfm">
		</div>
		<button type="submit" class="btn btn-outline-secondary btn-block">등록하기</button>
	</form>
	<script>
	  $(function() {
	    $( "#ib_date" ).datepicker({
	    	dateFormat: 'yy-mm-dd', // 달력 날짜 형태
	    	showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	    	showMonthAfterYear: true, // 년도 - 월 순서
	    	changeYear: true, // 년 선택 가능 옵션
	    	changeMonth: true // 월 선택 가능 옵션
	    });
	    $('#ib_date').datepicker('setDate', 'today'); //초기값을 오늘 날짜로 설정
	  });
	</script>
</body>
</html>