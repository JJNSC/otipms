<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="email-list-container" class="email-list m-t-15">
	<div class="message read message-1">
		<div class="col-mail col-mail-1 received">
			<div class="email-checkbox">
				<input type="checkbox" id="chk2">
				<label class="toggle" for="chk2"></label>
			</div>
			<span class="icon-copy star ion-ios-star-outline" onclick="checkimportant(1,event)"></span>
		</div>
		<div class="col-mail col-mail-profile">
			<div class="profile">
				<img src="/otipms/resources/images/users/2.jpg" height="40" width="40">
				<span class="rank">사원</span>
				<span class="name">김사원</span>
			</div>
		</div>
		<a href="detailMail">
			<div class="col-mail col-mail-2">
				<div class="subject">오늘 점심을 뭘 먹어야 할까요?</div>
				<div class="clip">
					<span class="icon-copy ion-paperclip mr-5"></span>
				</div>
				<div class="date">10분 전</div>
			</div>
		</a>
	</div>
	<div class="message message-2">
		<div class="col-mail col-mail-1 received">
			<div class="email-checkbox">
				<input type="checkbox" id="chk2">
				<label class="toggle" for="chk2"></label>
			</div>
			<span class="icon-copy ion-ios-star star" onclick="checkimportant(2, event)"></span>
		</div>
		<div class="col-mail col-mail-profile">
			<div class="profile">
				<img src="/otipms/resources/images/users/1.jpg" height="40" width="40">
				<span class="rank">대리</span>
				<span class="name">이대리</span>
			</div>
		</div>
		<a href="detailMail">
			<div class="col-mail col-mail-2">
				<div class="subject">오늘 점심은 수육국밥이다</div>
				<div class="clip">
					<span class="icon-copy ion-paperclip mr-5"></span>
				</div>
				<div class="date">54분 전</div>
			</div>
		</a>
	</div>
</div>
