<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
	
	<style>
		.fa-close {
		  background-color: transparent;
		}
		
		.paddingright{
			padding-right:5%;
		}
		
		
	</style>	
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
								    <select class="form-control" id="projectSelect" name="projectSelect">
								        <option value="">프로젝트 선택</option>
								        <option value="html">PMS 제작 프로젝트</option>
								        <option value="css">프로젝트 2번째</option>
								        <option value="javascript">본격 취업 프로젝트</option>
								    </select>
								</div>
								<div class="col-lg-2"  style="display:inline-block;">
	                                 <select class="form-control" id="projectSelect" name="projectSelect">
	                                     <option value="">팀 선택</option>
	                                     <option value="html">개발1팀</option>
	                                     <option value="html">개발2팀</option>
	                                     <option value="html">개발3팀</option>
	                                 </select>
	                             </div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered zero-configuration">
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
                                        <tbody>
                                            <tr>
                                                <td>2010001</td>
                                                <td>김진성</td>
                                                <td>부장</td>
                                                <td>010-1234-1234</td>
                                                <td>프로젝트 2번째</td>
                                                <td>개발2팀</td>
                                                <td>팀장</td>
                                                <td class="text-center"> 
                                                	<a data-toggle="modal" data-target="#modifyInfo" data-whatever="@mdo">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3010000</td>
                                                <td>이은지</td>
                                                <td>이사</td>
                                                <td>010-0000-0000</td>
                                                <td>본격 취업 프로젝트</td>
                                                <td>개발3팀</td>
                                                <td>팀장</td>
                                                <td class="text-center"> 
                                                	<a href="addAndModifyEmployee">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button" class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>1010002</td>
                                                <td>김종진</td>
                                                <td>대리</td>
                                                <td>010-9999-9999</td>
                                                <td>PMS 제작 프로젝트</td>
                                                <td>개발1팀</td>
                                                <td>팀원</td>
                                                <td class="text-center"> 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2010001</td>
                                                <td>김진성</td>
                                                <td>부장</td>
                                                <td>010-1234-1234</td>
                                                <td>프로젝트 2번째</td>
                                                <td>개발2팀</td>
                                                <td>팀장</td>
                                                <td class="text-center"> 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3010000</td>
                                                <td>이은지</td>
                                                <td>이사</td>
                                                <td>010-0000-0000</td>
                                                <td>본격 취업 프로젝트</td>
                                                <td>개발3팀</td>
                                                <td>팀장</td>
                                                <td class="text-center"> 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>1010002</td>
                                                <td>김종진</td>
                                                <td>대리</td>
                                                <td>010-9999-9999</td>
                                                <td>PMS 제작 프로젝트</td>
                                                <td>개발1팀</td>
                                                <td>팀원</td>
                                                <td class="text-center"> 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2010001</td>
                                                <td>김진성</td>
                                                <td>부장</td>
                                                <td>010-1234-1234</td>
                                                <td>프로젝트 2번째</td>
                                                <td>개발2팀</td>
                                                <td>팀장</td>
                                                <td class="text-center"> 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2010000</td>
                                                <td>이은지</td>
                                                <td>이사</td>
                                                <td>010-0000-0000</td>
                                                <td>프로젝트 2번째</td>
                                                <td>개발3팀</td>
                                                <td>팀장</td>
                                                <td class="text-center"> 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2010002</td>
                                                <td>김종진</td>
                                                <td>대리</td>
                                                <td>010-9999-9999</td>
                                                <td>프로젝트 2번째</td>
                                                <td>개발1팀</td>
                                                <td>팀원</td>
                                                <td class="text-center"> 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2010001</td>
                                                <td>김진성</td>
                                                <td>부장</td>
                                                <td>010-1234-1234</td>
                                                <td>프로젝트 2번째</td>
                                                <td>개발2팀</td>
                                                <td>팀장</td>
                                                <td class="text-center" > 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3010000</td>
                                                <td>이은지</td>
                                                <td>이사</td>
                                                <td>010-0000-0000</td>
                                                <td>본격 취업 프로젝트</td>
                                                <td>개발3팀</td>
                                                <td>팀장</td>
                                                <td class="text-center"> 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3010002</td>
                                                <td>김종진</td>
                                                <td>대리</td>
                                                <td>010-9999-9999</td>
                                                <td>본격 취업 프로젝트</td>
                                                <td>개발1팀</td>
                                                <td>팀원</td>
                                                <td class="text-center" > 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3010001</td>
                                                <td>김진성</td>
                                                <td>부장</td>
                                                <td>010-1234-1234</td>
                                                <td>본격 취업 프로젝트</td>
                                                <td>개발2팀</td>
                                                <td>팀장</td>
                                                <td class="text-center"> 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3010000</td>
                                                <td>이은지</td>
                                                <td>이사</td>
                                                <td>010-0000-0000</td>
                                                <td>본격 취업 프로젝트</td>
                                                <td>개발3팀</td>
                                                <td>팀장</td>
                                                <td class="text-center"> 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>1010002</td>
                                                <td>김종진</td>
                                                <td>대리</td>
                                                <td>010-9999-9999</td>
                                                <td>PMS 제작 프로젝트</td>
                                                <td>개발1팀</td>
                                                <td>팀원</td>
                                                <td class="text-center"> 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>1010001</td>
                                                <td>김진성</td>
                                                <td>부장</td>
                                                <td>010-1234-1234</td>
                                                <td>PMS 제작 프로젝트</td>
                                                <td>개발2팀</td>
                                                <td>팀장</td>
                                                <td class="text-center" > 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>1010000</td>
                                                <td>이은지</td>
                                                <td>이사</td>
                                                <td>010-0000-0000</td>
                                                <td>PMS 제작 프로젝트</td>
                                                <td>개발3팀</td>
                                                <td>팀장</td>
                                                <td class="text-center"> 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>1010002</td>
                                                <td>김종진</td>
                                                <td>대리</td>
                                                <td>010-9999-9999</td>
                                                <td>PMS 제작 프로젝트</td>
                                                <td>개발1팀</td>
                                                <td>팀원</td>
                                                <td class="text-center" > 
                                                	<a href="addAndModifyProject">
                                               			<i class="fa fa-pencil color-muted"></i>
                                               		</a>
                                                </td>
                                                <td class="text-center"> 
                                                	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
                                                </td>
                                            </tr>
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
			                <form class="form-valide" action="#" method="post">
	                            <div class="form-group row">
	                                <label class="col-lg-4 col-form-label" for="val-username">이름
	                                </label>
	                                <div class="col-lg-7">
	                                    <input type="text" class="form-control" id="val-username" name="val-username" placeholder="Enter a username..">
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-4 col-form-label" for="positionSelect">직책</label>
	                             <div class="col-lg-7">
	                                 <select class="form-control" id="positionSelect" name="positionSelect">
	                                     <option value="">직책 선택</option>
	                                     <option value="html">사원</option>
	                                     <option value="css">선임</option>
	                                     <option value="javascript">대리</option>
	                                     <option value="angular">과장</option>
	                                     <option value="angular">차장</option>
	                                     <option value="angular">부장</option>
	                                     <option value="angular">이사</option>
	                                     <option value="angular">상무</option>
	                                     <option value="angular">사장</option>
	                                     <option value="angular">고객</option>
	                                 </select>
	                             </div>
	                            </div>
	                            <div class="form-group row">
	                                <label class="col-lg-4 col-form-label" for="phoneNumber">연락처 
	                                </label>
	                                <div class="col-lg-7">
	                                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="010-xxxx-xxxx">
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-4 col-form-label" for="projectSelect">프로젝트 </label>
	                             <div class="col-lg-7">
	                                 <select class="form-control" id="projectSelect" name="projectSelect">
	                                     <option value="">프로젝트 선택</option>
	                                     <option value="html">PMS 제작 프로젝트</option>
	                                     <option value="css">프로젝트 2번째</option>
	                                     <option value="javascript">본격 취업 프로젝트</option>
	                                     <option value="angular">임시 프로젝트</option>
	                                 </select>
	                             </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-4 col-form-label" for="teamSelect">팀</label>
	                             <div class="col-lg-7">
	                                 <select class="form-control" id="projectSelect" name="projectSelect">
	                                     <option value="">팀 선택</option>
	                                     <option value="html">기획 1팀</option>
	                                     <option value="css">기획 2팀</option>
	                                     <option value="javascript">개발 1팀</option>
	                                     <option value="javascript">개발 2팀</option>
	                                     <option value="javascript">개발 3팀</option>
	                                     <option value="angular">QA 1팀</option>
	                                     <option value="angular">QA 2팀</option>
	                                     <option value="angular">고객</option>
	                                 </select>
	                             </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-4 col-form-label" for="authoritySelect">권한</label>
	                             <div class="col-lg-7">
	                                 <select class="form-control" id="projectSelect" name="projectSelect">
	                                     <option value="">권한 선택</option>
	                                     <option value="html">팀원</option>
	                                     <option value="css">팀장</option>
	                                     <option value="css">PM</option>
	                                     <option value="javascript">관리자</option>
	                                     <option value="angular">고객사</option>
	                                 </select>
	                             </div>
	                            </div>
	                            <div class="form-group row">
	                                <label class="col-lg-4 col-form-label" for="phoneNumber"> 비밀번호 초기화
	                                </label>
	                                <div class="col-lg-7">
	                                	<button type="button" class="btn btn-primary">초기화 하기</button>
	                                </div>
	                            </div>
	                        </form>
			            </div>
			            <div class="modal-footer">
			            	<button type="button" class="btn btn-primary">수정</button>
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
	                                 <select class="form-control" id="registerProject" name="registerProject">
	                                     <option value="">프로젝트 선택</option>
	                                     <option value="PMS 제작 프로젝트">PMS 제작 프로젝트</option>
	                                     <option value="프로젝트 2번째">프로젝트 2번째</option>
	                                     <option value="본격 취업 프로젝트">본격 취업 프로젝트</option>
	                                     <option value="임시 프로젝트">임시 프로젝트</option>
	                                 </select>
	                             </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-3 col-form-label" for="registerTeam">팀</label>
	                             <div class="col-lg-7">
	                                 <select class="form-control" id="registerTeam" name="registerTeam">
	                                     <option value="">팀 선택</option>
	                                     <option value="개발1팀">개발1팀</option>
	                                     <option value="개발2팀">개발2팀</option>
	                                     <option value="개발3팀">개발3팀</option>
	                                 </select>
	                             </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-3 col-form-label" for="registerAuthority">권한</label>
	                             <div class="col-lg-7">
	                                 <select class="form-control" id="registerAuthority" name="registerAuthority">
	                                     <option value="">권한 선택</option>
	                                     <option value="ROLE_PE">팀원</option>
	                                     <option value="ROLE_PM">PM</option>
	                                     <option value="ROLE_ADMIN">관리자</option>
	                                     <option value="ROLE_CLIENT">고객사</option>
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