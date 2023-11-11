<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>사원 찾기</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Favicon icon -->
    <%-- <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png"> --%>
    <link rel="icon" type="image/jpeg" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/otipms_fav.jpg">
    
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
	<script src="${pageContext.request.contextPath}/resources/js/task/selectTaskEmployee.js"></script>
    
    <!-- Editer -->
	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	
	<!-- selector -->
	<link href="${pageContext.request.contextPath}/resources/css/mail/prism.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/mail/prism.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/mail/select2.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/mail/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mail/custom.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/task/findTaskEmployee.js"></script>
</head>

<body>
    <div id="main-wrapper">
        <div class="content-body">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                            	<div class="card-title">
                            		<h4 style="font-weight: bolder;">사원 찾기</h4>
                            	</div>
                                <div class="compose-content">
                                   	<!-- <div>
								        <select id="project-dropdown">
								            <option value="">프로젝트 선택</option>
								        </select>
								        <select id="team-dropdown">
								            <option value="">팀 선택</option>
								        </select>
								        <select id="position-dropdown">
								            <option value="">직급 선택</option>
								        </select>
								    </div> -->
								    <div class="row mb-3">
								    	<div class="col-6 pr-0">
									        <select id="project-dropdown" style="width: 100%;">
									            <option value="">프로젝트 선택</option>
									        </select>
								    	</div>
								    	<div class="col-3 pr-0">
									        <select id="team-dropdown" style="width: 100%;">
									            <option value="">팀 선택</option>
									        </select>
								    	</div>
								    	<div class="col-3 pr-0">
									        <select id="position-dropdown" style="width: 87%;">
									            <option value="">직급 선택</option>
									        </select>
								    	</div>
								    </div>
                                    <!-- <div style="display:inline-block; position: absolute; right: 30px; top: 105px;">
	                                    <input class="form-control" id="hzInput" type="text" placeholder="사원 찾기" style="width:150px;"/>
                                    </div> -->
                                    <div>
	                                    <input class="form-control" id="hzInput" type="text" placeholder="사원 찾기" style="width:197px;"/>
                                    </div>
                                    <hr>
                                    <div class="tab-content">
                                        <div class="tab-pane fade show active" id="project1" role="tabpanel">
                                            <div class="p-t-15">
                                            	 <div class="table-responsive">
				                                    <table class="table table-hover table-custom" style="width:96%;">
				                                        <thead>
				                                            <tr>
				                                                <th class="text-center"></th>
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
                                        <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="button" style="height: 35px;" onclick="sendSelectedEmployees()">
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