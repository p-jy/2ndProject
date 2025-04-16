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
		<c:when test="${group ne null}">			
			<h1>그룹 메인페이지</h1>
			<div>
				<div>
					<label class="form-label">그룹이름</label>
					<input type="text" class="form-control" value="${group.gr_name}" readonly>
				</div>
				<div>
					<label class="form-label">그룹장</label>
					<input type="text" class="form-control" value="${group.gr_me_id}" readonly>
				</div>
				<div class="form-group mt-3">
					<label class="form-label">소개글</label>
					<div class="form-control" id="content" style="min-height: 400px;">${group.gr_introduction}</div>
				</div>
				<div class="form-group mt-3">
					<label class="form-label">공유할 기록</label>
					<input type="text" class="form-control" value="${group.sr_gr_num}" readonly>
				</div>
				<div class="form-group mt-3">
					<label class="form-label">규칙</label>
					<input type="text" class="form-control" value="${group.rl_rule}" readonly>
				</div>
				<div class="form-group mt-3">
					<label class="form-label">시작일</label>
					<input type="text" class="form-control" value="<fmt:formatDate value="${group.gr_start_date}" pattern="yyyy-MM-dd" />" readonly>
				</div>
				<div class="form-group mt-3">
					<label class="form-label">진행 기간</label>
					<input type="text" class="form-control" value="${group.gr_period}" readonly>
				</div>
				
				<div class="form-group mt-3">
					<label class="form-label">최대정원</label>
					<input type="text" class="form-control" value="${group.gr_personnel}" readonly>
				</div>
				<div class="form-group mt-3">
					<label class="form-label">목표</label>
					<input type="text" class="form-control" value="${group.gg_gl_num}" readonly>
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
		<a href='<c:url value="/"/>' class="btn">채팅방 입장하기</a>
			<div class="btns">
				<a href='<c:url value="/group/remake/${group.gr_num}"/>' class="btn">그룹설정 변경하기</a>
				<a href='<c:url value="/group/delete/${group.gr_num}"/>' class="btn">그룹 삭제하기</a>
				<a href='<c:url value="/"/>' class="btn">맴버 초대하기</a>
				<a href='<c:url value="/"/>' class="btn">맴버 초대받기</a>
			</div>
		</c:if>
		<c:if test="${user.me_id ne group.gr_me_id}">
		<a href='<c:url value="/"/>' class="btn btn-insertgroup">채팅방 입장하기</a>
			<div class="btns">
				<a href='<c:url value="/"/>' class="btn btn-insertgroup">가입신청하기</a>
			</div>
		</c:if>
	</div>
	
	<script type="text/javascript">
		$(".btn-insertgroup").click(function(e){
			//로그인 했다면 가입 페이지또는 채팅방 입장
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