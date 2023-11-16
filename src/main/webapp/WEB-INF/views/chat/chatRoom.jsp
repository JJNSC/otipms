<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
	<ul id="chatRoomList">
		<c:forEach var="ChatRoom" items="${chatRoom}">
			<li id="chatRoom${ChatRoom.mrNo}" class="chatRooms">
				<a id="findRoom" href="#" data-mrno="${ChatRoom.mrNo}" style="padding-left: 52px;">
<%-- 					<c:if test="${ChatRoom.empStatus == 1}">
						<span class="activity logined"></span>
					</c:if>
					<c:if test="${ChatRoom.empStatus != 1}">
						<span class="activity logout"></span>
					</c:if> --%>
					<img src="data:${ChatRoom.mediaFile.mediaFileType};base64, ${ChatRoom.mediaFileData}" height="40" width="40" alt="">
						<c:if test="${ChatRoom.empStatus == 1}">
							<span class="activity logined"></span>
						</c:if>
						<c:if test="${ChatRoom.empStatus != 1}">
							<span class="activity logout"></span>
						</c:if>
					</img>
					<span 
						  class="chatEmp"
						  style="display:inline-block;
								 clear: both;
							     font-size: 16px;
							     color: #202342;
							     font-weight: 700;
							     text-transform: capitalize;
							     font-family: 'Inter',sans-serif;
							     padding-bottom: 5px;">
							     ${ChatRoom.empRank} ${ChatRoom.empName}
					</span>
					<span class="chatTime" style="position: absolute;right: 0px;top: 18px;">
						<c:set var="currentDate" value="<%= new java.util.Date() %>"/>
						<c:choose>
    						<c:when test="${fn:substring(ChatRoom.mrDate, 0, 9) eq fn:substring(currentDate, 0, 9)}">
				        		<fmt:formatDate value="${ChatRoom.mrDate}" pattern="HH:mm"/>
				        	</c:when>
				        	<c:otherwise>
						        <fmt:formatDate value="${ChatRoom.mrDate}" pattern="MM/dd"/>
				        	</c:otherwise>
				        </c:choose>
					</span>
					<span class="chatMessage" style="white-space: nowrap;display: block;overflow: hidden;text-overflow: ellipsis;max-width: 160px;margin-left: 18px; ">
					${ChatRoom.mrLastChat}
					</span>
				</a>
			</li>
		</c:forEach>
	</ul>
