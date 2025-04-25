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
	position: relative;
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
		<div class="chart mt-3" style="height: 400px;">
			<canvas id="chart"></canvas>
		</div>
	</div>
<script>
  let chartInstance = null;
  let data = [];
  let period = "week";
  let type = "diet";
  let date = 7;

  const x = [];
  const y = [];

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
    if (type === 'diet') url = '<c:url value="/chart/diet"/>';
    else if (type === 'workout') url = '<c:url value="/chart/workout"/>';
    else if (type === 'inbody') url = '<c:url value="/chart/inbody"/>';

    $.ajax({
      type: 'post',
      url: url,
      data: { date: date },
      success: function (res) {
        data = res;
        callback();
        console.log(data);
      },
      error: function () {
        console.error("데이터 호출 실패");
      }
    });
  }

  function updateChart() {
    fetchData(() => {
      prepareChartData();
    });
  }

  function prepareChartData() {
    const today = new Date();
    x.length = 0;
    y.length = 0;

    let valueKey = '';
    let dateKey = '';

    if (type === 'diet') {
      valueKey = 'di_score';
      dateKey = 'di_date';
    } else if (type === 'workout') {
      valueKey = 'wo_minute';
      dateKey = 'wo_date';
    } else if (type === 'inbody') {
      valueKey = 'ib_weight';
      dateKey = 'ib_date';
    }

    if (date === 7) {
      const dayNames = ["일", "월", "화", "수", "목", "금", "토"];
      const scoreMap = {};

      for (let i = 6; i >= 0; i--) {
        const d = new Date(today);
        d.setDate(today.getDate() - i);
        const dayName = dayNames[d.getDay()];
        x.push(dayName);
        scoreMap[dayName] = [];
      }

      for (const item of data) {
        const dateVal = parseInt(item[dateKey]);
        if (isNaN(dateVal)) continue;

        const d = new Date(dateVal);
        const day = dayNames[d.getDay()];
        if (scoreMap[day] && item[valueKey] != null) {
          scoreMap[day].push(parseFloat(item[valueKey]));
        }
      }

      x.forEach(day => {
        const scores = scoreMap[day];
        const avg = scores.length > 0 ? (scores.reduce((a, b) => a + b, 0) / scores.length).toFixed(1) : 0;
        const parsedAvg = parseFloat(avg);
        y.push(isNaN(parsedAvg) ? 0 : parsedAvg);
      });

    } else {
      let groupCount = 0, groupSize = 0;
      if (date === 28) { groupCount = 4; groupSize = 7; }
      else if (date === 84) { groupCount = 3; groupSize = 28; }
      else if (date === 360) { groupCount = 6; groupSize = 60; }

      for (let i = 0; i < groupCount; i++) {
        const end = new Date(today);
        end.setDate(end.getDate() - (i * groupSize));
        const start = new Date(end);
        start.setDate(end.getDate() - groupSize + 1);

        const label = (start.getMonth() + 1) + '/' + start.getDate() + '~' + (end.getMonth() + 1) + '/' + end.getDate();
        x.unshift(label);

        const values = data.filter(d => {
          const dDate = new Date(parseInt(d[dateKey]));
          return dDate >= start && dDate <= end && d[valueKey] != null;
        }).map(d => parseFloat(d[valueKey]));

        const avg = values.length > 0 ? (values.reduce((a, b) => a + b, 0) / values.length).toFixed(1) : 0;
        const parsedAvg = parseFloat(avg);
        y.unshift(isNaN(parsedAvg) ? 0 : parsedAvg);
      }
    }

    renderChart();
  }

  function renderChart() {
    let bgColors = y.map(() => '#cce5ff');
    if (type === 'diet') {
      bgColors = y.map(score => {
        if (score <= 1) return '#ffd5d5';
        else if (score <= 2) return '#ffe5b4';
        else if (score <= 3) return '#fffac8';
        else if (score <= 4) return '#d5fdd5';
        else return '#cce5ff';
      });
    }

    let minY = 0, maxY = 0, step = 1;

    if (type === 'diet') {
      minY = 0; maxY = 5; step = 1;
    } else if (type === 'workout') {
      minY = 0; maxY = 180; step = 30;
    } else if (type === 'inbody') {
      const positiveY = y.filter(v => v > 0);
      if (positiveY.length > 0) {
        const min = Math.min(...positiveY);
        const floor = Math.floor(min / 10) * 10;
        minY = floor;
        maxY = floor + 30;
        step = 5;
      } else {
        minY = 0;
        maxY = 30;
        step = 5;
      }
    }

    if (chartInstance) chartInstance.destroy();

    let unit = '';
    if (type === 'diet') unit = '점';
    if (type === 'workout') unit = '분';
    if (type === 'inbody') unit = 'kg';

    chartInstance = new Chart(document.getElementById("chart"), {
      type: 'bar',
      data: {
        labels: x,
        datasets: [{
          data: y,
          backgroundColor: bgColors
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        tooltips: {
          callbacks: {
            label: function (tooltipItem) {
              return tooltipItem.value + unit;
            }
          }
        },
        legend: { display: false },
        scales: {
          yAxes: [{
            ticks: {
              min: minY,
              max: maxY,
              stepSize: step,
              beginAtZero: true
            }
          }]
        }
      }
    });
  }
</script>
</body>
</html>