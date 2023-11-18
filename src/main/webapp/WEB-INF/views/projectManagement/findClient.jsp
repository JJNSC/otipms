<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>고객 찾기</title>
    <!-- Favicon icon -->
    <%-- <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png"> --%>
    <link rel="icon" type="image/jpeg" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/otipmsFavicon.png">
    
   <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/mail/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mail/customStyle.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mail/dropzone.css" rel="stylesheet" type="text/css">
  
    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/resources/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/styleSwitcher.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/dropzone.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/project/selectClient.js"></script>
    
    <!-- Editer -->
	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	
	<!-- selector -->
	<link href="${pageContext.request.contextPath}/resources/css/mail/prism.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/mail/prism.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/mail/select2.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/mail/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mail/custom.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/project/findClient.js"></script>
</head>

<body>
    <div id="main-wrapper">
        <!-- <div class="content-body"> -->
        <div style="height:400px;margin-top:10px;">
            <!-- div class="container-fluid"> -->
            <div style="width:100%;padding-right:15px;padding-left:15px;margin-left:auto;margin-right:auto;height:400px;">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                        	<div style="background-color: #11407a;height:60px;">
                        		<h4 class="mt-3 ml-2" style="color:#fff;"><img src="${pageContext.request.contextPath}/resources/images/otipmsCube.jpg" style="height: 30px;" alt="">고객 찾기</h4>
                        	</div>
                            <div class="card-body" style="padding-top:0px;">
                                <div class="compose-content">
                                    <div class="tab-content">
                                        <div class="tab-pane fade show active" id="project1" role="tabpanel">
                                            <div class="p-t-15">
                                            	 <div class="table-responsive">
				                                    <table class="table table-hover table-custom" style="width:96%;">
				                                        <thead>
				                                            <tr>
				                                                <th class="text-center"><!-- <input type="checkbox" id="selectAllCheckbox"> --></th>
				                                                <th class="text-center">사원번호</th>
				                                                <th class="text-left ">이름</th>
				                                                <th class="text-center">직급</th>
				                                                <th class="text-center">권한</th>
				                                                <th class="d-none">권한</th>
				                                                <th class="d-none">권한</th>
				                                            </tr>
				                                        </thead>
				                                        <tbody id="employee-list">
				                                        	
				                                        </tbody>
				                                    </table>
		                                		</div>
                                       		</div>
                                   		</div>
                                   	</div>
                                    <div class="text-left m-t-15">
                                        <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="button" style="height: 35px;" onclick="sendSelectedEmployees()" >
                                        	<!-- <i class="fa fa-paper-plane m-r-5"></i> -->
                                        	<i class="icon-copy fa fa-check" aria-hidden="true"></i>
                                        	 확인
                                        </button>
                                        <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="button" style="height: 35px;" onclick="closeWindow()">
                                        	<!-- <i class="ti-close m-r-5"></i> -->
                                        	<i class="icon-copy fa fa-close" aria-hidden="true"></i>
                                        	 취소
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>