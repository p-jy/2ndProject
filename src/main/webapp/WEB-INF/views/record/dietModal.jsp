<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<style type="text/css">

.close {
	width: 8px;
}
.cancelBtn{
	width: 70px;
}
.insertBtn {
	width: 150px;
}
.radio-group {
	display: block;
	align-items: center;
	flex-wrap: wrap;
	gap: 10px;
}

.radio-group .form-label{
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
}

.form-label {
	margin-right: 10px;
	font-weight: bold;
	min-width: 80px;
}

.radio-option {
	display: flex;
	align-items: center;
	gap: 4px;
}

.radio-options{
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
}

.form{
	padding: 20px;
}

</style>
</head>
<body>
	<div class="modal-header">
		<h5 class="modal-title" id="insertModalLabel">식단 등록하기</h5>
		<button type="button" class="close mr-2" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">X</span>
		</button>
	</div>
	<div class="modal-body">
		<form class="form" method="post" action="/spring/record/dietModal" enctype="multipart/form-data">
			<div class="containers">
				<div class="f-container mb-3">
					<label for="file" class="form-label">이미지</label>
					<input type="file" class="form-control" name="file" />
				</div>
				<div class="f-container mb-3">
					<label for="di_name" class="form-label">음식명</label>
					<input type="text" class="form-control" name="di_name" id="di_name" placeholder="음식명을 입력하세요." required>
				</div>
				<%-- <div class="f-container mb-3">
					<div class="radio-group">
						<label class="form-label">분류</label>
						<div class="radio-options">
							<c:forEach var="sub" items="${mealtimeList}">
								<label class="radio-option d-flex">
									<input type="radio" name="option[분류]" id="sc_${sub.sc_num}" value="${sub.sc_name}">${sub.sc_name}
								</label>
							</c:forEach>
						</div>
					</div>
				</div> --%>
				<div class="f-container mb-3">
					<label for="di_date" class="form-label">날짜</label>
					<input type="text" class="form-control" name="di_date" id="di_date" required>
				</div>
				<!-- 식단 점수 -->
				<div class="f-container mb-3">
					<div class="radio-group">
						<label class="form-label">점수</label>
						<div class="radio-options">
							<c:forEach var="i" begin="1" end="5">
								<label class="radio-option">
									<input type="radio" name="di_score" id="score${i}" value="${i}" required>${i}점
								</label>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 오전/오후 -->
				<div class="f-container">
					<div class="radio-group">
						<label class="form-label">오전/오후</label>
						<div class="radio-options">
							<label class="radio-option">
								<input type="radio" name="di_ampm" id="am" value="오전" required> 오전
							</label>
							<label class="radio-option">
								<input type="radio" name="di_ampm" id="pm" value="오후"> 오후
							</label>
						</div>
					</div>
				</div>
				<div class="f-container mb-3">
					<label for="di_time" class="form-label">시간</label>
					<input type="text" class="form-control" name="di_time" id="di_time" required>
				</div>
				<div class="d-flex justify-content-center">
					<button type="submit" class="btn btn-outline-secondary btn-block insertBtn">등록하기</button>
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-danger cancelBtn" data-dismiss="modal">취소</button>
	</div>
	<script type="text/javascript">
		$(function() {
			$("#di_date").datepicker({
				dateFormat : 'yy-mm-dd', // 달력 날짜 형태
				showOtherMonths : true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
				showMonthAfterYear : true, // 년도 - 월 순서
				changeYear : true, // 년 선택 가능 옵션
				changeMonth : true
			// 월 선택 가능 옵션
			});
			$('#di_date').datepicker('setDate', 'today'); //초기값을 오늘 날짜로 설정
		});
		
		
	</script>
</body>
</html>