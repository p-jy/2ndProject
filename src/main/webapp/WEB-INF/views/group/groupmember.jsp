<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<h1>맴버리스트를 출력해봅시다.</h1>
	<table>
		<thead>
			<tr>
				<th>맴버이름</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${memberList}" var="group">
		
		</c:forEach>
			<tr>
				<td>${group_member.gm_me_id}</td>
			</tr>
		</tbody>
		
	</table>
	<div class="d-flex justify-content-between">
		<a href='<c:url value="/"/>' class="btn">메인화면으로 돌아가기</a>		
	</div>
</body>
</html>