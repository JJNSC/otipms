<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html id="startPage" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>OTIPMS</title>
    <!-- Favicon icon -->
    <%-- <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png"> --%>
    <link rel="icon" type="image/jpeg" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/otipmsFavicon.png">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/checkEmployee/dataTable.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/checkEmployee/employeeFilter.js"></script>
	
	<style>
		.fa-close {
		  background-color: transparent;
		}
		
		.paddingright{
			padding-right:5%;
		}
		
		/* 수평 스크롤바 숨김 */
		::-webkit-scrollbar {
		    background: transparent;
		}
	</style>	
	<script>
	    var contextPath = "${pageContext.request.contextPath}";
	</script>
</head>

<body>
	<jsp:include page="../headernsidebar.jsp">
		<jsp:param name="employee" value="${employee}" />
		<jsp:param name="mf" value="${mf}" />
		<jsp:param name="base64Img" value="${base64Img}" />
	</jsp:include>
        <!--**********************************
            Content body start
        ***********************************-->
        <!-- <div class="content-body" style="min-height: 1000px;"> -->
        <div style="height:810px; margin-left: 15.1875rem; margin-top:100px;">

            <!-- <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div> -->
            <!-- row -->
            <input class="d-none" id="contextPage" value="${pageContext.request.contextPath}"></input>
            <!-- <div class="container-fluid"> -->
            <div style="width:100%;padding-right:15px;padding-left:15px;margin-left:auto;margin-right:auto;margin-top:1rem;height:810px;">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                            	<div class="card-title">
                                	<h4 class="ml-4" style="font-weight: bolder;">인력 조회</h4>
                                </div>
                                <!-- <h4 style="font-weight: bolder;"><span style="position:relative; left:30px;">인력 조회</span></h4> -->
								<div class="col-lg-3" style="display:inline-block; margin-left:15px;">
								    <select class="form-control" id="project-dropdown" name="project-dropdown">
							            <option value="">프로젝트 선택</option>
							        </select>
								</div>
								<div class="col-lg-2"  style="display:inline-block;">
						 			
	                                <select id="team-dropdown" class="form-control">
							            <option value="">팀 선택</option>
							        </select>
	                            </div>
                                <div class="table-responsive">
                                    <table id="employeeTable" class="table table-striped datatables-products table-bordered zero-configuration">
                                        <thead>
                                            <tr>
                                                <th>사원번호</th>
                                                <th>사원 명</th>
                                                <th>직책</th>
                                                <th>연락처</th>
                                                <th>프로젝트</th>
                                                <th>팀</th>
                                                <th>쪽지</th>
                                            </tr>
                                        </thead>
                                    </table>
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
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <!-- <div class="copyright">
                <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div> -->
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
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
    
    <script src="${pageContext.request.contextPath}/resources/plugins/tables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>

</body>
</html>
</html>