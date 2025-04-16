<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<style type="text/css">
	.date-pill{
		border: 2px solid #f0f2f4;
		border-radius: 5px;
		padding: 3px;
	}
	.type-pill{
		background-color: #f0f2f4;
		border: 1px solid #f0f2f4;
		border-radius: 5px;
		padding: 3px;
	}
	.nav-link{
		color: #9b9b9b;
	}
	.nav-link:hover{
		color: #9b9b9b;
	}	
	.date-pill .nav-link.active, .nav-pills .show>.nav-link{
		color: #545e6f;
		font-weight: bold;
		background-color: #f0f2f4;
	}
	.type-pill .nav-link.active, .nav-pills .show>.nav-link{
		color: #545e6f;
		font-weight: bold;
		background-color: white;
	}
	.weekChart{
		width: 70%;
	}
	
</style>
</head>
<body>
	<div class="date-tab">
		<ul class="nav nav-pills date-pill nav-justified">
			<li class="nav-item">
				<a class="nav-link date week active">7일</a>
			</li>
			<li class="nav-item">
				<a class="nav-link date month">1개월</a>
    		</li>
			<li class="nav-item">
				<a class="nav-link date months">3개월</a>
			</li>
			<li class="nav-item">
				<a class="nav-link date year">1년</a>
			</li>
		</ul>
	</div>
	<div class="type-tab mt-2">
		<ul class="nav nav-pills type-pill nav-justified">
			<li class="nav-item">
				<a class="nav-link type diet active">식단</a>
			</li>
			<li class="nav-item">
				<a class="nav-link type workout">운동</a>
    		</li>
			<li class="nav-item">
				<a class="nav-link type inbody">신체</a>
			</li>
		</ul>
	</div>
	
	<div class="chart-container">
		<canvas id="chart"></canvas>
	</div>
	
	<script type="text/javascript">
		const $date = $('.date');
		const $type = $('.type');
		
		$date.click(function() {
			$(this).addClass('active');
			$date.not(this).removeClass('active');
		});
		$type.click(function() {
			$(this).addClass('active');
			$type.not(this).removeClass('active');
		})
	</script>
	
	<script>
		
	</script>
</body>
</html>