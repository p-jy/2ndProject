<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

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

.button-container {
	display: flex;
	flex-wrap: wrap;
	padding: 20px;
}

.recordtitle {
	text-align: center;
	padding: 10px;
}

P {
	text-align: center;
	margin-top: 5px;
}

/* 달력 css */
a {
    color: black;
}
.fc-toolbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.fc-toolbar-title {
  font-weight: bold;
  color: #333;
}
.fc-toolbar-chunk:nth-child(3) {
  display: flex;
}
.fc-button {
  margin: 0 5px;
  padding: 6px 12px;
  border-radius: 6px;
}

/*탭 버든 관련 스타일 시작*/
.tab-container {
	margin-top: 20px;
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
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/6.1.9/index.global.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/6.1.9/locales/ko.js'></script>

</head>
<body>
	<!-- 달력 영역입니다. -->
	<div id='calendar'></div>

	<!-- 탭 버튼입니다. -->
	<div class="tab-container my-record">
		<ul class="nav nav-tabs nav-justified" id="recordTabs" role="tablist">
			<li class="nav-item" onclick="loadDietList()">
				<a class="nav-link active" id="diet-tab" data-toggle="tab" href="#diet" >식단</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id="inbody-tab" data-toggle="tab" href="#inbody">신체</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id="workout-tab" data-toggle="tab" href="#workout">운동</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" role="plan" href="#">계획</a>
			</li>
		</ul>
	</div>
	
	
	<!-- 선택한 날짜에 신체 기록이 없을 경우 -->
	<div class="tab-content">
		<!-- 
		<c:if test="${empty inbodyList}">
			<p>등록된 리스트가 없습니다.</p>
		</c:if>
		<c:if test="${not empty inbodyList}">
			<div id="inbody" class="container tab-pane fade">
				<br>
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
		</c:if>
		 -->
	</div>
	<!-- 선택한 날짜에 운동 기록이 없을 경우 -->
	<!-- <div class="tab-content">
		<c:if test="${empty workoutList}">
			<p>등록된 리스트가 없습니다.</p>
		</c:if>
		<c:if test="${not empty workoutList}">
			<div id="workout" class="container tab-pane fade">
				<br>
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
		</c:if>
	</div>-->
	<form action="" method="post">
		<div class="recordtitle">
			<h2>오늘의 활동을 등록해보세요.</h2>
		</div>
		<div class="button-container">
			<a href="<c:url value='/record/insertDiet' />" class="btn btn-outline-secondary btn-block">식단</a> 
			<a href="<c:url value='/record/inbody' />" class="btn btn-outline-secondary btn-block">신체</a> 
			<a href="<c:url value='/record/workout' />" class="btn btn-outline-secondary btn-block">운동</a> 
			<a href="<c:url value='/record/plan' />" class="btn btn-outline-secondary btn-block">계획</a>
		</div>
	</form>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				height: '200px',
				initialView : 'dayGridWeek',
				locale : 'ko',
				headerToolbar : {
					start : 'title',
					center : '',
					end : 'today week month prev,next'
				},
				customButtons:{
					week:{
						text:'week',
						click: function(){
							calendar.changeView('dayGridWeek');
						}
					},
					month:{
						text:'month',
						click: function(){
							calendar.changeView('dayGridMonth');
						}
					}
				},
				events : {
					display: 'auto'
				},
			});
			calendar.render();
			addEventByType('2025-04-18','diet'); //테스트용
			addEventByType('2025-04-18','inbody'); //테스트용
			addEventByType('2025-04-18','workout'); //테스트용
			
			function addEventByType(date, type) {
			    let titleIcon = '';
			    let backgroundColor = '';

			    switch (type) {
			      case 'diet':
			        titleIcon = '🍽️';
			        backgroundColor = '#FFA07A';
			        break;
			      case 'inbody':
			        titleIcon = '🧍';
			        backgroundColor = '#98FB98';
			        break;
			      case 'workout':
			        titleIcon = '💪';
			        backgroundColor = '#87CEFA';
			        break;
			    }

			    calendar.addEvent({
			      title: titleIcon,
			      start: date,
			      allDay: true,
			      backgroundColor: backgroundColor,
			      borderColor: backgroundColor
			    });
			  }
			
		});
	</script>
	<script>
		$(".my-record .nav-item").first().click()
		//식단 리스트를 비동기통신으로 식단 탭에 뿌려줍니다.
		function loadDietList() {
			$.ajax({
				async : true,
				url : '<c:url value="/record/diet" />',
				method : 'GET',
				success : function(data) {
					$('.tab-content').html(data);
				}
			});
		}
	</script>
</body>
</html>