<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/noljaBooster.css">
<link rel="stylesheet" href="imageView.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<title>심심할땐? 놀자GO!</title>
<style type="text/css">
th {
	background-color: #eeeeee;
	text-align: center;
}

.content_main {
	cursor: pointer;
}
/* ---------- Jumbotron ---------- */
.jumbotron {
	background-image: url("images/1.jpg");
	background-size: cover;
	text-shadow: darkgrey 0.1em 0.1em 0.1em;
	color: springgreen;
}

select, input[type=text] {
	padding: 6px;
	margin-top: 10px;
	font-size: 15px;
	border: 1px solid #dddddd;
}

.search-container button {
	float: right;
	padding: 6px 10px;
	margin-top: 10px;
	margin-right: 16px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

.search-container button:hover {
	background: #ccc;
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
				<a class="navbar-brand" href="#">놀자GO!</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#"><span class="sr-only"></span>내주변</a></li>
					<li><a href="#">장르별</a></li>
					<li><a href="#">지역별</a></li>
					<li><a href="#">함께놀기</a></li>
					<li><a href="#">게시판</a></li>
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
					<li><a href="#">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!---------------- U P D A T E F O R M ------------------>

	<div class="container">
		<div class="row">
			<form action="updatePro.do" method="post">
				<input type="hidden" name="bnum" value="${board.bnum }"> 
				<input type="hidden" name="ref" value="${pageNum }">
				<table class="table table-hover"
					style="text-align: center; border: 1px solid #dddddd;">
					<thead>
						<tr>
							<th colspan="2">글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><select class="selectpicker form-control"
								style="width: 120px;" name="category">
									<option>잡담</option>
									<option>정보</option>
									<option>기타</option>
							</select></td>
							<td style="width: 90%"><input type="text"
								class="form-control" placeholder="제목" name="subject"
								maxlength="50" required="required" value="${board.subject }"></td>
						</tr>
						<tr>
							<td colspan="2"><textarea class="form-control"
									placeholder="내용" name="content" maxlength="1000"
									style="height: 300px;" required="required"></textarea></td>
							<td><input type="text" class="form-control"
								placeholder="아이디" name="id" style="width: 100px;"
								required="required" value="${board.id }"></td>
					</tbody>
				</table>
				<input type="submit" class="btn btn-info pull-right" value="수정완료"><br />
				<br /> <input type="reset" class="btn btn-info pull-right"
					value="다시작성">
			</form>
		</div>
	</div>

	<!--------------------  F O O T E R  ------------------>
	<footer>
		<div class="container-fluid">
			<div class="container">
				<!--------------------  F O O T E R : NAVI  ------------------>
				<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-2">
							하단메뉴<span class="caret"></span>
						</button>
						<a class="navbar-brand" href="#">놀자GO!</a>
					</div>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-2">
						<ul class="nav navbar-nav">
							<li><a href="#">회사소개</a></li>
							<li><a href="#">우리들</a></li>
							<li><a href="#">인재채용</a></li>
							<li><a href="#">이용약관</a></li>
							<li><a href="#">개인정보처리방침</a></li>
							<li class="divider"></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#">제휴문의</a></li>
							<li><a href="#">실시간 채팅상담</a></li>
						</ul>
					</div>
				</nav>
				<div class="row">
					<div class="col-xs-12">
						<p class="text-center">
							<img src="images/fbicon.png" alt="페이스북" style="width: 40px;">&nbsp;&nbsp;&nbsp;<img
								src="images/instaicon.png" alt="인스타그램" style="width: 40px;">&nbsp;&nbsp;&nbsp;<img
								src="images/twticon.png" alt="트위터" style="width: 40px"> <br />
							<br />
						</p>
					</div>
				</div>
				<!--------------------  F O O T E R : Customer-CALL  ------------------>
				<div class="row">
					<div class="col-xs-12">
						<p class="text-center">
							고객센터<br /> <small>운영시간 : (09:00 - 21:00)<br />점심시간 :
								(12:00 - 13:00)
							</small>
						</p>
					</div>
				</div>
				<!--------------------  F O O T E R : INFO  ------------------>
				<div class="row">
					<div class="col-xs-12">
						<p class="text-center">
							<br />(주) 2조친구들&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;팀장 :
							방현석&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;메일 : help@noljago.com<br />
							주소 : 서울 강남구 테헤란로7길 7
							602호&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;개인정보관리책임자 : 전민구<br />
							사업자 등록번호 :
							220-22-23456&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;통신판매업신고 :
							강남-12122호<br /> <br /> Copyright &copy; 2018<br /> (주) 2조친구들<br />
							All right reserved.<br /> <br />
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</body>
</html>