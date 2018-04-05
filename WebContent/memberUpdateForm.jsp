<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<form action="memberUpdatePro.do" method="post">
	<input type="hidden" name="id" value="${member.id }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table border="1">
		<caption><h2>회원정보 수정</h2></caption>
		<tr><td>아이디</td><td>${member.id}</td></tr>
		<tr><td>비밀번호</td><td>
		<input type="text" name="password" required="required"
		value="${member.password}"></td></tr>
		<tr><td>관리자여부</td><td>
		<input type="text" name="admin" required="required"
		value="${member.admin}"></td></tr>
		<tr><td>이름</td><td>
		<input type="text" name="name" required="required"
		value="${member.name}"></td></tr>
		<tr><td>생년월일</td><td>
		<input type="text" name="birth" required="required"
		value="${member.birth}"></td></tr>
		<tr><td>주소</td><td>
		<input type="text" name="address" required="required"
		value="${member.address}"></td></tr>
		<tr><td>이메일</td><td>
		<input type="text" name="email" required="required"
		value="${member.email}"></td></tr>
		<tr><td>전화번호</td><td>
		<input type="text" name="tel" required="required"
		value="${member.tel}"></td></tr>
		<tr><td>포인트</td><td>
		<input type="text" name="tel" required="required"
		value="${member.point}"></td></tr>
		<tr><td colspan="2"><input type="submit" value="수정완료" >
		</td></tr>
	</table>
</form>

</body>
</html>