<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		
		
	.buttonN {
	   border: 2px solid #969696;
	   background: #969696;
	   background: -webkit-gradient(linear, left top, left bottom, from(#969696), to(#969696));
	   background: -webkit-linear-gradient(top, #969696, #969696);
	   background: -moz-linear-gradient(top, #969696, #969696);
	   background: -ms-linear-gradient(top, #969696, #969696);
	   background: -o-linear-gradient(top, #969696, #969696);
	   background-image: -ms-linear-gradient(top, #969696 0%, #969696 100%);
	   padding: 20px 40px;
	   -webkit-border-radius: 0px;
	   -moz-border-radius: 0px;
	   border-radius: 0px;
	   -webkit-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
	   -moz-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
	   box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
	   text-shadow: #787878 0 1px 0;
	   color: #ffffff;
	   font-size: 16px;
	   font-family: helvetica, serif;
	   text-decoration: none;
	   vertical-align: middle;
	   }
	.buttonN:hover {
	   border: 2px solid #4f4f4f;
	   text-shadow: #7d7d7d 0 1px 0;
	   background: #969696;
	   background: -webkit-gradient(linear, left top, left bottom, from(#969696), to(#969696));
	   background: -webkit-linear-gradient(top, #969696, #969696);
	   background: -moz-linear-gradient(top, #969696, #969696);
	   background: -ms-linear-gradient(top, #969696, #969696);
	   background: -o-linear-gradient(top, #969696, #969696);
	   background-image: -ms-linear-gradient(top, #969696 0%, #969696 100%);
	   color: #fff;
	   }
	.buttonN:active {
	   text-shadow: #080808 0 1px 0;
	   border: 2px solid #969696;
	   background: #969696;
	   background: -webkit-gradient(linear, left top, left bottom, from(#969696), to(#969696));
	   background: -webkit-linear-gradient(top, #969696, #969696);
	   background: -moz-linear-gradient(top, #969696, #969696);
	   background: -ms-linear-gradient(top, #969696, #969696);
	   background: -o-linear-gradient(top, #969696, #969696);
	   background-image: -ms-linear-gradient(top, #969696 0%, #969696 100%);
	   color: #ffffff;
	   }	
	   
	   
	   
	.buttonY {
	   border: 2px solid #e3e3e3;
	   background: #e3e3e3;
	   background: -webkit-gradient(linear, left top, left bottom, from(#e3e3e3), to(#e3e3e3));
	   background: -webkit-linear-gradient(top, #e3e3e3, #e3e3e3);
	   background: -moz-linear-gradient(top, #e3e3e3, #e3e3e3);
	   background: -ms-linear-gradient(top, #e3e3e3, #e3e3e3);
	   background: -o-linear-gradient(top, #e3e3e3, #e3e3e3);
	   background-image: -ms-linear-gradient(top, #e3e3e3 0%, #e3e3e3 100%);
	   padding: 20px 40px;
	   -webkit-border-radius: 0px;
	   -moz-border-radius: 0px;
	   border-radius: 0px;
	   -webkit-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
	   -moz-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
	   box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
	   text-shadow: #dbdbdb 0 1px 0;
	   color: #616161;
	   font-size: 16px;
	   font-family: helvetica, serif;
	   text-decoration: none;
	   vertical-align: middle;
	   }
	.buttonY:hover {
	   border: 2px solid #828282;
	   text-shadow: #dbdbdb 0 1px 0;
	   background: #e3e3e3;
	   background: -webkit-gradient(linear, left top, left bottom, from(#e3e3e3), to(#e3e3e3));
	   background: -webkit-linear-gradient(top, #e3e3e3, #e3e3e3);
	   background: -moz-linear-gradient(top, #e3e3e3, #e3e3e3);
	   background: -ms-linear-gradient(top, #e3e3e3, #e3e3e3);
	   background: -o-linear-gradient(top, #e3e3e3, #e3e3e3);
	   background-image: -ms-linear-gradient(top, #e3e3e3 0%, #e3e3e3 100%);
	   color: #616161;
	   }
	.buttonY:active {
	   text-shadow: #080808 0 1px 0;
	   border: 2px solid #969696;
	   background: #969696;
	   background: -webkit-gradient(linear, left top, left bottom, from(#969696), to(#e3e3e3));
	   background: -webkit-linear-gradient(top, #969696, #969696);
	   background: -moz-linear-gradient(top, #969696, #969696);
	   background: -ms-linear-gradient(top, #969696, #969696);
	   background: -o-linear-gradient(top, #969696, #969696);
	   background-image: -ms-linear-gradient(top, #969696 0%, #969696 100%);
	   color: #ffffff;
	   }
		
		
	</style>
	
	
	
	
	<!--  달력     -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	 $( function() {
 		  $( "#datepicker" ).datepicker({
 			  dateFormat: "yy-mm-dd", 
 			  showMonthAfterYear: true,
 			showButtonPanel: true, 
 	         currentText: '오늘',
 	       closeText: '닫기',
 	     changeMonth: true, 
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        minDate: 0
 		  });
 	 } );
	 	 
	
	 </script>


	


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
	
	
	
	
	
	
	<img src="images/${cafe.image2 }" class="img-responsive" alt="Responsive image" style="margin: auto;">

	
	<div id="top" style="margin-top: 50px">
		<ul id="reserveList">
			<li id="reserveList2" style="background-color: red;">01. 날짜/시간 선택</li>
			<li id="reserveList2">02. 예약 정보 입력</li>
			<li id="reserveList2">03. 예약 완료</li>
		</ul>
	</div>
	<div style="margin-left: 50px; margin-top: 150px">
	예약날짜 : <input type="text" id="datepicker" placeholder="" style="margin-right: 30px" >
	
	
	<%-- 테마선택 : <select name="r_tema" style="margin-right: 40px">
            <optgroup label="" ><c:forEach var="themeList" items="theme">
                <option value="${theme.tname }">${theme.tname }</option>
                <option value="deadpool">국가정보원</option>
                <option value="spiderman">인 더 클럽</option>
            </c:forEach>
            </optgroup>
            
        </select> --%>
        
	인 원 : <select name="r_people" style="margin-right: 40px">
            <optgroup label="" class="r_people">
                <option value="1">1 </option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
            </optgroup>
        </select>
	예약가능  <img src="images/timeFullBut.jpg" width="40" height="40" style="margin-right: 20px">
	예약불가 <img src="images/timeEmptBut.jpg" width="40" height="40" style="margin-right: 20px">
	</div><br><br>       
	
	<h3 style="margin-left: 50px;">${theme.tname}</h3>
	<hr>
	<table style="margin-top: 30px; margin-bottom: 60px; margin-left: 50px;">
		
		
		
		
		<%-- <tr>
			<td rowspan="4"><img alt="" src="images/${theme.timage }" width="220" height="220" style="margin-right: 50px; "></td>
		</tr>
		<c:forEach var="i" items="begin=1" end="3" step="1">
		<tr>
			<c:forEach var="j" items="begin=1" end="4" step="1">
				<td>
					<c:choose>
						<c:when test="${ }">  <!-- 예약 가능  -->
							<a href='roomReserve2.do' class='buttonY' style="margin-right: 20px; margin-bottom: 20px;">12:00 예약 가능</a>
						</c:when>
						<c:otherwise>   <!-- 예약 불가능  -->
							<a href='roomReserve2.do' class='buttonY' style="margin-right: 20px; margin-bottom: 20px;">12:00 예약 불가능</a>
						</c:otherwise>
					</c:choose>
				</td>
			</c:forEach>
		</tr>
		</c:forEach>	
		 --%>
		
		
		
		
		
		<tr>
			<td rowspan="4"><img alt="" src="images/${theme.timage }" width="220" height="220" style="margin-right: 50px; "></td>
		</tr>
		<tr>
			<td><a href='reserve_r_info.jsp' class='buttonY' style="margin-right: 20px; margin-bottom: 20px;">12:00 예약가능</a></td>
			<td><a href='reserve_r_info.jsp' class='buttonY' style="margin-right: 20px; margin-bottom: 20px;">13:00 예약가능</a></td>
			<td><a href='reserve_r_info.jsp' class='buttonY' style="margin-right: 20px; margin-bottom: 20px;">13:00 예약가능</a></td>
			<td><a href='reserve_r_info.jsp' class='buttonN' style="margin-right: 20px; margin-bottom: 20px;">13:00 예약가능</a></td>
			</tr>
			
		
		<tr>
			<td><a href='reserve_r_info.jsp' class='buttonN' style="margin-right: 20px; margin-bottom: 20px;">12:00 예약마감</a></td>
			<td><a href='reserve_r_info.jsp' class='buttonY' style="margin-right: 20px; margin-bottom: 20px;">13:00 예약가능</a></td>
			<td><a href='reserve_r_info.jsp' class='buttonY' style="margin-right: 20px; margin-bottom: 20px;">13:00 예약가능</a></td>
			<td><a href='reserve_r_info.jsp' class='buttonN' style="margin-right: 20px; margin-bottom: 20px;">13:00 예약가능</a></td>
			
		</tr>
		<tr>
			<td><a href='reserve_r_info.jsp' class='buttonN' style="margin-right: 20px">12:00 예약마감</a></td>
			<td><a href='reserve_r_info.jsp' class='buttonY' style="margin-right: 20px">13:00 예약가능</a></td>
			<td><a href='reserve_r_info.jsp' class='buttonY' style="margin-right: 20px">13:00 예약가능</a></td>
			<td><a href='reserve_r_info.jsp' class='buttonN' style="margin-right: 20px">13:00 예약가능</a></td>
		</tr> 
	
	</table>
	
	
	
	
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