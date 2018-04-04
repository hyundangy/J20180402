<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 아이디 중복체크 AJAX 데이터받는 jsp파일 -->
<%
	String id = request.getParameter("id");
	MemberDAO md = MemberDAO.getInstance();
	int result = md.checkId(id);
	out.println(result);
%>
