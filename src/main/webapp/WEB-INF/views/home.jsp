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
#calendar.week{
	height : 200px;
}
#calendar.month{
	height : 500px;
}
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
	<div class="tab-content"></div>
	<!-- 식단/신체/운동 등록하기 버튼 -->
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
							calendarEl.classList.remove("month");
							calendarEl.classList.add("week");
							calendar.changeView('dayGridWeek');
						}
					},
					month:{
						text:'month',
						click: function(){
							calendarEl.classList.remove("week");
							calendarEl.classList.add("month");
							calendar.changeView('dayGridMonth');
						}
					}
				},
				events : {
					display: 'auto'
				},
			});
			calendar.render();
			setFullCalendar();
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
			function setFullCalendar(){
				//비동기 통신으로 today/week/month에 맞게 기록 정보들을 가져옴
				$.ajax({
					async : true,
					url : '<c:url value="/record/calendar/list" />',
					data : { date : "week"},
					method : 'GET',
					success : function(data) {
						console.log(data);
						for(obj of data){
							addEventByType(formatDate(new Date(obj.date)), obj.type);
							console.log(formatDate(new Date(obj.date)))
						}
					}
				})
			}
			$("button[title=week]").click();
		});
		
		function formatDate(date) {
		  const year = date.getFullYear();
		  const month = String(date.getMonth() + 1).padStart(2, '0'); // 0-based month
		  const day = String(date.getDate()).padStart(2, '0');
		  return `\${year}-\${month}-\${day}`;
		}
		
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