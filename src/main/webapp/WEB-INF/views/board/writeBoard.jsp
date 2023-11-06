<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

	<%-- <script src="${pageContext.request.contextPath}/resources/js/board/writeBoard.js"></script> --%>
    
	<!-- Editer -->-
	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	<!-- Dropzone -->
	<link href="${pageContext.request.contextPath}/resources/css/mail/dropzone.css" rel="stylesheet" type="text/css">

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
                                    <c:if test="${board != null}">
	                                    <%-- <h4>${board.boardTypeName}</h4> --%>
	                                    <c:if test="${board.boardTypeName ne '팀 게시판'}">
		                                    <h4>${board.boardTypeName}</h4>
	                                    </c:if>
	                                    <c:if test="${board.boardTypeName eq '팀 게시판'}">
		                                    <h4>${teamName} 게시판</h4>
	                                    </c:if>
                                    </c:if>
                                    <c:if test="${board == null}">
	                                    <h4>${boardType}</h4>
                                    </c:if>
                                </div>
                                <form action="submitBoard" method="post" id="submitBoardForm">
	                            	<div class="mt-4 pl-1 row" style="margin-bottom: 0.8rem;">
	                                    <h5 class="col-2" style="padding-top: 10px;">글쓰기</h5>
	                                    <span class="col-10 text-right">
				                            <!-- <button type="button" class="btn btn-primary" id="submitBtn">등록</button> -->
				                            <button type="submit" class="btn btn-primary" id="submitBtn">등록</button>
	                                    </span>
	                                </div>
	                                <c:if test="${board != null and board.boardTypeName eq '질의 게시판'}">
		                                <!-- <div class="dropdown d-inline-block" style="margin-bottom: 1rem;">
			                                <button type="button" class="btn btn-primary btn-custom dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="padding: 5px 9px;">전체  </button>
			                                <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 37px, 0px);">
			                                	<a class="dropdown-item" href="#" onclick="filter(this)">전체  </a> 
			                                	<a class="dropdown-item" href="#" onclick="filter(this)">시스템 관리 문의  </a> 
			                                	<a class="dropdown-item" href="#" onclick="filter(this)">아키텍처 문의  </a> 
			                                	<a class="dropdown-item" href="#" onclick="filter(this)">DBA 문의  </a>
			                                </div>
			                            </div> -->
			                            <div class="d-inline-block" style="margin-bottom: 1rem;">
											<select class="p-1" name="inquiryType" id="inquiryType" style="border: 1px solid #ced4da;">
												<c:choose>
													<c:when test="${board.inquiryBoardType eq '시스템 관리'}"> 
														<option value="시스템 관리" selected="selected">시스템 관리 문의</option>
														<option value="아키텍처">아키텍처 문의</option>
														<option value="DBA">DBA 문의</option>
													</c:when>
													<c:when test="${board.inquiryBoardType eq '아키텍처'}"> 
														<option value="시스템 관리">시스템 관리 문의</option>
														<option value="아키텍처" selected="selected">아키텍처 문의</option>
														<option value="DBA">DBA 문의</option>
													</c:when>
													<c:otherwise>
														<option value="시스템 관리">시스템 관리 문의</option>
														<option value="아키텍처">아키텍처 문의</option>
														<option value="DBA" selected="selected">DBA 문의</option>
													</c:otherwise>
												</c:choose>
												<!-- <option value="시스템 관리">시스템 관리 문의</option>
												<option value="아키텍처">아키텍처 문의</option>
												<option value="DBA">DBA 문의</option> -->
											</select>
			                            </div>
			                        </c:if>
			                        <c:if test="${board == null and boardType eq '질의 게시판'}">
		                                <!-- <div class="dropdown d-inline-block" style="margin-bottom: 1rem;">
			                                <button type="button" class="btn btn-primary btn-custom dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="padding: 5px 9px;">전체  </button>
			                                <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 37px, 0px);">
			                                	<a class="dropdown-item" href="#" onclick="filter(this)">전체  </a> 
			                                	<a class="dropdown-item" href="#" onclick="filter(this)">시스템 관리 문의  </a> 
			                                	<a class="dropdown-item" href="#" onclick="filter(this)">아키텍처 문의  </a> 
			                                	<a class="dropdown-item" href="#" onclick="filter(this)">DBA 문의  </a>
			                                </div>
			                            </div> -->
			                            <div class="d-inline-block" style="margin-bottom: 1rem;">
											<select class="p-1" name="inquiryType" id="inquiryType" style="border: 1px solid #ced4da;" >
												<option value="시스템 관리">시스템 관리 문의</option>
												<option value="아키텍처">아키텍처 문의</option>
												<option value="DBA">DBA 문의</option>
											</select>
			                            </div>
			                        </c:if>
	                                <div class="compose-content">
	                                	<c:if test="${board != null}">
	                                		<input type="hidden" name="boardNo" value="${board.boardNo}">
		                                    <div class="form-group" style="margin-bottom: 1rem;">
	                                            <input type="text" class="form-control bg-transparent" name="boardTitle" id="boardTitle" placeholder="제목을 입력해주세요." value="${board.boardTitle}">
	                                        </div>
	                                        <div class="form-group">
	                                            <textarea id="myEditor" name="myEditor" class="form-control border-radius-0" placeholder="내용을 입력하세요">${board.boardContent}</textarea>
	                                        </div>
	                                    </c:if>
	                                    <c:if test="${board == null}">
		                                    <div class="form-group" style="margin-bottom: 1rem;">
	                                            <input type="text" class="form-control bg-transparent" name="boardTitle" id="boardTitle" placeholder="제목을 입력해주세요.">
	                                        </div>
	                                        <div class="form-group">
	                                            <textarea id="myEditor" name="myEditor" class="form-control border-radius-0" placeholder="내용을 입력하세요"></textarea>
	                                        </div>
	                                    </c:if>
                                        <%-- <div class="form-group" style="margin-bottom: 1rem;">
                                            <input type="text" class="form-control bg-transparent" name="boardTitle" id="boardTitle" placeholder="제목을 입력해주세요." value="${board.boardTitle}">
                                        </div>
                                        <div class="form-group">
                                            <textarea id="myEditor" name="myEditor" class="form-control border-radius-0" placeholder="내용을 입력하세요">${board.boardContent}</textarea>
                                        </div> --%>
                                           	<script>
												var ckeditor_config = {
												  resize_enable : false,
												  enterMode : CKEDITOR.ENTER_BR,
												  shiftEnterMode : CKEDITOR.ENTER_P
												};
												CKEDITOR.replace("myEditor", ckeditor_config);
											</script>
                                    <!-- <h5 class="m-b-20"><i class="icon-copy fa fa-paperclip" aria-hidden="true" style="transform: rotate(445deg);"></i> 첨부파일</h5>
                                    <form action="#" class="dropzone">
                                        <div class="form-group">
                                            <div class="fallback">
                                                <input class="l-border-1" name="file" type="file" multiple="multiple">
                                            </div>
                                        </div>
                                    </form> -->
	                                    <div class="pd-20 card-box mb-30">
											<div class="clearfix mb-20">
												<div class="pull-left">
													<h5 class="m-b-20"><i class="icon-copy fa fa-paperclip" aria-hidden="true" style="transform: rotate(445deg);"></i> 첨부파일</h5>
												</div>
											</div>
											<div class="dropzone dz-clickable" action="#" name="dropzone" id="my-awesome-dropzone" style="min-height: 150px; border: 1px dashed #1a73e8;">
												<div class="dz-default dz-message" style="margin: 3em 0;">
													<span>파일을 드롭하거나, 클릭하여 업로드 하세요</span>
												</div>
											</div>
										</div>
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
    	                        </form>
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
    
    <!-- Editer -->-
	<%-- <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script> --%>
    
    <script src="${pageContext.request.contextPath}/resources/js/board/writeBoard.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/mail/dropzone.js"></script>
</body>

</html>