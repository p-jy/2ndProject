<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.js"></script>
<style type="text/css">

</style>
</head>
<body>
	<h1>그룹 수정</h1>
	<form action="<c:url value="/group/make"/>" method="post">		
		<div class="form-group mt-3">
			<label for="title" class="form-label">그룹이름</label>
			<input type="text" class="form-control" id="groupName" name="gr_name">
		</div>
		
		<div class="form-group mt-3">
			<label for="pw" class="form-label">비밀번호(최대 4자리)</label>
			<input type="password" class="form-control" id="groupPw" name="gr_pw">
		</div>
		<div class="form-group mt-3">
			<label for="pw2" class="form-label">비밀번호 확인(최대 4자리)</label>
			<input type="password" class="form-control" id="groupPw2" name="gr_pw2">
		</div>
		
		<div class="form-group mt-3">
			<label class="form-label">소개글</label>
			<textarea class="form-control" id="intro" name="gr_introduction" rows="10"></textarea>
		</div>
		<div class="form-group mt-3">
			<label class="form-label">공유할 기록</label>
			<input type="text" class="form-control" id="recode" name="sr_gr_num">
		</div>
		<div class="form-group mt-3">
			<label class="form-label">규칙</label>
			<input type="text" class="form-control" id="rule" name="rl_rule">
		</div>
		<div class="form-group mt-3">
			<label class="form-label">시작일</label>
			<input type="text" class="form-control" id="startdate" name="gr_start_date">
		</div>
		<div class="form-group mt-3">
			<label class="form-label">진행 기간</label>
			<input type="text" class="form-control" id="period" name="gr_period">
		</div>
		
		<div class="form-group mt-3">
			<label class="form-label">최대정원</label>
			<input type="text" class="form-control" id="person" name="gr_personnel">
		</div>
		<div class="form-group mt-3">
			<label class="form-label">목표</label>
			<input type="text" class="form-control" id="goal" name="gg_gr_num">
		</div>
		<div class="form-group mt-3">
			<label class="form-label">공개 여부(Y,N)을 입력하세요.</label>
			<label class="form-label">Y => 공개, N => 비공개</label>
			<input type="text" class="form-control" id="public" name="gr_public">
			<!--
			<input type="radio"  id="public_y" name="gr_public" checked>Y
			<input type="radio"  id="public_n" name="gr_public">N
			 -->
			
		</div>
		<button type="submit" class="btn btn-outline-info mt-3 col-12 content-center">그룹 수정하기</button>
	</form>
	<script type="text/javascript">
		
	</script>
</body>
</html>