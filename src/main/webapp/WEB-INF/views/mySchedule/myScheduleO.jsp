<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link href="${pageContext.request.contextPath}/resources/css/customStyle.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mySchedule/myScheduleCustom.css" rel="stylesheet">

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
                <a href="index.html">
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
                                <span class="badge gradient-1 badge-pill badge-primary badge-custom">3</span>
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
                                <span class="badge badge-pill gradient-2 badge-primary badge-custom">3</span>
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
                            <!-- <li><a href="./form-basic.html">공지사항</a></li>
                            <li><a href="./form-validation.html">질의 게시판</a></li>
                            <li><a href="./form-step.html">자유 게시판</a></li>
                            <li><a href="./form-editor.html">팀 게시판</a></li> -->
                            <li><a href="${pageContext.request.contextPath}/infoBoard">공지사항</a></li>
                            <li><a href="${pageContext.request.contextPath}/inquiryBoard">질의 게시판</a></li>
                            <li><a href="${pageContext.request.contextPath}/libertyBoard">자유 게시판</a></li>
                            <li><a href="${pageContext.request.contextPath}/teamBoard">팀 게시판</a></li>
                        </ul>
                    </li>
                    <li class="">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-grid menu-icon"></i><span class="nav-text">시스템 관리</span>
                        </a>
                        <ul aria-expanded="false" class="collapse" style="height: 0px;">
                            <li><a href="./ui-accordion.html">프로젝트 관리</a></li>
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

            <div class="container-fluid">
                <!-- row -->
                <div class="row">
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-intro-title">Calendar</h4>

                                <div class="">
                                    <div id="external-events" class="my-3">
                                        <p>Drag and drop your event or click in the calendar</p>
                                        <div class="external-event ui-draggable ui-draggable-handle" data-class="bg-primary" style="position: relative;"><i class="fa fa-move"></i>New Theme Release</div>
                                        <div class="external-event ui-draggable ui-draggable-handle" data-class="bg-success" style="position: relative;"><i class="fa fa-move"></i>My Event
                                        </div>
                                        <div class="external-event ui-draggable ui-draggable-handle" data-class="bg-warning" style="position: relative;"><i class="fa fa-move"></i>Meet manager</div>
                                        <div class="external-event ui-draggable ui-draggable-handle" data-class="bg-dark" style="position: relative;"><i class="fa fa-move"></i>Create New theme</div>
                                    </div>
                                    <!-- checkbox -->
                                    <div class="checkbox checkbox-event pt-3 pb-5">
                                        <input id="drop-remove" class="styled-checkbox" type="checkbox">
                                        <label class="ml-2 mb-0" for="drop-remove">Remove After Drop</label>
                                    </div>
                                    <a href="javascript:void()" data-toggle="modal" data-target="#add-category" class="btn btn-primary btn-event w-100">
                                        <span class="align-middle"><i class="ti-plus"></i></span> Create New
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="card">
                            <div class="card-body">
                                <div id="calendar" class="app-fullcalendar fc fc-unthemed fc-ltr"><div class="fc-toolbar fc-header-toolbar"><div class="fc-left"><div class="fc-button-group"><button type="button" class="fc-prev-button fc-button fc-state-default fc-corner-left" aria-label="prev"><span class="fc-icon fc-icon-left-single-arrow"></span></button><button type="button" class="fc-next-button fc-button fc-state-default fc-corner-right" aria-label="next"><span class="fc-icon fc-icon-right-single-arrow"></span></button></div><button type="button" class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right fc-state-disabled" disabled="">today</button></div><div class="fc-right"><div class="fc-button-group"><button type="button" class="fc-month-button fc-button fc-state-default fc-corner-left fc-state-active">month</button><button type="button" class="fc-agendaWeek-button fc-button fc-state-default">week</button><button type="button" class="fc-agendaDay-button fc-button fc-state-default fc-corner-right">day</button></div></div><div class="fc-center"><h2>October 2023</h2></div><div class="fc-clear"></div></div><div class="fc-view-container" style=""><div class="fc-view fc-month-view fc-basic-view" style=""><table class=""><thead class="fc-head"><tr><td class="fc-head-container fc-widget-header"><div class="fc-row fc-widget-header"><table class=""><thead><tr><th class="fc-day-header fc-widget-header fc-sun"><span>Sun</span></th><th class="fc-day-header fc-widget-header fc-mon"><span>Mon</span></th><th class="fc-day-header fc-widget-header fc-tue"><span>Tue</span></th><th class="fc-day-header fc-widget-header fc-wed"><span>Wed</span></th><th class="fc-day-header fc-widget-header fc-thu"><span>Thu</span></th><th class="fc-day-header fc-widget-header fc-fri"><span>Fri</span></th><th class="fc-day-header fc-widget-header fc-sat"><span>Sat</span></th></tr></thead></table></div></td></tr></thead><tbody class="fc-body"><tr><td class="fc-widget-content"><div class="fc-scroller fc-day-grid-container" style="overflow: hidden; height: 743.333px;"><div class="fc-day-grid fc-unselectable"><div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 123px;"><div class="fc-bg"><table class=""><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-past" data-date="2023-10-01"></td><td class="fc-day fc-widget-content fc-mon fc-past" data-date="2023-10-02"></td><td class="fc-day fc-widget-content fc-tue fc-past" data-date="2023-10-03"></td><td class="fc-day fc-widget-content fc-wed fc-past" data-date="2023-10-04"></td><td class="fc-day fc-widget-content fc-thu fc-past" data-date="2023-10-05"></td><td class="fc-day fc-widget-content fc-fri fc-past" data-date="2023-10-06"></td><td class="fc-day fc-widget-content fc-sat fc-past" data-date="2023-10-07"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-top fc-sun fc-past" data-date="2023-10-01"><span class="fc-day-number">1</span></td><td class="fc-day-top fc-mon fc-past" data-date="2023-10-02"><span class="fc-day-number">2</span></td><td class="fc-day-top fc-tue fc-past" data-date="2023-10-03"><span class="fc-day-number">3</span></td><td class="fc-day-top fc-wed fc-past" data-date="2023-10-04"><span class="fc-day-number">4</span></td><td class="fc-day-top fc-thu fc-past" data-date="2023-10-05"><span class="fc-day-number">5</span></td><td class="fc-day-top fc-fri fc-past" data-date="2023-10-06"><span class="fc-day-number">6</span></td><td class="fc-day-top fc-sat fc-past" data-date="2023-10-07"><span class="fc-day-number">7</span></td></tr></thead><tbody><tr style=""><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div><div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 123px;"><div class="fc-bg"><table class=""><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-past" data-date="2023-10-08"></td><td class="fc-day fc-widget-content fc-mon fc-past" data-date="2023-10-09"></td><td class="fc-day fc-widget-content fc-tue fc-past" data-date="2023-10-10"></td><td class="fc-day fc-widget-content fc-wed fc-past" data-date="2023-10-11"></td><td class="fc-day fc-widget-content fc-thu fc-past" data-date="2023-10-12"></td><td class="fc-day fc-widget-content fc-fri fc-past" data-date="2023-10-13"></td><td class="fc-day fc-widget-content fc-sat fc-past" data-date="2023-10-14"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-top fc-sun fc-past" data-date="2023-10-08"><span class="fc-day-number">8</span></td><td class="fc-day-top fc-mon fc-past" data-date="2023-10-09"><span class="fc-day-number">9</span></td><td class="fc-day-top fc-tue fc-past" data-date="2023-10-10"><span class="fc-day-number">10</span></td><td class="fc-day-top fc-wed fc-past" data-date="2023-10-11"><span class="fc-day-number">11</span></td><td class="fc-day-top fc-thu fc-past" data-date="2023-10-12"><span class="fc-day-number">12</span></td><td class="fc-day-top fc-fri fc-past" data-date="2023-10-13"><span class="fc-day-number">13</span></td><td class="fc-day-top fc-sat fc-past" data-date="2023-10-14"><span class="fc-day-number">14</span></td></tr></thead><tbody><tr style=""><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div><div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 123px;"><div class="fc-bg"><table class=""><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-past" data-date="2023-10-15"></td><td class="fc-day fc-widget-content fc-mon fc-past" data-date="2023-10-16"></td><td class="fc-day fc-widget-content fc-tue fc-past" data-date="2023-10-17"></td><td class="fc-day fc-widget-content fc-wed fc-past" data-date="2023-10-18"></td><td class="fc-day fc-widget-content fc-thu fc-today " data-date="2023-10-19"></td><td class="fc-day fc-widget-content fc-fri fc-future" data-date="2023-10-20"></td><td class="fc-day fc-widget-content fc-sat fc-future" data-date="2023-10-21"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-top fc-sun fc-past" data-date="2023-10-15"><span class="fc-day-number">15</span></td><td class="fc-day-top fc-mon fc-past" data-date="2023-10-16"><span class="fc-day-number">16</span></td><td class="fc-day-top fc-tue fc-past" data-date="2023-10-17"><span class="fc-day-number">17</span></td><td class="fc-day-top fc-wed fc-past" data-date="2023-10-18"><span class="fc-day-number">18</span></td><td class="fc-day-top fc-thu fc-today " data-date="2023-10-19"><span class="fc-day-number">19</span></td><td class="fc-day-top fc-fri fc-future" data-date="2023-10-20"><span class="fc-day-number">20</span></td><td class="fc-day-top fc-sat fc-future" data-date="2023-10-21"><span class="fc-day-number">21</span></td></tr></thead><tbody><tr style=""><td></td><td></td><td></td><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-danger fc-draggable"><div class="fc-content"><span class="fc-time">3:54p</span> <span class="fc-title">Soft drinks</span></div></a></td><td></td><td></td><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-dark fc-draggable"><div class="fc-content"><span class="fc-time">11:48a</span> <span class="fc-title">Chicken Burger</span></div></a></td></tr></tbody></table></div></div><div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 123px;"><div class="fc-bg"><table class=""><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-future" data-date="2023-10-22"></td><td class="fc-day fc-widget-content fc-mon fc-future" data-date="2023-10-23"></td><td class="fc-day fc-widget-content fc-tue fc-future" data-date="2023-10-24"></td><td class="fc-day fc-widget-content fc-wed fc-future" data-date="2023-10-25"></td><td class="fc-day fc-widget-content fc-thu fc-future" data-date="2023-10-26"></td><td class="fc-day fc-widget-content fc-fri fc-future" data-date="2023-10-27"></td><td class="fc-day fc-widget-content fc-sat fc-future" data-date="2023-10-28"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-top fc-sun fc-future" data-date="2023-10-22"><span class="fc-day-number">22</span></td><td class="fc-day-top fc-mon fc-future" data-date="2023-10-23"><span class="fc-day-number">23</span></td><td class="fc-day-top fc-tue fc-future" data-date="2023-10-24"><span class="fc-day-number">24</span></td><td class="fc-day-top fc-wed fc-future" data-date="2023-10-25"><span class="fc-day-number">25</span></td><td class="fc-day-top fc-thu fc-future" data-date="2023-10-26"><span class="fc-day-number">26</span></td><td class="fc-day-top fc-fri fc-future" data-date="2023-10-27"><span class="fc-day-number">27</span></td><td class="fc-day-top fc-sat fc-future" data-date="2023-10-28"><span class="fc-day-number">28</span></td></tr></thead><tbody><tr style=""><td></td><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-primary fc-draggable"><div class="fc-content"><span class="fc-time">1:48p</span> <span class="fc-title">Hot dog</span></div></a></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div><div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 123px;"><div class="fc-bg"><table class=""><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-future" data-date="2023-10-29"></td><td class="fc-day fc-widget-content fc-mon fc-future" data-date="2023-10-30"></td><td class="fc-day fc-widget-content fc-tue fc-future" data-date="2023-10-31"></td><td class="fc-day fc-widget-content fc-wed fc-other-month fc-future" data-date="2023-11-01"></td><td class="fc-day fc-widget-content fc-thu fc-other-month fc-future" data-date="2023-11-02"></td><td class="fc-day fc-widget-content fc-fri fc-other-month fc-future" data-date="2023-11-03"></td><td class="fc-day fc-widget-content fc-sat fc-other-month fc-future" data-date="2023-11-04"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-top fc-sun fc-future" data-date="2023-10-29"><span class="fc-day-number">29</span></td><td class="fc-day-top fc-mon fc-future" data-date="2023-10-30"><span class="fc-day-number">30</span></td><td class="fc-day-top fc-tue fc-future" data-date="2023-10-31"><span class="fc-day-number">31</span></td><td class="fc-day-top fc-wed fc-other-month fc-future" data-date="2023-11-01"><span class="fc-day-number">1</span></td><td class="fc-day-top fc-thu fc-other-month fc-future" data-date="2023-11-02"><span class="fc-day-number">2</span></td><td class="fc-day-top fc-fri fc-other-month fc-future" data-date="2023-11-03"><span class="fc-day-number">3</span></td><td class="fc-day-top fc-sat fc-other-month fc-future" data-date="2023-11-04"><span class="fc-day-number">4</span></td></tr></thead><tbody><tr style=""><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div><div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 128px;"><div class="fc-bg"><table class=""><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-other-month fc-future" data-date="2023-11-05"></td><td class="fc-day fc-widget-content fc-mon fc-other-month fc-future" data-date="2023-11-06"></td><td class="fc-day fc-widget-content fc-tue fc-other-month fc-future" data-date="2023-11-07"></td><td class="fc-day fc-widget-content fc-wed fc-other-month fc-future" data-date="2023-11-08"></td><td class="fc-day fc-widget-content fc-thu fc-other-month fc-future" data-date="2023-11-09"></td><td class="fc-day fc-widget-content fc-fri fc-other-month fc-future" data-date="2023-11-10"></td><td class="fc-day fc-widget-content fc-sat fc-other-month fc-future" data-date="2023-11-11"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-top fc-sun fc-other-month fc-future" data-date="2023-11-05"><span class="fc-day-number">5</span></td><td class="fc-day-top fc-mon fc-other-month fc-future" data-date="2023-11-06"><span class="fc-day-number">6</span></td><td class="fc-day-top fc-tue fc-other-month fc-future" data-date="2023-11-07"><span class="fc-day-number">7</span></td><td class="fc-day-top fc-wed fc-other-month fc-future" data-date="2023-11-08"><span class="fc-day-number">8</span></td><td class="fc-day-top fc-thu fc-other-month fc-future" data-date="2023-11-09"><span class="fc-day-number">9</span></td><td class="fc-day-top fc-fri fc-other-month fc-future" data-date="2023-11-10"><span class="fc-day-number">10</span></td><td class="fc-day-top fc-sat fc-other-month fc-future" data-date="2023-11-11"><span class="fc-day-number">11</span></td></tr></thead><tbody><tr style=""><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div></div></div></td></tr></tbody></table></div></div></div>
                            </div>
                        </div>
                    </div>
                    <!-- BEGIN MODAL -->
                    <div class="modal fade none-border" id="event-modal" aria-hidden="true" style="display: none;">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title"><strong>Add New Event</strong></h4>
                                </div>
                                <div class="modal-body"><form><div class="row"><div class="col-md-6"><div class="form-group"><label class="control-label">Event Name</label><input class="form-control" placeholder="Insert Event Name" type="text" name="title"></div></div><div class="col-md-6"><div class="form-group"><label class="control-label">Category</label><select class="form-control" name="category"><option value="bg-danger">Danger</option><option value="bg-success">Success</option><option value="bg-dark">Dark</option><option value="bg-primary">Primary</option><option value="bg-pink">Pink</option><option value="bg-info">Info</option><option value="bg-warning">Warning</option></select></div></div></div></form></div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-success save-event waves-effect waves-light">Create
                                        event</button>

                                    <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal" style="display: none;">Delete</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Add Category -->
                    <div class="modal fade none-border" id="add-category">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title"><strong>Add a category</strong></h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Category Name</label>
                                                <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name">
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">Choose Category Color</label>
                                                <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                                    <option value="success">Success</option>
                                                    <option value="danger">Danger</option>
                                                    <option value="info">Info</option>
                                                    <option value="pink">Pink</option>
                                                    <option value="primary">Primary</option>
                                                    <option value="warning">Warning</option>
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
    <script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
</body>

</html>