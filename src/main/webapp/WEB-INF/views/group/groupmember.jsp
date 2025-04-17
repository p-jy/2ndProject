<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<div class="title justify-content-center mb-3">
		<h1>그룹 ${group.gr_name} 맴버</h1>
	</div>
	
	<table class="table table-hover table-primary">
		<thead>
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
	<div class="d-flex justify-content-between">
		<a href='<c:url value="/group/main/${group.gr_num}"/>' class="btn btn-back">그룹으로 돌아가기</a>		
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>