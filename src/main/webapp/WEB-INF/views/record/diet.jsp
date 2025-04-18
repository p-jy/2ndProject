<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="tab-content">
		<!-- 선택한 날짜에 식단 기록이 없을 경우 -->
		<c:if test="${empty dietList}">
			<p>등록된 리스트가 없습니다.</p>
		</c:if>
		<c:if test="${not empty dietList}">
			<div id="diet" class="container tab-pane active">
				<br>
				<c:forEach var="diet" items="${dietList}">
					<div class="form-group">
						<label>식단 이름 : </label> 
						<input type="text" class="form-control" value="${diet.di_name }" readonly> 
						<label>식단점수(1~5) : </label>
						<input type="text" class="form-control" value="${diet.di_score }" readonly> 
						<label>식단한 날짜	: </label>
						<input type="text" class="form-control" value="${diet.di_date }" readonly>
						<label>오전/오후 : </label> 
						<input type="text" class="form-control" value="${diet.di_ampm }" readonly> 
						<label>식단한 시간 : </label> 
						<input type="text" class="form-control" value="${diet.di_time }" readonly>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</body>
</html>