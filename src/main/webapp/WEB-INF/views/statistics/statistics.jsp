<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<style type="text/css">
.nav-pills {
	border: 2px solid #f0f2f4;
	border-radius: 5px;
	padding: 3px;
}

.nav-link {
	color: #9b9b9b;
}

.nav-link:hover {
	color: #9b9b9b;
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	color: #545e6f;
	font-weight: bold;
	background-color: #f0f2f4;
}

.chart {
	width: 70%;
	
}
</style>
</head>
<body>
	<div class="period-tab">
		<ul class="nav nav-pills nav-justified">
			<li class="nav-item"><a class="nav-link period week active"
				data-target="week" onclick="week()">7일</a></li>
			<li class="nav-item"><a class="nav-link period month"
				data-target="month" onclick="month()">1개월</a></li>
			<li class="nav-item"><a class="nav-link period months"
				data-target="months" onclick="months()">3개월</a></li>
			<li class="nav-item"><a class="nav-link period year"
				data-target="year" onclick="year()">1년</a></li>
		</ul>
	</div>
	<div class="type-tab mt-2">
		<ul class="nav nav-pills nav-justified">
			<li class="nav-item"><a class="nav-link type diet active"
				data-target="diet" onclick="diet()">식단</a></li>
			<li class="nav-item"><a class="nav-link type workout"
				data-target="workout" onclick="workout()">운동</a></li>
			<li class="nav-item"><a class="nav-link type inbody"
				data-target="inbody" onclick="inbody()">신체</a></li>
		</ul>
	</div>

	<div class="chart-container">
		<div class="chart mt-3">
			<canvas id="chart"></canvas>
		</div>
	</div>

	<script type="text/javascript">
		var $period = $('.period');
		var $type = $('.type');

		var period = $(".period.active").data("target");
		var type = $(".type.active").data("target");
		var date = 7;
		
		const x = [];
		const y = [0,0,0,0,0,0,0];
		
		$period.click(function() {
			$(this).addClass('active');
			$period.not(this).removeClass('active');
		});
		$type.click(function() {
			$(this).addClass('active');
			$type.not(this).removeClass('active');
		});
		
		
		let data = dietAjax();
		scoreAVG();
		createDietChart(x, y);
		
		function diet() {
			checkPeriod();
			data = dietAjax();
		}
		function workout() {
			checkPeriod();
			data = workoutAjax();
		}
		function inbody() {
			checkPeriod();
			data = inbodyAjax();
		}
		function week() {
			date = 7;
			data = typeAjax();
		}
		function month() {
			date = 30;
			data = typeAjax();
		}
		function months() {
			date = 90;
			data = typeAjax();
		}
		function year() {
			date = 365;
			data = typeAjax();
		}

		function typeAjax() {
			type = $(".type.active").data("target");

			if (type === "diet") {
				dietAjax();
			}
			if (type === "workout") {
				workoutAjax();
			}
			if (type === "inbody") {
				inbodyAjax();
			}
		}

		function checkPeriod() {
			period = $(".period.active").data("target");
			if (period === "week") {
				date = 7;
			}
			if (period === "month") {
				date = 30;
			}
			if (period === "months") {
				date = 90;
			}
			if (period === "year") {
				date = 365;
			}
		}

		function dietAjax() {
			let res;
			$.ajax({
				async : false,
				url : '<c:url value="/chart/diet"/>',
				type : 'post',
				data : {
					date : date
				},
				success : function(data) {
					res = data;
				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			});
			return res;
		}

		function workoutAjax() {
			let res;
			$.ajax({
				async : false,
				url : '<c:url value="/chart/workout"/>',
				type : 'post',
				data : {
					date : date
				},
				success : function(data) {
					res = data;
				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			});
			return res;
		}

		function inbodyAjax() {
			let res;
			$.ajax({
				async : false,
				url : '<c:url value="/chart/inbody"/>',
				type : 'post',
				data : {
					date : date
				},
				success : function(data) {
					res = data;
				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			});
			return res;
		}

		function createDietChart(x, y) {
			new Chart("chart", {
				type : "bar",
				data : {
					labels : x,
					datasets : [ {
						data : y
					} ]
				},
				options : {
					legend : {
						display : false
					},
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					},

					title : {
						display : false,
						text : "World Wine Production 2018"
					}
				}
			});
		}
		
		function scoreAVG() {
			let d = [];
			console.log(data);
			for(var i in data) {
				let day;
				let score = data[i].di_score;
				let getDay = (new Date(data[i].di_date)).getDay()
				if(getDay === 1) {
					day = "월";
				} else if(getDay === 2) {
					day = "화";
				} else if(getDay === 3) {
					day = "수";
				} else if(getDay === 4) {
					day = "목";
				} else if(getDay === 5) {
					day = "금";
				} else if(getDay === 6) {
					day = "토";
				} else {
					day = "일";
				}
				d.push({score:score, day:day});
			}
			console.log(d);
			let count = 0;
			let sum = 0;
			let avg = 0;
			for(let i = 0; i < d.length - 1; i++) {
				for(let j = 1; j < d.length; j++) {
					if(d[i].day === d[j].day) {
						count++;
						sum += d[i].score;
					}
				}
			}
			avg = sum / count;
			console.log(avg);
		}
	</script>

</body>
</html>