<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<style type="text/css">
	.nav-pills{
		border: 2px solid #f0f2f4;
		border-radius: 5px;
		padding: 3px;
	}
	.nav-link{
		color: #9b9b9b;
	}
	.nav-link:hover{
		color: #9b9b9b;
	}	
	.nav-pills .nav-link.active, .nav-pills .show>.nav-link{
		color: #545e6f;
		font-weight: bold;
		background-color: #f0f2f4;
	}
	.weekChart{
		width: 70%;
	}
	
</style>
</head>
<body>
	<div class="period-tab">
		<ul class="nav nav-pills nav-justified">
			<li class="nav-item">
				<a class="nav-link period week active" data-target="week">7일</a>
			</li>
			<li class="nav-item">
				<a class="nav-link period month" data-target="month">1개월</a>
    		</li>
			<li class="nav-item">
				<a class="nav-link period months" data-target="months">3개월</a>
			</li>
			<li class="nav-item">
				<a class="nav-link period year" data-target="year">1년</a>
			</li>
		</ul>
	</div>
	<div class="type-tab mt-2">
		<ul class="nav nav-pills nav-justified">
			<li class="nav-item">
				<a class="nav-link diet active" onclick="diet()">식단</a>
			</li>
			<li class="nav-item">
				<a class="nav-link workout" onclick="workout()">운동</a>
    		</li>
			<li class="nav-item">
				<a class="nav-link inbody" onclick="inbody()">신체</a>
			</li>
		</ul>
	</div>
	
	<div class="chart-container">
		<canvas id="chart"></canvas>
	</div>
	
	<script type="text/javascript">
		const $period = $('.period');
		const $type = $('.type');
		let period = $(".period.active").data("target");
		let date;
		
		$period.click(function() {
			$(this).addClass('active');
			$period.not(this).removeClass('active');
		});
		$type.click(function() {
			$(this).addClass('active');
			$type.not(this).removeClass('active');
		})
		
		if(period === "week") {
			date = 7;
		} else if(period === "month") {
			date = 30;
		} else if(period === "months") {
			date = 90;
		} else {
			date = 365;
		}
		
		function diet(){
			alert($(".period.active").data("target"));
			
			$.ajax({
				async : false, 
				url : '<c:url value="/chart/diet"/>', 
				type : 'post', 
				data : { date : date }, 
				success : function (data){
					console.log(data);
				}, 
				error : function(jqXHR, textStatus, errorThrown){
	
				}
			});
		}
		function workout() {
			
			
		}
		function inbody() {
			
			
		}
	</script>
	
</body>
</html>