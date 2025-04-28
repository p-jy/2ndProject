<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
	<div>
		<c:if test="${empty groupList}">
			<p>등록된 그룹이 없습니다.</p>
		</c:if>
		<c:if test="${not empty groupList}">
			<div id="group" class="group-detail-wrapper container">
				<c:forEach var="group" items="${groupList}">
					<div class="group-item-wrapper">
						<div class="group-text-wrapper">
							<div class="group-group">
								<input type="text" class="group-control" value="${group.gr_name}" readonly>
							</div>
							<div class="group-group">
								<input type="text" class="group-control" value="${group.gr_introduction}" readonly>
							</div>
							<div class="diet-group">
								<input type="text" class="group-control" value="${group.gr_participant}명" readonly>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
	<div class="button-container">
		<a class="btn btn-outline-info btn-makegroup" data-toggle="modal" data-target="#createModal" onclick="openCreateGroupModal()" role="button">그룹 만들기</a>
	</div>
	<div id="createModal" class="modal fade" tabindex="-1" aria-labelledby="createModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>

	<script type="text/javascript">
		function openCreateGroupModal() {
			$('.modal-content').load("<c:url value='/group/createGroupModal'/>", function () {
		        $('#createModal').modal('show');
		    });
		}
	</script>




</body>
</html>