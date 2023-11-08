<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<ul id="chatRoomList">
		<c:forEach var="ChatRoom" items="${chatRoom}">
			<li>
				<a href="#" data-mrno="${ChatRoom.mrNo}">
					<img src="/otipms/resources/images/user/1.jpg" alt=""/>
					<h3 class="clearfix">${ChatRoom.empRank} ${ChatRoom.empName}</h3>
				</a>
			</li>
		</c:forEach>
	</ul>
