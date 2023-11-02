<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html id="startPage" lang="en">
<!DOCTYPE html>
<html id="startPage" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>막내온탑 >v<</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/employee/dataTable.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/employee/employeeFilter.js"></script>
	
	<style>
		.fa-close {
		  background-color: transparent;
		}
		
		.paddingright{
			padding-right:5%;
		}
	</style>	
	<script>
	    function prepareModify(empId) {
	    	$.ajax({
	            url: 'http://localhost:8080/otipms/employeeManagement/employeeInfoJson', // 해당 URL은 실제로 사용하는 URL로 변경해야 합니다.
	            type: 'GET',
	            data: { empId: empId },
	            success: function (data) {
	                // 요청이 성공하면 모달 내용을 업데이트
	                updateModalContent(data);
	            },
	            error: function () {
	                // 요청 실패 시 예외 처리
	                alert('사원 정보를 불러오는 중 문제가 발생했습니다.');
	            }
	        });
		}
	    function updateModalContent(employeeData) {
	        // employeeData를 사용하여 모달 내용 업데이트
	        $('#modifyInfo .modal-title').text('인력 정보 수정');
	        $('#nowEmpId').val(employeeData.empId);
	        $('#nowEmpName').val(employeeData.empName);
	        $('#nowEmpTel').val(employeeData.empTel);
	        $('#nowEmpEmail').val(employeeData.empEmail);
	        $('#nowEmpRank').val(employeeData.empRank);
	        $('#nowEmpRank').text(employeeData.empRank);
	        $('#nowProject').val(employeeData.projectNo);
	        $('#nowProject').text(employeeData.projectName);
	        $('#nowTeam').val(employeeData.teamNo);
	        $('#nowTeam').text(employeeData.teamName);
	        $('#nowRole').val(employeeData.role);
	        $('#nowRole').text(employeeData.role);

	        // 모달 열기
	        $('#modifyInfo').modal('show');
	    }
	</script>
	<script>
		function alertBeforePwReset(){
			var empId = document.getElementById("nowEmpId").value;
			console.log(" 여기서 콘솔로 나오는 EMPID: "+ empId);
			var reset = confirm("비밀번호를 초기화 하시겠습니까?");
			if(reset){
				$.ajax({
					url:'http://localhost:8080/otipms/employeeManagement/resetEmpPassword',
					type:'POST',
					data:{empId: empId},
					success:function(){
						alert("비밀번호가 초기화 되었습니다.");
					},
					error: function(){
						alert("비밀번호 초기화 실패");
					}
				})
			}
		}
	</script>
	<script>
		function alertBeforeDisableEmp(empId){
			var disable = confirm("해당 사용자를 삭제하시겠습니까?");
			if(disable){
				$.ajax({
					url : "/otipms/employeeManagement/disableEmployee",
					type: "POST",
					data: {empId:empId},
					success: function(data){
						alert("사용자가 삭제 되었습니다.");
						console.log(data);
						location.href=data;
					},
					error:function(){
						alert("삭제 실패.");
					}
				})
			}
		}
	</script>
</head>

