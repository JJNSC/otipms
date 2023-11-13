<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html id="htmlTest" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>OTIPMS</title>
    <!-- Favicon icon -->
    <%-- <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png"> --%>
    <link rel="icon" type="image/jpeg" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/otipmsFavicon.png">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/projectList.css" rel="stylesheet">
    
    <script src="${pageContext.request.contextPath}/resources/js/task/task.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/task/selectTaskEmployee.js"></script>
    
    <script>
	    	/* window.onload = function() {
			today = new Date();
			console.log("today.toISOString() >>>" + today.toISOString());
			today = today.toISOString().slice(0, 10);
			console.log("today >>>> " + today);
			bir = document.getElementById("startDate");
			bir.value = today;
		} */
		/* $(document).ready(function() {
			conosole.log("되니?");
			
			$('.projectNo').on('click', function() {
		    	const close = $('.show');
		    	if(close != null) {
		    		close.collapse('toggle');
		    	}
		        const target = $(this).data('target');
		        $(target).collapse('toggle');
		    });
		}); */
	</script>
	
	<style>
		.fa-trash-o {
		  background-color: transparent;
		}
		
		.paddingright{
			padding-right:5%;
		}
		
		.noHover{
			background-color: #fff;
		}
		.noHover:hover{
			background-color: #fff;
		}
		.no-left-border {
		  border-left: none; /* 왼쪽 테두리 제거 */
		}
		
		/* .taskTable td {
			line-height: 1.8;
			vertical-align: middle;
		} */
		
		.card {
		    /* margin-bottom: 30px; */
		    border: 0px;
		    border-radius: 0.625rem;
		    box-shadow: 6px 11px 41px -28px #B5C4D6;
		}
		
		.textarea_editor {
			min-height: 145px;
		}
		
		.btn-primary.disabled, .btn-primary:disabled {
		    color: #fff;
		    /* background-color: #7571f9;
		    border-color: #7571f9; */
		    background-color: #2f588b;
		    border-color: #2f588b; 
		}
		
		.text-secondary {
			color: #b5b5b5;
		}
		.text-success {
			color: #2b5797;
		}
		.text-danger {
			color: #00aba9;
		}
		
		/* 수직 스크롤바 숨김 */
		::-webkit-scrollbar {
		    width: 0;
		}
		
		/* 수평 스크롤바 숨김 */
		::-webkit-scrollbar-thumb {
		    background: transparent;
		}
	</style>	

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
        <!-- <div class="content-body"> -->
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
            <!-- <div class="container-fluid"> -->
            <div style="width:100%;padding-right:15px;padding-left:15px;margin-left:auto;margin-right:auto;margin-top:1rem;height:810px;">
                <div class="row">
                    <!-- /# column -->
                    <div class="col-7" style="padding-right: 0px;">
                        <div class="card card-custom">
                            <div class="card-body">
                                <div class="card-title">
                                	<h4 style="font-weight: bolder;">프로젝트 업무 관리</h4>
                                    <input type="hidden" id="loginEmployeeId" value="${employee.empId}">
                                    <input type="hidden" id="loginEmployeeRole" value="${employee.role}">
                                    <c:if test="${employee.role eq 'ROLE_ADMIN' or employee.role eq 'ROLE_PM'}">
	                                    <!-- <span style="float: right">
	                                    	<button type="button" class="btn mt-3 mb-1 btn-primary" onclick="addTask()">추가</button>
	                                    </span> -->
                                    </c:if> 
                                </div>
                                <div class="row my-3">
                                	<!-- 프로젝트 선택 -->
                                	<c:if test="${employee.role eq 'ROLE_ADMIN'}">
                                		<div class="col-lg-4" style="display:inline-block;">
										    <select class="form-control" id="projectSelect" name="projectSelect" onchange="selectProject()">
										    	<!-- <option>프로젝트 선택</option> -->
										    	<c:forEach var="project" items="${projectList}">
										    		<option value="${project.projectNo}">${project.projectName}</option>
										    	</c:forEach>
										        <!-- <option>프로젝트 선택</option>
										        <option value="html">PMS 제작 프로젝트</option>
										        <option value="css">프로젝트 2번째</option>
										        <option value="javascript">본격 취업 프로젝트</option> -->
										    </select>
										</div>
                                	</c:if>
                                	<%-- <c:if test="${employee.role eq 'ROLE_ADMIN'}">
                                		<div class="col-lg-4" style="display:inline-block;">
										    <select class="form-control" id="projectSelect" name="projectSelect" onchange="selectProject()">
										    	<c:forEach var="project" items="${projectList}">
										    		<c:if test="${project.projectNo == firstProject.projectNo}">
											    		<option value="${project.projectNo}" selected>${project.projectName}</option>
										    		</c:if>
										    		<c:if test="${project.projectNo != firstProject.projectNo}">
											    		<option value="${project.projectNo}">${project.projectName}</option>
										    		</c:if>
										    	</c:forEach>
										        <!-- <option>프로젝트 선택</option>
										        <option value="html">PMS 제작 프로젝트</option>
										        <option value="css">프로젝트 2번째</option>
										        <option value="javascript">본격 취업 프로젝트</option> -->
										    </select>
										</div>
                                	</c:if> --%>
                                	<c:if test="${employee.role ne 'ROLE_ADMIN'}">
                                		<div class="col-lg-4" style="display:none;">
										    <select class="form-control" id="projectSelect" name="projectSelect" onchange="selectProject()">
										    	<option selected="selected" value="${project.projectNo}">${project.projectNo}</option>
										    </select>
										</div>
                                	</c:if>
                                	<!-- 팀 선택 -->
									<%-- <div class="col-lg-2" style="display:inline-block;">
		                                 <select class="form-control" id="teamSelect" name="teamSelect" onchange="selectTeam()">
		                                     <option value="팀 선택">팀 선택</option>
		                                     <c:if test="${employee.role ne 'ROLE_ADMIN'}">
		                                     	<c:forEach var="team" items="${teamList}">
										    		<option value="${team.teamNo}">${team.teamName}</option>
										    	</c:forEach>		                                     
		                                     </c:if>
		                                     <!-- <option value="html">개발1팀</option>
		                                     <option value="html">개발2팀</option>
		                                     <option value="html">개발3팀</option> -->
		                                 </select>
		                            </div> --%>
		                            <div class="col-lg-2" style="display:inline-block;">
		                                 <select class="form-control" id="teamSelect" name="teamSelect" onchange="selectTeam()">
		                                     <option value="팀 선택">팀 선택</option>
	                                     		 <c:forEach var="team" items="${teamList}">
									    		 	<option value="${team.teamNo}">${team.teamName}</option>
									    	 	</c:forEach>		                                     
		                                     <!-- <option value="html">개발1팀</option>
		                                     <option value="html">개발2팀</option>
		                                     <option value="html">개발3팀</option> -->
		                                 </select>
		                            </div>
		                            <!-- 프로젝트 기간 -->
		                            <c:if test="${employee.role eq 'ROLE_ADMIN'}">
                                		<div id="projectInfo" class="col-lg-6" style="text-align: right; line-height: 3;">
			                            	<span id="projectName" class="mr-1">${firstProject.projectName} 기간: </span>
			                            	<span>
			                            		<!-- <span id="projectStartDate"></span>
			                            		- 
			                            		<span id="projectEndDate"></span> -->
			                            		<span id="projectStartDate"><fmt:formatDate value="${firstProject.projectStartDate}" pattern="yyyy.MM.dd"/> </span>
			                            		- 
			                            		<span id="projectEndDate"><fmt:formatDate value="${firstProject.projectEndDate}" pattern="yyyy.MM.dd"/></span>
			                            	</span>
			                            </div>
                                	</c:if>
		                            <c:if test="${employee.role ne 'ROLE_ADMIN'}">
                                		<div class="col-lg-10" style="text-align: right; line-height: 3;">
			                            	<span class="mr-1">${project.projectName} 기간:</span>
			                            	<span>
			                            		<fmt:formatDate value="${project.projectStartDate}" pattern="yyyy.MM.dd"/> 
			                            		- 
			                            		<fmt:formatDate value="${project.projectEndDate}" pattern="yyyy.MM.dd"/> 
			                            	</span>
			                            </div>
                                	</c:if>
		                                                 
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                            	<th style="width: 10%;">번호</th>
                                                <th style="width: 26%;">프로젝트</th>
                                                <th style="width: 13%;">팀</th>
                                                <th style="width: 13%;">사원 명</th>
                                                <th style="width: 13%;">직책</th>
                                                <th style="width: 25%;">진척률</th>
                                            </tr>
                                        </thead>
                                        <tbody id="detailTaskList">
                                        <c:if test="${fn:length(taskEmployeeList) != 0}">
                                        	<c:forEach var="taskEmployee" items="${taskEmployeeList}">
	                                            <tr class="reviewTitle table-hover" data-toggle="collapse" data-review-id="${taskEmployee.empId}" id="${'employeeId'}${taskEmployee.empId}" href="${'#task'}${taskEmployee.empId}" role="button" aria-expanded="false" aria-controls="collapseExample" onclick="taskEmployeeTr(this)">
	                                                <td>${taskEmployee.empId}</td>
	                                                <td>${taskEmployee.projectName}</td>
	                                                <td>${taskEmployee.teamName}</td>
	                                                <td>${taskEmployee.empName}</td>
	                                                <td>${taskEmployee.empRank}</td>
	                                                
                                                	<td class="progressTd">
		                                                <c:if test="${taskEmployee.progressRate < 20}">
															<h5 class="mt-3"> <i class="icon-copy fa fa-frown-o" aria-hidden="true"></i><span class="float-right">${taskEmployee.progressRate}%</span></h5>
		                                                	<div class="progress" style="height: 9px">
							                                    <div class="progress-bar wow progress-" style="width: ${taskEmployee.progressRate}%; background-color:#dd2c00;" role="progressbar"><span class="sr-only">60% Complete</span></div>
							                                </div>
		                                                </c:if>
		                                                <c:if test="${20 <= taskEmployee.progressRate and taskEmployee.progressRate < 80}">
															<h5 class="mt-3"> <i class="icon-copy fa fa-meh-o" aria-hidden="true"></i><span class="float-right">${taskEmployee.progressRate}%</span></h5>
		                                                	<div class="progress" style="height: 9px">
							                                    <div class="progress-bar wow  progress-" style="width: ${taskEmployee.progressRate}%; background-color:#2b5797;" role="progressbar"><span class="sr-only">60% Complete</span></div>
							                                </div>
		                                                </c:if>
		                                                <c:if test="${80 <= taskEmployee.progressRate}">
															<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">${taskEmployee.progressRate}%</span></h5>
		                                                	<div class="progress" style="height: 9px">
							                                    <div class="progress-bar wow  progress-" style="width: ${taskEmployee.progressRate}%; background-color:#00aba9;" role="progressbar"><span class="sr-only">60% Complete</span></div>
							                                </div>
		                                                </c:if>
	                                                </td>
	                                            </tr>
	                                            <tr style="background-color:#f3f3f3;" id="16bottom">
										   			<td style="padding-top :0px; padding-bottom :0px;" colspan="6">
								                      	<div class="collapse" id="${'task'}${taskEmployee.empId}" style="">
												         	<div class="card card-body mt-3 noHover">
												         		<div class="card-title">
								                                    <h6><b>업무 목록</b></h6>
								                                    <c:if test="${employee.role eq 'ROLE_ADMIN' or employee.role eq 'ROLE_PM'}">
								                                    <button type="button" class="btn mt-3 mb-1 btn-primary"
								                                    	    style="position: absolute;
																				    top: 0.3em;
																				    right: 0.5em;
																				    background: transparent;
																				    color: #3E6494;
																				    border: none;
																				    font-weight: bolder;"
																			value="${taskEmployee.empId},${taskEmployee.empName}"
								                                    	    onclick="addTask(this)"><i class="icon-copy ion-plus mr-1"></i><span style="padding-left: 2px;">추가</span></button>
								                                	</c:if>
								                                </div>
							                                    <table>
							                                        <thead>
							                                            <tr>
							                                                <th scope="col" style="width: 10%;">번호</th>
							                                                <th scope="col" style="width: 35%;">업무이름</th>
							                                                <!-- <th scope="col" style="width: 30%;">업무내용</th> -->
							                                                <th scope="col" style="width: 15%;">업무 시작일</th>
							                                                <th scope="col" style="width: 15%; text-align: center;">업무 종료일</th>
							                                                <th scope="col" style="width: 15%; text-align: center;">진행 상태</th>
							                                                <th class="text-center" style="width: 10%;">삭제</th>
							                                            </tr>
							                                        </thead>
							                                        <tbody class="detailTaskBody">
							                                            <!-- <tr class="table-hover" id="taskNo" onclick="taskTr(this)">
							                                                <td style="padding-left: 20px;">1</td>
							                                                <td>김종진 개인업무1</td>
							                                                <td>이러쿵 저러쿵 하는 겁니다 기한은 10일 드리죠 ㅡㅅㅡ</td>
							                                                <td>2023.10.14</td>
							                                                <td class="text-center"> - </td>
							                                                <td class="text-center text-success">진행중</td>
							                                                <td class="text-center"> 
							                                              		<button type="button" id="deleteTaskBtn" name="taskNo" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid" onclick="deleteTaskBtn(this)"></button>
							                                            	</td>
							                                            </tr> -->
							                                        </tbody>
							                                    </table>
												         	</div>
												      	</div>
										   			</td>
												</tr>
                                            </c:forEach>
                                        </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="modalGrid">
	                        <div class="modal-dialog" role="document">
	                            <div class="modal-content">
	                                <div class="modal-header">
	                                    <h5 class="modal-title">업무 삭제</h5>
	                                </div>
	                                <div class="modal-body">
	                                    <div class="container-fluid">
	                                        <div class="row">
	                                        	해당 업무를 삭제하시겠습니까?
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="modal-footer">
	                                    <button type="button" class="btn btn-primary" id="deleteCheckBtn" onclick="deleteTask()" data-dismiss="modal">삭제</button>
	                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	                                </div>
	                            </div>
	                        </div>
                		</div>
                        <!-- /# card -->
                    </div>
                    <div class="col-5">
                        <div class="card card-custom">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4 style="font-weight: bolder;">업무 상세 내용</h4>
                                    <!-- <span style="float: right">
                                    	<a href="addAndModifyProject">
                                    		<button type="button" class="btn mt-3 mb-1 btn-primary">등록</button>
                                    	</a>
                                    </span> -->
                                </div>
                                
                                <div class="mt-4">
                                    <form>
	                                    <div class="row mb-3 d-none">
	                                        <div class="col-md-12">
	                                            <label class="control-label">태크스 번호 hidden 처리할 예정</label>
	                                            <input class="form-control form-white" type="text" id="taskNoInput" name="taskNoInput">
	                                        </div>
	                                    </div>
	                                    <div class="row mb-3">
	                                        <div class="col-md-12">
	                                            <label class="control-label">업무 이름</label><span id="taskNameInval" class="text-danger d-none"> *</span>
	                                            <input class="form-control form-white" type="text" id="taskName" name="taskName">
	                                        </div>
	                                    </div>
	                                    <div class="row mb-3">
	                                        <div class="col-md-12">
	                                            <label class="control-label">업무 개요</label>
	                                            <!-- <input class="form-control form-white" value="대충 이거 저거 하세욧" type="text" name="category-name" readonly> -->
	                                            <textarea class="textarea_editor form-control bg-light" rows="5" placeholder="내용을 입력해주세요." id="taskComment" name="taskComment"></textarea>
	                                        </div>
	                                    </div>
	                                    <!-- <div class="row mb-3">
	                                    	<div class="col-md-12">
	                                    		<button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" 
		                                              type="button" 
		                                              onclick="javascript:void(window.open('findEmployee','_blank','width=600, height=600, left=600, top=30'))">
		                                           <i class="fa fa-paper-plane m-r-5"></i>
		                                            	사원 찾기
		                                        </button>
	                                    	</div>
	                                    </div> -->
	                                    <div class="row mb-3 d-none">
	                                        <div class="col-md-12">
	                                            <label class="control-label">사원번호 hidden 처리할 예정</label>
	                                            <input class="form-control form-white" type="text" id="empIdInput" name="empIdInput">
	                                        </div>
	                                    </div>
	                                    <!-- <div class="row mb-3">
	                                        <div class="col-md-12">
	                                            <label class="control-label">담당자</label><span id="empIdInval" class="text-danger d-none"> *</span>
	                                            <input class="form-control form-white" type="text" id="employeeName" name="employeeName">
	                                        </div>
	                                    </div> -->
	                                    <div class="row mb-3">
	                                        <div class="col-md-12">
	                                            <label class="control-label">담당자</label><span id="empIdInval" class="text-danger d-none"> *</span>
	                                            <div class="d-flex">
		                                            <input class="form-control form-white" type="text" id="employeeName" name="employeeName">
	                                            	<div class="d-flex">
	                                            		<button id="searchHumanBtn"
	                                            			  class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" 
				                                              type="button" 
				                                              onclick="javascript:void(window.open('findEmployee','_blank','width=600, height=600, left=600, top=30'))">
				                                           <i class="icon-copy fa fa-search" aria-hidden="true"></i>
				                                        </button>
	                                            	</div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="row mb-3">
	                                        <div class="col-md-12">
	                                            <label for="example-datetime-local-input" class="control-label">시작일</label><span id="startDateInval" class="text-danger d-none"> *</span>
	                                            <input class="form-control form-white" type="date" id="startDate" name="startDate">
	                                        </div>
	                                    </div>
	                                    <div class="row mb-3">
	                                        <div class="col-md-12">
	                                            <label for="example-datetime-local-input" class="control-label">종료일</label>
	                                            <input class="form-control form-white dateSelectable" data-placeholder="날짜 선택하세욧!" required aria-required="true" type="date" id="endDate" name="endDate">
	                                        </div>
	                                    </div>
	                                    <div class="row mb-3">
	                                    	<!-- <div class="col-lg-3" style="display:inline-block;">
											    <select class="form-control" id="projectSelect" name="projectSelect">
											        <option value="">프로젝트 선택</option>
											        <option value="html">PMS 제작 프로젝트</option>
											        <option value="css">프로젝트 2번째</option>
											        <option value="javascript">본격 취업 프로젝트</option>
											    </select>
											</div> -->
	                                        <div class="col-md-12">
	                                            <label class="control-label">진행상태</label>
	                                            <!-- <input class="form-control form-white" value="김종진" type="text" name="category-name"> -->
	                                            <select class="form-control" id="status" name="status">
											        <option id="defaultStatus" value="진행전">진행전</option>
											        <option id="ongoingStatus" value="진행중">진행중</option>
											        <option id="doneStatus" value="진행완료">진행완료</option>
											    </select>
	                                        </div>
	                                    </div>
		                                <div class="form-footer text-right">
	                                        <!-- <button type="button" class="btn btn-default waves-effect" onclick="resetForm()">초기화</button> -->
	                                        <c:if test="${employee.role eq 'ROLE_ADMIN' or employee.role eq 'ROLE_PM'}">
		                                        <button type="button" id="resetBtn" class="btn btn-default waves-effect" onclick="resetForm()">초기화</button>
		                                        <button type="button" id="registerTaskBtn" class="btn btn-primary waves-effect waves-light save-category" onclick="registerTask()">등록</button>
		                                        <button type="button" id="updateTaskBtn" class="btn btn-primary waves-effect waves-light save-category d-none" onclick="updateTask()">수정</button>
	                                        </c:if>
	                                        <c:if test="${employee.role ne 'ROLE_ADMIN' or employee.role ne 'ROLE_PM'}">
		                                        <button type="button" id="resetBtn" class="btn btn-default waves-effect d-none" onclick="resetForm()">초기화</button>
	                                        	<button type="button" id="updateTaskBtn" class="btn btn-primary waves-effect waves-light save-category d-none" onclick="updateTask()">수정</button>
	                                        </c:if>
	                                    </div>
	                                </form>
                                </div>
                            </div>
                        </div>
                        <!-- /# card -->
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
    
    <script src="${pageContext.request.contextPath}/resources/js/task/task.js"></script>
    
    <script>
    	function taskEmployeeTr(taskEmployeeTr) {
    		console.log("이게 되나??");  
    		console.log($(taskEmployeeTr));
    		console.log($(taskEmployeeTr).attr("aria-expanded"))
    		if ($(taskEmployeeTr).attr("aria-expanded") == "false") {
     		console.log($(taskEmployeeTr).attr("data-review-id"));
     		var empId = $(taskEmployeeTr).attr("data-review-id");
     		
     		getTaskList(empId);
    		}
    	}
    	
    	function taskTr(taskTr) {
    		console.log("이게 되나??");
    		console.log($(taskTr));
    		console.log($(taskTr).attr("id"))
     		var taskNo = $(taskTr).attr("id");
     		
     		getTaskDetail(taskNo);
    	}
    	
    	function deleteTaskBtn(deleteTaskBtn) {
    		console.log($(deleteTaskBtn));
    		console.log($(deleteTaskBtn).attr("name"))
     		var taskNo = $(deleteTaskBtn).attr("name");
    		
    		$("#deleteCheckBtn").attr("name", taskNo);
    		$("#deleteTaskNo").val(taskNo);
    		
    		console.log("자 일단 Tr을 찾아보자? ")
     		
    		console.log(taskNo.substring(4, taskNo.length));
    	}
    </script>
    

</body>

</html>