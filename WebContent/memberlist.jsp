<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
table {
	width: 100%;
}
</style>
</head>
<body>
	<h2>회원 리스트</h2>
	<table>
		<tr>
			<td><a href="memberAddForm.do">회원생성</a></td>
		</tr>
	</table>
	<table>
		<tr>
			<th>회원 아이디</th>
			<th>관리자 여부</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>주소</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>포인트</th>
		</tr>
		<c:if test="${totCnt > 0 }">	<!-- 리스트 널 체크 -->
			<c:forEach var="member" items="${list }">
				<tr>
					<td class=left width=200>
						 <a href='memberContent.do?id=${member.id}&pageNum=${currentPage}'>
							${member.id}</a>
					</td>
					<td>${member.admin}</td>
					<td>${member.name}</td>
					<td>${member.birth}</td>
					<td>${member.sex}</td>
					<td>${member.address}</td>
					<td>${member.email}</td>
					<td>${member.tel}</td>
					<td>${member.point}</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>
	
	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='memberList.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='memberList.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='memberList.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
</body>
</html>