<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 등록</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<form action = "memberAddPro.do?pageNum=${pageNum}" method = "post">
<table>
	<caption><h2>회원정보 등록</h2></caption>
	<tr><td> 아이디 </td><td><input type="text" name="id" required="required" > </td></tr>
	<tr><td> 비밀번호 </td><td><input type="password" name="password" required="required" > </td></tr>
	<tr><td> 관리자 여부 </td><td><input type="text" name="admin" required="required" > </td></tr>
	<tr><td> 이름 </td><td><input type="text" name="name" required="required" > </td></tr>
	<tr><td> 생년월일 </td><td><input type="text" name="birth" required="required" > </td></tr>
	<tr><td> 성별 </td><td><input type="text" name="sex" required="required" > </td></tr>
	<tr><td> 주소 </td><td><input type="text" name="address" required="required" > </td></tr>
	<tr><td> 이메일 </td><td><input type="text" name="email" required="required" > </td></tr>
	<tr><td> 전화번호 </td><td><input type="text" name="tel" required="required" > </td></tr>
	<tr><td> 한줄 자기소개 </td><td><input type="text" name="intro"> </td></tr>
	<tr><td> 포인트 </td><td><input type="text" name="point" required="required"> </td></tr>
	<tr>
		<td><input type="reset" value="다시작성"></td>
		<td><input type="submit" value="확인"></td>
	</tr>
</table>
</form>
</body>
</html>