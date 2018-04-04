<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약</title>
<style type="text/css">
	ul {
    list-style:none;
    margin:0;
    padding:0;
	}
	li {
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
</style>
</head>
<body>
	<div id="top">
		<ul>
			<li>01. 날짜/시간 선택</li>
			<li>02. 예약 정보 입력</li>
			<li>03. 예약 완료</li>
		</ul>
	</div>

	<br><br>
	<p>울산 바이킹<hr>
	<img src="images/game1.JPG">
	<p>예약 날짜 <input type="text" name="date">
	<select name="start_time">
    <option value="">시작시간</option>
    <option value="one">1시</option>
    <option value="two">2시</option>
    <option value="three">3시</option>
    <option value="four">4시</option>
    <option value="five">5시</option>
    <option value="six">6시</option>
    <option value="seven">7시</option>
    <option value="seven">8시</option>
    <option value="seven">9시</option>
    <option value="seven">10시</option>
    <option value="seven">11시</option>
    <option value="seven">12시</option>
    </select>
    ~ 
    <select name="end_time">
    <option value="">종료시간</option>
    <option value="one">1시</option>
    <option value="two">2시</option>
    <option value="three">3시</option>
    <option value="four">4시</option>
    <option value="five">5시</option>
    <option value="six">6시</option>
    <option value="seven">7시</option>
    <option value="seven">8시</option>
    <option value="seven">9시</option>
    <option value="seven">10시</option>
    <option value="seven">11시</option>
    <option value="seven">12시</option>
	</select>
</body>
</html>