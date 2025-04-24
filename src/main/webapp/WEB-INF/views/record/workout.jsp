<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<!-- 선택한 날짜에 운동 기록이 없을 경우 -->
 <div class="tab-content">
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
</div>
</body>
</html>