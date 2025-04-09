<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<h1>그룹 만들기</h1>
	<form action="<c:url value="/group/make"/>">		
		<div class="form-group mt-3">
			<label for="title" class="form-label">그룹이름</label>
			<input type="text" class="form-control" id="groupName" name="gr_name">
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
			<label class="form-label">공개 여부</label>
			<input type="radio"  id="public_y" name="gr_public" checked>Y
			<input type="radio"  id="public_n" name="gr_public">N
		</div>
		<button type="submit" class="btn btn-outline-info mt-3 col-12 content-center">그룹 만들기</button>
	</form>
</body>
</html>