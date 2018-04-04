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
<!-- <link rel="stylesheet" href="imageView.css"> -->
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

.search-container #btn1 {
	float: right;
	padding: 6px 10px;
	margin-top: 10px;
	margin-right: 16px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

.search-container #btn1:hover {
	background: #ccc;
}

#myImg {
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}

#myImg:hover {
	opacity: 0.7;
}
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.9); /* Black w/ opacity */
}
/* Modal Content (image) */
.modal-content {
	margin: auto;
	display: block;
}
	.meminfo{display: none;
				position: absolute;
				border: 1px solid gray;
				background-color: white;
				width: 200px;
	}
</style>
	<!-- 게시물 슬라이드  -->
	<script type="text/javascript">
		$(document).ready(function() {
			$(".content_main").click(function() {
				status = $(this).next(".hide_display").css("display");
				if (status == "none") {
					$(".hide_display").css("display","none");
					$(this).next(".hide_display").css("display", "");
				} else {
					$(this).next(".hide_display").css("display", "none");
				}
			});
		});
	</script>

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

	<!---------------- B O R A D ------------------>

	<div class="container">
		<div class="row">
			<a href="#" class="btn btn-info pull-right">파티 생성</a>
			<h2>파티 게시판</h2>
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th>번호</th>
						<th>카페종류</th>
						<th>지역</th>
						<th>카페이름</th>
						<th>인원수</th>
						<th>희망시간</th>
						<th>파티장</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:if test = "${totCnt>0 }">
					<c:forEach var="partyinfo" items="${list }">
					<tr class="content_main" onclick="return false;">
						<td>${partyinfo.pnum }</td>
						<td>${partyinfo.type }</td>
						<td>${partyinfo.caddress }</td>
						<td>${partyinfo.cname }</td>
						<td>${partyinfo.max }명</td>
						<td>${partyinfo.hopedate } ${partyinfo.hopehour }:00</td>
						<td>${partyinfo.id}</td>
						<td>${partyinfo.preg_date }</td>
					</tr>
					<tr class="hide_display" style="display: none;">
						<td colspan="8">
							<div class="continer">
								<table id="tablesub" class="table table-striped"
									style="text-align: center; border: 1px solid #dddddd; width: 100%;">
									<tr>
										<th width="40%" style="text-align: right">${partyinfo.cname }</th>
										<th colspan="4">${partyinfo.tname }</th>
									</tr>
									<tr>
										<td rowspan="4"><img id="myImg" alt="cafe1"
											src="images/cafe1.jpg" class="img-thumbnail"
											data-toggle="modal" data-target="#myModal"></td>
											<td style="text-align: right">영업시간 : </td>
											<td>${partyinfo.open }:00 ~ ${partyinfo.close }:00</td>
										<td style="text-align: right; width: 10%">희망시간 :</td>
										<td style="text-align: left">${partyinfo.hopedate } ${partyinfo.hopehour }:00</td>
									</tr>
									<tr>
										<td style="text-align: right">평일/주말 : </td>
										<td><fmt:formatNumber value="${partyinfo.price }" pattern="#,###"/>원 / <fmt:formatNumber value="${partyinfo.redprice }" pattern="#,###"/>원</td>
										<td style="text-align: right">인원 : </td>
										<!-- 인원수 체크 Start-->
										<td style="text-align: left">
										<img alt="방장" src="images/person_leader.png" class="${partyinfo.pnum }-1" style="cursor: pointer">
										<c:forEach var="person_mem" begin="1" end="${partyinfo.pmcount }" varStatus="status_mem">
											<img alt="멤버" src="images/person_mem.png" class="${partyinfo.pnum }-${person_mem+1}" style="cursor: pointer">
											<c:if test="${status_mem.count+1==4 }"><br></c:if>
										</c:forEach>
										<c:forEach var="person_empty" begin="1" end="${partyinfo.max-partyinfo.pmcount-1 }" varStatus="status_empty">
											<img alt="빈자리" src="images/person_empty.png"  style="cursor: pointer">
											<c:if test="${status_empty.count+1+partyinfo.pmcount==4}"><br></c:if>
										</c:forEach>
										<c:forEach var="person_locked" begin="1" end="${8-partyinfo.max}">
										<img alt="막음" src="images/person_locked.png" style="cursor: pointer">
										</c:forEach>
										</td>
										<!-- 인원수 체크 End -->
									</tr>
									<tr>
										<td style="text-align: right">테마 설명 : </td>
										<td style="text-align: left" colspan="3">${partyinfo.tcontent }</td>
									</tr>
									<tr>
										<td style="text-align: right" colspan="1" rowspan="3">추가사항 :</td>
										<td style="text-align: left" colspan="6">${partyinfo.pcontent }
										</td>
									</tr>
									<tr>
										<td colspan="1">별점</td>
									</tr>
									<tr>
										<td><a href=# class="btn btn-info">카페소개바로가기</a></td>
									<tr>
										<td colspan="7"><a href="#" class="btn btn-info pull-center">파티가입</a>&nbsp;&nbsp;
										<a href="#" class="btn btn-info pull-center">파티정보수정</a>&nbsp;&nbsp;
										<a href="#"class="btn btn-info pull-center">파티탈퇴</a></td>
								</table>
							</div>
						</td>
					</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
			<form action="">
				<table style="float: right;">
					<tr>
						<td><select class="selectpicker form-control"
							style="width: 120px;">
								<option>작성자</option>
								<option>카페이름</option>
						</select></td>
						<td><div class="search-container">
								<input type="text" placeholder="검색" name="search">
								<button type="submit" id="btn1">
									<i class="fa fa-search"></i>
								</button>
							</div></td>
					</tr>
				</table>
		<div style="text-align: center;">
			<c:if test="${startPage>blockSize }">
				<a href="List.do?pageNum=${startPage-blockSize }">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<a href="List.do?pageNum=${i }">${i }</a>
			</c:forEach>
			<c:if test="${endPage<pageCnt }">
				<a href="List.do?pageNum=${startPage+blockSize }">[다음]</a>
			</c:if>
		</div>
			</form>
		</div>
		<!-- 각 파티원 정보 id = #pnum-pmnum ex)1-2-->
		<c:forEach var="mem" items="${memList }">
			<div class="meminfo" id="${mem.pnum }-${mem.pmnum}">
				<ul>
					<li>${mem.pnum }-${mem.pmnum}</li>
					<li>아이디 : ${mem.id }</li>
					<li>이름 : ${mem.name }</li>
					<li>성별 : ${mem.sex }</li>
					<li>생년월일 :  <br>${mem.birth }</li>
					<li>이메일 :  <br> ${mem.email }</li>
					<li>연락처 : <br>${mem.tel }</li>
					<li>자기소개 : <br>${mem.intro }</li>
				</ul>
			</div>
		</c:forEach>
	<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-body">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<!-- Wrapper for slides -->
 						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img src="images/cafe1.jpg" style="width: 100%; height: 500px;">
								<div class="carousel-caption"></div>
							</div>
							<div class="item">
								<img src="images/cafe2.jpg" style="width: 100%; height: 500px;">
								<div class="carousel-caption"></div>
							</div>
							<div class="item">
								<img src="images/cafe3.JPG" style="width: 100%; height: 500px;">
								<div class="carousel-caption"></div>
							</div>
						</div>

						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic"
							role="button" data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"
							aria-hidden="true"></span> <span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 마우스 오버시 파티원 정보 표시 -->
	<script type="text/javascript">
	for(j=1;j<="${count}";j++){
	for(i=1;i<=8;i++){
		var divClass = '.'+j+'-'+i;
	$(divClass).hover(function(e){ //mouse over
		var divName ='#'+$(this).attr('class');
		var sWidth = window.innerWidth;
		var sHeight = window.innerHeight;
		var oWidth = $(divName).width();
		var oHeight = $(divName).height();
		// 레이어가 나타날 위치를 셋팅한다.
		var divLeft = e.clientX + 10;
		var divTop = e.clientY - 5;
		// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
		//if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
		//if( divTop + oHeight > sHeight ) divTop -= oHeight;
		// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
		//if( divLeft < 0 ) divLeft = 0;
		//if( divTop < 0 ) divTop = 0;
		$(divName).css({
			"top": divTop,
			"left": divLeft,
			"position": "absolute"
		}).show();
	},function(){ //mouse out
		$('.meminfo').hide();
	}).mousemove(function(ev) { //현재 작동안함
		  // 이벤트 좌표
		  var $ev_x = ev.pageX;
		  var $ev_y = ev.pageY;
		  // 툴팁 좌표
		  var $tt_x = $(divName).outerWidth();
		  var $tt_y = $(divName).outerHeight();
		  // 본문 좌표
		  var $bd_x = $(this).outerWidth();
		  var $bd_y = $(this).outerHeight();
		  // 툴팁을 이동시킨다.
		  $('.meminfo').css({
		   'top': $ev_y + $tt_y > $bd_y ? $ev_y - $tt_y +80 : $ev_y,
		   'left': $ev_x + $tt_x +20 > $bd_x ? $ev_x - $tt_x -10 : $ev_x + 20
		  });
		 });
	}
	}
</script>
<!--
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the image and insert it inside the modal - use its "alt" text as a caption
		var img = document.getElementById('myImg');
		var modalImg = document.getElementById("img01");
		var captionText = document.getElementById("caption");
		img.onclick = function() {
			modal.style.display = "block";
			modalImg.src = this.src;
			captionText.innerHTML = this.alt;
		}

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}
	</script> -->
	<!---------------- B O R A D _ E N D------------------>
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