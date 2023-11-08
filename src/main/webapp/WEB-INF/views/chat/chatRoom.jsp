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

		<!-- CSS -->
		<link href="${pageContext.request.contextPath}/resources/css/chat/core.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/chat/style.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/chat/stylechat.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/customStyle.css" rel="stylesheet">
		
		<!-- js -->
		<script src="${pageContext.request.contextPath}/resources/js/chat/chat.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/chat/core.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/chat/process.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/chat/layout-settings.js"></script>
		
		<!-- selector -->
		<link href="${pageContext.request.contextPath}/resources/css/chat/select2.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
	</head>
	<body class="header-white sidebar-dark">
		<ul>
			<c:forEach var="ChatRoom" items="${chatRoom}">
				<li>
					<a href="#" data-mrno="${ChatRoom.mrNo}">
						<img src="/otipms/resources/images/user/1.jpg" alt=""/>
						<h3 class="clearfix">${ChatRoom.empRank} ${ChatRoom.empName}</h3>
					</a>
				</li>
			</c:forEach>
		</ul>
	</body>
</html>
