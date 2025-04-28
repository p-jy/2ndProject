<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
	.body{
		background: repeating-linear-gradient(
	    white,
	    white 29px,
	    #f0f0f0 30px
	  );
	  font-family: 'Nanum Pen Script', cursive;
	  padding: 40px;
	}
	.body, .form-control, .btn {
	  font-size: 20px;
	}
	.form-control {
	  background-color: transparent;
	  border: none;
	  border-bottom: 1px dashed #999;
	  border-radius: 0;
	  box-shadow: none;
	  padding-left: 10px;
	}
	.card-notebook {
	  background-color: #fff8dc;
	  border: 1px solid #ddd;
	  padding: 20px;
	  border-radius: 10px;
	  box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
	  margin-bottom: 20px;
	}
</style>
</head>
<body id="body">

	<c:choose>
		<c:when test="${group ne null}">			
			<h2 class="mb-4 fw-bold text-primary">${group.gr_name}</h2>
			<div>
				<!-- 
				<div>
					<label class="form-label">그룹이름</label>
					<input type="text" class="form-control" value="${group.gr_name}" readonly>
				</div>
				 -->
				<div class="form-group mt-3">
					<label class="form-label-muted">소개글</label>
					<div class="form-control" id="content" style="min-height: 100px;">${group.gr_introduction}</div>
				</div>
				<div class="row g-3">
					<div class="col-md-6">
						<label class="form-label fw-bold">그룹장</label>
						<input type="text" class="form-control bg-light" value="${group.gr_me_id}" readonly>
					</div>
					<div class="col-md-6">
						<label class="form-label fw-bold">시작일</label>
						<input type="text" class="form-control bg-light" value="<fmt:formatDate value="${group.gr_start_date}" pattern="yyyy-MM-dd" />" readonly>
					</div>				
					
					<div class="col-md-4">
						<label class="form-label fw-bold">진행 기간</label>
						<input type="text" class="form-control bg-light" value="${group.gr_period}" readonly>
					</div>
					
					<div class="col-md-4">
						<label class="form-label fw-bold">최대정원</label>
						<input type="text" class="form-control bg-light" value="${group.gr_personnel}" readonly>
					</div>
					<div class="col-md-4">
						<label class="form-label fw-bold">목표</label>
						<input type="text" class="form-control bg-light" value="${group.gg_gl_num}" readonly>
					</div>
					
					<c:if test="${ruleList.size()>0}">
						<div class="col-12">
							<label class="form-label fw-bold">규칙</label>
							<c:forEach items="${ruleList}" var="rule">
								<input type="text" class="form-control bg-light" value="${rule.rl_rule}" readonly>
							</c:forEach>						
						</div>
					</c:if>
					<c:if test="${srList.size()>0}">
						<div class="col-12">
							<label class="form-label fw-bold">공유할 기록</label>
							<c:forEach items="${srList}" var="sharerecord">
								<input type="text" class="form-control bg-light" value="${sharerecord.majorcates.mc_name}" readonly>
							</c:forEach>							
						</div>
					</c:if>	
					
				</div>				
			</div>
			
		</c:when>
		<c:otherwise>
			<h3>삭제되었거나 존재하지 않는 그룹입니다.</h3>		
		</c:otherwise>
	</c:choose>
	<div class="mt-4 d-flex flex-wrap gap-2 justify-content-end">
		<a href='<c:url value="/"/>' class="btn btn-outline-secondary">메인화면으로 돌아가기</a>
		<a href='<c:url value="/group/groupmember/${group.gr_num}"/>' class="btn btn-insertgroup btn-outline-info">그룹맴버</a>		
		<c:if test="${user.me_id eq group.gr_me_id}">
		<a href='<c:url value="/"/>' class="btn">채팅방 입장하기</a>
			<div class="btns">
				<a href='<c:url value="/group/remake/${group.gr_num}"/>' class="btn btn-outline-warning">그룹설정 변경하기</a>
				<a href='<c:url value="/group/delete/${group.gr_num}"/>' class="btn btn-outline-danger">그룹 삭제하기</a>
			</div>
		</c:if>
		
		<c:if test="${user.me_id ne group.gr_me_id}">
		<a href='<c:url value="/"/>' class="btn btn-insertgroup btn-outline-primary">채팅방 입장하기</a>
		
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