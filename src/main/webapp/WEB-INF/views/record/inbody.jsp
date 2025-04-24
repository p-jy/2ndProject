<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<!-- 선택한 날짜에 신체 기록이 없을 경우 -->
<div class="tab-content">
	<c:if test="${empty inbodyList}">
			<p>등록된 리스트가 없습니다.</p>
	</c:if>
	<c:if test="${not empty inbodyList}">
		<div id="inbody" class="container tab-pane fade">
			<br>
			<c:forEach var="inbody" items="${inbodyList}">
				<div class="form-group">
					<label for="ib_num">신체 번호 : </label> 
					<input type="text" class="form-control" id="ib_num" value="${inbody.ib_num }" readonly> 
					<label for="ib_date">신체 촬영 날짜 : </label> 
					<input type="text" class="form-control" id="ib_date" value="${inbody.ib_Date }" readonly> 
					<label for="ib_weight">몸무게 : </label> 
					<input type="text" class="form-control" id="ib_weight" value="${inbody.ib_weight }" readonly> 
					<label for="ib_smm">골격근량 : </label> 
					<input type="text" class="form-control" id="ib_smm" value="${inbody.ib_smm }" readonly>
				</div>
			</c:forEach>
		</div>
	</c:if>
		
</div>
</body>
</html>