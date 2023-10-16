<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>쪽지 보내기</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png">
    
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail/app-email.css" />
	
	<!-- Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail/core.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail/theme-default.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat/perfect-scrollbar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat/typeahead.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail/katex.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail/editor.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail/select2.css" />
    
    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/resources/js/mail/helpers.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/template-customizer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/config.js"></script>
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
                                    	<a href="emailInbox" class="list-group-item border-0 text-primary p-r-0">
                                    		<i class="fa fa-inbox font-18 align-middle mr-2"></i>
                                    		<b>수신 쪽지함</b>
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
                                <div class="email-right-box">
                                    <div class="toolbar" role="toolbar">
                                        <div class="btn-group m-b-20">
                                            <button type="button" class="btn btn-light"><i class="fa fa-archive"></i>
                                            </button>
                                            <button type="button" class="btn btn-light"><i class="fa fa-exclamation-circle"></i>
                                            </button>
                                            <button type="button" class="btn btn-light"><i class="fa fa-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="compose-content mt-5">
                                        <form action="#">
                                            <div class="form-group">
                                                <input type="text" class="form-control bg-transparent" placeholder=" To">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control bg-transparent" placeholder=" Subject">
                                            </div>
                                            <div class="form-group">
                                                <textarea class="textarea_editor form-control bg-light" rows="15" placeholder="Enter text ..."></textarea>
                                            </div>
                                        </form>
                                        <h5 class="m-b-20"><i class="fa fa-paperclip m-r-5 f-s-18"></i> 첨부파일</h5>
                                        <form action="#" class="dropzone">
                                            <div class="form-group">
                                                <div class="fallback">
                                                    <input class="l-border-1" name="file" type="file" multiple="multiple">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="text-left m-t-15">
                                        <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="button"><i class="fa fa-paper-plane m-r-5"></i> Send</button>
                                        <button class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" type="button"><i class="ti-close m-r-5 f-s-12"></i> Discard</button>
                                    </div>
                                </div>
                                <!-- <panel> -->
                                    <div class="row mt-3">
                                    
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

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="${pageContext.request.contextPath}/resources/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/styleSwitcher.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/app-email.js"></script>

	<!-- Core JS -->
    <script src="${pageContext.request.contextPath}/resources/js/chat/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/chat/popper.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/chat/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/chat/perfect-scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/chat/hammer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/chat/i18n.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/chat/typeahead.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/chat/menu.js"></script>


    <!-- Vendors JS -->
    <script src="${pageContext.request.contextPath}/resources/js/mail/katex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/quill.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/select2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/block-ui.js"></script>
    
</body>

</html>