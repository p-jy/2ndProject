<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<style type="text/css">
.group-item-wrapper {
	border: 1px solid #ccc;
	border-radius: 10px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	width: 300px;
	background: #fff;
}

.group-group {
	margin-bottom: 10px;
}

.container1 {
	min-height: 730px;
}

.titleLabel {
	border: none;
	background: transparent;
	font-weight: bold;
	font-size: 18px;
	width: 100%;
}

.introductionLabel {
	border: none;
	background: transparent;
	font-size: 14px;
	width: 100%;
}

.paricipantLabel {
	border: none;
	background: transparent;
	color: #777;
	font-size: 13px;
	width: 100%;
}
.container{
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}
.group-item-wrapper:hover {
  transform: translateY(-3px); /* 살짝 위로 뜨게 */
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15); /* 그림자 강조 */
  background-color: #f9f9f9; /* 살짝 밝은색 */
}
</style>
</head>
<body>
	<div class="container1">
		<div class="button-container mb-3 d-flex justify-content-end">
			<a class="btn btn-outline-info btn-makegroup" data-toggle="modal"
				data-target="#createModal" onclick="openCreateGroupModal()"
				role="button">그룹 생성</a>
		</div>
		<div id="createModal" class="modal fade" tabindex="-1"
			aria-labelledby="createModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content"></div>
			</div>
		</div>
		<div>
			<c:if test="${empty groupList}">
				<p>등록된 그룹이 없습니다.</p>
			</c:if>
			<c:if test="${not empty groupList}">
				<div id="group" class="group-detail-wrapper container">
					<c:forEach var="group" items="${groupList}">
						<a href="<c:url value="/group/main/${group.gr_num}"/>" style="text-decoration: none; color: inherit;">
							<div class="group-item-wrapper">
								<div class="group-text-wrapper">
									<div class="group-group">
										<div class="group-label titleLabel">${group.gr_name}</div>
									</div>
									<div class="group-group">
										<div class="group-label introductionLabel">${group.gr_introduction}</div>
									</div>
									<div class="group-group">
										<div class="group-label participantLabel">${group.gr_participant}/10명</div>
									</div>
									<div class="group-group">
										<c:forEach var="shared_record" items="${group.sharedList}">
											<div class="group-control">${shared_record.sr_mj_cate}</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>
			</c:if>
		</div>
	</div>

	<script type="text/javascript">
		function openCreateGroupModal() {
			$('.modal-content').load(
					"<c:url value='/group/createGroupModal'/>", function() {
						$('#createModal').modal('show');
					});
		}
	</script>




</body>
</html>