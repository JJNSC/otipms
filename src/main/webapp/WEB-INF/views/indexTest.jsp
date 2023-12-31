<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    
    <!-- theme meta -->
    <meta name="theme-name" content="quixlab" />
  
    <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png">
    <!-- Pignose Calender -->
    <link href="${pageContext.request.contextPath}/resources/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

</head>

<body>
	<div id="main-wrapper" class="show">
	<jsp:include page="headernsidebar.jsp">
		<jsp:param name="employee" value="${employee}" />
	</jsp:include>
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="container-fluid mt-3">
                <!-- <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-1">
                            <div class="card-body">
                                <h3 class="card-title text-white">Products Sold</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">4565</h2>
                                    <p class="text-white mb-0">Jan - March 2019</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-shopping-cart"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-2">
                            <div class="card-body">
                                <h3 class="card-title text-white">Net Profit</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">$ 8541</h2>
                                    <p class="text-white mb-0">Jan - March 2019</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-money"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-3">
                            <div class="card-body">
                                <h3 class="card-title text-white">New Customers</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">4565</h2>
                                    <p class="text-white mb-0">Jan - March 2019</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-users"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-4">
                            <div class="card-body">
                                <h3 class="card-title text-white">Customer Satisfaction</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">99%</h2>
                                    <p class="text-white mb-0">Jan - March 2019</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-heart"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                 -->
                <!-- 달력 & 개인 일정 -->
                <div class="row">
					<div class="col-lg-5">
						<div class="card">
							<div class="card-body">
								<div class="year-calendar">
									<div class="pignose-calendar pignose-calendar-blue pignose-calendar-default">
										<div class="pignose-calendar-top">
											<a href="#"
												class="pignose-calendar-top-nav pignose-calendar-top-prev">
												<span class="icon-arrow-left pignose-calendar-top-icon"></span>
											</a>
											<div class="pignose-calendar-top-date">
												<span class="pignose-calendar-top-month">October</span> <span
													class="pignose-calendar-top-year">2023</span>
											</div>
											<a href="#"
												class="pignose-calendar-top-nav pignose-calendar-top-next">
												<span class="icon-arrow-right pignose-calendar-top-icon"></span>
											</a>
										</div>
										<div class="pignose-calendar-header">
											<div class="pignose-calendar-week pignose-calendar-week-sun">SUN</div>
											<div class="pignose-calendar-week pignose-calendar-week-mon">MON</div>
											<div class="pignose-calendar-week pignose-calendar-week-tue">TUE</div>
											<div class="pignose-calendar-week pignose-calendar-week-wed">WED</div>
											<div class="pignose-calendar-week pignose-calendar-week-thu">THU</div>
											<div class="pignose-calendar-week pignose-calendar-week-fri">FRI</div>
											<div class="pignose-calendar-week pignose-calendar-week-sat">SAT</div>
										</div>
										<div class="pignose-calendar-body">
											<div class="pignose-calendar-row">
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sun"
													data-date="2023-10-01">
													<a href="#">1</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-mon"
													data-date="2023-10-02">
													<a href="#">2</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-tue"
													data-date="2023-10-03">
													<a href="#">3</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-wed"
													data-date="2023-10-04">
													<a href="#">4</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-thu"
													data-date="2023-10-05">
													<a href="#">5</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-fri"
													data-date="2023-10-06">
													<a href="#">6</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sat"
													data-date="2023-10-07">
													<a href="#">7</a>
												</div>
											</div>
											<div class="pignose-calendar-row">
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sun"
													data-date="2023-10-08">
													<a href="#">8</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-mon"
													data-date="2023-10-09">
													<a href="#">9</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-tue"
													data-date="2023-10-10">
													<a href="#">10</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-wed"
													data-date="2023-10-11">
													<a href="#">11</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-thu"
													data-date="2023-10-12">
													<a href="#">12</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-fri pignose-calendar-unit-active pignose-calendar-unit-first-active"
													data-date="2023-10-13">
													<a href="#">13</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sat"
													data-date="2023-10-14">
													<a href="#">14</a>
												</div>
											</div>
											<div class="pignose-calendar-row">
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sun"
													data-date="2023-10-15">
													<a href="#">15</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-mon"
													data-date="2023-10-16">
													<a href="#">16</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-tue"
													data-date="2023-10-17">
													<a href="#">17</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-wed"
													data-date="2023-10-18">
													<a href="#">18</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-thu"
													data-date="2023-10-19">
													<a href="#">19</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-fri"
													data-date="2023-10-20">
													<a href="#">20</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sat"
													data-date="2023-10-21">
													<a href="#">21</a>
												</div>
											</div>
											<div class="pignose-calendar-row">
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sun"
													data-date="2023-10-22">
													<a href="#">22</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-mon"
													data-date="2023-10-23">
													<a href="#">23</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-tue"
													data-date="2023-10-24">
													<a href="#">24</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-wed"
													data-date="2023-10-25">
													<a href="#">25</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-thu"
													data-date="2023-10-26">
													<a href="#">26</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-fri"
													data-date="2023-10-27">
													<a href="#">27</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sat"
													data-date="2023-10-28">
													<a href="#">28</a>
												</div>
											</div>
											<div class="pignose-calendar-row">
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sun"
													data-date="2023-10-29">
													<a href="#">29</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-mon"
													data-date="2023-10-30">
													<a href="#">30</a>
												</div>
												<div
													class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-tue"
													data-date="2023-10-31">
													<a href="#">31</a>
												</div>
												<div class="pignose-calendar-unit pignose-calendar-unit-wed"></div>
												<div class="pignose-calendar-unit pignose-calendar-unit-thu"></div>
												<div class="pignose-calendar-unit pignose-calendar-unit-fri"></div>
												<div class="pignose-calendar-unit pignose-calendar-unit-sat"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /# card -->
					</div>
				</div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body pb-0 d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-1">Product Sales</h4>
                                            <p>Total Earnings of the Month</p>
                                            <h3 class="m-0">$ 12,555</h3>
                                        </div>
                                        <div>
                                            <ul>
                                                <li class="d-inline-block mr-3"><a class="text-dark" href="#">Day</a></li>
                                                <li class="d-inline-block mr-3"><a class="text-dark" href="#">Week</a></li>
                                                <li class="d-inline-block"><a class="text-dark" href="#">Month</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="chart-wrapper">
                                        <canvas id="chart_widget_2"></canvas>
                                    </div>
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between">
                                            <div class="w-100 mr-2">
                                                <h6>Pixel 2</h6>
                                                <div class="progress" style="height: 6px">
                                                    <div class="progress-bar bg-danger" style="width: 40%"></div>
                                                </div>
                                            </div>
                                            <div class="ml-2 w-100">
                                                <h6>iPhone X</h6>
                                                <div class="progress" style="height: 6px">
                                                    <div class="progress-bar bg-primary" style="width: 80%"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                

                <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Order Summary</h4>
                                    <div id="morris-bar-chart"></div>
                                </div>
                            </div>
                            
                        </div>    
                    </div>
                

                <div class="row">
                    <div class="col-xl-3 col-lg-6 col-sm-6 col-xxl-6">

                        <div class="card">
                            <div class="chart-wrapper mb-4">
                                <div class="px-4 pt-4 d-flex justify-content-between">
                                    <div>
                                        <h4>Sales Activities</h4>
                                        <p>Last 6 Month</p>
                                    </div>
                                    <div>
                                        <span><i class="fa fa-caret-up text-success"></i></span>
                                        <h4 class="d-inline-block text-success">720</h4>
                                        <p class=" text-danger">+120.5(5.0%)</p>
                                    </div>
                                </div>
                                <div>
                                        <canvas id="chart_widget_3"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-12 col-sm-12 col-xxl-12">
                        <div class="card">
                            <div class="card-body">
                                    <h4 class="card-title mb-0">Store Location</h4>
                                <div id="world-map" style="height: 470px;"></div>
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

    <!-- Chartjs -->
    <script src="${pageContext.request.contextPath}/resources/plugins/chart.js/Chart.bundle.min.js"></script>
    <!-- Circle progress -->
    <script src="${pageContext.request.contextPath}/resources/plugins/circle-progress/circle-progress.min.js"></script>
    <!-- Datamap -->
    <script src="${pageContext.request.contextPath}/resources/plugins/d3v3/index.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/topojson/topojson.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/datamaps/datamaps.world.min.js"></script>
    <!-- Morrisjs -->
    <script src="${pageContext.request.contextPath}/resources/plugins/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/morris/morris.min.js"></script>
    <!-- Pignose Calender -->
    <script src="${pageContext.request.contextPath}/resources/plugins/moment/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/pg-calendar/js/pignose.calendar.min.js"></script>
    <!-- ChartistJS -->
    <script src="${pageContext.request.contextPath}/resources/plugins/chartist/js/chartist.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>



    <script src="${pageContext.request.contextPath}/resources/js/dashboard/dashboard-1.js"></script>

</body>

</html>
