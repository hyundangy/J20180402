<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 메인메뉴</title>
</head>
<body>
	<h1>회원관리</h1>
	<table bgcolor="pink" border="1" width="80%">
		<tr><td><a href="memberList.do">회원 명단 List</a></td></tr>
	</table> <p><p>
	
	<h1>카페관리</h1>
	<table bgcolor="pink" border="1" width="80%">
		<tr><td><a href="cafeList.do">카페 명단 List</a></td></tr>
	</table>
	
	<h1>파티관리</h1>
	<table bgcolor="pink" border="1" width="80%">
		<tr><td><a href="partyList.do">파티 명단 List</a></td></tr>
	</table>
	
</body>
</html>