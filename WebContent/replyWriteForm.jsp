<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<form action="replyWritePro.do?pageNum=${pageNum }" method="post">
				<input type="text" name="bnum" value="${bnum }">
				<input type="text" name="ref" value="${ref }">
				<input type="text" name="re_level" value="${re_level }">
				<input type="text" name="category" value="${category }">
				<input type="text" name="readcount" value="${readcount }">
				<table>
					<tr>
						<td style="width: 90%"><input type="text"
							class="form-control" placeholder="제목" name="subject"
							maxlength="50" required="required"></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" placeholder="아이디"
							name="id" style="width: 100px;" required="required"></td>
				</table>
				<input type="submit" class="btn btn-info pull-right" value="글쓰기"><br />
				<br /> <input type="reset" class="btn btn-info pull-right"
					value="다시작성">
			</form>
		</div>
	</div>
</body>
</html>