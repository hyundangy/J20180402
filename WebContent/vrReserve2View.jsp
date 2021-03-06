<%@page import="jdk.nashorn.internal.ir.debug.JSONWriter"%>
<%@page import="netscape.javascript.JSObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>vrReserve2</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
		
	 
	 table.type04 {
	    border-collapse: separate;
	    border-spacing: 1px;
	    text-align: left;
	    line-height: 1.5;
	    border-top: 1px solid #ccc;
	 	 margin : 20px 10px;
		}
	  table.type04 th {
	    width: 150px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	  }
   	  table.type04 td {
	    width: 350px;
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	  }
	 	
	</style>
	
	<c:set var="date1" value="<%=new Date() %>"></c:set>
	
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
		<div id="top" style="margin-top: 50px">
			<ul id="reserveList">
				<li id="reserveList2">01. 날짜/시간 선택</li>
				<li id="reserveList2" style="background-color: red;">02. 예약 정보 입력</li>
				<li id="reserveList2">03. 예약 완료</li>
			</ul>
		</div>
	</div>
	
	
	<table class="type04" style="margin: auto;">
		<tr>
			<th scope="row">테마</th>
			<td>${theme.tname }</td>
		</tr>
		<tr>
			<th scope="row">예약일시(Date)</th>
			<td><fmt:formatDate value="${datepicker}" /></td>
		</tr>
		<tr>
			<th scope="row">시간</th>
			<td> </td>
		</tr>
		<tr>
			<th scope="row">인원(Players)</th>
			<td><input type="text" id="people">${res.count }</td>
		</tr>
		<tr>
			<th scope="row">예약자</th>
			<td>${member.name }</td>
		</tr>
		<tr>
			<th scope="row">연락처</th>
			<td><input type="text" hidden="tel">${member.tel }
            </td>
		</tr>
		<tr>
			<th scope="row">이메일</th>
			<td><input type="email" hidden="r_email">${member.email }</td>
		</tr>
		<tr>
			<th scope="row">총이용요금</th>
			<td><input type="text" hidden="r_price">${cafe.price }</td>
		</tr>
	</table>
	<p><p>
	<div style="color: red;" align="center">
		※ 게임시작 1시간 전에 예약확인 전화를 드리는데, 통화가 되지 않을 경우 자동 예약취소가 되니 이점 양지하여 주시기 바랍니다.<br>
		※ 게임 시작 시간 10분전까지 매장 내방해주시기 바랍니다.<p>
	</div>
	<div align="center"><textarea rows="5" cols="80" name="contents">개인정보 수집, 이용 및 제공 등에 관한 고지사항
이용자 본인은 아래의 개인정보가 사실임을 확인하며, 아래와 같이 개인정보를 수집 및 이용하는 것에 동의합니다.
[개인정보의 수집 및 이용목적]
- 비회원 예매서비스 제공
- 예약 정보를 확인 및 관리하고, 필요 시 예약 이행 여부 확인을 위해 예약자에게 연락을 취할 목적 등
[수집하는 개인정보의 항목]
- 필수입력사항 : 이용자의 식별을 위한 정보
- 입력정보 : 이름, 휴대폰번호, 이메일 주소
		</textarea>
	</div>
	<div align="center">
	<input type="radio" name="agree" id="agree" value="agreeY" checked="checked" />동의
	<input type="radio" name="agree" id="agree" value="agreeN"/>동의 안함
	</div><p>
	<div align="center">
		<a href="vrReserve3View.jsp"><input type="button" id="next" value="다음단계"></a>
		<input type="button" value="취소">
	</div>
	<p>


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
				<br>
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