<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색창, 추천 게임</title>
<style type="text/css">
	#top{text-align: center;}
	#logo{color: #98F791; }
	#game{
		font-size: 1.5em; 
		margin:20px;
	}
	#list{text-align: center; margin-top: 50px;}
</style>
</head>
<body>
	<div id="top">
		<span id="logo">놀자 Go!</span>
		<input type="text" name="search" placeholder="지역명을 입력하세요">
		<img src="images/search.png" width="30" height="17">
	</div>
	<!-- 추천 게임 -->
		<span id="game">오늘의 추천 게임</span>
		<div id="list">
			<img src="images/list1.jpg" width="200" height="250">
			<img src="images/list2.jpg" width="200" height="250">
			<img src="images/list3.jpg" width="200" height="250">
		</div>
</body>
</html>