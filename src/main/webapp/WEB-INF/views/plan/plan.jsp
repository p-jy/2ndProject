<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<style>
.plan-detail-wrapper {
  display: flex;
  align-items: flex-start;
  gap: 20px;
  margin-top: 20px;
}

.plan-image {
  width: 100px;
  height: auto;
  object-fit: cover;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.plan-text-info {
  display: flex;
  flex-direction: column;
  gap: 8px;
  flex: 1;
}

.plan-group {
  display: flex;
  gap: 10px;
  align-items: center;
  padding:0px;
  margin-bottom: 10px;
}

.plan-group label {
  font-weight: bold;
  width: 110px;
}

.plan-control {
  padding: 6px;
  font-size: 14px;
  border: 1px solid #ddd;
  border-radius: 4px;
  background-color: #f9f9f9;
  width: 230px;
  box-sizing: border-box;
  display: inline-block;
}

.plan-item-wrapper {
  display: flex;
  gap: 20px;
  align-items: flex-start;
  width: 100%;
}

.plan-image-wrapper {
  flex: 1; /* 이미지 영역의 flex 비율 */
}

.plan-text-wrapper {
  flex: 2; /* 텍스트 영역의 flex 비율 */
}

.tab-content{
	overflow-x: auto;
}
</style>

</head>
<body>
	<div>
		<c:if test="${empty planList}">
			<p>등록된 계획이 없습니다.</p>
		</c:if>
		<c:if test="${not empty planList}">
			<div id="plan" class="plan-detail-wrapper container tab-pane active">
				<br>
				<c:forEach var="plan" items="${planList}">
					<div class="plan-item-wrapper">
						<div class="plan-text-wrapper">
							<div class="plan-group">
								<label>타이틀</label>
								<input type="text" class="plan-control" value="${plan.pl_title}" readonly>
							</div>
							<div class="plan-group">
								<label>요일</label>
								<input type="text" class="plan-control" value="${plan.pl_dy_day}" readonly>
							</div>
							<div class="plan-group">
								<label>분류</label>
								<input type="text" class="plan-control" value="${plan.pl_mc_num == 1 ? '운동' : plan.pl_mc_num == 2 ? '식단' : plan.pl_mc_num == 3 ? '신체' : plan.pl_mc_num == 4 ? '생활' : ''}" readonly>
							</div>
							<div class="plan-group">
								<label>기간</label>
								<input type="text" class="plan-control" value="${plan.pl_period}일" readonly>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</body>
</html>
