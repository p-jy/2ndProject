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
	
	<h1 class="justify-content-center">그룹 리스트</h1>
	<table class="table table-hover table-primary">
		<thead>
			<tr>
				<th>번호</th>
				<th>그룹이름</th>
				<th>소개</th>
				<th>인원</th>
				<th>시작일</th>
				<th>방장이름</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="group">
				<tr>
					<td>${group.gr_num}</td>
					<td>
						<a href='<c:url value="/group/main/${group.gr_num}"/>'>${group.gr_name}</a>
					</td>
					<td>${group.gr_introduction}</td>
					<td>${group.gr_personnel}</td>
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
	
	<ul class="pagination justify-content-center">	
		<li class="page-item">
	  		<a class="page-link" href="${url}">이전</a>
	  	</li>
	
		<li class="page-item">
			<a class="page-link" href="${url}">1</a>
		</li>
	  
		<li class="page-item">
			<a class="page-link" href="${url}">다음</a>
		</li>
	  
	</ul>
	
	<a href='<c:url value="/group/make"/>' class="btn btn-outline-info btn-insert">그룹 만들기</a>
	
	

</body>
</html>