<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                                    	<a href="emailInbox" class="list-group-item border-0 p-r-0">
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
                                        <a href="temporaryMail" class="list-group-item border-0 text-primary p-r-0">
                                        	<i class="mdi mdi-file-document-box font-18 align-middle mr-2"></i>
                                        	<b>임시 저장함</b>
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
                                        <div class="d-flex justify-content-between align-items-center">
				                            <div class="d-flex align-items-center">
				                            	<div class="form-check me-2">
				                              		<input class="form-check-input" type="checkbox" id="email-select-all">
				                                	<label class="form-check-label" for="email-select-all"></label>
				                              	</div>
			                              		<i class="fa fa-trash font-18 align-middle ml-2"></i>
			                              		<i class="fa icon-copy ion-loop font-18 align-middle ml-3"></i>
				                            </div>
		                          		</div>
                                    </div>
                                    <div class="email-list m-t-15">
                                    	<ul class="list-unstyled m-0">
                                    		<li class="email-list-item email-marked-read p-2" data-bs-toggle="sidebar" data-target="#app-email-view">
		                                        <div class="d-flex align-items-center">
					                            	<div class="form-check">
				                                  		<input class="email-list-item-input form-check-input" type="checkbox" id="email-1">
				                                  		<label class="form-check-label" for="email-1"></label>
					                                </div>
					                                <i class="list-inline-item email-unread bx bx-envelope fs-4 ml-1 mr-2 mt-1"></i>
					                                <i class="email-list-item-bookmark bx bx-star d-sm-inline-block d-none cursor-pointer ml-1 mr-2 bx-sm"></i>
					                                <img src="/otipms/resources/images/users/1.jpg" alt="user-avatar" class="d-block flex-shrink-0 rounded-circle me-sm-3 me-0" height="32" width="32">
					                                <div class="email-list-item-content ms-2 ms-sm-0 me-2">
				                                  		<span class="email-list-item-username me-2 h6">김사원</span>
				                                  	</div>
				                                  	<div onclick="location.href='detailMail';" class="email-list-item-content ms-2 ms-sm-0 me-2" style="cursor:pointer;">
				                                  		<span class="email-list-item-subject d-xl-inline-block d-block">장그래가 될거야</span>
					                                </div>
					                                <div class="email-list-item-meta ms-auto d-flex align-items-center">
				                                  		<i class="icon-copy ion-paperclip mr-5"></i>
				                                  		<small class="email-list-item-time text-muted">15분 전</small>
				                                	</div>
				                              	</div>
                                    		</li>
                                    		<li class="email-list-item email-marked-read p-2" data-bs-toggle="sidebar" data-target="#app-email-view">
		                                        <div class="d-flex align-items-center">
					                            	<div class="form-check">
				                                  		<input class="email-list-item-input form-check-input" type="checkbox" id="email-1">
				                                  		<label class="form-check-label" for="email-1"></label>
					                                </div>
					                                <i class="list-inline-item email-unread bx bx-envelope fs-4 ml-1 mr-2 mt-1"></i>
					                                <i class="email-list-item-bookmark bx bx-star d-sm-inline-block d-none cursor-pointer ml-1 mr-2 bx-sm"></i>
					                                <img src="/otipms/resources/images/users/2.jpg" alt="user-avatar" class="d-block flex-shrink-0 rounded-circle me-sm-3 me-0" height="32" width="32">
					                                <div class="email-list-item-content ms-2 ms-sm-0 me-2">
				                                  		<span class="email-list-item-username me-2 h6">박대리</span>
				                                  		<span class="email-list-item-subject d-xl-inline-block d-block">대리운전 장인이야</span>
					                                </div>
					                                <div class="email-list-item-meta ms-auto d-flex align-items-center">
				                                  		<i class="icon-copy ion-paperclip mr-5"></i>
				                                  		<small class="email-list-item-time text-muted">2시간 전</small>
				                                	</div>
				                              	</div>
                                    		</li>
                                    		<li class="email-list-item email-marked-read p-2" data-bs-toggle="sidebar" data-target="#app-email-view">
		                                        <div class="d-flex align-items-center">
					                            	<div class="form-check">
				                                  		<input class="email-list-item-input form-check-input" type="checkbox" id="email-1">
				                                  		<label class="form-check-label" for="email-1"></label>
					                                </div>
					                                <i class="list-inline-item email-unread bx bx-envelope fs-4 ml-1 mr-2 mt-1"></i>
					                                <i class="email-list-item-bookmark bx bx-star d-sm-inline-block d-none cursor-pointer ml-1 mr-2 bx-sm"></i>
					                                <img src="/otipms/resources/images/users/2.jpg" alt="user-avatar" class="d-block flex-shrink-0 rounded-circle me-sm-3 me-0" height="32" width="32">
					                                <div class="email-list-item-content ms-2 ms-sm-0 me-2">
				                                  		<span class="email-list-item-username me-2 h6">박대리</span>
				                                  		<span class="email-list-item-subject d-xl-inline-block d-block">대리운전 장인이야</span>
					                                </div>
					                                <div class="email-list-item-meta ms-auto d-flex align-items-center">
				                                  		<i class="icon-copy ion-paperclip mr-5"></i>
				                                  		<small class="email-list-item-time text-muted">2시간 전</small>
				                                	</div>
				                              	</div>
                                    		</li>
                                    		<li class="email-list-item email-marked-read p-2" data-bs-toggle="sidebar" data-target="#app-email-view">
		                                        <div class="d-flex align-items-center">
					                            	<div class="form-check">
				                                  		<input class="email-list-item-input form-check-input" type="checkbox" id="email-1">
				                                  		<label class="form-check-label" for="email-1"></label>
					                                </div>
					                                <i class="list-inline-item email-unread bx bx-envelope fs-4 ml-1 mr-2 mt-1"></i>
					                                <i class="email-list-item-bookmark bx bx-star d-sm-inline-block d-none cursor-pointer ml-1 mr-2 bx-sm"></i>
					                                <img src="/otipms/resources/images/users/2.jpg" alt="user-avatar" class="d-block flex-shrink-0 rounded-circle me-sm-3 me-0" height="32" width="32">
					                                <div class="email-list-item-content ms-2 ms-sm-0 me-2">
				                                  		<span class="email-list-item-username me-2 h6">박대리</span>
				                                  		<span class="email-list-item-subject d-xl-inline-block d-block">대리운전 장인이야</span>
					                                </div>
					                                <div class="email-list-item-meta ms-auto d-flex align-items-center">
				                                  		<i class="icon-copy ion-paperclip mr-5"></i>
				                                  		<small class="email-list-item-time text-muted">2시간 전</small>
				                                	</div>
				                              	</div>
                                    		</li>
                                    	</ul>
                                        <!-- <div class="message">
                                            <a href="email-read.html">
                                                <div class="col-mail col-mail-1">
                                                    <div class="email-checkbox">
                                                        <input type="checkbox" id="chk2">
                                                        <label class="toggle" for="chk2"></label>
                                                    </div>
                                                    <span class="star-toggle ti-star"></span>
                                                </div>
                                                <div class="col-mail col-mail-2">
                                                    <div class="subject">동아일보 중딩한테 털렸죠? 아무고토 모타쥬?</div>
                                                    <div class="date">10분 전</div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="message unread">
                                            <a href="email-read.html">
                                                <div class="col-mail col-mail-1">
                                                    <div class="email-checkbox">
                                                        <input type="checkbox" id="chk3">
                                                        <label class="toggle" for="chk3"></label>
                                                    </div><span class="star-toggle ti-star"></span>
                                                </div>
                                                <div class="col-mail col-mail-2">
                                                    <div class="subject">어쩔티비 저쩔티비</div>
                                                    <div class="date">54분 전</div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="message">
                                            <a href="email-read.html">
                                                <div class="col-mail col-mail-1">
                                                    <div class="email-checkbox">
                                                        <input type="checkbox" id="chk4">
                                                        <label class="toggle" for="chk4"></label>
                                                    </div><span class="star-toggle ti-star"></span>
                                                </div>
                                                <div class="col-mail col-mail-2">
                                                    <div class="subject">이 메일은 영국에서부터 전해져</div>
                                                    <div class="date">4시간 전</div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="message">
                                            <a href="email-read.html">
                                                <div class="col-mail col-mail-1">
                                                    <div class="email-checkbox">
                                                        <input type="checkbox" id="chk5">
                                                        <label class="toggle" for="chk5"></label>
                                                    </div><span class="star-toggle ti-star"></span>
                                                </div>
                                                <div class="col-mail col-mail-2">
                                                    <div class="subject">아 휴가가고 십다</div>
                                                    <div class="date">2022.10.14</div>
                                                </div>
                                            </a>
                                        </div> -->
                                    </div>
                                    <!-- panel -->
                                    <div class="row mt-3">
	                                    <div class="bootstrap-pagination">
		                                    <nav>
		                                        <ul class="pagination justify-content-center">
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