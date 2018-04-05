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
<%@ include file="topMenu.jsp" %>
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
