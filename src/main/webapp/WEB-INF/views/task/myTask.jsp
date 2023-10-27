<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>otipms</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/plugins/fullcalendar/css/fullcalendar.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/customStyle.css" rel="stylesheet">

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
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4><b>업무 일정</b></h4>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="card-box m-b-50">
                                            <div id="calendar"></div>
                                        </div>
                                    </div>
									<div class="col-lg-4 mt-5">
                                        <div id="external-events" class="m-t-20 mt-5">
                                            <!-- <div class="external-event ui-draggable ui-draggable-handle" data-class="bg-primary" style="position: relative;"><i class="fa fa-move"></i>New Theme Release</div> -->
                                            <div class="basic-form">
			                                    <form>
			                                        <div class="form-group">
			                                            <div class="form-check form-check-inline mr-4">
			                                                <label class="form-check-label">
			                                                <input type="checkbox" class="form-check-input" value="">모두 선택</label>
			                                            </div>
			                                            <div class="form-check form-check-inline">
			                                                <label class="form-check-label">
			                                                <input type="checkbox" class="form-check-input" value="">진행전</label>
			                                            </div>
			                                            <div class="form-check form-check-inline">
			                                                <label class="form-check-label">
			                                                <input type="checkbox" class="form-check-input" value="">진행중</label>
			                                            </div>
			                                            <div class="form-check form-check-inline disabled">
			                                                <label class="form-check-label">
			                                                <input type="checkbox" class="form-check-input" value="">진행 완료</label>
			                                            </div>
			                                        </div>
			                                    </form>
			                                </div>
                                            <table class="table table-hover taskTable">
		                                        <tbody>
		                                            <tr>
		                                                <td><div class="taskEvent-red mb-1" style="position: relative;"><i class="fa fa-move"></i>ㅇㅇㅇ 프로젝트</div></td>
		                                                <td class="text-success">진행중</td>
		                                                <td><button class="btn btn-sm btn-detail" data-toggle="modal" data-target="#taskDetail">상세</button></td>
		                                            </tr>
		                                            <tr>
		                                                <td><div class="taskEvent-orange mb-1" style="position: relative;"><i class="fa fa-move"></i>개인업무1</div></td>
		                                                <td class="text-light">진행전</td>
		                                                <td><button class="btn btn-sm btn-detail" data-toggle="modal" data-target="#taskDetail">상세</button></td>
		                                            </tr>
		                                            <tr>
		                                                <td><div class="taskEvent-yellow mb-1" style="position: relative;"><i class="fa fa-move"></i>개인업무2</div></td>
		                                                <td class="text-danger">진행 완료</td>
		                                                <td><button class="btn btn-sm btn-detail" data-toggle="modal" data-target="#taskDetail">상세</button></td>
		                                            </tr>
		                                            <tr>
		                                                <td><div class="taskEvent-lightGreen mb-1" style="position: relative;"><i class="fa fa-move"></i>개인업무2</div></td>
		                                                <td class="text-danger">진행 완료</td>
		                                                <td><button class="btn btn-sm btn-detail" data-toggle="modal" data-target="#taskDetail">상세</button></td>
		                                            </tr>
		                                            <tr>
		                                                <td><div class="taskEvent-green mb-1" style="position: relative;"><i class="fa fa-move"></i>개인업무2</div></td>
		                                                <td class="text-danger">진행 완료</td>
		                                                <td><button class="btn btn-sm btn-detail" data-toggle="modal" data-target="#taskDetail">상세</button></td>
		                                            </tr>
		                                            <tr>
		                                                <td><div class="taskEvent-lightBlue mb-1" style="position: relative;"><i class="fa fa-move"></i>개인업무2</div></td>
		                                                <td class="text-danger">진행 완료</td>
		                                                <td><button class="btn btn-sm btn-detail" data-toggle="modal" data-target="#taskDetail">상세</button></td>
		                                            </tr>
		                                            <tr>
		                                                <td><div class="taskEvent-blue mb-1" style="position: relative;"><i class="fa fa-move"></i>개인업무2</div></td>
		                                                <td class="text-danger">진행 완료</td>
		                                                <td><button class="btn btn-sm btn-detail" data-toggle="modal" data-target="#taskDetail">상세</button></td>
		                                            </tr>
		                                            <tr>
		                                                <td><div class="taskEvent-purple mb-1" style="position: relative;"><i class="fa fa-move"></i>개인업무2</div></td>
		                                                <td class="text-danger">진행 완료</td>
		                                                <td><button class="btn btn-sm btn-detail" data-toggle="modal" data-target="#taskDetail">상세</button></td>
		                                            </tr>
		                                            <tr>
		                                                <td><div class="taskEvent-pink mb-1" style="position: relative;"><i class="fa fa-move"></i>개인업무2</div></td>
		                                                <td class="text-danger">진행 완료</td>
		                                                <td><button class="btn btn-sm btn-detail" data-toggle="modal" data-target="#taskDetail">상세</button></td>
		                                            </tr>
		                                        </tbody>
		                                    </table>
                                        </div>
                                        <!-- checkbox -->
                                        <!-- <div class="checkbox m-t-40">
                                            <input id="drop-remove" type="checkbox">
                                            <label for="drop-remove">&nbsp; 드롭 후 제거</label>
                                        </div> -->
                                    </div>
                                    <!-- end col -->
                                    <!-- Modal Add Category -->
                                    <div class="modal fade none-border" id="taskDetail">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title"><strong>업무 상세</strong></h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">업무 이름</label>
                                                                <input class="form-control form-white" value="ㅇㅅㅇ 업무" type="text" name="category-name" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">업무 개요</label>
                                                                <input class="form-control form-white" value="대충 이거 저거 하세욧" type="text" name="category-name" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">담당자</label>
                                                                <input class="form-control form-white" value="프로젝트는 pm이지만 개인은 당신이다" type="text" name="category-name" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label for="example-datetime-local-input" class="control-label">시작일</label>
                                                                <input class="form-control form-white" value="2023-10-25" type="date" name="category-name" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label for="example-datetime-local-input" class="control-label">종료일</label>
                                                                <input class="form-control form-white dateSelectable" data-placeholder="날짜 선택하세욧!" required aria-required="true" type="date" name="category-name">
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label for="example-datetime-local-input" class="control-label">고객명</label>
                                                                <input class="form-control form-white" value="고객은 왕이다" type="text" name="category-name" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">작업 상태</label>
                                                                <select class="form-control form-white" data-placeholder="작업 전" name="category-color">
                                                                    <option value="taskBefore">작업 전</option>
                                                                    <option value="taskIng">작업 중</option>
                                                                    <option value="taskDone">작업 완료</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">색상</label>
                                                                <select class="form-control form-white" data-placeholder="표시 색상을 고르세여" name="category-color">
                                                                    <option value="red">Red</option>
                                                                    <option value="orange">Orange</option>
                                                                    <option value="yellow">Yellow</option>
                                                                    <option value="lightGreen">Light Green</option>
                                                                    <option value="green">Green</option>
                                                                    <option value="lightBlue">Light Blue</option>
                                                                    <option value="blue">Blue</option>
                                                                    <option value="purple">Purple</option>
                                                                    <option value="pink">Pink</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- <div class="modal fade" id="taskDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <div class="form-group">
                                                            <label for="recipient-name" class="col-form-label">Recipient:</label>
                                                            <input type="text" class="form-control" id="recipient-name">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="message-text" class="col-form-label">Message:</label>
                                                            <textarea class="form-control" id="message-text"></textarea>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary">Send message</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->
                                    <!-- END MODAL -->
                                </div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
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

    
    <script src="${pageContext.request.contextPath}/resources/plugins/jqueryui/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/moment/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/fullcalendar/js/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins-init/fullcalendar-init.js"></script>
    
    <script>
		document.querySelector('.fc-view.fc-month-view.fc-basic-view').style.overflowY='hidden';
    </script>

</body>

</html>