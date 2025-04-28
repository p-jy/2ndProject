<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<style>
.workout-detail-wrapper {
  display: flex;
  align-items: flex-start;
  gap: 20px;
  margin-top: 20px;
}

.workout-image {
  width: 100px;
  height: auto;
  object-fit: cover;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.workout-text-info {
  display: flex;
  flex-direction: column;
  gap: 8px;
  flex: 1;
}

.workout-group {
  display: flex;
  gap: 10px;
  align-items: center;
  padding:0px;
}

.workout-group label {
  font-weight: bold;
  width: 110px;
}

.workout-control {
  padding: 6px;
  font-size: 14px;
  border: 1px solid #ddd;
  border-radius: 4px;
  background-color: #f9f9f9;
  width: 230px;
  box-sizing: border-box;
  display: inline-block;
}

.workout-item-wrapper {
  display: flex;
  gap: 20px;
  align-items: flex-start;
  width: 100%;
}

.workout-image-wrapper {
  flex: 1; /* 이미지 영역의 flex 비율 */
}

.workout-text-wrapper {
  flex: 2; /* 텍스트 영역의 flex 비율 */
}

.tab-content{
	overflow-x: auto;
}
</style>

</head>
<body>
	<div>
		<!-- 선택한 날짜에 식단 기록이 없을 경우 -->
		<c:if test="${empty workoutList}">
			<br>
			<p>등록된 운동 기록이 없습니다.</p>
		</c:if>
		<c:if test="${not empty workoutList}">
			<div id="workout" class="workout-detail-wrapper container tab-pane active">
				<br>
				<c:forEach var="workout" items="${workoutList}">
					<div class="workout-item-wrapper">
					<div class="workout-image-wrapper">
						<img class="workout-image" src="<c:url value="/imgs/${workout.wp_name }"/>" alt="운동 이미지" onerror="this.onerror=null; this.src='/images/no-image.png';">
					</div>
					<div class="workout-text-wrapper">
						<div class="workout-group">
							<label>운동 이름 : </label> 
							<input type="text" class="workout-control" value="${workout.wo_title }" readonly>
						</div>
						<div class="workout-group">
							<label>운동한 날짜	: </label>
							<input type="text" class="workout-control" value="<fmt:formatDate value='${workout.wo_date}' pattern='yyyy-MM-dd' />" readonly>
						</div>
						<div class="workout-group">
							<label>오전/오후 : </label> 
							<input type="text" class="workout-control" value="${workout.wo_ampm }" readonly>
						</div> 
						<div class="workout-group">
							<label>운동한 시간 : </label> 
							<input type="text" class="workout-control" value="${workout.wo_time }" readonly>
						</div>
						<div class="workout-group">
							<label>지속 시간 : </label> 
							<input type="text" class="workout-control" value="${workout.wo_minute }" readonly>
						</div>
						<div class="workout-group">
							<label>메모 : </label> 
							<input type="text" class="workout-control" value="${workout.wo_text }" readonly>
						</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</body>
</html>