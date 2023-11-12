<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<!-- Basic Page Info -->
		<meta charset="utf-8" />
		<title>채팅</title>
		<link rel="icon" type="image/jpeg" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/otipmsFavicon.png">
		<!-- CSS -->
		<link href="${pageContext.request.contextPath}/resources/css/chat/core.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/chat/style.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/chat/stylechat.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/customStyle.css" rel="stylesheet">
		
		<!-- js -->
		<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/chat/chat.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/chat/core.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/chat/process.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/chat/layout-settings.js"></script>
		
		<!-- selector -->
		<link href="${pageContext.request.contextPath}/resources/css/chat/select2.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
	</head>
	<body class="header-white sidebar-dark">
		<div class="main-container">
			<div class="pd-ltr-20 xs-pd-20-10">
				<div class="min-height-200px">
					<div class="bg-white border-radius-4 box-shadow mb-30" style="max-height:980px;">
						<div class="row no-gutters" style="max-height:980px;">
							<div class="col-lg-3 col-md-4 col-sm-12" style="max-height:980px;">
								<div class="chat-list bg-light-gray">
									<div class="chat-search">
										<span class="icon-copy fa fa-search"></span>
										<input id="searchRoom" type="text" placeholder="Search Contact" />
										<img src="${pageContext.request.contextPath}/resources/images/chatplus.png" 
											  style="width:28px;margin-left:43px;margin-top:16px;cursor:pointer"
											  type="button"
											  onclick="javascript:void(window.open('findEmployee','_blank','width=600, height=600, left=600, top=30'))"
										/>
									</div>
									<div id="chatRoomContainer" class="notification-list chat-notification-list customscroll" style="overflow-y: auto;">
									</div>
								</div>
							</div>
							<div class="col-lg-9 col-md-8 col-sm-12" style="max-height:980px;">
								<div class="chat-detail">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
