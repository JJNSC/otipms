<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- Basic Page Info -->
		<meta charset="utf-8" />
		<title>채팅</title>

		<!-- CSS -->
		<link href="${pageContext.request.contextPath}/resources/css/chat/core.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/chat/style.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/chat/stylechat.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/customStyle.css" rel="stylesheet">
		
		<!-- js -->
		<script src="${pageContext.request.contextPath}/resources/js/chat/core.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/chat/script.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/chat/process.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/chat/layout-settings.js"></script>
		
	</head>
	<body class="header-white sidebar-dark">
		<div class="main-container">
			<div class="pd-ltr-20 xs-pd-20-10">
				<div class="min-height-200px">
					<div class="bg-white border-radius-4 box-shadow mb-30">
						<div class="row no-gutters">
							<div class="col-lg-3 col-md-4 col-sm-12">
								<div class="chat-list bg-light-gray">
									<div class="chat-search">
										<span class="icon-copy fa fa-search"></span>
										<input type="text" placeholder="Search Contact" />
										<img src="${pageContext.request.contextPath}/resources/images/chatplus.png" 
											  style="width:35px;height:30px;margin-left:15px;margin-top:13px;cursor:pointer"
										/>
									</div>
									<div
										class="notification-list chat-notification-list customscroll"
									>
										<ul>
											<li>
												<a href="#">
													<img src="/otipms/resources/images/user/1.jpg" alt=""/>
													<h3 class="clearfix">사원 김사원</h3>
													<p>
														<i class="fa fa-circle text-light-green"></i> online
													</p>
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/otipms/resources/images/user/1.jpg" alt=""/>
													<h3 class="clearfix">사원 김사원</h3>
													<p>
														<i class="fa fa-circle text-light-green"></i> online
													</p>
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/otipms/resources/images/user/1.jpg" alt=""/>
													<h3 class="clearfix">사원 김사원</h3>
													<p>
														<i class="fa fa-circle text-light-green"></i> online
													</p>
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/otipms/resources/images/user/1.jpg" alt=""/>
													<h3 class="clearfix">사원 김사원</h3>
													<p>
														<i class="fa fa-circle text-warning"></i> active 3
														min
													</p>
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/otipms/resources/images/user/1.jpg" alt=""/>
													<h3 class="clearfix">사원 김사원</h3>
													<p>
														<i class="fa fa-circle text-warning"></i> active 3
														min
													</p>
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/otipms/resources/images/user/1.jpg" alt=""/>
													<h3 class="clearfix">사원 김사원</h3>
													<p>
														<i class="fa fa-circle text-warning"></i> active 3
														min
													</p>
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/otipms/resources/images/user/1.jpg" alt=""/>
													<h3 class="clearfix">사원 김사원</h3>
													<p>
														<i class="fa fa-circle text-light-orange"></i> 
														offline
													</p>
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/otipms/resources/images/user/1.jpg" alt=""/>
													<h3 class="clearfix">사원 김사원</h3>
													<p>
														<i class="fa fa-circle text-light-orange"></i> 
														offline
													</p>
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/otipms/resources/images/user/1.jpg" alt=""/>
													<h3 class="clearfix">사원 김사원</h3>
													<p>
														<i class="fa fa-circle text-light-orange"></i> 
														offline
													</p>
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/otipms/resources/images/user/1.jpg" alt=""/>
													<h3 class="clearfix">사원 김사원</h3>
													<p>
														<i class="fa fa-circle text-light-orange"></i> 
														offline
													</p>
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/otipms/resources/images/user/1.jpg" alt=""/>
													<h3 class="clearfix">사원 김사원</h3>
													<p>
														<i class="fa fa-circle text-light-orange"></i> 
														offline
													</p>
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/otipms/resources/images/user/1.jpg" alt=""/>
													<h3 class="clearfix">사원 김사원</h3>
													<p>
														<i class="fa fa-circle text-light-orange"></i> 
														offline
													</p>
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-lg-9 col-md-8 col-sm-12">
								<div class="chat-detail">
									<div class="chat-profile-header clearfix">
										<div class="left">
											<div class="clearfix">
												<div class="chat-profile-photo">
													<img src="/otipms/resources/images/user/1.jpg" alt="" />
												</div>
												<div class="chat-profile-name">
													<h3>사원 김사원</h3>
													<span>개발 1팀</span>
												</div>
											</div>
										</div>
										<div class="right text-right">
											<div class="dropdown">
												<a
													class="btn btn-outline-primary dropdown-toggle"
													href="#"
													role="button"
													data-toggle="dropdown"
												>
													Setting
												</a>
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item" href="#">찾기</a>
													<a class="dropdown-item text-light-orange" href="#">
														채팅방 나가기
													</a>
												</div>
											</div>
										</div>
									</div>
									<div class="chat-box">
										<div class="chat-desc customscroll">
											<ul>
												<li class="clearfix admin_chat">
													<span class="chat-img">
														<img src="vendors/images/chat-img2.jpg" alt="" />
													</span>
													<div class="chat-body clearfix">
														<p>Maybe you already have additional info?</p>
														<div class="chat_time">09:40PM</div>
													</div>
												</li>
												<li class="clearfix admin_chat">
													<span class="chat-img">
														<img src="vendors/images/chat-img2.jpg" alt="" />
													</span>
													<div class="chat-body clearfix">
														<p>
															It is to early to provide some kind of estimation
															here. We need user stories.
														</p>
														<div class="chat_time">09:40PM</div>
													</div>
												</li>
												<li class="clearfix">
													<span class="chat-img">
														<img src="vendors/images/chat-img1.jpg" alt="" />
													</span>
													<div class="chat-body clearfix">
														<p>
															We are just writing up the user stories now so
															will have requirements for you next week. We are
															just writing up the user stories now so will have
															requirements for you next week.
														</p>
														<div class="chat_time">09:40PM</div>
													</div>
												</li>
												<li class="clearfix">
													<span class="chat-img">
														<img src="vendors/images/chat-img1.jpg" alt="" />
													</span>
													<div class="chat-body clearfix">
														<p>
															Essentially the brief is for you guys to build an
															iOS and android app. We will do backend and web
															app. We have a version one mockup of the UI,
															please see it attached. As mentioned before, we
															would simply hand you all the assets for the UI
															and you guys code. If you have any early questions
															please do send them on to myself. Ill be in touch
															in coming days when we have requirements prepared.
															Essentially the brief is for you guys to build an
															iOS and android app. We will do backend and web
															app. We have a version one mockup of the UI,
															please see it attached. As mentioned before, we
															would simply hand you all the assets for the UI
															and you guys code. If you have any early questions
															please do send them on to myself. Ill be in touch
															in coming days when we have.
														</p>
														<div class="chat_time">09:40PM</div>
													</div>
												</li>
												<li class="clearfix admin_chat">
													<span class="chat-img">
														<img src="vendors/images/chat-img2.jpg" alt="" />
													</span>
													<div class="chat-body clearfix">
														<p>Maybe you already have additional info?</p>
														<div class="chat_time">09:40PM</div>
													</div>
												</li>
												<li class="clearfix admin_chat">
													<span class="chat-img">
														<img src="vendors/images/chat-img2.jpg" alt="" />
													</span>
													<div class="chat-body clearfix">
														<p>
															It is to early to provide some kind of estimation
															here. We need user stories.
														</p>
														<div class="chat_time">09:40PM</div>
													</div>
												</li>
												<li class="clearfix">
													<span class="chat-img">
														<img src="vendors/images/chat-img1.jpg" alt="" />
													</span>
													<div class="chat-body clearfix">
														<p>
															We are just writing up the user stories now so
															will have requirements for you next week. We are
															just writing up the user stories now so will have
															requirements for you next week.
														</p>
														<div class="chat_time">09:40PM</div>
													</div>
												</li>
												<li class="clearfix">
													<span class="chat-img">
														<img src="vendors/images/chat-img1.jpg" alt="" />
													</span>
													<div class="chat-body clearfix">
														<p>
															Essentially the brief is for you guys to build an
															iOS and android app. We will do backend and web
															app. We have a version one mockup of the UI,
															please see it attached. As mentioned before, we
															would simply hand you all the assets for the UI
															and you guys code. If you have any early questions
															please do send them on to myself. Ill be in touch
															in coming days when we have requirements prepared.
															Essentially the brief is for you guys to build an
															iOS and android app. We will do backend and web
															app. We have a version one mockup of the UI,
															please see it attached. As mentioned before, we
															would simply hand you all the assets for the UI
															and you guys code. If you have any early questions
															please do send them on to myself. Ill be in touch
															in coming days when we have.
														</p>
														<div class="chat_time">09:40PM</div>
													</div>
												</li>
												<li class="clearfix upload-file">
													<span class="chat-img">
														<img src="vendors/images/chat-img1.jpg" alt="" />
													</span>
													<div class="chat-body clearfix">
														<div class="upload-file-box clearfix">
															<div class="left">
																<img
																	src="vendors/images/upload-file-img.jpg"
																	alt=""
																/>
																<div class="overlay">
																	<a href="#">
																		<span
																			><i class="fa fa-angle-down"></i
																		></span>
																	</a>
																</div>
															</div>
															<div class="right">
																<h3>Big room.jpg</h3>
																<a href="#">Download</a>
															</div>
														</div>
														<div class="chat_time">09:40PM</div>
													</div>
												</li>
												<li class="clearfix upload-file admin_chat">
													<span class="chat-img">
														<img src="vendors/images/chat-img2.jpg" alt="" />
													</span>
													<div class="chat-body clearfix">
														<div class="upload-file-box clearfix">
															<div class="left">
																<img
																	src="vendors/images/upload-file-img.jpg"
																	alt=""
																/>
																<div class="overlay">
																	<a href="#">
																		<span
																			><i class="fa fa-angle-down"></i
																		></span>
																	</a>
																</div>
															</div>
															<div class="right">
																<h3>Big room.jpg</h3>
																<a href="#">Download</a>
															</div>
														</div>
														<div class="chat_time">09:40PM</div>
													</div>
												</li>
											</ul>
										</div>
										<div class="chat-footer">
											<div class="file-upload">
												<a href="#"><i class="fa fa-paperclip"></i></a>
											</div>
											<div class="chat_text_area">
												<textarea placeholder="Type your message…"></textarea>
											</div>
											<div class="chat_send">
												<button class="btn btn-link" type="submit">
													<i class="icon-copy ion-paper-airplane"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
