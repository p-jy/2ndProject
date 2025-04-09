<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>그룹리스트</title>
</head>
<body>
	<div class="title justify-content-center mb-3">
		<h1>그룹 리스트</h1>
	</div>
	<table class="table table-hover table-primary">
		<thead>
			<tr>
				<th>그룹이름</th>
				<th>소개</th>
				<th>인원</th>
				<th>시작일</th>
				<th>방장이름</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${groupList}" var="group">
				<tr>
					<td>${group.gr_num}</td>
					<td>
						<a href='<c:url value="/group/main/${group.gr_num}"/>'>${group.gr_name}</a>
					</td>
					<td>${group.gr_introduction}</td>
					<td>${group.gr_participant}/${group.gr_personnel}</td>
					<td><fmt:formatDate value="${group.gr_start_date}" pattern="yyyy-MM-dd"/></td>
					<td>${group.gr_me_id}</td>
				</tr>
			</c:forEach>
			<c:if test="${groupList.size() eq 0 }">
				<tr>
					<th colspan="5" class="text-center">아직 그룹이 없습니다.</th>
				</tr>
			</c:if>
		</tbody>
	</table>
	
	<!-- 
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
	 -->
	
	
	<a href='<c:url value="/group/make"/>' class="btn btn-outline-info btn-makegroup">그룹 만들기</a>
	
	
	<script type="text/javascript">
		$(".btn-makegroup").click(function(e){
			//로그인 했다면 만들기 페이지로 입장
			if(${user != null}){
				return;
			}
			e.preventDefault();
			//로그인 안했다면 로그인 페이지로 이동
			if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하겠습니까?")){
				location.href="<c:url value="/login"/>";
			}
		})
	</script>
	 
	
	

</body>
</html>