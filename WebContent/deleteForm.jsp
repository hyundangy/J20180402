<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 삭제</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
		<script type="text/javascript">
				if(confirm("삭제하겠습니까?")){
						location.href="deletePro.do?pageNum=${pageNum}&bnum=${bnum}&id=${board.id}";
				}else{
					window.history.back();
				}
		</script>
</body>
</html>