<body>
 <%@include file="/WEB-INF/views/headernsidebar.jsp" %>
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body" style="min-height: 1000px;">

            <!-- <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div> -->
            <!-- row -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4><span style="position:relative; left:30px;"><b>인력 관리</b></span></h4>
                                <!-- <span style="float: right;">
                                	<a href="addAndModifyEmployee">
                                		<button type="button" class="btn btn-primary" style="position:relative; right:40px;">등록</button>
                                	</a>
                                </span> -->
                                <span style="float: right;">
                               		<button type="button" class="btn btn-primary" style="position:relative; right:40px;" data-toggle="modal" data-target="#singleRegister" data-whatever="@mdo">개별 등록</button>
                                </span>
                                <span style="float: right; ">
                               		<button type="button" class="btn btn-primary" style="margin-right:10px; position:relative; right:40px;" data-toggle="modal" data-target="#multiRegister" data-whatever="@mdo">일괄 등록</button>
                                </span>
								<div class="col-lg-3" style="display:inline-block; margin-left:15px;">
								    <%-- <select class="form-control" id="projectSelect" name="projectSelect">
								        <option value="">프로젝트 선택</option>
							        	<c:forEach var="oneProjectTeams" items="${projectTeams }" varStatus="pts_project">
						        			<option value="html">${oneProjectTeams.project.projectName }</option>
								         </c:forEach>
								    </select> --%>
								    <select id="project-dropdown">
							            <option value="">프로젝트 선택</option>
							        </select>
							        <div class="product_names">
							        
							        </div>
								</div>
								<div class="col-lg-2"  style="display:inline-block;">
						 			<%-- <c:forEach var="oneProjectTeams" items="${projectTeams }" varStatus="pts_team">
		                                <select class="form-control" id="projectSelect" name="projectSelect">
		                                    <option value="">팀 선택</option>
		                                    <c:forEach var="oneProjectTeam" items="${oneProjectTeams.teamList }" varStatus="pt_team">
		                                    	<option value="html">${oneProjectTeam.teamName}</option>
		                                    </c:forEach>
		                                </select>
	                                </c:forEach> --%>
	                                <select id="team-dropdown">
							            <option value="">팀 선택</option>
							        </select>
	                            </div>
                                <div class="table-responsive">
                                    <table class="table table-striped datatables-products table-bordered zero-configuration">
                                        <thead>
                                            <tr>
                                                <th>사원번호</th>
                                                <th>사원 명</th>
                                                <th>직책</th>
                                                <th>연락처</th>
                                                <th>프로젝트</th>
                                                <th>팀</th>
                                                <th>권한</th>
                                                <th class="text-center">수정</th>
                                                <th class="text-center">삭제</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <div class="modal fade" id="modifyInfo" tabindex="-1" role="dialog" aria-labelledby="singleRegisterLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="singleRegisterLabel">인력 정보 수정</h5>
			            </div>
			            <div class="modal-body">
			                <form class="form-valide" action="modifySingleEmployeeInfo" method="post" id="modifySingleEmployeeInfo">
			                	<input type="hidden" id="nowEmpId" name="empId"></input>
	                            <div class="form-group row">
	                                <label class="col-lg-4 col-form-label" for="val-username">이름
	                                </label>
	                                <div class="col-lg-7">
	                                    <input type="text" class="form-control" id="nowEmpName" name="nowEmpName" placeholder="Enter a username..">
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-4 col-form-label" for="positionSelect">직책</label>
	                             <div class="col-lg-7">
	                                 <select class="form-control" id="positionSelect" name="nowEmpRank">
	                                     <option value="" id="nowEmpRank"></option>
	                                     <option value="사원">사원</option>
	                                     <option value="대리">대리</option>
	                                     <option value="과장">과장</option>
	                                     <option value="차장">차장</option>
	                                     <option value="부장">부장</option>
	                                     <option value="이사">이사</option>
	                                     <option value="고객">고객</option>
	                                 </select>
	                             </div>
	                            </div>
	                            <div class="form-group row">
	                                <label class="col-lg-4 col-form-label" for="phoneNumber">연락처 
	                                </label>
	                                <div class="col-lg-7">
	                                    <input type="text" class="form-control" id="nowEmpTel" name="nowEmpTel" placeholder="010-xxxx-xxxx">
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                                <label class="col-lg-4 col-form-label" for="emailAddress">이메일 
	                                </label>
	                                <div class="col-lg-7">
	                                    <input type="text" class="form-control" id="nowEmpEmail" name="nowEmpEmail" placeholder="aaa@AAA.com">
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-4 col-form-label" for="projectSelect">프로젝트 </label>
	                             <div class="col-lg-7">
	                                 <select class="form-control" id="project-dropdown-modal" name="nowProject">
							            <option value="" id="nowProject"></option>
							        </select>
	                             </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-4 col-form-label" for="teamSelect">팀</label>
	                             <div class="col-lg-7">
	                                 <select class="form-control" id="team-dropdown-modal" name="nowTeam">
							            <option value="" id="nowTeam">팀 선택</option>
							        </select>
	                             </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-4 col-form-label" for="authoritySelect">권한</label>
	                             <div class="col-lg-7">
	                                 <select class="form-control" id="projectSelect" name="nowRole">
	                                     <option value="" id="nowRole"></option>
	                                     <option value="ROLE_PE">ROLE_PE</option>
	                                     <option value="ROLE_PM">ROLE_PM</option>
	                                     <option value="ROLE_ADMIN">ROLE_ADMIN</option>
	                                     <option value="ROLE_CLIENT">ROLE_CLIENT</option>
	                                 </select>
	                             </div>
	                            </div>
	                            <div class="form-group row">
	                                <label class="col-lg-4 col-form-label" for="phoneNumber"> 비밀번호 초기화
	                                </label>
	                                <div class="col-lg-7">
	                                	<button type="button" class="btn btn-primary" onclick="alertBeforePwReset()">초기화 하기</button>
	                                </div>
	                            </div>
	                        </form>
			            </div>
			            <div class="modal-footer">
			            	<button type="submit" class="btn btn-primary" form="modifySingleEmployeeInfo">수정</button>
			                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			            </div>
			        </div>
			    </div> 	
			</div>
            <div class="modal fade" id="singleRegister" tabindex="-1" role="dialog" aria-labelledby="singleRegisterLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="singleRegisterLabel">인력 개별 등록</h5>
			            </div>
			            <div class="modal-body">
			                <form id="singleRegisterForm"class="form-valide" action="${pageContext.request.contextPath}/employeeManagement/singleResgister" method="post">
	                            <div class="form-group row">
	                                <label class="col-lg-3 col-form-label" for="registerEmpName">이름
	                                </label>
	                                <div class="col-lg-7">
	                                    <input type="text" class="form-control" id="registerEmpName" name="registerEmpName" placeholder="Enter a username..">
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-3 col-form-label" for="registerPosition">직책</label>
	                             <div class="col-lg-7">
	                                 <select class="form-control" id="registerPosition" name="registerPosition">
	                                     <option value="">직책 선택</option>
	                                     <option value="사원">사원</option>
	                                     <option value="대리">대리</option>
	                                     <option value="과장">과장</option>
	                                     <option value="차장">차장</option>
	                                     <option value="부장">부장</option>
	                                     <option value="이사">이사</option>
	                                     <option value="고객">고객</option>
	                                 </select>
	                             </div>
	                            </div>
	                            <div class="form-group row">
	                                <label class="col-lg-3 col-form-label" for="registerPhoneNumber">연락처 
	                                </label>
	                                <div class="col-lg-7">
	                                    <input type="text" class="form-control" id="registerPhoneNumber" name="registerPhoneNumber" placeholder="010-xxxx-xxxx">
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-3 col-form-label" for="registerProject">프로젝트 </label>
	                             <div class="col-lg-7">
	                                 <select class="form-control" id="project-dropdown-modal-register" name="registerProject">
	                                     <option value="">프로젝트 선택</option>
	                                 </select>
	                             </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-3 col-form-label" for="registerTeam">팀</label>
	                             <div class="col-lg-7">
	                                 <select class="form-control" id="team-dropdown-modal-register" name="registerTeam">
	                                     <option value="">팀 선택</option>
	                                 </select>
	                             </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-3 col-form-label" for="registerAuthority">권한</label>
	                             <div class="col-lg-7">
	                                 <select class="form-control" id="registerAuthority" name="registerAuthority">
	                                     <option value="">권한 선택</option>
	                                     <option value="ROLE_PE">ROLE_PE</option>
	                                     <option value="ROLE_PM">ROLE_PM</option>
	                                     <option value="ROLE_ADMIN">ROLE_ADMIN</option>
	                                     <option value="ROLE_CLIENT">ROLE_CLIENT</option>
	                                 </select>
	                             </div>
	                            </div>
	                        </form>
			            </div>
			            <div class="modal-footer">
			            	<button type="submit" form="singleRegisterForm" class="btn btn-primary">등록</button>
			                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			            </div>
			        </div>
			    </div> 	
			</div>
			<div class="modal fade" id="multiRegister" tabindex="-1" role="dialog" aria-labelledby="multiRegisterLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content" style="width:1000px;">
			            <div class="modal-header">
			                <h5 class="modal-title" id="multiRegisterLabel">일괄 등록</h5>
			            </div>
			           <%--  <form id="multiRegisterBtn" method="post" class="dropzone" action="${pageContext.request.contextPath}/multiRegister" enctype="multipart/form-data"> --%>
			            <form id="multiRegisterBtn" method="post" class="dropzone" action="#" enctype="multipart/form-data">
				            <div class="form-group row ml-2 mt-3">
	                            <label class="col-lg-3 col-form-label" for="val-username">프로젝트 명<br>(엑셀 시트명)
	                            </label>
	                            <div class="col-lg-7">
	                                <input type="text" class="form-control" id="excelSheetName" name="excelSheetName" placeholder="프로젝트 명 입력">
	                            </div>
	                        </div>
	                        <div class="modal-body">
		                        <div class="form-group">
		                            <div class="fallback">
		                                <input class="l-border-1" name="file" type="file">
		                            </div>
		                        </div>
				            </div>
			            </form>
			            <table class="table">
			            	<thead>
			            		<tr>
			            			<td>no.</td>
			            			<td>사원 명</td>
			            			<td>직급</td>
			            			<td>전화번호</td>
			            			<td>프로젝트 명</td>
			            			<td>팀 명</td>
			            			<td>권한</td>
			            			<td>회사 명</td>
			            			<td>이메일</td>
			            		</tr>
			            	</thead>
			            	<tbody id="checkMultiRegister">
			            	
			            	</tbody>
			            </table>
			            <div class="modal-footer">
			            	<button onclick="multiRestRegister()" class="btn btn-primary">등록</button>
