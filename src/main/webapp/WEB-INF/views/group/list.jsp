<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>그룹리스트</title>
</head>
<body>
	<div>
		
	</div>
	
	<h1>그룹 리스트</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>공개여부</th>
				<th>그룹이름</th>
				<th>소개</th>
				<th>참여인원/정원</th>
				<th>개설일</th>
				<th>방장이름</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="group">
				<tr>
					<td>${group.gr_num}</td>
					<td>${group.gr_public}</td>
					<td>${group.gr_name}</td>
					<td>${group.gr_introduction}</td>
					<td>${group.gr_personnel}/${group.gr_period}</td>
					<td><fmt:formatDate value="${group.gr_start_date}" pattern="yyyy-MM-dd"/></td>
					<td>${group.gr_me_id}</td>
				</tr>
			</c:forEach>
			<c:if test="${list.size() eq 0}">
				<tr>
					<th colspan="5">아직 그룹이 없습니다.</th>
				</tr>
			</c:if>
		</tbody>
	</table>

	

</body>
</html>