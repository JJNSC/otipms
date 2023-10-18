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
    <link href="${pageContext.request.contextPath}/resources/css/mail/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/customStyle.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mail/dropzone.css" rel="stylesheet" type="text/css">
  
    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/resources/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/styleSwitcher.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/dropzone.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/writemail.js"></script>
    
    <!-- Editer -->
	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	
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
                                    	<a href="receivedMail" class="list-group-item border-0 text-primary p-r-0">
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
                                    <div class="compose-content mt-5 mb-5">
                                        <form action="#">
                                            <div class="form-group">
                                                <input type="text" class="form-control bg-transparent" placeholder=" To">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control bg-transparent" placeholder=" Subject">
                                            </div>
                                            <div class="form-group">
												<textarea id="myEditor" name="myEditor" class="form-control border-radius-0" placeholder="Enter text ..."></textarea>
                                            	<script>
													var ckeditor_config = {
													  resize_enaleb : false,
													  enterMode : CKEDITOR.ENTER_BR,
													  shiftEnterMode : CKEDITOR.ENTER_P
													};
													CKEDITOR.replace("myEditor", ckeditor_config);
												</script>
                                            </div>
                                        </form>
                                        <div class="pd-20 card-box mb-30">
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
                                    <div class="text-left m-t-15">
                                        <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="button"><i class="fa fa-paper-plane m-r-5"></i> Send</button>
                                        <button class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" type="button"><i class="ti-close m-r-5 f-s-12"></i> Discard</button>
                                    </div>
                                </div>
                                <div class="bootstrap-wysihtml5-insert-link-modal modal fade bs-example-modal-lg" style="display: none;" aria-hidden="true">
                                	<div class="modal-dialog modal-lg">
                                		<div class="modal-content">
                                			<div class="modal-header">
                                				<a class="close" data-dismiss="modal"></a>
                                				<h3>Insert link</h3>
                                			</div>
                                			<div class="modal-body">
                                				<div class="form-group">
                                					<input value="http://" class="bootstrap-wysihtml5-insert-link-url form-control" type="text">
                                				</div>
                                			</div>
                                			<div class="modal-footer">
                                				<a href="#" class="btn btn-inverse" data-dismiss="modal">Cancel</a>
                                				<a href="#" class="btn btn-primary" data-dismiss="modal">Insert link</a>
                                			</div>
                                		</div>
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

</body>

</html>