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
    <title>oitpms</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/projectList.css" rel="stylesheet">
    
    <script src="${pageContext.request.contextPath}/resources/js/task/task.js"></script>
    
    <script>
		$(document).ready(function() {
			conosole.log("되니?");
			
			$('.projectNo').on('click', function() {
		    	const close = $('.show');
		    	if(close != null) {
		    		close.collapse('toggle');
		    	}
		        const target = $(this).data('target');
		        $(target).collapse('toggle');
		    });
		});
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
		
	</style>	

</head>

<body>
    <jsp:include page="../headernsidebar.jsp">
		<jsp:param name="employee" value="${employee}" />
	</jsp:include>
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->
            <div class="container-fluid">
                <div class="row">
                    <!-- /# column -->
                    <div class="col-7">
                        <div class="card card-custom">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4><b>프로젝트 업무 관리</b></h4> 
                                    <span style="float: right">
                                    	<button type="button" class="btn mt-3 mb-1 btn-primary" onclick="addTask()">추가</button>
                                    </span>
                                </div>
                                <div class="row my-3">
                                	<c:if test="${employee.role eq 'ROLE_ADMIN'}">
                                		<div class="col-lg-4" style="display:inline-block;">
										    <select class="form-control" id="projectSelect" name="projectSelect" onchange="selectProject()">
										    	<option>프로젝트 선택</option>
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
									<div class="col-lg-3"  style="display:inline-block;">
		                                 <select class="form-control" id="teamSelect" name="teamSelect" onchange="selectTeam()">
		                                     <option value="">팀 선택</option>
		                                     <!-- <option value="html">개발1팀</option>
		                                     <option value="html">개발2팀</option>
		                                     <option value="html">개발3팀</option> -->
		                                 </select>
		                            </div>                                
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                            	<th style="width: 10.5%;">번호</th>
                                                <th style="width: 25%;">프로젝트</th>
                                                <th style="width: 13%;">팀</th>
                                                <th style="width: 13%;">사원 명</th>
                                                <th style="width: 13%;">직책</th>
                                                <th style="width: 25.5%;">진척률</th>
                                            </tr>
                                        </thead>
                                        <%-- <tbody>
                                        	<c:forEach var="project" items="${projectList}" varStatus="a">
                                        		<c:forEach var="pm" items="${PMList}" varStatus="b">
                                        			<c:if test="${a.index==b.index}">
                                        				<c:forEach var="customerInfo" items="${customerInfoList}" varStatus="c">
                                        					<c:if test="${a.index==c.index}">
					                                            <tr class="reviewTitle table-hover " data-toggle="collapse" data-review-id="${project.projectNo }" id="projectNo${project.projectNo }" href="#collapseExample${project.projectNo }" role="button" aria-expanded="false" aria-controls="collapseExample">
					                                                <td class="text-center">${project.projectNo }</td>
					                                                <td>
																	   ${project.projectName }
																	</td>
					                                                <td>${pm.empName }</td>
					                                                <td>
					                                                	<c:set var="startDate" value="${project.projectStartDate}" />
																		<c:choose>
																		    <c:when test="${not empty startDate}">
																		        <fmt:formatDate value="${startDate}" pattern="yyyy.MM.dd" var="formattedStartDate" />
																		    </c:when>
																		    <c:otherwise>
																		        <c:set var="formattedStartDate" value="" />
																		    </c:otherwise>
																		</c:choose>
																		${formattedStartDate}
					                                                </td>
					                                                <td>
					                                                	<c:set var="endDate" value="${project.projectEndDate}" />
																		<c:choose>
																		    <c:when test="${not empty endDate}">
																		        <fmt:formatDate value="${endDate}" pattern="yyyy.MM.dd" var="formattedEndDate" />
																		    </c:when>
																		    <c:otherwise>
																		        <c:set var="formattedEndDate" value="" />
																		    </c:otherwise>
																		</c:choose>
																		${formattedEndDate}
					                                                </td>
					                                                <td>
																		<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">88%</span></h5>
					                                                	<div class="progress" style="height: 9px">
										                                    <div class="progress-bar bg-info wow  progress-" style="width: 88%;" role="progressbar"><span class="sr-only">60% Complete</span>
										                                    </div>
										                                </div>
					                                                </td>
						                                            <td class="text-right" style="padding-right:20px"> 
						                                             	<a href="addAndModifyProject?projectNo=${project.projectNo}&pmId=${pm.empId}&customerId=${customerInfo.empId}">
						                                            			<i class="fa fa-pencil color-muted"></i>
						                                            		</a>
						                                             </td>
						                                             <td class="text-center"> 
						                                              	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
						                                             </td>
					                                            </tr>
					                                            <tr style="background-color:#f3f3f3;" id="${project.projectNo }bottom">
														   			<td style="padding-top :0px; padding-bottom :0px;"colspan="8">
												                      	<div class="collapse" id="collapseExample${project.projectNo }">
																         	<div class="card card-body mt-3 noHover" style="height:200px;">
							                                            		<table border="1" class="table-in-table">
							                                            			<tr>
							                                            				<td class="no-right-border col-md-9">
							                                            					<i class="icon-copy fa fa-book" aria-hidden="true"> 프로젝트 개요</i>
							                                            				</td>
							                                            				<td class="no-right-border col-md-1">
							                                            					<i class="icon-copy fa fa-user" aria-hidden="true"> 고객 명</i>
							                                            				</td>
							                                            				<td class="no-left-border col-md-2">
							                                            					${customerInfo.empName }
							                                            				</td>
							                                            			</tr>
							                                            			<tr>
							                                            				<td rowspan="2"class="no-right-border">
							                                            					${project.projectContent }
							                                            				</td>
							                                            				<td class="no-right-border">
							                                            					<i class="icon-copy fa fa-drivers-license-o" aria-hidden="true"> 고객 연락처</i>
							                                            				</td>
							                                            				<td class="no-left-border">
							                                            					${customerInfo.empTel }
							                                            				</td>
							                                            			</tr>
							                                            			<tr>
							                                            				<td class="no-right-border">
							                                            					<i class="icon-copy fa fa-envelope" aria-hidden="true"> 고객 이메일</i>
							                                            				</td>
							                                            				<td class="no-left-border">
							                                            					${customerInfo.empEmail }
							                                            				</td>
							                                            			</tr>
							                                            		</table>
																         	</div>
																      	</div>
														   			</td>
																</tr>
															</c:if>
														</c:forEach>
													</c:if>
												</c:forEach>
											</c:forEach>
                                        </tbody> --%>
                                        <tbody id="detailTaskList">
                                        <c:if test="${fn:length(taskEmployeeList) != 0}">
                                        	<c:forEach var="taskEmployee" items="${taskEmployeeList}">
	                                            <tr class="reviewTitle table-hover" data-toggle="collapse" data-review-id="${taskEmployee.empId}" id="${'employeeId'}${taskEmployee.empId}" href="${'#task'}${taskEmployee.empId}" role="button" aria-expanded="true" aria-controls="collapseExample">
	                                                <td>${taskEmployee.empId}</td>
	                                                <td>${taskEmployee.projectName}</td>
	                                                <td>${taskEmployee.teamName}</td>
	                                                <td>${taskEmployee.empName}</td>
	                                                <td>${taskEmployee.empRank}</td>
	                                                <td>
														<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">88%</span></h5>
	                                                	<div class="progress" style="height: 9px">
						                                    <div class="progress-bar bg-info wow  progress-" style="width: 88%;" role="progressbar"><span class="sr-only">60% Complete</span>
						                                    </div>
						                                </div>
	                                                </td>
	                                            </tr>
	                                            <tr style="background-color:#f3f3f3;" id="16bottom">
										   			<td style="padding-top :0px; padding-bottom :0px;" colspan="6">
								                      	<div class="collapse" id="${'task'}${taskEmployee.empId}" style="">
												         	<div class="card card-body mt-3 noHover">
												         		<div class="card-title">
								                                    <h6>업무 목록</h6>
								                                </div>
							                                    <table>
							                                        <thead>
							                                            <tr>
							                                                <th scope="col" style="width: 10%;">번호</th>
							                                                <th scope="col" style="width: 30%;">업무이름</th>
							                                                <!-- <th scope="col" style="width: 30%;">업무내용</th> -->
							                                                <th scope="col" style="width: 20%;">업무 시작일</th>
							                                                <th scope="col" style="width: 20%; text-align: center;">업무 종료일</th>
							                                                <th scope="col" style="width: 20%; text-align: center;">진행 상태</th>
							                                                <th class="text-center">삭제</th>
							                                            </tr>
							                                        </thead>
							                                        <tbody class="detailTaskBody">
							                                            <tr class="table-hover">
							                                                <td style="padding-left: 20px;">1</td>
							                                                <td>김종진 개인업무1</td>
							                                                <!-- <td>이러쿵 저러쿵 하는 겁니다 기한은 10일 드리죠 ㅡㅅㅡ</td> -->
							                                                <td>2023.10.14</td>
							                                                <td class="text-center"> - </td>
							                                                <td class="text-center text-success">진행중</td>
							                                                <td class="text-center"> 
							                                              		<button type="button" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid"></button>
							                                            	</td>
							                                            </tr>
							                                            <tr class="table-hover">
							                                                <td style="padding-left: 20px;">2</td>
							                                                <td>김종진 개인업무2</td>
							                                                <!-- <td>이러쿵 저러쿵 하는 겁니다 기한은 10일 드리죠 ㅡㅅㅡ</td> -->
							                                                <td>2023.10.14</td>
							                                                <td class="text-center"> 2023.10.14 </td>
							                                                <td class="text-center text-danger">진행완료</td>
							                                                <td class="text-center"> 
							                                              		<button type="button" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid"></button>
							                                            	</td>
							                                            </tr>
							                                            <tr class="table-hover">
							                                                <td style="padding-left: 20px;">3</td>
							                                                <td>김종진 개인업무3</td>
							                                                <!-- <td>이러쿵 저러쿵 하는 겁니다 기한은 10일 드리죠 ㅡㅅㅡ</td> -->
							                                                <td>2023.10.14</td>
							                                                <td class="text-center"> 2653.13.34 </td>
							                                                <td class="text-center text-danger">진행완료</td>
							                                                <td class="text-center"> 
							                                              		<button type="button" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid"></button>
							                                            	</td>
							                                            </tr>
							                                        </tbody>
							                                    </table>
												         	</div>
												      	</div>
										   			</td>
												</tr>
                                            </c:forEach>
                                        </c:if>
											<tr class="reviewTitle table-hover" data-toggle="collapse" href="#taskExample6" role="button" aria-expanded="true">
                                                <td>16</td>
                                                <td>ㅇㅅㅇ 프로젝트</td>
                                                <td>개발1팀</td>
                                                <td>김종진</td>
                                                <td>대리</td>
                                                <td>
													<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">88%</span></h5>
                                                	<div class="progress" style="height: 9px">
					                                    <div class="progress-bar bg-info wow  progress-" style="width: 88%;" role="progressbar"><span class="sr-only">60% Complete</span>
					                                    </div>
					                                </div>
                                                </td>
                                            </tr>
                                            <tr style="background-color:#f3f3f3;">
									   			<td style="padding-top :0px; padding-bottom :0px;" colspan="6">
							                      	<div class="collapse" id="taskExample6" style="">
											         	<div class="card card-body mt-3 noHover">
											         		<div class="card-title">
							                                    <h6>업무 일정</h6>
							                                </div>
						                                    <table>
						                                        <thead>
						                                            <tr>
						                                                <th scope="col" style="width: 10%;">번호</th>
						                                                <th scope="col" style="width: 30%;">업무이름</th>
						                                                <!-- <th scope="col" style="width: 30%;">업무내용</th> -->
						                                                <th scope="col" style="width: 20%;">업무 시작일</th>
						                                                <th scope="col" style="width: 20%; text-align: center;">업무 종료일</th>
						                                                <th scope="col" style="width: 20%; text-align: center;">진행 상태</th>
						                                                <th class="text-center">삭제</th>
						                                            </tr>
						                                        </thead>
						                                        <tbody>
						                                            <tr class="table-hover">
						                                                <td style="padding-left: 20px;">1</td>
						                                                <td>김종진 개인업무1</td>
						                                                <!-- <td>이러쿵 저러쿵 하는 겁니다 기한은 10일 드리죠 ㅡㅅㅡ</td> -->
						                                                <td>2023.10.14</td>
						                                                <td class="text-center"> - </td>
						                                                <td class="text-center text-success">진행중</td>
						                                                <td class="text-center"> 
						                                              		<button type="button" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid"></button>
						                                            	</td>
						                                            </tr>
						                                            <tr class="table-hover">
						                                                <td style="padding-left: 20px;">2</td>
						                                                <td>김종진 개인업무2</td>
						                                                <!-- <td>이러쿵 저러쿵 하는 겁니다 기한은 10일 드리죠 ㅡㅅㅡ</td> -->
						                                                <td>2023.10.14</td>
						                                                <td class="text-center"> 2023.10.14 </td>
						                                                <td class="text-center text-danger">진행완료</td>
						                                                <td class="text-center"> 
						                                              		<button type="button" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid"></button>
						                                            	</td>
						                                            </tr>
						                                            <tr class="table-hover">
						                                                <td style="padding-left: 20px;">3</td>
						                                                <td>김종진 개인업무3</td>
						                                                <!-- <td>이러쿵 저러쿵 하는 겁니다 기한은 10일 드리죠 ㅡㅅㅡ</td> -->
						                                                <td>2023.10.14</td>
						                                                <td class="text-center"> 2653.13.34 </td>
						                                                <td class="text-center text-danger">진행완료</td>
						                                                <td class="text-center"> 
						                                              		<button type="button" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid"></button>
						                                            	</td>
						                                            </tr>
						                                        </tbody>
						                                    </table>
											         	</div>
											      	</div>
									   			</td>
											</tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="modalGrid">
	                        <div class="modal-dialog" role="document">
	                            <div class="modal-content">
	                                <div class="modal-header">
	                                    <h5 class="modal-title">프로젝트 삭제</h5>
	                                </div>
	                                <div class="modal-body">
	                                    <div class="container-fluid">
	                                        <div class="row">
	                                        	해당 프로젝트를 삭제하시겠습니까?
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="modal-footer">
	                                    <button type="button" class="btn btn-primary">삭제</button>
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
                                    <h4><b>업무 상세 내용</b></h4> 
                                    <!-- <span style="float: right">
                                    	<a href="addAndModifyProject">
                                    		<button type="button" class="btn mt-3 mb-1 btn-primary">등록</button>
                                    	</a>
                                    </span> -->
                                </div>
                                
                                <div class="mt-4">
                                    <form>
	                                    <div class="row mb-3">
	                                        <div class="col-md-12">
	                                            <label class="control-label">업무 이름</label>
	                                            <input class="form-control form-white" value="ㅇㅅㅇ 업무" type="text" id="taskName" name="taskName">
	                                        </div>
	                                    </div>
	                                    <div class="row mb-3">
	                                        <div class="col-md-12">
	                                            <label class="control-label">업무 개요</label>
	                                            <!-- <input class="form-control form-white" value="대충 이거 저거 하세욧" type="text" name="category-name" readonly> -->
	                                            <textarea class="textarea_editor form-control bg-light" rows="5" placeholder="내용을 입력해주세요." id="taskComment" name="taskComment"></textarea>
	                                        </div>
	                                    </div>
	                                    <div class="row mb-3">
	                                        <div class="col-md-12">
	                                            <label class="control-label">사원번호 hidden 처리할 예정</label>
	                                            <input class="form-control form-white" type="text" id="empIdInput" name="empIdInput">
	                                        </div>
	                                    </div>
	                                    <div class="row mb-3">
	                                        <div class="col-md-12">
	                                            <label class="control-label">담당자</label>
	                                            <input class="form-control form-white" value="김종진" type="text" id="employeeName" name="employeeName">
	                                        </div>
	                                    </div>
	                                    <div class="row mb-3">
	                                        <div class="col-md-12">
	                                            <label for="example-datetime-local-input" class="control-label">시작일</label>
	                                            <input class="form-control form-white" value="2023-10-25" type="date" id="startDate" name="startDate">
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
											        <option value="진행전">진행전</option>
											        <option value="진행중">진행중</option>
											        <option value="진행완료">진행완료</option>
											    </select>
	                                        </div>
	                                    </div>
		                                <div class="form-footer text-right">
	                                        <button type="button" class="btn btn-default waves-effect">초기화</button>
	                                        <button type="button" id="registerTaskBtn" class="btn btn-danger waves-effect waves-light save-category" onclick="registerTask()">등록</button>
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
            <div class="copyright">
                <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div>
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
    

</body>

</html>