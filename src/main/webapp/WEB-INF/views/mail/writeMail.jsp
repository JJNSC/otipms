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
	<!-- <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" /> -->
  
    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/resources/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/styleSwitcher.js"></script>
    <%-- <script src="${pageContext.request.contextPath}/resources/js/mail/dropzone.js"></script> --%>
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/writemail.js"></script>
    
    <!-- Editer -->-
	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	
	<!-- selector -->
	<link href="${pageContext.request.contextPath}/resources/css/mail/prism.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/mail/prism.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/mail/select2.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/mail/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mail/custom.js"></script>
</head>

<body>
    <div id="main-wrapper">
        <div class="content-body">
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
	                                <div class="text-left m-t-15">
                                        <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" 
                                        		type="button" 
                                        		onclick="javascript:void(window.open('findEmployee','_blank','width=600, height=600, left=600, top=30'))">
                                        	<i class="fa fa-paper-plane m-r-5"></i>
                                        	 사원 찾기
                                        </button>
                                    </div>
                                    <div class="compose-content mt-5 mb-5">
                                        <form action="#">
                                            <div>
										        <label class="text-dark font-weight-medium">수신자</label>
										        <div class="form-group row">
													<div class="col-sm-12 col-md-10">
									                    <div class="selected-employees" id="selectedRecipientEmployees">
									                    </div>
									                    <input type="text" id="selectedRecipientTextbox" style="display:none;">
									                </div>
												</div>
										    </div>
										    <div>
										        <label class="text-dark font-weight-medium">참조</label>
										        <div class="form-group row">
													<div class="col-sm-12 col-md-10">
									                    <div class="selected-employees" id="selectedReferenceEmployees">
									                    </div>
								                    	<input type="text" id="selectedReferenceTextbox" style="display:none;">
													</div>
												</div>
										    </div>
										    <div>
										        <label class="text-dark font-weight-medium">비밀 참조</label>
										        <div class="form-group row">
													<div class="col-sm-12 col-md-10">
														<div class="selected-employees" id="selectedBlindCopyEmployees">
									                    </div>
								                    	<input type="text" id="selectedBlindCopyTextbox" style="display:none;">
													</div>
												</div>
										    </div>
                                            <div class="form-group">
                                            	<label class="text-dark font-weight-medium">제목</label>
                                                <input id="mailTitleInput" type="text" class="form-control bg-transparent" placeholder=" 제목을 입력하세요">
                                            </div>
                                            <div class="form-group">
												<textarea id="myEditor" name="myEditor" class="form-control border-radius-0" placeholder="내용을 입력하세요"></textarea>
                                            	<script>
													var ckeditor_config = {
													  resize_enable : false,
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
											<form class="dropzone dz-clickable" id="my-awesome-dropzone">
												<div class="dz-default dz-message">
													<span>파일을 드롭하거나, 클릭하여 업로드 하세요</span>
												</div>
											</form>
											<script>
												Dropzone.autoDiscover = false; // deprecated 된 옵션. false로 해놓는걸 공식문서에서 명시
												const dropzone = new Dropzone('form#my-awesome-dropzone', {
													url: 'http://localhost:8080/otipms/mail/upload',
													method: 'post',
													autoProcessQueue: true,
													createImageThumbnails: true,
													clickable: true,
													autoQueue: false,
													thumbnailHeight: 120, 
												    thumbnailWidth: 120,
												    maxFilesize: 30,
												    uploadMultiple: false,
												    addRemoveLinks: true, 
												    dictRemoveFile: '삭제'
												});
												
												const uploadedFiles = [];
												// 업로드 시작 이벤트 리스너
											    dropzone.on("addedfile", function(file) {
											        // 파일이 추가될 때 업로드 대기열을 처리
											        console.log("파일이 추가되었습니다.", file);
											        console.log(file.name);
											        console.log(file.type);
											        
											        const reader = new FileReader();
											        reader.onload = function () {
											            // 파일 데이터 (base64 내용)이 여기에서 사용 가능합니다.
											            const base64Data = reader.result;
											            console.log("파일 데이터 (Base64):", base64Data);
											            // 필요한 경우 추가 처리를 수행하거나 데이터를 저장할 수 있습니다.
											            
											            const fileInfo = {
											                    name: file.name,
											                    type: file.type,
											                    data: base64Data,
											                };
											        	uploadedFiles.push(fileInfo);
											        };
											        
											        // 파일을 base64 문자열로 읽기
											        reader.readAsDataURL(file);
											        dropzone.processQueue();
											    });
												
											    dropzone.on("removedfile", function(file) {
											        const fileName = file.name;
											        const fileIndex = uploadedFiles.findIndex((info) => info.name === fileName);
											        if (fileIndex !== -1) {
											            uploadedFiles.splice(fileIndex, 1);
											        }
											    });

											</script>
										</div>
                                    </div>
                                    <div class="text-left m-t-15">
                                       	<input id="memIdSpan" type="hidden" value="${employee.empId}"/>
                                        <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="button" onclick="sendMail()">
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
                                <div class="row mt-3">
                                    
                                </div>
                            </div>
                        </div>
                	</div>
                </div>
            </div>
        </div>
    </div>
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