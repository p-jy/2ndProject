<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body id="body">

	<c:choose>
		<c:when test="${group ne null }">
			<h1>그룹 메인페이지</h1>
			<div>
				<div>
					<label class="form-label">그룹이름</label>
					<input type="text" class="form-control" value="{group.gr_name}" readonly>
				</div>
				<div class="form-group mt-3">
					<label class="form-label">소개글</label>
					<div class="form-control" id="content" style="min-height: 400px;">${group.gr_introduction}</div>
				</div>
				<div class="form-group mt-3">
					<label class="form-label">공유할 기록</label>
					<input type="text" class="form-control" value="{group.sr_gr_num}" readonly>
				</div>
				<div class="form-group mt-3">
					<label class="form-label">규칙</label>
					<input type="text" class="form-control" value="{group.rl_rule}" readonly>
				</div>
				<div class="form-group mt-3">
					<label class="form-label">시작일</label>
					<input type="text" class="form-control" value="<fmt:formatDate value="${group.gr_start_date}" pattern="yyyy-MM-dd HH:mm:ss" />" readonly>
				</div>
				<div class="form-group mt-3">
					<label class="form-label">진행 기간</label>
					<input type="text" class="form-control" value="{group.gr_period}" readonly>
				</div>
				
				<div class="form-group mt-3">
					<label class="form-label">최대정원</label>
					<input type="text" class="form-control" value="{group.gr_personnel}" readonly>
				</div>
				<div class="form-group mt-3">
					<label class="form-label">목표</label>
					<input type="text" class="form-control" value="{group.gl_num}" readonly>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<h3>삭제되었거나 존재하지 않는 그룹입니다.</h3>		
		</c:otherwise>
	</c:choose>
	<div class="d-flex justify-content-between">
		<a href='<c:url value="/"/>' class="btn">메인화면으로 돌아가기</a>
		<c:if test="${user.me_id eq group.gr_me_id}">
			<div class="btns">
				<a href='<c:url value="/"/>' class="btn">그룹설정 변경하기</a>
				<a href='<c:url value="/"/>' class="btn">그룹 삭제하기</a>
			</div>
		</c:if>
	</div>
	
</body>
</html>