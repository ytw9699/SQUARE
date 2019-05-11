<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
</head>
<script>
alert("보유하고 있는 DOT이 부족합니다 \n\n마이페이지에서 충전이 가능합니다")
location.href=location.href='viewAction.action?line_num=<s:property value="line_num"/>&currentPage=<s:property value="currentPage"/>&board_num=<s:property value="board_num"/>';
</script>
<body>

</body>
</html>