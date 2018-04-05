<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>들어와! 놀자GO!</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/cookie.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/noljaBooster.css">
	<style type="text/css">
	form {
		display: block;
	}
	.form-login {
		margin: 65px auto;
		padding: 30px;
		width: 350px;
	}
	form input {
		margin: 15px 0;
	}
	form input:placeholder-shown { /* Standard (https://drafts.csswg.org/selectors-4/#placeholder) */
  		font-size: 13px;
	}
	form label {
		font-weight: normal;
		margin: 0;
		font-size: 14px;
	}
	form #submit {
		background-color: powderblue;
		border: none;
		margin: 15px 0;
	}
	form .row {
		display:inline-block;
		font-size: 10px;
		margin: 0;
	}
	form .checkbox {
		padding: 0;
		margin-top: 0;
	}
	form .col-md-6 {
		padding: 0;
		margin-bottom: 15px;
	}
	.form-horizontal .checkbox {
		padding: 0;
	}
    /* 로그인 버튼 */
    #submit {
        font-size: 14px;
        border: none;
        background: linear-gradient(141deg, #0fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);
        color: white;
    }
    #loginOk {
    	font-size: 12px;
    	color: red;
    	margin-bottom: 15px;
    }
    /* 아이디 비밀번호 찾기 팝업창 */
    /* input 넓이 설정 */
    .modal .input-lg {
    	width: 300px;
    	/* border-radius: 0; */
    	font-size: 13px;
    }
    .modal #name {
    	margin-top: 5px;
    }
    .modal #id {
    	margin-top: 5px;
    }
    .modal #findOk {
    	color: white;
    	background: linear-gradient(141deg, #0fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);
    }
    .modal #mbCont {
    	margin: 30px auto;
    }
    .modal .id-notice {
    	color: red;
    	font-size: 10px;
    }
    .modal-footer a {
    	color: black;
    }
    
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var userInputId = getCookie("userInputId");
	    $("input[name='id']").val(userInputId); 
	     
	    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#saveid").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#saveid").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#saveid").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[name='id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#saveid").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[name='id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	</script>
</head>
<%------------ B O D Y ------------%>
<body>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		$(document).ready(function(){
			$("#password").css("background-color", "#FFCECE");
			$("#loginOk").text("비밀번호를 확인해주세요.");
		});
	</script>
</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		$(document).ready(function(){
			$("#id").css("background-color", "#FFCECE");
			$("#loginOk").text("아이디가 존재하지 않습니다.");
		});
	</script>
</c:if>
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
					<li><a href="searchGps.do"><span class="sr-only"></span>내주변</a></li>
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
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="login.do">로그인</a></li>
					<li><a href="agree.do">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!--------------- L O G I N : F O R M ---------------->
	<div class="container">
		<form class="form-horizontal form-login" action="loginAction.do" method="post">
			<h2 class="form-login-heading text-center">들어와! 놀자GO!</h2>
			<br>
			<label class="sr-only" for="id">아이디</label>
			<input type="text" class="form-control center-block input-lg" name="id" id="id" placeholder="아이디를 입력하세요" required autofocus>
			<label class="sr-only" for="password">비밀번호</label>
			<input type="password" class="form-control center-block input-lg" name="password" id="password" placeholder="비밀번호를 입력하세요" required>
			<div id="loginOk"></div>
			<div class="row">
				<label>
					<input class="pull-left" type="checkbox" id="saveid">&nbsp;아이디저장
				</label>
			</div>
			<a class="text-rihgt pull-right" data-target="#modal" data-toggle="modal">아이디/비밀번호 찾기</a>
			<input class="form-control center-block input-lg" id="submit" type="submit" value="로&nbsp;그&nbsp;인">
		</form>
	</div>
	<!--------------- 아이디 비밀번호 찾기 팝업창 ----------------->
	<div class="row">
		<div class="modal" id="modal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<a class="find-title">아이디/비밀번호 찾기</a>
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="mbCont" action="findId.do">
							<h4 class="text-center">아이디 찾기</h4>
							<div class="form-group text-center">
								<a class="id-notice">※가입하실때 입력하셨던 이름과 이메일을 입력해주세요.</a>
								<input type="text" class="form-control input-lg center-block" name="name" id="name" placeholder="이름" required="required">
								<input type="email" class="form-control input-lg center-block" name="email" id="email" placeholder="이메일 주소" required="required">
								<div id="findid"></div>
								<input type="submit" class="form-control input-lg center-block" id="findOk" value="아이디&nbsp;찾기">
							</div>
						</form>
						<form class="form-horizontal" id="mbCont" action="findPwd.do">
							<h4 class="text-center">비밀번호 찾기</h4>
							<div class="form-group text-center">
								<a class="id-notice">※가입하실때 입력하셨던 아이디와 이메일을 입력해주세요.</a>
								<input type="text" class="form-control input-lg center-block" name="id" id="id" placeholder="아이디" required="required">
								<input type="email" class="form-control input-lg center-block" name="email" id="email" placeholder="이메일 주소" required="required">
								<div id="findpwd"></div>
								<input type="submit" class="form-control input-lg center-block" id="findOk" value="비밀번호&nbsp;찾기">
							</div>
						</form>
					</div>
					<div class="modal-footer text-center">
						<a class="close" role="button" id="close" data-dismiss="modal">돌아가기</a>
					</div>
				</div>
			</div>
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
						<a class="navbar-brand" href="main.jsp">놀자GO!</a>
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
</body>
</html>
