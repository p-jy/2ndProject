<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<style>
.container1 {
	min-height: 690px;
}

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
#calendar.week {
	height: 200px;
}

#calendar.month {
	height: 500px;
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
	<div class="container1">
		<!-- 달력 영역입니다. -->
		<div id='calendar'></div>

		<!-- 탭 버튼입니다. -->
		<div class="tab-container my-record">
			<ul class="nav nav-tabs nav-justified" id="recordTabs" role="tablist">
				<li class="nav-item" onclick="loadDietList()"><a
					class="nav-link type active" id="diet-tab" data-toggle="tab"
					href="#diet" data-target="diet">식단</a></li>
				<li class="nav-item"><a class="nav-link type" id="inbody-tab"
					data-toggle="tab" href="#inbody" data-target="inbody">신체</a></li>
				<li class="nav-item"><a class="nav-link type" id="workout-tab"
					data-toggle="tab" href="#workout" data-target="workout">운동</a></li>
				<li class="nav-item"><a class="nav-link type" role="plan"
					href="#" data-target="plan">계획</a></li>
			</ul>
		</div>
		<div class="tab-content"></div>
		<!-- 식단/신체/운동 등록하기 버튼 -->
		<div>
			<div class="recordtitle">
				<h2>오늘의 활동을 등록해보세요.</h2>
			</div>
			<div class="button-container">
				<a class="btn btn-outline-secondary btn-block" data-toggle="modal"
					data-target="#insertModal" onclick="openDietModal()" role="button">식단</a>
				<a class="btn btn-outline-secondary btn-block" data-toggle="modal"
					data-target="#insertModal" onclick="openInbodyModal()"
					role="button">신체</a> <a class="btn btn-outline-secondary btn-block"
					data-toggle="modal" data-target="#insertModal"
					onclick="openWorkoutModal()" role="button">운동</a> <a
					class="btn btn-outline-secondary btn-block" data-toggle="modal"
					data-target="#insertModal" onclick="openPlanModal()" role="button">계획</a>
			</div>
			<div id="insertModal" class="modal fade" tabindex="-1"
				aria-labelledby="insertModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content"></div>
				</div>
			</div>
		</div>
	</div>

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
					data : { date : "month"},
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
		let type = "diet";
		console.log(type);
		
		loadList();
		
		$('.type').click(function () {
			$('.type').removeClass('active');
			$(this).addClass('active');
			type = $(this).data('target');
			console.log(type);
			loadList();
		});
		//식단 리스트를 비동기통신으로 식단 탭에 뿌려줍니다.
		function loadList() {
			let url = '';
			if (type === 'diet') url = '<c:url value="/record/diet"/>';
		    else if (type === 'workout') url = '<c:url value="/record/workout"/>';
		    else if (type === 'inbody') url = '<c:url value="/record/inbody"/>';
		    else if (type === 'plan') url = '<c:url value="/plan/plan"/>';
			
			$.ajax({
				async : true,
				url : url,
				method : 'GET',
				success : function(data) {
					$('.tab-content').html(data);
				}
			});
		}
		
		
		
		function openDietModal() {
			$('.modal-content').load("<c:url value='/record/dietModal'/>", function () {
		        $('#insertModal').modal('show');
		    });
		}
		function openInbodyModal() {
			$('.modal-content').load("<c:url value='/record/inbodyModal'/>", function () {
		        $('#insertModal').modal('show');
		    });
		}
		function openWorkoutModal() {
			$('.modal-content').load("<c:url value='/record/workoutModal'/>", function () {
		        $('#insertModal').modal('show');
		    });
		}
		function openPlanModal() {
			$('.modal-content').load("<c:url value='/plan/planModal'/>", function () {
		        $('#insertModal').modal('show');
		    });
		}
	</script>
</body>
</html>