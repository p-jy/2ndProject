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
.inbody-detail-wrapper {
  display: flex;
  align-items: flex-start;
  gap: 20px;
  margin-top: 20px;
}

.inbody-image {
  width: 200px;
  height: 200px;
  object-fit: cover;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.inbody-text-info {
  display: flex;
  flex-direction: column;
  gap: 8px;
  flex: 1;
}

.form-group {
  display: flex;
  flex-wrap:wrap;
  gap: 10px;
  align-items: center;
  padding:0px;
}

.form-group label {
  font-weight: bold;
  width: 110px;
}

.form-control {
  padding: 6px;
  font-size: 14px;
  border: 1px solid #ddd;
  border-radius: 4px;
  background-color: #f9f9f9;
  width: 230px;
  box-sizing: border-box;
  display: inline-block;
}

.inbody-item-wrapper {
  display: flex;
  gap: 20px;
  align-items: flex-start;
  width: 100%;
}

.inbody-image-wrapper {
  flex: 1; /* 이미지 영역의 flex 비율 */
}

.inbody-text-wrapper {
  flex: 2; /* 텍스트 영역의 flex 비율 */
}
</style>

</head>
<body>
	<div>
		<!-- 선택한 날짜에 식단 기록이 없을 경우 -->
		<c:if test="${empty inbodyList}">
			<p>등록된 리스트가 없습니다.</p>
		</c:if>
		<c:if test="${not empty inbodyList}">
			<div id="inbody" class="inbody-detail-wrapper container tab-pane active">
				<br>
				<c:forEach var="inbody" items="${inbodyList}">
					<div class="inbody-item-wrapper">
					<div class="inbody-image-wrapper">
						<img class="inbody-image" src="<c:url value="/imgs/${inbody.ip_name }"/>" alt="식단 이미지" onerror="this.onerror=null; this.src='/images/no-image.png';">
					</div>
					<div class="inbody-text-wrapper">
						<div class="form-group">
							<label>식단 이름 : </label> 
							<input type="text" class="form-control" value="${inbody.di_name }" readonly>
						</div> 
						<div class="form-group">
							<label>식단점수(1~5) : </label>
							<input type="text" class="form-control" value="${inbody.di_score }" readonly>
						</div> 
						<div class="form-group">
							<label>식단한 날짜	: </label>
							<input type="text" class="form-control" value="<fmt:formatDate value='${inbody.di_date}' pattern='yyyy-MM-dd' />" readonly>
						</div>
						<div class="form-group">
							<label>오전/오후 : </label> 
							<input type="text" class="form-control" value="${inbody.di_ampm }" readonly>
						</div> 
						<div class="form-group">
							<label>식단한 시간 : </label> 
							<input type="text" class="form-control" value="${inbody.di_time }" readonly>
						</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</body>
</html>