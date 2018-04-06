<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>vrListView</title>
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
	table{ float: left; display: inline;}
	</style>
	
	<script type="text/javascript">
		$('#myTab a').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show')
			});
	
		$('#myTab a[href="#profile"]').tab('show') // Select tab by name
		$('#myTab a:first').tab('show') // Select first tab
		$('#myTab a:last').tab('show') // Select last tab
		$('#myTab li:eq(2) a').tab('show') // Select third tab (0-indexed)
		
		
	</script>
		
	<script type="text/javascript">
		function popup() {
			window.open('play.jsp','검색창','width=700,height=500');
		}
	</script>
<style type="text/css">
game1 { width:20%;}
h2 {
	text-align: center;
	text-decoration: underline;
	margin-top: 50px;
}

#box {
	display: block;
	width: 260px;
	height: 35px;
	text-align: center;
	border: none;
	background: #4C4C4C;
	color:white;
	margin-left: 80px;
	margin-top: 50px;
}
#content { color: #B1B1B1; margin-left: 80px; padding-left: 80px;}
#content2{padding-left: 100px;}
#like { padding-left: 35px; padding-top: 17px; }
.effect:HOVER {
    display: inline-block;
    transform: rotate(5deg);
}
#reserve { background-color: white; border-color: black; }
#rate{ text-align: right;}
</style>
<script type="text/javascript">
	function clk(){
		var img1=document.getElementById("img1")
			img1.src="images/like2.png"
	}
	function clk2(){
		var img2=document.getElementById("img2")
			img2.src="images/like2.png"
	}
	function clk3(){
		var img3=document.getElementById("img3")
			img3.src="images/like2.png"
	}
	function clk4(){
		var img4=document.getElementById("img4")
			img4.src="images/like2.png"
	}
	function pop(){
		window.open('vrReviewView.jsp','리뷰창','width=1000,height=500');
	}
