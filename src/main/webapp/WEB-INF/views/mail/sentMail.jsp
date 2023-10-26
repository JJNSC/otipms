<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>쪽지 수신함</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png">
    
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/mail/style.css" rel="stylesheet">
    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/resources/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/styleSwitcher.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/mail.js"></script>
</head>

<body>
    <div id="main-wrapper">
        <!-- Content body start -->
        <div class="content-body">
            <!-- row -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="email-left-box">
                                	<a href="writeMail" class="btn btn-primary btn-block">쪽지 보내기</a>
                                    <div class="mail-list mt-4">
                                    	<a href="receivedMail" class="list-group-item border-0 p-r-0">
                                    		<i class="fa fa-inbox font-18 align-middle mr-2"></i>
                                    		수신 쪽지함
                                    		<span class="badge badge-primary badge-sm float-right m-t-5">198</span>
                                    	</a>
                                        <a href="sentMail" class="list-group-item border-0 text-primary p-r-0">
                                        	<i class="fa fa-paper-plane font-18 align-middle mr-2"></i>
                                        	<b>보낸 쪽지함</b>
                                        </a>
                                        <a href="importantMail" class="list-group-item border-0 p-r-0">
                                        	<i class="fa fa-star-o font-18 align-middle mr-2"></i>
                                        	중요 쪽지함
                                        	<span class="badge badge-danger badge-sm float-right m-t-5">47</span>
                                        </a>
                                        <a href="temporaryMail" class="list-group-item border-0 p-r-0">
                                        	<i class="mdi mdi-file-document-box font-18 align-middle mr-2"></i>
                                        	임시 저장함
                                        </a>
                                        <a href="trashMail" class="list-group-item border-0 p-r-0">
                                        	<i class="fa fa-trash font-18 align-middle mr-2"></i>
                                        	쪽지 휴지통
                                        </a>
                                    </div>
                                </div>
                                <div class="email-right-box">
                                    <div role="toolbar" class="toolbar">
                                        <div class="btn-group">
                                            <button aria-expanded="false" data-toggle="dropdown" class="btn btn-dark dropdown-toggle" type="button"> 
                                            	Filter
                                            	<span class="caret m-l-5"></span>
                                            </button>
                                            <div class="dropdown-menu">
                                           		<a href="javascript: void(0);" class="dropdown-item">발신자</a>
                                           		<a href="javascript: void(0);" class="dropdown-item">날짜</a>
                                           		<a href="javascript: void(0);" class="dropdown-item">읽음여부</a>
                                           		<a href="javascript: void(0);" class="dropdown-item">첨부파일</a>
                                            </div>
	                                        <div class="header-left" style="margin-left:20px;">
							                    <div class="input-group icons" style="margin-top:0px;">
							                        <input type="search" class="form-control" placeholder="검색어를 입력하세요" aria-label="Search Dashboard">
							                        <div class="input-group-prepend">
							                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1">
							                            	<i class="mdi mdi-magnify"></i>
							                            </span>
							                        </div>
							                    </div>
							                </div>
                                        </div>
                                        <hr/>
                                        <div class="d-flex justify-content-between align-items-center" style="margin-bottom:5px;">
				                            <div class="d-flex align-items-center">
				                            	<div class="form-check me-2">
				                              		<input class="form-check-input" type="checkbox" id="email-select-all" onclick="checkall()">
				                                	<label class="form-check-label" for="email-select-all"></label>
				                              	</div>
			                              		<i class="fa fa-trash font-18 align-middle ml-2" style="cursor: pointer;" onclick="deletemail()"></i>
			                              		<i id="refresh-button" class="fa icon-copy ion-loop font-18 align-middle ml-3" style="cursor: pointer;" onclick="refreshSentEmailList()"></i>
				                            </div>
		                          		</div>
                                    </div>
                                   	<div id="email-list-container" class="email-list m-t-15">
									    <c:forEach items="${messages}" var="message" varStatus="loop">
									        <div class="message message-${loop.index+1}">
									            <div class="col-mail col-mail-1 received">
									                <div class="email-checkbox">
									                    <input type="checkbox" id="chk${message.messageNo}">
									                    <label class="toggle" for="chk${message.messageNo}"></label>
									                </div>
									                <span class="icon-copy ${message.messageImportant == 1 ? 'ion-ios-star star' : 'star ion-ios-star-outline'}" onclick="checkimportant(${message.messageNo}, ${loop.index+1}, event)"></span>
									            	<span class="icon-copy ${message.messageChecked == 1 ? 'ion-android-mail' : 'ion-android-drafts'} mail" onclick="checkread(${loop.index+1}, event)"></span>
									            </div>
									            <div class="col-mail col-mail-profile">
									                <div class="profile">
									                    <img src="/otipms/resources/images/users/2.jpg" height="40" width="40">
									                    <span class="rank">${message.empRank}</span>
									                    <span class="name">${message.empName}</span>
									                </div>
									            </div>
									            <a href="detailMail">
									                <div class="col-mail col-mail-2">
									                    <div class="subject">${message.messageTitle}</div>
									                    <div class="clip">
									                        <c:if test="${message.mediaFileNo != null}">
									                            <span class="icon-copy ion-paperclip mr-5"></span>
									                        </c:if>
									                    </div>
									                    <div class="date">10분전</div>
									                    <%-- <div class="date">${fn:formatDate(message.messageReservedDate, 'MM월 dd일 HH:mm')}</div> --%>
									                </div>
									            </a>
									        </div>
									    </c:forEach>
									</div>

                                    <!-- panel -->
                                    <div class="row mt-3 justify-content-center">
	                                    <div class="bootstrap-pagination">
		                                    <nav>
		                                        <ul class="pagination">
		                                            <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">이전</a>
		                                            </li>
		                                            <li class="page-item active">
		                                            	<a class="page-link" href="#">1</a>
		                                            </li>
		                                            <li class="page-item">
		                                            	<a class="page-link" href="#">2</a>
		                                            </li>
		                                            <li class="page-item">
		                                            	<a class="page-link" href="#">3</a>
		                                            </li>
		                                            <li class="page-item">
		                                            	<a class="page-link" href="#">4</a>
		                                            </li>
		                                            <li class="page-item">
		                                            	<a class="page-link" href="#">5</a>
		                                            </li>
		                                            <li class="page-item">
		                                            	<a class="page-link" href="#">다음</a>
		                                            </li>
		                                        </ul>
		                                    </nav>
		                                </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

</body>

</html>