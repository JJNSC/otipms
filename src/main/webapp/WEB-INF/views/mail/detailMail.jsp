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
    <link href="${pageContext.request.contextPath}/resources/css/mail/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/customStyle.css" rel="stylesheet">
    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/resources/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/styleSwitcher.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/detailmail.js"></script>
    
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
                                        <div class="media pt-5">
                                            <img class="mr-3 rounded-circle" src="/otipms/resources/images/user/1.jpg" style="width:60px; height:60px;">
                                            <div class="media-body">
                                                <span class="m-b-5 font-weight-bold">발신자 : </span>
                                                <span class="m-b-3">사원 </span>
                                                <span class="m-b-3">김사원</span>
                                                <br/>
                                                <span class="m-b-2 font-weight-bold">발신 날짜 : </span>
                                                <span class="m-b-2">15:20:55 &nbsp;&nbsp;&nbsp; 2023.10.16</span>
                                                <br/>
                                                <span class="m-b-5 font-weight-bold">수신자 : </span>
                                                <span class="m-b-3">차장 </span>
                                                <span class="m-b-3">최차장</span>
                                                <br/>
                                                <span class="m-b-3 font-weight-bold">참조 : </span>
                                               	<span>사원 </span>
                                               	<span>김사원, </span>
                                               	<span>대리 </span>
                                               	<span>이대리, </span>
                                               	<span>과장 </span>
                                               	<span>박과장</span>
                                            </div>
                                            
                                        </div>
                                        <hr>
                                        <div class="media mb-4 mt-1">
                                            <div class="media-body">
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