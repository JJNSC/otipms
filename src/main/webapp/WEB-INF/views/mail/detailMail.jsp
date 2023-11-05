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
    <title>쪽지 상세 보기</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png">
    
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/mail/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/customStyle.css" rel="stylesheet">
    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/resources/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/styleSwitcher.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/detailmail.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/headernside.js"></script>
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
                                        <a href="sentMail" class="list-group-item border-0 p-r-0">
                                        	<i class="fa fa-paper-plane font-18 align-middle mr-2"></i>
                                        	보낸 쪽지함
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
                                <input id="memIdSpan" type="hidden" value="${employee.empId}"/>
                                <div class="email-right-box">
                                    <div class="toolbar" role="toolbar">
                                        <div class="btn-group m-b-20">
                                            <button type="button" class="btn btn-light" onclick="checkimportant(event)">
                                            	<i class="icon-copy star ion-ios-star-outline"></i>
                                            </button>
                                            <button type="button"  class="btn" data-toggle="modal" data-target="#modalGrid">
                                            	<i class="fa fa-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="read-content">
                                    	<button onclick="javascript:void(window.open('readTime?messageNo=${messageContent.messageNo}','_blank','width=600, height=600, left=600, top=30'))"
                                    	   class="btn btn-primary btn-block" 
                                    	   style="position:absolute; width:150px; right:20px">읽음 여부</button>
                                        <div class="media pt-5">
                                            <img class="mr-3 rounded-circle" src="/otipms/resources/images/user/1.jpg" style="width:60px; height:60px;">
                                            <div class="media-body">
                                                <span class="m-b-5 font-weight-bold">발신자 : </span>
                                                <c:forEach items="${messageEmployee}" var="messageEmpSen">
	                                                <c:choose>
		                                                <c:when test="${messageEmpSen.ccType == 2}">
			                                                <span class="m-b-3">${messageEmpSen.empRank}</span>
			                                                <span class="m-b-3">${messageEmpSen.empName}</span>
		                                                </c:when>
	                                                </c:choose>
                                                </c:forEach>
                                                <br/>
                                                <span class="m-b-2 font-weight-bold">발신 날짜 : </span>
                                                <fmt:formatDate value="${messageContent.messageReservedDate}" pattern="HH:mm:ss       yyyy.MM.dd" />
                                                <br/>
                                                <span class="m-b-5 font-weight-bold">수신자 : </span>
                                                <c:set var="recipients" value="" />
												    <c:forEach items="${messageEmployee}" var="messageEmpRec" varStatus="recLoop">
												        <c:choose>
												            <c:when test="${messageEmpRec.ccType == 1}">
												                <c:if test="${recLoop.index > 0 && recLoop.index < 2}">
												                    <c:set var="recipients" value="${recipients}, " />
												                </c:if>
												                <c:if test="${recLoop.index < 2}">
													                <c:set var="recipients" value="${recipients}${messageEmpRec.empRank} ${messageEmpRec.empName}" />
												            	</c:if>
												            	<c:set var="recipientCount" value="${recipientCount + 1}" />
												            </c:when>
												        </c:choose>
												    </c:forEach>
												    ${recipients}
												    <c:if test="${recipientCount > 2}">
												        외 <span class="m-b-3">${recipientCount  - 2}명</span>
												    </c:if>
												    <br/>
												    
	                                                <span class="m-b-3 font-weight-bold">참조 : </span>
	                                                <c:set var="references" value="" />
	                                                <c:set var="referencesCount" value="0" />
	                                               	<c:forEach items="${messageEmployee}" var="messageEmpRei" varStatus="reiLoop">
	                                                	<c:choose>
		                                                	<c:when test="${messageEmpRei.ccType == 3}">
				                                                <c:if test="${reiLoop.index > 0 && reiLoop.index < 2}">
												                    <c:set var="references" value="${references}, " />
												                </c:if>
												                <c:if test="${reiLoop.index < 2}">
													                <c:set var="references" value="${references}${messageEmpRei.empRank} ${messageEmpRei.empName}" />
												            	</c:if>
												            	<c:set var="referencesCount" value="${referencesCount + 1}" />
		                                                	</c:when>
		                                                </c:choose>
	                                                </c:forEach>
	                                                ${references}
												    <c:if test="${referencesCount > 2}">
												        외 <span class="m-b-3">${referencesCount  - 2}명</span>
												    </c:if>
	                                                <br/>
	                                                
                                                <c:forEach items="${messageEmployee}" var="messageEmpBli" varStatus="loop">
	                                               	<c:choose>
		                                               	<c:when test="${messageEmpBli.ccType == 4 && employee.empId == messageEmpBli.empId}">
			                                                <span class="m-b-3 font-weight-bold">비밀참조 : </span>
			                                                <span class="m-b-3">${messageEmpBli.empRank}</span>
			                                                <span class="m-b-3">${messageEmpBli.empName}</span>
		                                               	</c:when>
	                                               	</c:choose>
                                               	</c:forEach>
                                            </div>
                                        </div>
                                        <br/>
                                        <div>
                                        	<b>제목 : </b>
                                        	<span>${messageContent.messageTitle}</span>
                                        </div>
                                        <hr>
                                        <div class="media mb-4 mt-1">
                                            <div class="media-body">
                                                ${messageContent.messageContent}
                                            </div>
                                        </div>
                                        <hr>
                                        <h6 class="p-t-15">
                                        	<i class="fa fa-download mb-2"></i>
                                        	첨부파일
                                        	<c:choose>
                                        		<c:when test="${empty messageMedia}">
                                           		<span>(0)</span>
                                           		</c:when>
	                                        	<c:otherwise>
		                                        	<span>(<c:out value="${messageMedia.size()}" />)</span>
	                                        	</c:otherwise>
                                        	</c:choose> 
                                        </h6>
                                        <div class="row m-b-30">
                                            <c:forEach items="${messageMedia}" var="messageMedia" >
                                            	<c:choose>
                                               		<c:when test="${empty messageMedia}">
                                               		</c:when>
                                               		<c:otherwise>
			                                            <div class="col-auto">
			                                            	<a href="download/${messageMedia.mediaFileNo}" class="text-muted" download="${mediaFile.mediaFileName}">
			                                            		${messageMedia.mediaFileName}
			                                            	</a>
			                                            </div>
                                               		</c:otherwise>
                                               	</c:choose>
                                            </c:forEach>
                                        </div>
                                        <div>
                                        	<input class="mt-3" type="button" value="일괄 다운로드" id="downloadAll"/>
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
    <div class="modal fade" id="modalGrid">
    	<div class="modal-dialog" role="document">
        	<div class="modal-content">
            	<div class="modal-header">
                	<h5 class="modal-title">쪽지 삭제</h5>
                </div>
                <div class="modal-body">
                	<div class="container-fluid">
                    	<div class="row">
	                       	쪽지를 삭제하시겠습니까?
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                	<button type="button" class="btn btn-primary" onclick="checkdelete()">삭제</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
	</div>
</body>

</html>