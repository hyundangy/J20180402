<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Let's! 놀자GO!</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/nolja.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/noljaBooster.css">
	<link rel="stylesheet" href="css/noljaAddr.css">
	<style type="text/css">
		form {
			display: block;
		}

		.form-join {
			margin: 0 auto;
			padding: 30px;
			width: 400px;
		}

		form input {
			margin: 15px 0;
		}

		form input:placeholder-shown {
			/* Standard (https://drafts.csswg.org/selectors-4/#placeholder) */
			font-size: 13px;
		}

		form label {
			font-weight: normal;
			margin: 0;
			font-size: 14px;
		}

		form input[type="submit"] {
			background-color: powderblue;
			border: none;
			margin: 15px 0;
		}

		form .row {
			display: inline-block;
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

		/* 주소 관련 CSS */

		form .address {
			margin: 0 auto;
		}
		/* 성별 관련 CSS */

		form .sex-group {
			margin: 15px;
			text-align: center;
		}

		form .input-group-btn .tel {
			margin: 0 auto;
			width: 30%;

		}
		form .address {
			font-size: 12px;
		}
		#address {
			border-radius: 7px 0 0 7px;
		}
		/* 프로필 이미지 업로드 */
		#img {
			width: 30%;
			height: 30%;
		}
		.input-file {
			display: inline-block;
			margin-bottom: 15px;
		}
		#profile-group {
			padding-top: 20px;
		}
		.input-file [type="file"] {
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1;
			overflow: hidden;
			clip: rect(0, 0, 0, 0);
			border: 0 none;
		}
		.input-file .file-label {
			display: inline-block;
			/* min-width: 53px;
			height: 27px; */
			line-height: 24px;
			border-radius: 2px;
			font-size: 13px;
			background-color: powderblue;
			color: #707070;
			text-align: center;
		}
		.input-file .file-name	{
			margin: 0px 0px 15px 55px;
			width: 50%;
			background: #f5f5f5;
			height: 27px;
			line-height: 26px;
			text-indent: 5px;
			border: 1px solid #bbb;
		}
		/* 접근성 탭 포커스 스타일 */
		.file-focus {
			outline: 1px dotted #d2310e;
		}
		/* 한줄 자기소개 */
		#intro {
			margin: 15px auto;
		}
		/* 회원가입버튼 */
		#submit {
			font-size: 14px;
			border: none;
	        background: linear-gradient(141deg, #0fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);
	        color: white;
		}
		div #emailOk {
			margin-bottom: 15px;
		}
		/* 아이디 / 비밀번호 입력 메세지 출력 */
		#idOk, #pwdFalse, #birthOk, #emailOk,
		#nameOk, #telOk, #imgOk {
			font-size: 12px;
			color: red;
		}
		#pwdOk {
			font-size: 12px;
		}
	    
	</style>
	
	
	<script type="text/javascript">
	/* 아이디 중복 체크 */
		function checkId() {
			var id = $('#id').val();
			var sendData = 'id=' +id;
			$.post('checkId.jsp', sendData, function(result) {
				if(result == 0) {
					$("#idOk").html("사용가능한 아이디입니다.").css("color", "#2cb5e8").css("font-size", "12");
				} else if (result == 1) {
					$("#idOk").html("이미 존재하는 ID입니다.").css("color", "red");
				} else if (result == -1) {
					$("#idOk").html("ID는 4자이상 20자이하로 입력해주세요.").css("color", "red");
				}
		 	});
		 }
	/* 비밀번호 체크 */
		function checkPwd() {
		var password = $('#password').val();
		var password2 = $('#password2').val();
		if(password2 == "" & (password2 != password || password2 == password)) {
			$("#password2").css("background-color", "#FFCECE");
			$("pwdFalse").show();
			$("#pwdFalse").html("비밀번호를 확인해주세요.")
			$("#pwdOk").hide();
		} else if(password == password2) {
			$("#password2").css("background-color", "#FFFFFF");
			$("#pwdFalse").hide();
			$("#pwdOk").show();
			$("#pwdOk").html("비밀번호 일치").css("color", "#2cb5e8");
		}
			
	}
	/* 생년월일 길이 체크 */
		function checkBirth() {
		var birth = $('#birth').val();
		if(birth.length < 6) {
			$("#birth").css("background-color", "#FFCECE");
			$("#birthOk").html("생년월일을 확인해주세요.")
		} else if(birth.length == 6) {
			$("#birth").css("background-color", "white");
			$("#birthOk").hide();
		}
	}
	/* 이름길이 체크 */
		function checkName() {
		var name = $('#name').val();
		if(name.length < 2 || name.length > 8) {
			$("#name").css("background-color", "#FFCECE");
			$("#nameOk").html("이름은 2자이상 8자이하로 입력해주세요");
		} else if(name.length == 2 || name.length == 8) {
			$("#name").css("background-color", "white");
			$("#nameOk").hide();
		}
	}
	/* 전화번호 체크 */
		function checkTel() {
		var tel = $('#tel').val();
		if(tel.length < 10 || tel.length > 11) {
			$("#tel").css("background-color", "#FFCECE");
			$("#telOk").html("연락처는 '-'를 제외한 10자이상 11자이하로 입력해주세요.")
		} else if(tel.length == 10 || tel.length == 11) {
			$("#tel").css("background-color", "white");
			$("#telOk").hide();
		}
	}
	/* 이메일체크 */
		function checkEmail() {
			var str = $('#email').val();
			if(str.indexOf("@") == -1) {
				$("#email").css("background-color", "#FFCECE");
				$("#emailOk").html("이메일주소를 확인해주세요.")
			} else if(str.indexOf("@") != -1) {
				$("#email").css("background-color", "white");
				$("#emailOk").hide();
			}
		}
	/* 프로필 이미지 업로드 */
		var sel_file;
		$(document).ready(function() {
			$("#image").on("change", handleImgFileSelect);
		});
		
		function handleImgFileSelect(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f) {
				if(!f.type.match("image.*")) {
					$("#imgOk").html("이미지파일만 선택가능합니다.");
					/* alert("확장자는 이미지 확장자만 가능합니다."); */
					return;
				}
				
				sel_file = f;
				
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#img').attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		
	</script>
</head>

<!-------------- B O D Y -------------->
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.do">놀자GO!</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#"><span class="sr-only"></span>내주변</a></li>
					<li><a href="#">장르별</a></li>
					<li><a href="#">지역별</a></li>
					<li><a href="#">함께놀기</a></li>
					<li><a href="#">게시판</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">더보기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">공지사항</a></li>
							<li><a href="#">놀자GO! BEST</a></li>
							<li><a href="#">놀자GO! 초이스</a></li>
							<li><a href="#">1:1 문의하기</a></li>
						</ul>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="login.do">로그인</a></li>
					<li class="active"><a href="agree.do">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!--------------- J O I N : F O R M ---------------->
	<div class="container">
		<form class="form-horizontal form-join" name="form" id="form" action="joinAction.do" enctype="multipart/form-data" method="post">
			<h2 class="form-login-heading text-center">Let's 놀자GO!</h2>
			<br>
			<label class="sr-only" for="id">아이디</label>
			<input type="text" class="form-control center-block input-lg center-block" name="id" id="id" placeholder="아이디를 입력해주세요.(4~20자)" pattern="[A-Za-z0-9]{4, 20}" minlength="4" maxlength="20" onblur="checkId();" required autofocus>
			<div id="idOk"></div>
			<label class="sr-only" for="password">비밀번호</label>
			<input type="password" class="form-control center-block input-lg" name="password" id="password" placeholder="비밀번호를 입력하세요.(8~20자)" onblur="checkPwd();" minlength="8" maxlength="20" required>
			<label class="sr-only" for="password2">비밀번호확인</label>
			<input type="password" class="form-control center-block input-lg" name="password2" id="password2" placeholder="비밀번호를 한번 더 입력하세요." onblur="checkPwd();" minlength="8" maxlength="20" required>
			<div id="pwdFalse"></div>
			<div id="pwdOk"></div>
			<label class="sr-only" for="name">이름</label>
			<input type="text" class="form-control center-block input-lg" name="name" id="name" placeholder="이름을 입력해주세요(2~8자)" pattern="[가-힣]{2, 8}" minlength="2" maxlength="8" onblur="checkName();" required>
			<div id="nameOk"></div>
			<label class="sr-only" for="age">생년월일</label>
			<input type="text" class="form-control center-block input-lg" name="birth" id="birth" placeholder="생년월일 (예: 890217)" pattern="[0-9]{6}" minlength="6" maxlength="6" onblur="checkBirth();" required>
			<div id="birthOk"></div>
			<label class="sr-only" for="tel">연락처</label>
			<input type="tel" class="form-control center-block input-lg" name="tel" id="tel" placeholder="연락처 ('-'를 제외한  10~11자리)" pattern="[0-9]{10, 11}" minlength="10" maxlength="11" onblur="checkTel();" required>
			<div id="telOk"></div>
			<label class="sr-only" for="email">이메일</label>
			<input type="email" class="form-control center-block input-lg" name="email" id="email" placeholder="이메일을 입력해주세요." onblur="checkEmail();" required>
			<div id="emailOk"></div>
			<!------------ 주 소 검 색  ------------>
			<div class="input-group addrGroup">
				<label class="sr-only" for="address">주소</label>
				<input type="text" class="form-control address input-lg" name="address" id="address" placeholder="주소 검색" value="">
				<span class="input-group-btn">
                    <button class="btn btn-default input-lg" type="button" onclick="goPopup()">검색</button>
                </span>
			</div>
			<!------------ 성 별 버 튼 ------------>
			<div class="form-group sex-group">
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-default active">
                        <input type="radio" name="sex" autocomplete="off" value="남자" checked="checked">남자
                    </label>
					<label class="btn btn-default">
                        <input type="radio"	name="sex" autocomplete="off" value="여자">여자
                    </label>
				</div>
			</div>
			<!--------------- 프 로 필 업 로 드 ------------->
			<div class="thumbnail" style="border: none;">
				<img src="images/home.png" class="img-responsive img-circle" id="img">
			</div>
			<div class="input-file col-md-4 col-md-offset-4">
				<label for="image" class="file-label form-control">
					<input type="file" accept="image/*" name="image" id="image" class="file-upload" />업로드
				</label>
			</div>
			<div class="row">
				<div class="text-center" id="imgOk"></div>
			</div>
			<!------------ 자 기 소 개 ------------->
			<label class="sr-only" for="intro">자기소개</label>
			<textarea class="form-control" name="intro" id="intro" maxlength="50">자신을 소개해 보세요.</textarea>
			<input class="form-control center-block input-lg" id="submit" type="submit" value="회&nbsp;원&nbsp;가&nbsp;입">
		</form>
	</div>

	<!--------------------  F O O T E R  ------------------>
	<footer>
		<div class="container-fluid">
			<div class="container">
				<!--------------------  F O O T E R : NAVI  ------------------>
				<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
							하단메뉴<span class="caret"></span>
						</button>
						<a class="navbar-brand" href="#">놀자GO!</a>
					</div>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
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
							<img src="images/fbicon.png" alt="페이스북" style="width: 40px;">&nbsp;&nbsp;&nbsp;<img src="images/instaicon.png" alt="인스타그램" style="width: 40px;">&nbsp;&nbsp;&nbsp;<img src="images/twticon.png" alt="트위터" style="width: 40px"> <br />
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
							<br />(주) 2조친구들&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;팀장 : 방현석&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;메일 : help@noljago.com<br /> 주소 : 서울 강남구 테헤란로7길 7 602호&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;개인정보관리책임자 : 전민구<br /> 사업자 등록번호 : 220-22-23456&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;통신판매업신고
							: 강남-12122호
							<br />
							<br /> Copyright &copy; 2018<br /> (주) 2조친구들<br /> All right reserved.
							<br />
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
