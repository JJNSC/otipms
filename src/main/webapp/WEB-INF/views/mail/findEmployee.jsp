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
    <link href="${pageContext.request.contextPath}/resources/css/mail/customStyle.css" rel="stylesheet">
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
        <div class="content-body">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="compose-content mt-5 mb-5">
                                   	<div>
								        <select id="project-dropdown">
								            <option value="">프로젝트 선택</option>
								        </select>
								        <select id="team-dropdown">
								            <option value="">팀 선택</option>
								        </select>
								        <select id="position-dropdown">
								            <option value="">직급 선택</option>
								        </select>
								    </div>
								    <div id="radio-buttons" class="mt-3">
									    <label><input type="radio" name="recipient" value="Recipient">수신</label>
									    <label><input type="radio" name="recipient" value="Reference">참조</label>
									    <label><input type="radio" name="recipient" value="BlindCopy">비밀참조</label>
									</div>
                                    <hr>
                                    <div class="tab-content">
                                        <div class="tab-pane fade show active" id="project1" role="tabpanel">
                                            <div class="p-t-15">
                                            	 <div class="table-responsive">
				                                    <table class="table table-hover table-custom" style="width:96%;">
				                                        <thead>
				                                            <tr>
				                                                <th class="text-center"><input type="checkbox" id="selectAllCheckbox"></th>
				                                                <th class="text-center">프로젝트 명</th>
				                                                <th class="text-center">팀 명</th>
				                                                <th class="text-center">직급</th>
				                                                <th class="text-left ">이름</th>
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
                                        <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="button" onclick="sendSelectedEmployees()">
                                        	<i class="fa fa-paper-plane m-r-5"></i>
                                        	 OK
                                        </button>
                                        <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="button" onclick="closeWindow()">
                                        	<i class="ti-close m-r-5"></i>
                                        	 cancel
                                        </button>
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
    </div>
</body>

</html>