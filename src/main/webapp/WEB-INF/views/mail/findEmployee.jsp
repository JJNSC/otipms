<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>사원 찾기</title>
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
	
	<!-- selector -->
	<link href="${pageContext.request.contextPath}/resources/css/mail/prism.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/mail/prism.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/mail/select2.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/mail/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mail/custom.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mail/findEmployee.js"></script>
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
                                    <div class="compose-content mt-5 mb-5">
                                        <form action="#">
                                            <div>
										        <label class="text-dark font-weight-medium">부서</label>
										        <div class="dropdown" id="dropdown1">
												    <select>
												      <option value="" disabled selected>Select an option</option>
												      <option value="option1">Option 1</option>
												      <option value="option2">Option 2</option>
												      <option value="option3">Option 3</option>
												    </select>
											  	</div>
										    </div>
                                        </form>
                                        <div class="message read message-1">
											<div class="col-mail col-mail-1">
												<div class="email-checkbox">
													<input type="checkbox" id="chk2">
													<label class="toggle" for="chk2"></label>
												</div>
												<span class="icon-copy star ion-ios-star-outline" onclick="checkimportant(1, event)"></span>
												<span class="icon-copy mail ion-android-mail" onclick="checkread(1, event)"></span>
											</div>
											<div class="col-mail col-mail-profile">
												<div class="profile">
													<img src="/otipms/resources/images/users/2.jpg" height="40" width="40">
													<span class="rank">사원</span>
													<span class="name">김사원</span>
												</div>
											</div>
											<a href="detailMail">
												<div class="col-mail col-mail-2">
													<div class="subject">동아일보 중딩한테 털렸죠? 아무고토 모타쥬?</div>
													<div class="clip">
														<span class="icon-copy ion-paperclip mr-5"></span>
													</div>
													<div class="date">10분 전</div>
												</div>
											</a>
										</div>
                                    </div>
                                    <div class="text-left m-t-15">
                                        <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="button">
                                        	<i class="fa fa-paper-plane m-r-5"></i>
                                        	 Send
                                        </button>
                                        <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="button" data-toggle="modal" data-target="#modalGrid">
                                        	<i class="fa fa-archive m-r-5"></i>
                                        	 Temporary Save
                                        </button>
                                        <button class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" type="button">
                                        	<i class="ti-close m-r-5 f-s-12"></i>
                                        	Discard
                                        </button>
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
	<div class="modal fade" id="modalGrid">
    	<div class="modal-dialog" role="document">
        	<div class="modal-content">
            	<div class="modal-header">
                	<h5 class="modal-title">쪽지 임시 저장</h5>
                </div>
                <div class="modal-body">
                	<div class="container-fluid">
                    	<div class="row">
	                       	쪽지를 임시 저장하시겠습니까?
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                	<button type="button" class="btn btn-primary" onclick="checksave()">저장</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
	</div>
</body>

</html>