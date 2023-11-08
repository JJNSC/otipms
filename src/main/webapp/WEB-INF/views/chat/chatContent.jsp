<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<div class="chat-profile-header clearfix">
			<div class="left">
				<div class="clearfix">
					<div class="chat-profile-photo">
						<img src="/otipms/resources/images/user/1.jpg" alt="" />
					</div>
					<div class="chat-profile-name">
						<h3>${chatRoomEmp.empRank} ${chatRoomEmp.empName}</h3>
					</div>
				</div>
			</div>
			<input type="hidden" value="${employee.empId}" id="empId"/>
			<input type="hidden" value="${mrNo}" id="mrNo"/>
			<div class="right text-right" style="padding-top: 15px;">
				<a href="#" class="btn btn-primary btn-block" style="width:150px;">채팅방 나가기</a>
			</div>
		</div>
		<div class="chat-box">
			<div class="chat-desc customscroll" style="overflow-y: auto;">
				<ul id="chatList">
					<c:forEach var="ChatContent" items="${chatContent}">
						<c:choose>
							<c:when test="${employee.empId == ChatContent.empId}">
								<li class="clearfix admin_chat">
							</c:when>
							<c:when test="${employee.empId != ChatContent.empId}">
								<li class="clearfix">
							</c:when>
						</c:choose>
							<span class="chat-img">
								<img src="/otipms/resources/images/defaultHuman.jpg" alt="" />
							</span>
							<div class="chat-body clearfix">
								<p>${ChatContent.messengerContent}</p>
								<div class="chat_time">
									<fmt:formatDate value="${ChatContent.messengerDate}" pattern="yyyy.MM.d a h:mm:ss"/>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="chat-footer">
				<div class="file-upload">
				</div>
				<div class="chat_text_area">
					<input type="text" placeholder="Type your message…" id="chatInput"
					style="padding-left: 20px;
						   height: 87px;
						   width: 400px;
						   border: none;"/>
				</div>
				<div class="chat_send">
					<button class="btn btn-link" id="sendMessageButton">
						<i class="icon-copy ion-paper-airplane"></i>
					</button>
				</div>
			</div>
		</div>
