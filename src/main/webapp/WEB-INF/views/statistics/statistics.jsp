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
.chart-container {
	display: flex;
	
}
</style>
</head>
<body>
	<div class="period-tab">
		<ul class="nav nav-pills nav-justified">
			<li class="nav-item"><a class="nav-link period week active"
				data-target="week">7일</a></li>
			<li class="nav-item"><a class="nav-link period month"
				data-target="month">1개월</a></li>
			<li class="nav-item"><a class="nav-link period months"
				data-target="months">3개월</a></li>
			<li class="nav-item"><a class="nav-link period year"
				data-target="year">1년</a></li>
		</ul>
	</div>
	<div class="type-tab mt-2">
		<ul class="nav nav-pills nav-justified">
			<li class="nav-item"><a class="nav-link type diet active"
				data-target="diet">식단</a></li>
			<li class="nav-item"><a class="nav-link type workout"
				data-target="workout">운동</a></li>
			<li class="nav-item"><a class="nav-link type inbody"
				data-target="inbody">신체</a></li>
		</ul>
	</div>

	<div class="chart-container justify-content-center">
		<div class="chart mt-3">
			<canvas id="chart"></canvas>
		</div>
	</div>
	<script type="text/javascript">
		let chartInstance = null;
		let data = [];
		let period = "week";
		let type = "diet";
		let date = 7;
	
		const x = [];
		const y = [];
		const datasets = [];
	
		$(document).ready(function () {
			setDateByPeriod();
			updateChart();
		});
	
		$('.period').click(function () {
			$('.period').removeClass('active');
			$(this).addClass('active');
			period = $(this).data('target');
			setDateByPeriod();
			updateChart();
		});
	
		$('.type').click(function () {
			$('.type').removeClass('active');
			$(this).addClass('active');
			type = $(this).data('target');
			updateChart();
		});
	
		function setDateByPeriod() {
			switch (period) {
				case 'week': date = 7; break;
				case 'month': date = 28; break;
				case 'months': date = 84; break;
				case 'year': date = 360; break;
			}
		}
	
		function fetchData(callback) {
			let url = '';
			if (type === 'diet') {
				url = '<c:url value="/chart/diet"/>';
			}
			if (type === 'workout') {
				url = '<c:url value="/chart/workout"/>';
			}
			if (type === 'inbody') {
				url = '<c:url value="/chart/inbody"/>';
			}
	
			$.ajax({
				type: 'post',
				url: url,
				data: { date: date },
				success: function (res) {
					data = res;
					callback();
				},
				error: function () {
					console.error("데이터 호출 실패");
				}
			});
		}
	
		function updateChart() {
			fetchData(() => {
				scoreAVG();
			});
		}
	
		function createDietChart(x, y) {
			let bgColors = [];
	
			if (type === 'diet') {
				y.forEach(score => {
					if (score <= 1) bgColors.push('#ffd5d5');
					else if (score <= 2) bgColors.push('#ffe5b4');
					else if (score <= 3) bgColors.push('#fffac8');
					else if (score <= 4) bgColors.push('#d5fdd5');
					else bgColors.push('#cce5ff');
				});
			} else {
				bgColors = Array(y.length).fill('#cce5ff');
			}
	
			if (chartInstance) chartInstance.destroy();
	
			chartInstance = new Chart("chart", {
				type: "bar",
				data: {
					labels: x,
					datasets: [{
						data: y,
						backgroundColor: bgColors
					}]
				},
				options: {
					legend: { display: false },
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true,
								max: type === 'diet' ? 5 : undefined,
								stepSize: type === 'diet' ? 1 : undefined
							}
						}]
					}
				}
			});
		}
	
		function createGroupedChart(x, datasets) {
			if (chartInstance) chartInstance.destroy();
	
			chartInstance = new Chart("chart", {
				type: "bar",
				data: {
					labels: x,
					datasets: datasets
				},
				options: {
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true,
								max: type === 'diet' ? 5 : undefined,
								stepSize: type === 'diet' ? 1 : undefined
							}
						}]
					},
					legend: {
						display: true
					}
				}
			});
		}
	
		function scoreAVG() {
			const today = new Date();
			x.length = 0;
			y.length = 0;
			datasets.length = 0;
	
			let valueKey = 'di_score';
			if (type === 'workout') valueKey = 'wo_minute';
			if (type === 'inbody') valueKey = 'ib_weight';
	
			if (date === 7) {
				const dayNames = ["일", "월", "화", "수", "목", "금", "토"];
				const scoresMap = {};
	
				for (let i = 6; i >= 0; i--) {
					const d = new Date(today);
					d.setDate(d.getDate() - i);
					const dayName = dayNames[d.getDay()];
					x.push(dayName);
					scoresMap[dayName] = [];
				}
	
				for (let i = 0; i < data.length; i++) {
					const entry = data[i];
					const d = new Date(parseInt(entry.di_date));
					const dayName = dayNames[d.getDay()];
					if (scoresMap[dayName] && entry[valueKey] != null) {
						scoresMap[dayName].push(entry[valueKey]);
					}
				}
	
				x.forEach(day => {
					const arr = scoresMap[day];
					const avg = arr.length > 0
						? (arr.reduce((a, b) => a + b, 0) / arr.length).toFixed(1)
						: 0;
					y.push(parseFloat(avg));
				});
	
				createDietChart(x, y);
				return;
			}
	
			let groupCount = 1, subgroupSize = 7;
			if (date === 28) { groupCount = 4; subgroupSize = 7; }
			else if (date === 84) { groupCount = 3; subgroupSize = 28; }
			else if (date === 360) { groupCount = 4; subgroupSize = 90; }
	
			for (let g = 0; g < groupCount; g++) {
				const groupEnd = new Date(today);
				groupEnd.setDate(today.getDate() - (g * subgroupSize));
	
				const groupStart = new Date(groupEnd);
				groupStart.setDate(groupEnd.getDate() - subgroupSize + 1);
	
				const label =
					((groupStart.getMonth() + 1) + '/' + (groupStart.getDate())) +
					'~' +
					((groupEnd.getMonth() + 1) + '/' + (groupEnd.getDate()));
				x.unshift(label);
				
				const subGroupCount = (date === 84) ? 4 : (date === 360 ? 3 : 1);
				const subSize = subgroupSize / subGroupCount;
				const yGroup = [];
	
				for (let s = 0; s < subGroupCount; s++) {
					const subStart = new Date(groupStart);
					subStart.setDate(subStart.getDate() + (s * subSize));
					const subEnd = new Date(subStart);
					subEnd.setDate(subEnd.getDate() + subSize - 1);
	
					const subValues = data.filter(d => {
						const dDate = new Date(parseInt(d.di_date));
						return dDate >= subStart && dDate <= subEnd && d[valueKey] != null;
					}).map(d => d[valueKey]);
	
					const avg = subValues.length > 0
						? (subValues.reduce((a, b) => a + b, 0) / subValues.length).toFixed(1)
						: 0;
	
					yGroup.push(parseFloat(avg));
				}
	
				y.unshift(yGroup);
			}
	
			if (type === 'diet') {
				const scoreRanges = [
					{ min: 0, max: 1, label: '1점', color: '#ffd5d5' },
					{ min: 1, max: 2, label: '2점', color: '#ffe5b4' },
					{ min: 2, max: 3, label: '3점', color: '#fffac8' },
					{ min: 3, max: 4, label: '4점', color: '#d5fdd5' },
					{ min: 4, max: 5.1, label: '5점', color: '#cce5ff' }
				];
	
				const groupedData = y.map(group => {
					const counts = [0, 0, 0, 0, 0];
					group.forEach(score => {
						score = parseFloat(score);
						for (let i = 0; i < scoreRanges.length; i++) {
							if (score > scoreRanges[i].min && score <= scoreRanges[i].max) {
								counts[i]++;
								break;
							}
						}
					});
					return counts;
				});
	
				for (let i = 0; i < scoreRanges.length; i++) {
					datasets.push({
						label: scoreRanges[i].label,
						data: groupedData.map(group => group[i]),
						backgroundColor: scoreRanges[i].color
					});
				}
	
				createGroupedChart(x, datasets);
				return;
			}
	
			const barCount = y[0].length;
			for (let i = 0; i < barCount; i++) {
				datasets.push({
					label: `${i + 1}번째`,
					data: y.map(group => group[i]),
					backgroundColor: '#cce5ff'
				});
			}
	
			createGroupedChart(x, datasets);
		}
	</script>
	
</body>
</html>