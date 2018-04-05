<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>심심할땐? 놀자GO!</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/noljaBooster.css">
	<style type="text/css">

	/* ---------- Jumbotron ---------- */
	.jumbotron {
		background-image: url("images/1.jpg");
		background-size: cover;
		text-shadow: darkgrey 0.1em 0.1em 0.1em;
		color: springgreen;
	}
	body #img {
		width: 20px;
		margin-top: 2px;
		margin-right: 5px;
	}
	</style>
</head>
<%------------ B O D Y ------------%>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.do">놀자GO!</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#"><span class="sr-only"></span>내주변</a></li>
					<li><a href="#">장르별</a></li>
					<li><a href="#">지역별</a></li>
					<li><a href="partyboard.do">함께놀기</a></li>
					<li><a href="list.do">게시판</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">더보기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">공지사항</a></li>
							<li><a href="#">놀자GO! BEST</a></li>
							<li><a href="#">놀자GO! 초이스</a></li>
							<li><a href="#">1:1 문의하기</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="login.do">로그인</a></li>
					<li><a href="join.do">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!------------------  H E A D E R : JUMBOTRON  ------------------>
	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">심심할땐? 놀자GO!</h1>
			<p class="text-center" style="font-weight: bold">재미있는 테마 카페들이 한
				곳에 !</p>
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="input-group">
						<input class="form-control input-lg" type="search" /> <span
							class="input-group-btn">
							<button class="btn btn-default btn-lg" type="button">Go!</button>
						</span>
					</div>
				</div>
			</div>
		</div>

		<!------------------  C O N T E N T : FIRST  ------------------>
		<div class="row">
			<div class="col-sm-4">
				<h4>이번주 BEST 장소</h4>
				<p>이번주 테마별 BEST 놀자GO!</p>
				<p>회원님들이 추천한 BEST 장소들</p>
				<p>
					<a class="btn btn-default" data-target="#modal" data-toggle="modal">자세히
						알아보기</a>
				</p>
			</div>
			<div class="col-sm-4">
				<h4>함께, 놀자GO!</h4>
				<p>놀사람이 없다고? 그럼 함께 놀자GO!</p>
				<p>같이 놀 사람들을 매칭시켜주는 파티 시스템.</p>
				<p>
					<a class="btn btn-default" href="#">자세히 알아보기</a>
				</p>
			</div>
			<div class="col-sm-4">
				<h4>여기, 추천GO!</h4>
				<p>3GO!하면 포인트를 준다GO!?</p>
				<p>놀GO! 추천하GO! 포인트받GO!</p>
				<p>
					<a class="btn btn-default" href="#">자세히 알아보기</a>
				</p>
			</div>
		</div>
		<hr />
	</div>
	<!------------------  C O N T E N T : FIRST-MODAL  ------------------>
	<div class="row">
		<div class="modal" id="modal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						이번주 BEST 장소
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						회원님들이 직접 추천한 이번주 BEST 장소들을 지금 확인해보세요.<br /> 흥미로운 카페를 체험하고 직접 후기를
						남겨보세요<br />
						<br /> <img src="images/best.png" id="imagepreview" style="width: 256px; height: 256px;">
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="footer.jsp" %>
</body>
</html>
