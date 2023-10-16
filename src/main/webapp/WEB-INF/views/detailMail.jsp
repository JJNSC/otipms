<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                                            <button type="button" class="btn btn-light">
                                            	<i class="fa fa-archive"></i>
                                            </button>
                                            <button type="button" class="btn btn-light">
                                            	<i class="fa fa-exclamation-circle"></i>
                                            </button>
                                            <button type="button" class="btn btn-light">
                                            	<i class="fa fa-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="read-content">
                                        <div class="media pt-5">
                                            <img class="mr-3 rounded-circle" src="/otipms/resources/images/user/2.jpg" style="width:60px; height:60px;">
                                            <div class="media-body">
                                                <h5 class="m-b-3">Ingredia Nutrisha</h5>
                                                <p class="m-b-2">20 May 2018</p>
                                            </div>
                                            
                                        </div>
                                        <div class="media pt-1">
                                        	<div class="media-body">
                                                <div>
	                                                <span class="m-b-3" style="font-weight: bold;">참조 : </span>
                                                	<span>김김김, 이이이, 박박박</span>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="media mb-4 mt-1">
                                            <div class="media-body"><span class="float-right">07:23 AM</span>
                                                <h4 class="m-0 text-primary">A collection of textile samples lay spread</h4>
                                            </div>
                                        </div>
                                        <h5 class="m-b-15">Hi,Ingredia,</h5>
                                        <p>
                                        	<strong>Ingredia Nutrisha,</strong> 
                                        	A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture
                                        </p>
                                        <p>
                                        	Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of
                                            Grammar.
                                        </p>
                                        <p>
                                        	Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.
                                            Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero,
                                            sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar,
                                        </p>
                                        <h5 class="m-b-5 p-t-15">Kind Regards</h5>
                                        <p>Mr Smith</p>
                                        <hr>
                                        <h6 class="p-t-15">
                                        	<i class="fa fa-download mb-2"></i>
                                        	첨부파일 
                                        	<span>(3)</span>
                                        </h6>
                                        <div class="row m-b-30">
                                            <div class="col-auto"><a href="#" class="text-muted">My-Photo.png</a>
                                            </div>
                                            <div class="col-auto"><a href="#" class="text-muted">My-File.docx</a>
                                            </div>
                                            <div class="col-auto"><a href="#" class="text-muted">My-Resume.pdf</a>
                                            </div>
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