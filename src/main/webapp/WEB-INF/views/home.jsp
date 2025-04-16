<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
		<ul class="nav nav-tabs nav-justified" role="tablist">
			<li class="nav-item">
				<a class="nav-link active" data-toggle="tab" href="#diet">식단</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#inbody">신체</a>
    		</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#workout">운동</a>
			</li>
			<li class="nav-item">
				<a class="nav-link disabled" data-toggle="plan"href="#">계획</a>
			</li>
		</ul>
	</div>
	
	<!-- 선택한 날짜에 식단 기록이 없을 경우 -->
	<c:if test="${empty dietList}">
		<form action="" method="post">
			<p>등록된 리스트가 없습니다.</p>
				<div class="recordtitle">
					<h2>오늘의 활동을 등록해보세요.</h2>
				</div>
				<div class="button-container">
				  <a href="<c:url value='/record/diet' />" class="btn btn-outline-secondary btn-block">식단</a>
				  <a href="<c:url value='/record/inbody' />" class="btn btn-outline-secondary btn-block">신체</a>
				  <a href="<c:url value='/record/workout' />" class="btn btn-outline-secondary btn-block">운동</a>
				  <a href="<c:url value='/record/plan' />" class="btn btn-outline-secondary btn-block">계획</a>
				</div>
		</form>
	</c:if>
	<c:if test="${not empty dietList}">
		<div class="tab-content">
			<div id="diet" class="container tab-pane active"><br>
				<c:forEach var="diet" items="${dietList}">
					<div class="form-group">
					  <label for="di_Name">식단 이름 : </label>
					  <input type="text" class="form-control" id="di_Name" value="${diet.di_Name }" readonly>
					  <label for="di_Date">식단한 날짜 : </label>
					  <input type="text" class="form-control" id="di_Date" value="${diet.di_Date }" readonly>
					  <label for="di_AmPm">오전/오후 : </label>
					  <input type="text" class="form-control" id="di_AmPm" value="${diet.di_AmPm }" readonly>
					  <label for="di_Time">식단한 시간 : </label>
					  <input type="text" class="form-control" id="di_Time" value="${diet.di_Time }" readonly>
					</div>
				</c:forEach>				
			</div>
		</div>
	</c:if>
	<!-- 선택한 날짜에 신체 기록이 없을 경우 -->
	<c:if test="${empty inbodyList}">
		<form action="" method="post">
			<p>등록된 리스트가 없습니다.</p>
				<div class="recordtitle">
					<h2>오늘의 활동을 등록해보세요.</h2>
				</div>
				<div class="button-container">
				  <a href="<c:url value='/record/diet' />" class="btn btn-outline-secondary btn-block">식단</a>
				  <a href="<c:url value='/record/inbody' />" class="btn btn-outline-secondary btn-block">신체</a>
				  <a href="<c:url value='/record/workout' />" class="btn btn-outline-secondary btn-block">운동</a>
				  <a href="<c:url value='/record/plan' />" class="btn btn-outline-secondary btn-block">계획</a>
				</div>
		</form>
	</c:if>
	<c:if test="${not empty inbodyList}">
		<div class="tab-content">
			<div id="inbody" class="container tab-pane fade"><br>
				<c:forEach var="inbody" items="${inbodyList}">
					<div class="form-group">
					  <label for="ib_num">신체 번호 : </label>
					  <input type="text" class="form-control" id="ib_num" value="${inbody.ib_num }" readonly>
					  <label for="ib_date">신체 촬영 날짜 : </label>
					  <input type="text" class="form-control" id="ib_date" value="${inbody.ib_Date }" readonly>
					  <label for="ib_weight">몸무게 : </label>
					  <input type="text" class="form-control" id="ib_weight" value="${inbody.ib_weight }" readonly>
					  <label for="ib_smm">골격근량 : </label>
					  <input type="text" class="form-control" id="ib_smm" value="${inbody.ib_smm }" readonly>
					</div>
				</c:forEach>				
			</div>
		</div>
	</c:if>
	
	<!-- 선택한 날짜에 운동 기록이 없을 경우 -->
	<c:if test="${empty workoutList}">
		<form action="" method="post">
			<p>등록된 리스트가 없습니다.</p>
				<div class="recordtitle">
					<h2>오늘의 활동을 등록해보세요.</h2>
				</div>
				<div class="button-container">
				  <a href="<c:url value='/record/diet' />" class="btn btn-outline-secondary btn-block">식단</a>
				  <a href="<c:url value='/record/inbody' />" class="btn btn-outline-secondary btn-block">신체</a>
				  <a href="<c:url value='/record/workout' />" class="btn btn-outline-secondary btn-block">운동</a>
				  <a href="<c:url value='/record/plan' />" class="btn btn-outline-secondary btn-block">계획</a>
				</div>
		</form>
	</c:if>
	<c:if test="${not empty workoutList}">
		<div class="tab-content">
			<div id="workout" class="container tab-pane fade"><br>
				<c:forEach var="workout" items="${workoutList}">
					<div class="form-group">
					  <label for="wo_title">운동 제목 : </label>
					  <input type="text" class="form-control" id="wo_title" value="${workout.wo_title }" readonly>
					  <label for="wo_date">운동한 날짜 : </label>
					  <input type="text" class="form-control" id="wo_date" value="${workout.wo_date }" readonly>
					  <label for="wo_ampm">오전/오후 : </label>
					  <input type="text" class="form-control" id="wo_ampm" value="${workout.wo_ampm }" readonly>
					  <label for="wo_time">운동한 시간 : </label>
					  <input type="text" class="form-control" id="wo_time" value="${workout.wo_time }" readonly>
					</div>
				</c:forEach>				
			</div>
		</div>
	</c:if>
	
	
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