</script>
<style type="text/css">
	#cafe_info{ text-align: center;}
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
	
	<div id="cafe_info">
	 <img src="images/${cafe.image1 }" alt="가게 이미지" width="300" height="200">
	 <p><h1 style="color: gray">${cafe.cname }</h1><p>
			
			
			<!-- 가게 평점 기능 구현해야함! -->
			<img src="images/f_star.png" alt="평점" width="20" height="20">
			<img src="images/f_star.png" alt="평점" width="20" height="20">
			<img src="images/f_star.png" alt="평점" width="20" height="20">
			<img src="images/f_star.png" alt="평점" width="20" height="20">
			
			${cafe.caddress }
			<h5>${cafe.content }</h5>
	
	</div>
	
	
		<!-- tab  -->
	
		<div role="tabpane1" style="margin-top: 50px">
		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">콘텐츠 안내</a></li>
		    <li role="presentation"><a href="#reviewTab" aria-controls="reviewTab" role="tab" data-toggle="tab">후기</a></li>
		  </ul>
	
	 	 <!-- Tab panes -->
	 	 <div class="tab-content">
	 	
	  	  <div role="tabpanel" class="tab-pane active" id="home">
	    	
	<div id="game1" style="float:left">
		<c:forEach var="theme" items="${list }">
			
	<table>
		<tr>
      	  <td>
      	  <div id="box">
      	  <p id="text">${theme.tname }</p>
      		</div>
      	  </td>
		</tr>
		
		<tr>
		   <td> 
		   <img src="images/${theme.timage }" class="effect" width="260px" height="130px" id="main" style="margin-left: 80px;"><p>
			</td>
		</tr>
		
				
		<tr>
			<td id="content">
				장르: 액션 FPS
			</td>
		</tr>
		
		
		<tr>
			<td id="content">
				${theme.tcontent }
			</td>
		</tr>
		
		<tr>
			<td id="content">
				인원: ${theme.headcount }
			</td>
		</tr>
		
		<tr>
			<td id="content">
				VR 체험 난이도: 
				<c:choose>
					<c:when test="${theme.score1 eq 1 }">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
					</c:when>
					<c:when test="${theme.score1 eq 2}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
					</c:when>
					<c:when test="${theme.score1 eq 3}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						
					</c:when>
					<c:when test="${theme.score1 eq 4}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
					</c:when>
					<c:when test="${theme.score1 eq 5}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
					</c:when>
				</c:choose>
			</td>
		</tr>
		
		<tr>
			<td id="content">
				스릴감: 
				<c:choose>
					<c:when test="${theme.score2 eq 1 }">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
					</c:when>
					<c:when test="${theme.score2 eq 2}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
					</c:when>
					<c:when test="${theme.score2 eq 3}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						
					</c:when>
					<c:when test="${theme.score2 eq 4}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
					</c:when>
					<c:when test="${theme.score2 eq 5}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
					</c:when>
				</c:choose>
			</td>
		</tr>
		
		
		<tr>
			<td id="content">
				공포감: 
				<c:choose>
					<c:when test="${theme.score3 eq 1 }">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
					</c:when>
					<c:when test="${theme.score3 eq 2}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
					</c:when>
					<c:when test="${theme.score3 eq 3}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						
					</c:when>
					<c:when test="${theme.score3 eq 4}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
					</c:when>
					<c:when test="${theme.score3 eq 5}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
					</c:when>
				</c:choose>
			</td>
		</tr>
		
		<tr>
			<td id="content">
				볼거리:
				<c:choose>
					<c:when test="${theme.score4 eq 1 }">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
					</c:when>
					<c:when test="${theme.score4 eq 2}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
					</c:when>
					<c:when test="${theme.score4 eq 3}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
						
					</c:when>
					<c:when test="${theme.score4 eq 4}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/e_star.png" width="15" height="20">
					</c:when>
					<c:when test="${theme.score4 eq 5}">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
						<img src="images/f_star.png" width="15" height="20">
					</c:when>
				</c:choose>
			</td>
		</tr>
		
		<tr>
			<td id="content2">    		
			<button style="border: 0; outline: 0; background-color: white;" onclick="clk()"><img src="images/like.png" id="img1" width="30" height="40"></button>
    		<img src="images/play_button.png" width="30" height="40" onclick="popup()">
    		
			 <a href="vrReserveView.do?cnum=${theme.cnum }&&tnum=${theme.tnum}"><button id="reserve">예약하기</button></a>
			
			</td>
		</tr>
		
		<tr>	
			<td id="content2">
    		<div style="text-align: center"> 좋아요: 0개</div>
			</td>
		</tr>
		
	</table>
		</c:forEach>
	
	    
	    </div>
	    </div>
	    
	    
	    <!------------------- 후기  tab  ------------------>
	    <div role="tabpanel" class="tab-pane" id="reviewTab">
	    	
	    	<div id=top style="width: 100%; text-align: center; font-size: 20px;"  >
		바른 후기 는 직접 체험한 회원만 작성할 수 있습니다.
			</div>
	
	<table>
		<tr>
			<td><br>
				<img src="${member.image}" width="150" height="150">
			</td>
			
			<td>
				너무 재밌었습니다!!!!! 재밌어요 재밌어요 재밌어요 재밌어요 재밌어요<br><hr>
				<img src="images/f_star.png" width="15" height="20">
				<img src="images/f_star.png" width="15" height="20">
				<img src="images/f_star.png" width="15" height="20">
				
				<span style="margin-left: 200px;">아이디: ${member.id} | 작성일: ${member.reg_date }</span>
			</td>
			
		</tr>

		<tr>
			<td><br>
				<img src="${member.image}" width="150" height="150">
			</td>
			
			<td>
				너무 재밌었습니다!!!!! 재밌어요 재밌어요 재밌어요 재밌어요 재밌어요<br><hr>
				<img src="images/f_star.png" width="15" height="20">
				<img src="images/f_star.png" width="15" height="20">
				<img src="images/f_star.png" width="15" height="20">
				
				<span style="margin-left: 200px;">아이디: ${member.id} | 작성일: ${member.reg_date }</span>
			</td>
			
		</tr>
		
		<tr>
			<td><br>
				<img src="${member.image}" width="150" height="150">
			</td>
			
			<td>
				너무 재밌었습니다!!!!! 재밌어요 재밌어요 재밌어요 재밌어요 재밌어요<br><hr>
				<img src="images/f_star.png" width="15" height="20">
				<img src="images/f_star.png" width="15" height="20">
				<img src="images/f_star.png" width="15" height="20">
				
				<span style="margin-left: 200px;">아이디: ${member.id} | 작성일: ${member.reg_date }</span>
			</td>
			
		</tr>
		
		<tr>
			<td><br>
				<img src="${member.image}" width="150" height="150">
			</td>
			
			<td>
				너무 재밌었습니다!!!!! 재밌어요 재밌어요 재밌어요 재밌어요 재밌어요<br><hr>
				<img src="images/f_star.png" width="15" height="20">
				<img src="images/f_star.png" width="15" height="20">
				<img src="images/f_star.png" width="15" height="20">
				
				<span style="margin-left: 200px;">아이디: ${member.id} | 작성일: ${member.reg_date }</span>
			</td>
			
		</tr>
		
	</table>
	
	
	
	</div>
	</div>
	</div>
	
	
	
	
</body>
</html>