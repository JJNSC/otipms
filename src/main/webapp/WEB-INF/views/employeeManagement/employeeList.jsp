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

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <div class="brand-logo">
                <a href="${pageContext.request.contextPath}/index">
                    <b class="logo-abbr"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt=""> </b>
                    <span class="logo-compact"><img src="${pageContext.request.contextPath}/resources/images/logo-compact.png" alt=""></span>
                    <span class="brand-title">
                        <%-- <img src="${pageContext.request.contextPath}/resources/images/logo-text.png" alt=""> --%>
                        <img src="${pageContext.request.contextPath}/resources/images/ic_oti_logo_wh_rb.png" width="70px" alt="">
                    </span>
                </a>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header">    
            <div class="header-content clearfix">
                
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="toggle-icon"><i class="icon-menu"></i></span>
                    </div>
                </div>
                <!-- <div class="header-left">
                    <div class="input-group icons">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                        </div>
                        <input type="search" class="form-control" placeholder="Search Dashboard" aria-label="Search Dashboard">
                        <div class="drop-down   d-md-none">
							<form action="#">
								<input type="text" class="form-control" placeholder="Search">
							</form>
                        </div>
                    </div>
                </div> -->
                <div class="header-right">
                    <ul class="clearfix">
                        <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-email-outline"></i>
                                <!-- <span class="badge gradient-1 badge-pill badge-primary">3</span> -->
                                <span class="badge badge-pill badge-custom">3</span>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu">
                                <div class="dropdown-content-heading d-flex justify-content-between">
                                    <span class="">3 New Messages</span>  
                                    
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li class="notification-unread">
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="images/avatar/1.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Saiful Islam</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="notification-unread">
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="images/avatar/2.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Adam Smith</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Can you do me a favour?</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="images/avatar/3.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Barak Obama</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="images/avatar/4.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Hilari Clinton</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hello</div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-bell-outline"></i>
                                <!-- <span class="badge badge-pill gradient-2 badge-primary">3</span> -->
                                <span class="badge badge-pill badge-custom">3</span>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                                <div class="dropdown-content-heading d-flex justify-content-between">
                                    <span class="">2 New Notifications</span>  
                                    
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">Events near you</h6>
                                                    <span class="notification-text">Within next 5 days</span> 
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">Event Started</h6>
                                                    <span class="notification-text">One hour ago</span> 
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">Event Ended Successfully</h6>
                                                    <span class="notification-text">One hour ago</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">Events to Join</h6>
                                                    <span class="notification-text">After two days</span> 
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown d-none d-md-flex">
                            <a href="javascript:void(0)" class="log-user"  data-toggle="dropdown">
                                <span>English</span>  <i class="fa fa-angle-down f-s-14" aria-hidden="true"></i>
                            </a>
                            <div class="drop-down dropdown-language animated fadeIn  dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li><a href="javascript:void()">English</a></li>
                                        <li><a href="javascript:void()">Dutch</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown">
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                <span class="activity active"></span>
                                <img src="images/user/1.png" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile   dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
                                        </li>
                                        <li>
                                            <a href="email-inbox.html"><i class="icon-envelope-open"></i> <span>Inbox</span> <div class="badge gradient-3 badge-pill badge-primary">3</div></a>
                                        </li>
                                        
                                        <hr class="my-2">
                                        <li>
                                            <a href="page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                        </li>
                                        <li><a href="page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <!-- <ul class="metismenu" id="menu">
                    <li class="nav-label">Dashboard</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Dashboard</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./index.html">Home 1</a></li>
                            <li><a href="./index-2.html">Home 2</a></li>
                        </ul>
                    </li>
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">Layouts</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./layout-blank.html">Blank</a></li>
                            <li><a href="./layout-one-column.html">One Column</a></li>
                            <li><a href="./layout-two-column.html">Two column</a></li>
                            <li><a href="./layout-compact-nav.html">Compact Nav</a></li>
                            <li><a href="./layout-vertical.html">Vertical</a></li>
                            <li><a href="./layout-horizontal.html">Horizontal</a></li>
                            <li><a href="./layout-boxed.html">Boxed</a></li>
                            <li><a href="./layout-wide.html">Wide</a></li>
                            
                            
                            <li><a href="./layout-fixed-header.html">Fixed Header</a></li>
                            <li><a href="layout-fixed-sidebar.html">Fixed Sidebar</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">Apps</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i> <span class="nav-text">Email</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./email-inbox.html">Inbox</a></li>
                            <li><a href="./email-read.html">Read</a></li>
                            <li><a href="./email-compose.html">Compose</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">Apps</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./app-profile.html">Profile</a></li>
                            <li><a href="./app-calender.html">Calender</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-graph menu-icon"></i> <span class="nav-text">Charts</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./chart-flot.html">Flot</a></li>
                            <li><a href="./chart-morris.html">Morris</a></li>
                            <li><a href="./chart-chartjs.html">Chartjs</a></li>
                            <li><a href="./chart-chartist.html">Chartist</a></li>
                            <li><a href="./chart-sparkline.html">Sparkline</a></li>
                            <li><a href="./chart-peity.html">Peity</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">UI Components</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-grid menu-icon"></i><span class="nav-text">UI Components</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./ui-accordion.html">Accordion</a></li>
                            <li><a href="./ui-alert.html">Alert</a></li>
                            <li><a href="./ui-badge.html">Badge</a></li>
                            <li><a href="./ui-button.html">Button</a></li>
                            <li><a href="./ui-button-group.html">Button Group</a></li>
                            <li><a href="./ui-cards.html">Cards</a></li>
                            <li><a href="./ui-carousel.html">Carousel</a></li>
                            <li><a href="./ui-dropdown.html">Dropdown</a></li>
                            <li><a href="./ui-list-group.html">List Group</a></li>
                            <li><a href="./ui-media-object.html">Media Object</a></li>
                            <li><a href="./ui-modal.html">Modal</a></li>
                            <li><a href="./ui-pagination.html">Pagination</a></li>
                            <li><a href="./ui-popover.html">Popover</a></li>
                            <li><a href="./ui-progressbar.html">Progressbar</a></li>
                            <li><a href="./ui-tab.html">Tab</a></li>
                            <li><a href="./ui-typography.html">Typography</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-layers menu-icon"></i><span class="nav-text">Components</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./uc-nestedable.html">Nestedable</a></li>
                            <li><a href="./uc-noui-slider.html">Noui Slider</a></li>
                            <li><a href="./uc-sweetalert.html">Sweet Alert</a></li>
                            <li><a href="./uc-toastr.html">Toastr</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="widgets.html" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
                        </a>
                    </li>
                    <li class="nav-label">Forms</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-note menu-icon"></i><span class="nav-text">Forms</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./form-basic.html">Basic Form</a></li>
                            <li><a href="./form-validation.html">Form Validation</a></li>
                            <li><a href="./form-step.html">Step Form</a></li>
                            <li><a href="./form-editor.html">Editor</a></li>
                            <li><a href="./form-picker.html">Picker</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">Table</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">Table</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./table-basic.html" aria-expanded="false">Basic Table</a></li>
                            <li><a href="./table-datatable.html" aria-expanded="false">Data Table</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">Pages</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-notebook menu-icon"></i><span class="nav-text">Pages</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./page-login.html">Login</a></li>
                            <li><a href="./page-register.html">Register</a></li>
                            <li><a href="./page-lock.html">Lock Screen</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">Error</a>
                                <ul aria-expanded="false">
                                    <li><a href="./page-error-404.html">Error 404</a></li>
                                    <li><a href="./page-error-403.html">Error 403</a></li>
                                    <li><a href="./page-error-400.html">Error 400</a></li>
                                    <li><a href="./page-error-500.html">Error 500</a></li>
                                    <li><a href="./page-error-503.html">Error 503</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul> -->
                <ul class="metismenu in" id="menu">
                    <li class="">
                        <!-- <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">개인 일정</span>
                        </a> -->
                        <a class="" href="schedule" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">개인 일정</span>
                        </a>
                    </li>
                    <li class="">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-notebook menu-icon"></i><span class="nav-text">업무 관리</span>
                        </a>
                        <ul aria-expanded="false" class="collapse" style="height: 0px;">
                            <li><a href="./page-login.html">프로젝트 업무 관리</a></li>
                            <li><a href="./page-register.html">팀 업무 관리</a></li>
                            <li><a href="./page-lock.html">개인 업무 관리</a></li>
                        </ul>
                    </li>
                    <li class="mega-menu mega-menu-sm">
                        <!-- <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">인력 조회</span>
                        </a> -->
                        <!-- has-arrow 지우긴 했는데 클릭한 이후 선택된 상태로 남는지는 확인해야 함 -->
                        <a class="" href="searchHuman" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">인력 조회</span>
                        </a>
                    </li>
                    
                    <li class="">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-note menu-icon"></i><span class="nav-text">게시판</span>
                        </a>
                        <ul aria-expanded="false" class="collapse" style="height: 0px;">
                            <li><a href="./form-basic.html">공지사항</a></li>
                            <li><a href="./form-validation.html">질의 게시판</a></li>
                            <li><a href="./form-step.html">자유 게시판</a></li>
                            <li><a href="./form-editor.html">팀 게시판</a></li>
                        </ul>
                    </li>
                    <li class="">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-grid menu-icon"></i><span class="nav-text">시스템 관리</span>
                        </a>
                        <ul aria-expanded="false" class="collapse" style="height: 0px;">
                            <li><a href="${pageContext.request.contextPath}/projectManagement/projectList">프로젝트 관리</a></li>
                            <li><a href="./ui-alert.html">팀 관리</a></li>
                            <li><a href="./ui-badge.html">인력 관리</a></li>
                            <li><a href="./ui-button.html">권한 관리</a></li>
                            <li><a href="./ui-button-group.html">게시판 관리</a></li>
                        <!-- </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-layers menu-icon"></i><span class="nav-text">Components</span>
                        </a>
                        <ul aria-expanded="false"> -->
                        </ul>
                     </li>
                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->

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
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4><span style="position:relative; top:30px; left:30px;"><b>인력 관리</b></span></h4>
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
                                                	<a href="addAndModifyEmployee">
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
            <div class="modal fade" id="singleRegister" tabindex="-1" role="dialog" aria-labelledby="singleRegisterLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="singleRegisterLabel">인력 개별 등록</h5>
			            </div>
			            <div class="modal-body">
			                <form class="form-valide" action="#" method="post">
	                            <div class="form-group row">
	                                <label class="col-lg-3 col-form-label" for="val-username">이름
	                                </label>
	                                <div class="col-lg-7">
	                                    <input type="text" class="form-control" id="val-username" name="val-username" placeholder="Enter a username..">
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-3 col-form-label" for="positionSelect">직책</label>
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
	                                <label class="col-lg-3 col-form-label" for="phoneNumber">연락처 
	                                </label>
	                                <div class="col-lg-7">
	                                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="010-xxxx-xxxx">
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                             <label class="col-lg-3 col-form-label" for="projectSelect">프로젝트 </label>
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
	                             <label class="col-lg-3 col-form-label" for="teamSelect">팀</label>
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
	                             <label class="col-lg-3 col-form-label" for="authoritySelect">권한</label>
	                             <div class="col-lg-7">
	                                 <select class="form-control" id="projectSelect" name="projectSelect">
	                                     <option value="">권한 선택</option>
	                                     <option value="html">팀원</option>
	                                     <option value="css">팀장</option>
	                                     <option value="javascript">관리자</option>
	                                     <option value="angular">고객사</option>
	                                 </select>
	                             </div>
	                            </div>
	                        </form>
			            </div>
			            <div class="modal-footer">
			            	<button type="button" class="btn btn-primary">등록</button>
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
    
    <script src="${pageContext.request.contextPath}/resources/plugins/tables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>

</body>

</html>