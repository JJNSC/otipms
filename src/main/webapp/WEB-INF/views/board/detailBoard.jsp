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
    <title>막내온탑 >v<</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/customStyle.css" rel="stylesheet">
    
	<%-- <link href="${pageContext.request.contextPath}/resources/css/mail/dropzone.css" rel="stylesheet" type="text/css"> --%>

</head>

<body>
	<jsp:include page="../headernsidebar.jsp">
		<jsp:param name="employee" value="${employee}" />
	</jsp:include>
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
				<div class="row">
                    <!-- /# column -->
                    <div class="col">
                        <div class="card card-custom">
                            <div class="card-body">
                            	<div class="card-title mb-1">
                                    <!-- <h4>공지사항</h4> -->
                                    <%-- <h4>${boardType}</h4> --%>
                                    <h4>${board.boardTypeName}</h4>
                                </div>
                            	<div class="mt-4 pl-3 row" style="margin-bottom: 0.8rem;">
                                    <h3 style="padding-top: 10px;">${board.boardTitle}</h3>
                                    <!-- <span class="col-10 text-right">
			                            <button type="button" class="btn btn-primary">등록</button>
                                    </span> -->
                                </div>
                                <div class="row">
                                	<div class="col-6 mb-3">
                                		<div class="d-flex align-items-center">
		                                    <div style="margin-right: 0.8rem !important;"><img src="data:${board.mediaFileData};base64, ${board.base64Img}" class="rounded-circle" width="40" height="40"></div>
		                                   <!--  <div class="mr-3"><img src="/otipms/resources/images/testHuman.jpg" alt="user" class="rounded-circle" width="40" height="40"></div> -->
		                                    <div class="">
		                                        <h6 class="text-dark mb-0 font-16 font-weight-medium pb-1">
		                                        	<c:if test="${board.teamName == null}">
		                                        		${board.empName} <span style="font-weight: 300; font-size: 0.8rem; color: #9097c4;"> ${board.empRank}</span>
		                                        	</c:if>
		                                        	<c:if test="${board.teamName != null}">
		                                        		${board.empName} <span style="font-weight: 300; font-size: 0.8rem; color: #9097c4;"> ${board.empRank} | ${board.teamName}</span>
		                                        	</c:if>
		                                        </h6>
		                                        <c:set var="now" value="<%= new java.util.Date() %>" />
			                                    <c:choose>
												    <c:when test="${fn:substring(board.boardWriteDate, 0, 10) == fn:substring(now, 0, 10)}">
												        <span class="text-muted font-14">  <fmt:formatDate value="${board.boardWriteDate}" pattern="HH:mm"/></span>
												    </c:when>
												    <c:otherwise>
												        <span class="text-muted font-14">  <fmt:formatDate value="${board.boardWriteDate}" pattern="yyyy.MM.dd"/></span>
												    </c:otherwise>
												</c:choose>
		                                        <!-- <span class="text-muted font-14">  2023.10.18 16:13</span> -->
		                                        &nbsp; <span class="text-muted font-14">조회 ${board.boardHitcount}</span>
		                                    </div>
		                                </div>
                                	</div>
                                	<div class="col-6 text-right pt=4" style=" padding-top: 30px; padding-right: 29px;">
		                                <!-- <button type="button" class="btn mb-1 btn-light-custom">수정</button> -->
		                                <c:if test="${board.empId == employee.empId}">
		                                    <a href="writeBoard?boardNo=${board.boardNo}" type="button" class="text-secondary" style=" margin-right: 7px;">수정</a>                                                                	
		                                    <a href="writeBoard?boardNo=${board.boardNo}" type="button" class="text-danger">샥제</a>                                       	
		                                </c:if>
                                	</div>
                                </div>
                                <div class="compose-content pt-3" style="min-height: 86px; border-top: 1px solid #ebecef; padding-left: 1.5rem !important; padding-top: 2.5rem !important; padding-bottom: 2.5rem !important;">
                                   	${board.boardContent}
                                </div>
                                <!-- 댓글 -->
                                <div class="compose-content" style="border-top: 1px solid #ebecef; padding-top: 1.5rem; padding-bottom: 1.5rem;">
                                	<div class="row">
                                		<div class="col-6">
                                			<div class="d-flex align-items-center">
			                                    <div style="margin-right: 0.8rem !important;"><img src="/otipms/resources/images/testHuman.jpg" alt="user" class="rounded-circle" width="40" height="40"></div>
			                                    <div class="">
			                                        <h6 class="text-dark mb-0 font-16 font-weight-medium pb-1">
			                                        	김종진 <span style="font-weight: 300; font-size: 0.8rem; color: #9097c4;">대리 | 개발1팀</span>
			                                        	<span class="badge badge-pill badge-writer-custom">작성자</span>
			                                        </h6>
			                                        <span class="text-muted font-14">  2023.10.18 16:13</span>
			                                    </div>
			                                </div>
                                		</div>
                                		<div class="col-6 text-right">
                                			<div class="dropdown custom-dropdown" style="flex: 1; text-align: right;">
		                                        <div data-toggle="dropdown" aria-expanded="false" class="px-3">
		                                        	<i class="fa fa-ellipsis-v"></i>
		                                        </div>
		                                        <div class="dropdown-menu dropdown-menu-right" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-81px, 21px, 0px);">
		                                        	<a class="dropdown-item" href="#">수정</a>
		                                        	<a class="dropdown-item" href="#">삭제</a>
		                                        </div>
		                                    </div>             		
                                		</div>
                                	</div>
                                	<div class="row pt-3 pl-5 ml-1">
                                		감사합니다~
                                	</div>
                                </div>
                                <div class="compose-content" style="border-top: 1px solid #ebecef; padding-top: 1.5rem; padding-bottom: 1.5rem;">
                                	<div class="row">
                                		<div class="col-6">
                                			<div class="d-flex align-items-center">
			                                    <div style="margin-right: 0.8rem !important;"><img src="/otipms/resources/images/testHuman.jpg" alt="user" class="rounded-circle" width="40" height="40"></div>
			                                    <div class="">
			                                        <h6 class="text-dark mb-0 font-16 font-weight-medium pb-1">
			                                        	김종진 <span style="font-weight: 300; font-size: 0.8rem; color: #9097c4;">대리 | 개발1팀</span>
			                                        	<span class="badge badge-pill badge-writer-custom">작성자</span>
			                                        </h6>
			                                        <span class="text-muted font-14">  2023.10.18 16:13</span>
			                                    </div>
			                                </div>
                                		</div>
                                		<div class="col-6 text-right">
                                			<div class="dropdown custom-dropdown" style="flex: 1; text-align: right;">
		                                        <div data-toggle="dropdown" aria-expanded="false" class="px-3">
		                                        	<i class="fa fa-ellipsis-v"></i>
		                                        </div>
		                                        <div class="dropdown-menu dropdown-menu-right" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-81px, 21px, 0px);">
		                                        	<a class="dropdown-item" href="#">수정</a>
		                                        	<a class="dropdown-item" href="#">삭제</a>
		                                        </div>
		                                    </div>             		
                                		</div>
                                	</div>
                                	<div class="row pt-3 pl-5 ml-1">
                                		감사합니다~
                                	</div>
                                </div>
                                <!-- 댓글 작성 -->
                                <%-- <div class="box-footer" style="">
                                	<img class="img-responsive img-circle img-sm" src="${pageContext.request.contextPath}/resources/images/testHuman.jpg" alt="Alt Text" width="40px" height="40px">
									<form action="#" method="post">
										<input type="text" class="form-control input-sm" placeholder="Press enter to post comment">
									</form>
								</div> --%>
								<div class="CommentWriter">
									<div class="comment_inbox">
										<span class="comment_inbox_name">
											<strong style="font-weight: 700; font-size: 0.875rem;">${employee.empName} </strong> 
											<c:if test="${employee.teamName == null}">
												<span style="font-weight: 300; font-size: 0.8rem; color: #9097c4;">${employee.empRank}</span>
	                                       	</c:if>
	                                       	<c:if test="${employee.teamName != null}">
												<span style="font-weight: 300; font-size: 0.8rem; color: #9097c4;">${employee.empRank} | ${employee.teamName}</span>
	                                       	</c:if>
											<%-- <span style="font-weight: 300; font-size: 0.8rem; color: #9097c4;">${employee.empRank} | ${employee.teamName}</span></span> --%>
                                       	</span>
                                       	<input type="hidden" id="boardNumber" value="${board.boardNo}">
										<textarea placeholder="댓글을 남겨보세요" id="commentText" rows="15" class="comment_inbox_text" style="width: 100%; overflow: hidden; overflow-wrap: break-word; height: 20px; border: none; resize: none;"></textarea>
										<!-- <text placeholder="댓글을 남겨보세요" rows="1" class="comment_inbox_text" style="overflow: hidden; overflow-wrap: break-word; height: 17px; border: none;"></text> -->
										<!----><!---->
									</div>
									<div data-v-afadf0bc="" class="comment_attach">
										<div data-v-afadf0bc="" class="attach_box">
											<!-- <form action="#" class="dropzone">
	                                            <div class="form-group mb-0">
	                                                <div class="fallback">
	                                                    <input class="l-border-1" name="file" type="file" multiple="multiple">
	                                                </div>
	                                            </div>
	                                        </form> -->
	                                        <form action="#" class="dropzone">
											    <div class="form-group mb-0">
											        <div class="fallback">
											            <label for="fileInput" class="file-label">
											                <i class="icon-copy fa fa-paperclip" aria-hidden="true" style="transform: rotate(445deg);"></i> <!-- 파일 아이콘 -->
											            </label>
											            <!-- <input id="fileInput" class="l-border-1" name="file" type="file" multiple="multiple" style="display: none;"> -->
											            <input id="fileInput" class="l-border-1" name="file" type="file" multiple="multiple" style="display: none;">
											        </div>
											    </div>
											</form>
											<!-- <div class="pd-20 card-box mb-30">
												<div class="clearfix mb-20">
													<div class="pull-left">
														<h4 class="text-blue h4">첨부파일</h4>
													</div>
												</div>
												<form class="dropzone dz-clickable" action="#" id="my-awesome-dropzone">
													<div class="dz-default dz-message">
														<span>파일을 드롭하거나, 클릭하여 업로드 하세요</span>
													</div>
												</form>
											</div> -->
											<script>
											Dropzone.autoDiscover = false;
											$(".dropzone").dropzone({
											addRemoveLinks: true,
											removedfile: function (file) {
											var name = file.name;
											var _ref;
											return (_ref = file.previewElement) != null
											? _ref.parentNode.removeChild(file.previewElement)
											: void 0;
											},
											});
											</script>
										</div>
										<div class="register_box">
											<a href="#" role="button" class="button btn_register" onclick="register()">등록</a>
											<!-- <button class="button btn_register">등록</button> -->
											<script type="text/javascript">
												function register() {
													registerComment();
												}
											</script>
										</div>
									</div>
								</div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="${pageContext.request.contextPath}/resources/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/styleSwitcher.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/mail/dropzone.js"></script>
</body>

</html>