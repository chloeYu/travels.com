<%@ page import="travels.MemberDataAccessObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<script type="text/javascript">
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage : 'ko',
			layout : google.translate.TranslateElement.InlineLayout.SIMPLE
		}, 'google_translate_element');
	}
	
	$('.register').click(function() {
		$("#main").load("user_register.html");
	});
	
	$('.user_register').click(function() {
		$("#main").load("user_register_form.jsp");
	});
	
	$(function() {
		$(".navigation li a").click(function(e) {
			e.preventDefault(); //To prevent the default anchor tag behaviour
			var url = this.href;
			$("li:first" ).removeClass( "active" );
			$("#main").load(url);
		});
	});
	
	$(function() {
		$(".header-setting .user a").click(function(e) {
			e.preventDefault(); //To prevent the default anchor tag behaviour
			var url = this.href;
			$("#main").load(url);
		});
	});
	
	
</script>

<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<!--header-->
<div class="header">
	<div class="header-setting">
		<div class="container">
			<div class="logo">
				<a href="index.html"> <img src="images/logo2.png" width="50%"
					alt="" /></a>
			</div>
			<div class="user">
			<%
			if(session.getAttribute("id")==null){
				//session.setAttribute("id", "chloe");
			%>
				<a class="user_register">회원가입</a>
				<a onclick="window.open('user_login.html', '', 'width=300 height=300');">로그인</a> 
			<% 
			}else {
				session.invalidate();
				%>
				<a onclick="alert('로그아웃되었습니다'); location.href='index.html'">로그아웃</a>
				<%
			}
			%>
			</div>
			<div id="google_translate_element"></div>
		</div>
	</div>
	
	<div class="header-nav">
		<div class="container">
			<div class="navigation">
				<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"> </span> <span class="icon-bar"> </span> <span
								class="icon-bar"> </span>
						</button>
					</div>
					<div class="collapse navbar-collapse nav-wil"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="active" ><a href="home.html">홈</a></li>
							<li><a href="blog.html">여행 정보</a></li>
							<li><a href="gallery.html">여행 상품</a></li>
							<li><a href="about.html">환율&날씨</a></li>
							<li><a href="contact.html">리뷰 게시판</a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<!-- /.navbar-collapse -->
				</nav>
			</div>

		</div>
	</div>
</div>
<!-- 
<div id="header"></div>
	<div class="header-setting">
		<div class="container">
			<div class="user">
				<a href="user_login.html">로그인</a> <a href="user_register_form.jsp">회원가입</a>
			</div>
		</div>
	</div>
	<div class="header-nav">
		<div class="container">
			<div class="navigation">
				<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"> </span> <span class="icon-bar"> </span> <span
								class="icon-bar"> </span>
						</button>
					</div>
					<div class="collapse navbar-collapse nav-wil"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="active"><a href="home.html">홈<span
									class="sr-only">(current)</span></a></li>
							<li><a href="services.html">패키지 여행</a></li>
							<li><a href="blog.html">여행 정보</a></li>
							<li><a href="gallery.html">여행 상품</a></li>
							<li><a href="about.html">환율&날씨</a></li>
							<li><a href="contact.html">리뷰 게시판</a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					/.navbar-collapse
				</nav>
			</div>

		</div>
	</div> -->
</html>