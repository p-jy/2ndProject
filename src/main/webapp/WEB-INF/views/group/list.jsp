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
			<div id="group" class="group-detail-wrapper container" style="display: flex; flex-wrap: wrap; gap: 20px;">
				<c:forEach var="group" items="${groupList}">
					<div class="group-item-wrapper" style="border: 1px solid #ccc; border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); padding: 20px; width: 300px; background: #fff;">
						<div class="group-text-wrapper">
							<div class="group-group" style="margin-bottom: 10px;">
								<input type="text" class="group-control" value="${group.gr_name}" readonly style="border: none; background: transparent; font-weight: bold; font-size: 18px; width: 100%;">
							</div>
							<div class="group-group" style="margin-bottom: 10px;">
								<input type="text" class="group-control" value="${group.gr_introduction}" readonly style="border: none; background: transparent; font-size: 14px; width: 100%;">
							</div>
					        <div class="group-group">
								<input type="text" class="group-control" value="${group.gr_participant}/10명" readonly style="border: none; background: transparent; color: #777; font-size: 13px; width: 100%;">
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