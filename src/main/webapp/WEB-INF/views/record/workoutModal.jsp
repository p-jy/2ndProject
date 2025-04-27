<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
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
		display: flex;
		align-items: center;
		flex-wrap: wrap;
		gap: 10px;
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
	
	.form{
		padding: 20px;
	}
</style>
</head>
<body>
	<div class="modal-header">
		<h5 class="modal-title" id="insertModalLabel">운동 등록하기</h5>
		<button type="button" class="close mr-2" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">X</span>
		</button>
	</div>
	<div class="modal-body">
		<form class="form" method="post" action="/spring/record/workoutModal" enctype="multipart/form-data">
			<div class="containers">
				<div class="f-container mb-3">
					<label for="file" class="form-label">이미지</label>
					<input type="file" class="form-control" name="file" />
				</div>
				<div class="f-container mb-3">
					<label for="wo_title" class="form-label">타이틀</label>
					<input type="text" class="form-control" name="wo_title" id="wo_title" placeholder="타이틀을 입력해주세요." required>
				</div>
				<div class="f-container mb-3">
					<label for="wo_date" class="form-label">날짜</label>
					<input type="text" class="form-control" name="wo_date" id="wo_date" required>
				</div>
				<div class="f-container">
					<div class="radio-group">
						<label class="form-label">오전/오후</label>
						<label class="radio-option">
							<input type="radio" name="wo_ampm" id="am" value="오전" required> 오전
						</label>
						<label class="radio-option">
							<input type="radio" name="wo_ampm" id="pm" value="오후"> 오후
						</label>
					</div>
				</div>
				<div class="f-container mb-3">
					<label for="wo_time" class="form-label">시작 시간</label>
					<input type="text" class="form-control" name="wo_time" id="wo_time" required>
				</div>
				<div class="f-container mb-3">
					<label for="wo_minute" class="form-label">운동 시간(분)</label>
					<input type="text" class="form-control" name="wo_minute" id="wo_minute" required>
				</div>
				<div class="f-container mb-3">
					<label for="wo_memo" class="form-label">메모</label>
					<input type="text" class="form-control" name="wo_memo" id="wo_memo">
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
	<script>
	  $(function() {
	    $( "#wo_date" ).datepicker({
	    	dateFormat: 'yy-mm-dd', // 달력 날짜 형태
	    	showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	    	showMonthAfterYear: true, // 년도 - 월 순서
	    	changeYear: true, // 년 선택 가능 옵션
	    	changeMonth: true // 월 선택 가능 옵션
	    });
	    $('#wo_date').datepicker('setDate', 'today'); //초기값을 오늘 날짜로 설정
	  });
	</script>
</body>
</html>