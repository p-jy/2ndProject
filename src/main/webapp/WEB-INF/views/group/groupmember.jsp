<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="container my-5">
	<div class="card shadow rounded-4 p-4">
		<h2 class="mb-4 fw-bold text-primary">${group.gr_name}의 맴버</h2>
	</div>
	
	<table class="table table-hover table-primary rounded overflow-hidden">
		<thead class="table-light">
			<tr>
				<th>맴버이름</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${memberList}" var="group_member">
			<tr>
				<td>${group_member.gm_me_id}</td>
			</tr>
		</c:forEach>			
		</tbody>		
	</table>
	<div class="d-flex justify-content-between align-items-center mt-4">
		<a href='<c:url value="/group/main/${group.gr_num}"/>' class="btn btn-back btn-outline-secondary">그룹으로 돌아가기</a>		
		<c:if test="${user.me_id eq group.gr_me_id}">
			<div class="btns">
				<a href='<c:url value="/group/invitation/${group.gr_num}"/>' class="btn btn-outline-primary">맴버 초대하기</a>
			</div>
		</c:if>
	</div>
</div>
	
	
</body>
<script type="text/javascript">
	
</script>
</html>