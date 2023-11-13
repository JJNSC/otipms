<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    
    <!-- theme meta -->
    <meta name="theme-name" content="quixlab" />
  
    <title>OTIPMS</title>
    <!-- Favicon icon -->
    <%-- <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png"> --%>
    <link rel="icon" type="image/jpeg" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/otipmsFavicon.png">
    <!-- Pignose Calender -->
    <link href="${pageContext.request.contextPath}/resources/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/customStyle.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
	<style>
		.nk-sidebar{
			 height : 96%;
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
	<jsp:include page="headernsidebar.jsp">
		<jsp:param name="employee" value="${employee}" />
		<jsp:param name="mf" value="${mf}" />
		<jsp:param name="base64Img" value="${base64Img}" />
	</jsp:include>
        <!--**********************************
            Content body start
        ***********************************-->
        <!-- <div style="min-height:764px; margin-left: 15.1875rem;"> -->
         <div style="height:810px; margin-left: 15.1875rem; margin-top:100px;">
        <!-- <script>
        	var element = document.getElementById('contentBody');
        	element.style.setProperty('min-height', '800px', 'important');
        </script> -->
            <div style="width:100%;padding-right:15px;padding-left:15px;margin-left:auto;margin-right:auto;margin-top:1rem;height:810px;">
            	<div class="row">
            		<div class="col-lg-8" style="padding-right: 0px;">
           				<!-- 달력 -->
            			<div class="row" style="height: 54%">
            				<div class="col-12">
            					<div class="card" style="height: 28.3rem;">
									<div class="card-body" style="padding-top:0px;padding-bottom:0px;">
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
            				</div>
            			</div>
           				<!-- 공지사항 -->
           				<div class="row">
           					<div class="col-12">
            					<div class="card card-custom">
		                            <!-- <div class="card-body" style="height:304px; padding:20px,28px;"> -->
		                            <div class="card-body" style="height:304px;">
		                                <div class="card-title">
		                                    <h4 style="font-weight: bolder;">공지사항</h4>
		                                </div>
		                                <div class="table-responsive">
		                                    <table class="table table-hover table-custom">
		                                        <thead>
			                                        <tr>
			                                            <th></th>
			                                            <th style="width: 35%;">제목</th>
			                                            <th>작성자</th>
			                                            <th>작성일</th>
			                                            <th>조회수</th>
			                                        </tr>
		                                        </thead>
		                                        <tbody id="boardTbody">
		                                        	<c:if test="${fn:length(boardPagerMap.boardList) == 0}">
		                                        		<tr>
		                                        			<td></td>
		                                        			<td></td>
		                                        			<td colspan="2">게시글이 존재하지 않습니다.<td>
		                                        		</tr>
		                                        	</c:if>
		                                        	<c:if test="${fn:length(boardPagerMap.boardList) != 0}">
			                                        	<c:forEach var="board" items="${boardPagerMap.boardList}">
				                                       		<tr onclick="window.location.href='detailBoard?boardNo=${board.boardNo}';">
				                                                <td>${board.rnum}</td>
				                                                <td>
				                                                	${board.boardTitle}
				                                                	<c:if test="${board.mediaFileName != null}">
					                                                	&nbsp;
					                                                	<i class="icon-copy fa fa-paperclip" aria-hidden="true" style="transform: rotate(445deg);"></i>
				                                                	</c:if>
				                                                	<c:if test="${board.commentCount != 0}">
					                                                	&nbsp;
					                                                	<span class="text-red">[${board.commentCount}]</span>
				                                                	</c:if>
				                                                </td>
				                                                <td>${board.empName}</td>
				                                                <!-- 오늘 날짜면 시간만 보이도록 -->
				                                                <c:set var="now" value="<%= new java.util.Date() %>" />
				                                                <c:choose>
																    <c:when test="${fn:substring(board.boardWriteDate, 0, 10) == fn:substring(now, 0, 10)}">
																        <td>
																            <fmt:formatDate value="${board.boardWriteDate}" pattern="HH:mm"/>
																        </td>
																    </c:when>
																    <c:otherwise>
																        <td>
																            <fmt:formatDate value="${board.boardWriteDate}" pattern="yyyy.MM.dd"/>
																        </td>
																    </c:otherwise>
																</c:choose>
				                                                <td>${board.boardHitcount}</td>
				                                            </tr>
			                                        	</c:forEach>
			                                        </c:if>
		                                        </tbody>
		                                    </table>
		                                </div>
		                            </div>
		                            <c:if test="${fn:length(boardPagerMap.boardList) != 0}">
		                            	<div class="bootstrap-pagination">
			                           		<!-- <nav> -->
			                           		<nav class="justify-content-center" style="display: flex; margin-bottom: 1rem;">
			                           			<c:set var="pager" value="${boardPagerMap.boardPager}" />
						                        <!-- <ul class="pagination justify-content-center"> -->
					                        	<c:if test="${pager.groupNo>1}">
					                        		<input type="button" class="page-link" tabindex="-1" value="이전" onclick="movePage(${pager.startPageNo-1})">
					                            </c:if>
					                            <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
													<c:if test="${pager.pageNo == i}">
														<input type="button" class="page-link selected" value="${i}" onclick="movePage(${i})">
													</c:if>
													<c:if test="${pager.pageNo != i}">
														<input type="button" class="page-link" value="${i}" onclick="movePage(${i})">
													</c:if>
												</c:forEach>
												<c:if test="${pager.groupNo<pager.totalGroupNo}">
													<input type="button" class="page-link" value="다음" onclick="movePage(${pager.endPageNo+1})">
					                            </c:if>
						                    </nav>
						                </div>
		                            </c:if>
		                        </div>
            				</div>
           				</div>
            		</div>
            		<div class="col-lg-4">
            			<!-- 진척도 -->
            			<div class="row" style="height:49%;">
            				<div class="col-12">
            					<div class="card" style="height: 25.7rem;">
		                            <div class="card-body">
		                                <h4 class="card-title mb-5" style="font-weight: bolder;">${project.projectName } 진척률</h4>
		                                <canvas id="myChart" style="width:100%;max-width:800px; height:270px;"></canvas>
		                                <script>
		                                	var beforeCnt = ${projectTaskCount.undoneTaskCnt};	
		                                	var nowCnt = ${projectTaskCount.proceedingTaskCnt};	
		                                	var finishCnt = ${projectTaskCount.finishedTaskCnt};	
		                                	var beforeRate = ${projectTaskCount.undoneTaskRate};	
		                                	var nowRate = ${projectTaskCount.proceedingTaskRate};	
		                                	var finishRate = ${projectTaskCount.finishedTaskRate};	
		                                
											var xValues = ["진행전 "+beforeRate+"%" ,"진행중 "+nowRate+"%", "완료 "+finishRate+"%"];
											var yValues = [beforeCnt, nowCnt, finishCnt];
											var barColors = [
												,
											  "#2b5797",
											  "#00aba9"
											];
											
											new Chart("myChart", {
											  type: "doughnut",
											  data: {
											    labels: xValues,
											    datasets: [{
											      backgroundColor: barColors,
											      data: yValues
											    }]
											  },
											  options: {
												    title: {
												      display: false,
												      text: "48.7% 진행중",
												      position: "bottom"
												    }
												  }
											});
										</script>
		                                <!-- <canvas id="doughutChart" width="500" height="250"></canvas> -->
		                            </div>
		                        </div>
            				</div>
            			</div>
            			<!-- 프로젝트 정보 -->
            			<div class="row">
            				<div class="col-12">
            					<div class="card" style="height:100%;">
				                    <div class="card-body" style="">
				                    	 <h4 class="card-title" style="font-weight: bolder;">프로젝트 정보</h4>
				                    	 <table>
				                    	 	<thead>
				                    	 		<tr >
				                    	 			<th >프로젝트 명</th>
				                    	 			<td style="width:32px;"></td>
				                    	 			<td>${project.projectName}</td>
				                    	 		</tr>
				                    	 		<tr>
				                    	 			<th>프로젝트 시작 날짜</th>
				                    	 			<td ></td>
				                    	 			<td>
				                    	 				<fmt:formatDate pattern="yyyy년  MM월 dd일" value="${project.projectStartDate}"></fmt:formatDate>
				                    	 			</td>
				                    	 		</tr>
				                    	 		<tr>
				                    	 			<th>프로젝트 종료 날짜</th>
				                    	 			<td ></td>
				                    	 			<td>
				                    	 				<fmt:formatDate pattern="yyyy년  MM월 dd일" value="${project.projectEndDate}"></fmt:formatDate>
				                    	 			</td>
				                    	 		</tr>
				                    	 		<tr>
				                    	 			<th>프로젝트 개요</th>
				                    	 			<td ></td>
				                    	 			<td>${project.projectContent}</td>
				                    	 		</tr>
				                    	 	</thead>
				                    	 </table>
			                    	 </div>
			                    	 <div class="card-body">
				                    	 <h4 class="card-title" style="font-weight: bolder;">PM(Project Manager) 정보</h4>
				                    	 <table>
				                    	 	<thead>
				                    	 		<tr>
				                    	 			<th>사원 번호</th>
				                    	 			<td style="width:32px;"></td>
				                    	 			<td>${pmInfo.empId}</td>
				                    	 		</tr>
				                    	 		<tr>
				                    	 			<th>PM 이름</th>
				                    	 			<td ></td>
				                    	 			<td>${pmInfo.empName}</td>
				                    	 		</tr>
				                    	 		<tr>
				                    	 			<th>직급</th>
				                    	 			<td ></td>
				                    	 			<td>${pmInfo.empRank}</td>
				                    	 		</tr>
				                    	 		<tr>
				                    	 			<th>연락처</th>
				                    	 			<td ></td>
				                    	 			<td>${pmInfo.empTel}</td>
				                    	 		</tr>
				                    	 		<tr>
				                    	 			<th>이메일</th>
				                    	 			<td ></td>
				                    	 			<td>${pmInfo.empEmail}</td>
				                    	 		</tr>
				                    	 	</thead>
				                    	 </table>
			                    	 </div>
			                    </div>
            				</div>
            			</div>
            		</div>
            	</div>
                <div class="row d-none" style="height:28%;position:relative; bottom:20px;">
                    <!-- /# column -->
                    <div class="col-lg-8" style=" padding-right:10px;">
                        
                        <!-- /# card -->
                    </div>
                    <div class="col-lg-4 col-md-4" style="height:28%;position: relative;bottom:15px;">
	                    <div >
		                    
	                	</div>
                	</div>
                <div class="d-none">
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

                

                <div class="d-none">
                        <div class="col-lg-6 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Order Summary</h4>
                                    <div id="morris-bar-chart"></div>
                                </div>
                            </div>
                            
                        </div>    
                    </div>
                

                <div class="d-none">
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
            <!-- <div class="copyright">
                <p>Copyright &copy; Designed & Developed by OTIPMS 2023</p>
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



    <script src="${pageContext.request.contextPath}/resources/js/index/dashboardPM.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/index/indexPM.js"></script>

</body>

</html>
