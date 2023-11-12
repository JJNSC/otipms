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
    <title>쪽지 발신함</title>
    <!-- Favicon icon -->
    <%-- <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png"> --%>
    <link rel="icon" type="image/jpeg" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/otipms_fav.jpg">
    
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/mail/style.css" rel="stylesheet">
    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/resources/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/styleSwitcher.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/mail.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/sentMailPaging.js"></script>
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
                                    	</a>
                                        <a href="sentMail" class="list-group-item border-0 text-primary p-r-0">
                                        	<i class="fa fa-paper-plane font-18 align-middle mr-2"></i>
                                        	<b>보낸 쪽지함</b>
                                        </a>
                                        <a href="importantMail" class="list-group-item border-0 p-r-0">
                                        	<i class="fa fa-star-o font-18 align-middle mr-2"></i>
                                        	중요 쪽지함
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
				                            </div>
		                          		</div>
                                    </div>
                                 	<input id="cntSpan" type="hidden" value="${cnt2}"/>
                            		<input id="memIdSpan" type="hidden" value="${employee.empId}"/>
                                   	<div id="email-list-container" class="email-list m-t-15">
									</div>
                                    <!-- panel -->
                                    <div class="row mt-3 justify-content-center">
	                                    <div id="pagingContainer" class="bootstrap-pagination">
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