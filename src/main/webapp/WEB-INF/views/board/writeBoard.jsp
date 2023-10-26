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
                                    <h4>${boardType}</h4>
                                </div>
                            	<div class="mt-4 pl-1 row" style="margin-bottom: 0.8rem;">
                                    <h5 class="col-2" style="padding-top: 10px;">글쓰기</h5>
                                    <span class="col-10 text-right">
			                            <button type="button" class="btn btn-primary">등록</button>
                                    </span>
                                </div>
                                <c:if test="${boardType eq '질의 게시판'}">
	                                <div class="dropdown d-inline-block" style="margin-bottom: 1rem;">
		                                <button type="button" class="btn btn-primary btn-custom dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="padding: 5px 9px;">시스템 관리 문의  </button>
		                                <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 37px, 0px);">
		                                	<a class="dropdown-item" href="#" onclick="filter(this)">시스템 관리 문의  </a> 
		                                	<a class="dropdown-item" href="#" onclick="filter(this)">아키텍처 문의  </a> 
		                                	<a class="dropdown-item" href="#" onclick="filter(this)">DBA 문의  </a>
		                                </div>
		                            </div>
		                        </c:if>
                                <div class="compose-content">
                                    <form action="#">
                                        <div class="form-group" style="margin-bottom: 1rem;">
                                            <input type="text" class="form-control bg-transparent" placeholder="제목을 입력해주세요.">
                                        </div>
                                        <div class="form-group">
                                            <textarea class="textarea_editor form-control bg-light" rows="15" placeholder="내용을 입력해주세요."></textarea>
                                        </div>
                                    </form>
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
										<form class="dropzone dz-clickable" action="#" id="my-awesome-dropzone" style="min-height: 150px; border: 1px dashed #1a73e8;">
											<div class="dz-default dz-message" style="margin: 3em 0;">
												<span>파일을 드롭하거나, 클릭하여 업로드 하세요</span>
											</div>
										</form>
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