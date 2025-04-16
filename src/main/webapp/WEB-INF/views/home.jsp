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
	
	/* 달력 관련 스타일 시작*/
	#calendar {
        max-width: 900px;
        margin: 40px auto;
    }
    #scheduleList {
        max-width: 900px;
        margin: 20px auto;
        border-top: 1px solid #ccc;
        padding-top: 20px;
    }
    a[aria-label] {
		  color: black;
	}
    /*달력 관련 스타일 끝*/
    
    /*탭 버든 관련 스타일 시작*/
    .tab-container {
	      margin-bottom: 10px;
    }

    .tab {
    	  flex: 1;
    	  text-align: center;
	      padding: 10px 20px;
	      cursor: pointer;
	      border: 1px solid #ccc;
	      background-color: #f2f2f2;
	      margin-right: 5px;
    }
    /*탭 버든 관련 스타일 끝*/
	
</style>

	<!-- 아래 세 줄은 달력 스크립트입니다. -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/main.min.css' rel='stylesheet' />
    <script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/6.1.9/index.global.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/6.1.9/locales/ko.js'></script>

</head>
<body>
	<!-- 달력 영역입니다. -->
	<div id='calendar'></div>
	
	<!-- 탭 버튼입니다. -->
	<div class="tab-container">
		<ul class="nav nav-tabs nav-justified">
			<li class="nav-item">
				<a class="nav-link active" data-tab="diet" href="#">식단</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-tab="body" href="#">신체</a>
    		</li>
			<li class="nav-item">
				<a class="nav-link" data-tab="workout" href="#">운동</a>
			</li>
			<li class="nav-item">
				<a class="nav-link disabled" data-tab="plan"href="#">계획</a>
			</li>
		</ul>
	</div>
	
	<!-- 탭 버튼 클릭시 나오는 페이지 입니다. -->
	<div id="diet" class="tab-content">
	    <p>식단 페이지 내용입니다.</p>
	</div>
	<div id="body" class="tab-content">
	    <p>신체 페이지 내용입니다.</p>
	</div>
	<div id="workout" class="tab-content">
	    <p>운동 페이지 내용입니다.</p>
	</div>
	<div id="plan" class="tab-content">
	    <p>계획 페이지 내용입니다.</p>
	</div>
	
	
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
			  <label for="di_Num">식단 번호 : </label>
		  		<input type="text" class="form-control" id="di_Num" value="${diet.di_Num }">
			  <label for="di_Name">식단 이름 : </label>
			  	<input type="text" class="form-control" id="di_Name" value="${diet.di_Name }">
			  <label for="di_Date">식단한 날짜 : </label>
			 	 <input type="text" class="form-control" id="di_Date" value="${diet.di_Date }">
			  <label for="di_AmPm">오전/오후 : </label>
			  	<input type="text" class="form-control" id="di_AmPm" value="${diet.di_AmPm }">
			  <label for="di_Time">식단한 시간 : </label>
			 	 <input type="text" class="form-control" id="di_Time" value="${diet.di_Time }">
			</div>
		</c:forEach>
	</form>
	
	
	
	<script>
	    document.addEventListener('DOMContentLoaded', function () {
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'dayGridMonth',
	            locale : 'ko',
	            headerToolbar: {
	                left: 'prev',
	                center: 'title',
	                right: 'next'
	              },
	        });
	        calendar.render();
	        console.log(calendar)
	    });
	</script>
</body>
</html>