<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionCheck.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/noljaBooster.css">
</head>
<body>
<%	
	if(session.getAttribute("id") != null)
		id = (String)session.getAttribute("id");
%>
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
				<a class="navbar-brand" href="main.jsp">놀자GO!</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#"><span class="sr-only"></span>내주변</a></li>
					<li><a href="#">장르별</a></li>
					<li><a href="#">지역별</a></li>
					<li><a href="partylist.do">함께놀기</a></li>
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
				<%	if(id == null) { %>	
				
					<ul class="nav navbar-nav navbar-right">
						<li><a href="login.do">로그인</a></li>
						<li><a href="agree.do">회원가입</a></li>
					</ul>
				<%	} else { %>
				<c:if test="${admin == 1 }">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">예약내역</a></li>
					<li><a href="#">쪽지함</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><img src="images/home.png" class="pull-left" img-responsive img-circle" id="img">${name }님<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="myinfo.do">내 정보</a></li>
						<li><a href="#">포인트<span> 0P</span></a></li>
						<li><a href="#">예약내역<span> 0건</span></a></li>
						<li><a href="#">찜 목록<span> 0개</span></a></li>
						<li><a href="logoutAction.do">로그아웃</a></li>
					</ul></li>
				</ul>
				</c:if>
				<c:if test="${admin == 3 }">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">쪽지함</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><img src="images/home.png" class="pull-left" img-responsive img-circle" id="img">${name }님<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="adminMain.do">관리하기</a></li>
						<li><a href="logoutAction.do">로그아웃</a></li>
					</ul></li>
				</ul>
				</c:if>
				<%
					}
				%>
			</div>
		</div>
	</nav>
</body>
</html>