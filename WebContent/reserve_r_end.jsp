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
	
	#reserveList {
		    list-style:none;
		    margin:0;
		    padding:0;
		}
	#reserveList2 {
			 margin: 2px;
			display:block; 
			 width:33%; 
		    height:40px;
		    background:#bdbdbd; 
		    color:white;
		    float: left;
		    font-weight: 200;
		    font-size: 1.5em;
		    text-align: center;
		}
		
		
	.button {
	   border: 2px solid #e3e3e3;
	   background: #ffffff;
	   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
	   background: -webkit-linear-gradient(top, #ffffff, #ffffff);
	   background: -moz-linear-gradient(top, #ffffff, #ffffff);
	   background: -ms-linear-gradient(top, #ffffff, #ffffff);
	   background: -o-linear-gradient(top, #ffffff, #ffffff);
	   background-image: -ms-linear-gradient(top, #ffffff 0%, #ffffff 100%);
	   padding: 13.5px 27px;
	   -webkit-border-radius: 0px;
	   -moz-border-radius: 0px;
	   border-radius: 0px;
	   -webkit-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
	   -moz-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
	   box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
	   text-shadow: #cfcfcf 0 1px 0;
	   color: #8c8c8c;
	   font-size: 24px;
	   font-family: helvetica, serif;
	   text-decoration: none;
	   vertical-align: middle;
	   }
	.button:hover {
	   border: 2px solid #828282;
	   text-shadow: #dbdbdb 0 1px 0;
	   background: #ebebeb;
	   background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
	   background: -webkit-linear-gradient(top, #ededed, #ebebeb);
	   background: -moz-linear-gradient(top, #ededed, #ebebeb);
	   background: -ms-linear-gradient(top, #ededed, #ebebeb);
	   background: -o-linear-gradient(top, #ededed, #ebebeb);
	   background-image: -ms-linear-gradient(top, #ededed 0%, #ebebeb 100%);
	   color: #616161;
	   }
	.button:active {
	   text-shadow: #080808 0 1px 0;
	   border: 2px solid #969696;
	   background: #969696;
	   background: -webkit-gradient(linear, left top, left bottom, from(#969696), to(#ebebeb));
	   background: -webkit-linear-gradient(top, #969696, #969696);
	   background: -moz-linear-gradient(top, #969696, #969696);
	   background: -ms-linear-gradient(top, #969696, #969696);
	   background: -o-linear-gradient(top, #969696, #969696);
	   background-image: -ms-linear-gradient(top, #969696 0%, #969696 100%);
	   color: #ffffff;
	   }
		
		
		
	</style>
</head>
<body>



<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
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
	
	
	<div style="margin: auto;">
		<img src="images/r_theQHome.JPG" class="img-responsive" alt="Responsive image" style="margin: auto;">
		
		<div id="top" style="margin-top: 50px">
			<ul id="reserveList">
				<li id="reserveList2">01. 날짜/시간 선택</li>
				<li id="reserveList2">02. 예약 정보 입력</li>
				<li id="reserveList2" style="background-color: red;">03. 예약 완료</li>
			</ul>
		</div>
	</div><p>
	
	<div align="center" style="margin-left: 50px; margin-top: 150px">
		<h2 style="margin-bottom: 40px;">고객님의 예약이 확인되었습니다.</h2>
		<p>
		<table style="margin-bottom: 30px;">
			<tr>
				<th>예약번호 :</th>
				<td></td>
			</tr>
			<tr>
				<th>테마 :</th>
				<td></td>
			</tr>
			<tr>
				<th>예약일시 :</th>
				<td></td>
			</tr>
			<tr>
				<th>인원 :</th>
				<td></td>
			</tr>
			<tr>
				<th>총 이용요금 :</th>
				<td></td>
			</tr>
			
		</table>
	</div><p>
	<div align="center" style="margin-top:30px;">
		<a href='mainView.jsp' class='button'>메인화면</a>
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
							고객센터<br />
							<small>운영시간 : (09:00 - 21:00)<br />점심시간 : (12:00 -
								13:00)
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
							강남-12122호<br />
							<br /> Copyright &copy; 2018<br /> (주) 2조친구들<br /> All right
							reserved.<br />
							<br />
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	
	
</body>
</html>