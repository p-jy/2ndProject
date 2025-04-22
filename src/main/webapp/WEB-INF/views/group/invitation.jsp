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
		<h1>초대하기</h1>
	</div>
	<form action="<c:url value='/group/invitation/${group.gr_num}' />" method="post" class="mt-3">
	    <label for="inviteId">초대할 사용자 ID</label>
	    <input type="text" class="form-control" name="inviteId" required />
	    <button type="submit" class="btn btn-primary mt-2">초대하기</button>
	</form>
	<div class="d-flex justify-content-between">
		<a href='<c:url value="/group/groupmember/${group.gr_num}"/>' class="btn btn-back">이전화면으로 돌아가기</a>
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>