<!-- 			            	<button onclick="multiRestRegister()" class="btn btn-primary" data-dismiss="modal">등록</button> -->
			                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			            </div>
			            <script>
				            function multiRestRegister() {
				                // FormData 객체 생성
				                var formData = new FormData($('#multiRegisterBtn')[0]);
	
				                $.ajax({
				                    url: '/otipms/restMultiRegister',
				                    type: 'POST',
				                    data: formData,
				                    processData: false, // 데이터 처리 방식을 false로 설정
				                    contentType: false, // 컨텐츠 타입을 false로 설정
				                    success: function(data) {
				                        // 성공 처리
				                        console.log(data);
				                        updateTable(data);
				                    },
				                    error: function() {
				                        // 실패 처리
				                        console.log('파일 업로드 실패');
				                    }
				                });
				            }
				            
				            function updateTable(data) {
				                var table = $('#checkMultiRegister');
				                table.empty(); // 현재 테이블 내용을 비웁니다.

				                // data를 파싱하고 테이블에 삽입합니다.
				                data.forEach(function(item, index) {
				                    var row = '<tr>' +
				                        '<td>' + (index+1) + '</td>' +
				                        '<td>' + item["0"] + '</td>' +
				                        '<td>' + item["1"] + '</td>' +
				                        '<td>' + item["2"] + '</td>' +
				                        '<td>' + item["3"] + '</td>' +
				                        '<td>' + item["4"] + '</td>' +
				                        '<td>' + item["5"] + '</td>' +
				                        '<td>' + item["6"] + '</td>' +
				                        '<td>' + item["7"] + '</td>' +
				                        '</tr>';

				                    table.append(row);
				                });
				            }
			            </script>
			        </div>
			    </div>
			</div>
<%-- 			<div class="modal fade" id="multiRegister" tabindex="-1" role="dialog" aria-labelledby="multiRegisterLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="multiRegisterLabel">일괄 등록</h5>
			            </div>
			            <form id="multiRegisterBtn" method="post" class="dropzone" action="${pageContext.request.contextPath}/multiRegister" enctype="multipart/form-data">
				            <div class="form-group row ml-2 mt-3">
	                            <label class="col-lg-3 col-form-label" for="val-username">프로젝트 명<br>(엑셀 시트명)
	                            </label>
	                            <div class="col-lg-7">
	                                <input type="text" class="form-control" id="excelSheetName" name="excelSheetName" placeholder="프로젝트 명 입력">
	                            </div>
	                        </div>
	                        <div class="modal-body">
		                        <div class="form-group">
		                            <div class="fallback">
		                                <input class="l-border-1" name="file" type="file">
		                            </div>
		                        </div>
				            </div>
			            </form>
			            <div class="modal-footer">
			            	<button form="multiRegisterBtn" onclick="form.submit()" class="btn btn-primary" data-dismiss="modal">등록</button>
			                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			            </div>
			        </div>
			    </div>
			</div> --%>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div>
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