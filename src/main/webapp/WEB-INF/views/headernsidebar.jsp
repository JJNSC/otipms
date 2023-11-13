<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
[data-sidebar-position="fixed"][data-layout="vertical"] .nk-sidebar{
	position:fixed;
}
@media only screen and (min-width: 768px)
[data-sidebar-style="mini"] .nk-sidebar{
width:15.1875rem;
}
</style>

    <div class="nav-header">
        <div class="brand-logo">
        	<c:if test="${employee.role=='ROLE_ADMIN' }">
            <a href="${pageContext.request.contextPath}/indexAdmin" style="padding:0px;" class="ml-3">
            </c:if>
        	<c:if test="${employee.role=='ROLE_PM' }">
            <a href="${pageContext.request.contextPath}/indexPM" style="padding:0px;" class="ml-3">
            </c:if>
        	<c:if test="${employee.role=='ROLE_PE' }">
            <a href="${pageContext.request.contextPath}/indexPE" style="padding:0px;" class="ml-3">
            </c:if>
        	<c:if test="${employee.role=='ROLE_CLIENT' }">
            <a href="${pageContext.request.contextPath}/indexClient" style="padding:0px;" class="ml-3">
            </c:if>
                <b class="logo-abbr"><img src="images/logo.png" alt=""> </b>
                <span class="logo-compact"><img src="./images/logo-compact.png" alt=""></span>
                <span class="brand-title">
                    <!-- <img src="images/logo-text.png" alt=""> -->
                    <img src="${pageContext.request.contextPath}/resources/vendors/images/otipms.jpg" style="margin-top: 5px; height: 70px; margin-left: 20px;" alt="">
                </span>
            </a>
        </div>
    </div>
        <div class="header">    
            <div class="header-content clearfix">
                <div class="header-right">
                    <ul class="clearfix">
                        <li class="icons dropdown">
							<span>
								<span id="date" class="mr-2" style="color:#fff"></span>
	                        	<span id="time" class="mr-2" style="color:#fff"></span>
	                        	<span id="weather" class="mr-2"  style="color:#fff"></span>
                        	</span>
                        	<a class="nav-link nav-icons" href="javascript:void(0);" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="mdi mdi-email-outline"></i>
								<span id="alarmCnt" class="badge badge-pill badge-custom"></span>
								<input type="hidden" value="${employee.empId}" id="memIdSpan">
								<div class="alertMail" id="alarmIcon" style="background-color: transparent; border:0px; width:300px; position:absolute; top:5em; left:-2.2em; ">
						          	<div class="content alert  fade show" style="background-color: #f57f17">
                                    <span type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    	<!-- <span aria-hidden="true">×</span> -->
                                    </span> 
                                    <i class="mdi mdi-email-outline" aria-hidden="true"></i>&nbsp;&nbsp; 새로운 쪽지가 도착했습니다.
                                    </div>
						        </div>
						        <div class="alertMail" id="alarmChatIcon" style="background-color: transparent; border:0px; width:300px; position:absolute; top:9em; left:-2.2em;">
							        <div class="content alert  fade show" style="background-color: #bf360c">
	                                    <span type="button" class="close" data-dismiss="alert" aria-label="Close">
	                                    	<!-- <span aria-hidden="true">×</span> -->
	                                    </span> 
	                                    <i class="icon-copy fa fa-bell-o" aria-hidden="true"></i>&nbsp;&nbsp; 새로운 채팅이 도착했습니다.
	                                    </div>
						        </div>
							</a>
                            <div class="drop-down animated fadeIn dropdown-menu">
                                <div class="dropdown-content-heading d-flex justify-content-between">
                                    <span class="">New Messages</span>  
                                </div>
                                <div id="alarmListContainer" class="dropdown-content-body" style="max-height: 300px; overflow-y:scroll;">
                                    <ul id="alarmList" style="padding:0px;height:310px;">
                                    </ul>
                                    <div id="totalAlarm"style="text-align:center;">
									  	<a href="#" class="btn btn-primary btn-block" onclick="deleteAlarm(${employee.empId},event)">알림 전체 삭제</a>
									</div>
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown">
                        	<a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-bell-outline"></i>
                                <span id="alarmChatCnt" class="badge badge-pill badge-custom">0</span>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                                <div class="dropdown-content-heading d-flex justify-content-between">
                                    <span class="">New Chat</span>  
                                </div>
                                <div id="alarmListChatContainer" class="dropdown-content-body" style="max-height: 300px; overflow-y:scroll;">
                                    <ul id="chatAlarmList" style="padding:0px;height:310px;">
                                    </ul>
                                    <div id="totalAlarm"style="text-align:center;">
									  	<a href="#" class="btn btn-primary btn-block" onclick="deleteChatAlarm(${employee.empId},event)">알림 전체 삭제</a>
									</div>
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown d-none d-md-flex">
                            <a href="javascript:void(0)" class="log-user" >
                                <span style="padding:0">${employee.empName}</span> 
                                <span style="padding:0">${employee.empRank}</span>
                            </a>
                        </li>
                        <li class="icons dropdown">
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                               	<c:if test="${employee.empStatus == 1}">
                               		<span class="loginin logined"></span>
                               	</c:if>
                               	<c:if test="${employee.empStatus != 1}">
                               		<span class="loginin logout"></span>
                               	</c:if>
                                <img src="data:${mf.mediaFileType};base64, ${base64Img}" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/profile"><i class="icon-user"></i> <span>내 정보</span></a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(window.open('${pageContext.request.contextPath}/mail/receivedMail','_blank','width=920, height=680, left=800, top=30'))">
                                                <i class="icon-envelope-open"></i>
                                                <span>쪽지</span>
                                                <div class="badge gradient-3 badge-pill gradient-1">
                                                	<span id="alarmCnt2"></span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(window.open('${pageContext.request.contextPath}/chat/chat', '_blank', 'width=724, height=950, left=1000, top=30'))">
                                                <i class="icon-copy fa fa-comments-o"></i>
                                                <span>채팅</span>
                                                <div class="badge gradient-3 badge-pill gradient-1">
                                                	<span id="alarmChatCnt2"></span>
                                                </div>
                                            </a>
                                        </li>
                                        <hr class="my-2">
                                        <li>
                                            <a href="page-lock.html"><i class="icon-lock"></i> <span>화면 잠금</span></a>
                                        </li>
                                        <li><a href="${pageContext.request.contextPath}/logout"><i class="icon-key"></i> <span>로그아웃</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar">           
            <div class="nk-nav-scroll active">
                <ul class="metismenu in" id="menu">
                    <li class="">
                        <!-- <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">개인 일정</span>
                        </a> -->
                        <a class="" href="${pageContext.request.contextPath}/mySchedule" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">개인 일정</span>
                        </a>
                    </li>
                    <li class="">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-notebook menu-icon"></i><span class="nav-text">업무 관리</span>
                        </a>
                        <ul aria-expanded="false" class="collapse" >
                            <li><a href="${pageContext.request.contextPath}/projectTask">프로젝트 업무 관리</a></li>
                            <!-- <li><a href="./page-register.html">팀 업무 관리</a></li> -->
                            <li><a href="${pageContext.request.contextPath}/myTask">개인 업무 관리</a></li>
                        </ul>
                    </li>
                    <li class="mega-menu mega-menu-sm">
                        <!-- <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">인력 조회</span>
                        </a> -->
                        <!-- has-arrow 지우긴 했는데 클릭한 이후 선택된 상태로 남는지는 확인해야 함 -->
                        <a class="" href="${pageContext.request.contextPath}/checkEmployeeList/employeeList" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">인력 조회</span>
                        </a>
                    </li>
                    
                    <li class="">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-note menu-icon"></i><span class="nav-text">게시판</span>
                        </a>
                        <ul aria-expanded="false" class="collapse" >
                       <!--  <ul aria-expanded="false" class="collapse" style="height: 0px;"> -->
                            <li><a href="${pageContext.request.contextPath}/board?boardType=공지사항">공지사항</a></li>
                            <li><a href="${pageContext.request.contextPath}/board?boardType=질의 게시판">질의 게시판</a></li>
                            <%-- <li><a href="${pageContext.request.contextPath}/board?boardType=자유 게시판">자유 게시판</a></li> --%>
                            <c:if test="${employee.role == 'ROLE_PE'}">
	                            <li><a href="${pageContext.request.contextPath}/board?boardType=팀 게시판">팀 게시판</a></li>
                            </c:if>
                        </ul>
                    </li>
                   	<sec:authorize access="hasRole('ROLE_ADMIN')">
	                    <li class="">
	                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                            <i class="icon-grid menu-icon"></i><span class="nav-text">시스템 관리</span>
	                        </a>
	                        <ul aria-expanded="false" class="collapse">
	                            <li><a href="${pageContext.request.contextPath}/projectManagement/projectList">프로젝트 관리</a></li>
	                            <li><a href="${pageContext.request.contextPath}/teamManagement/teamList">팀 관리</a></li>
	                            <li><a href="${pageContext.request.contextPath}/employeeManagement/employeeList">인력 관리</a></li> 
	                        </ul>
	                    </li>
                    </sec:authorize>
                </ul>
            </div>
        </div>
        
        <script src="${pageContext.request.contextPath}/resources/js/headernside.js"></script>
        <link href="${pageContext.request.contextPath}/resources/css/headernside.css" rel="stylesheet">
        <!--**********************************
            Sidebar end
        ***********************************-->
