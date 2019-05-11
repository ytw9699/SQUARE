<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<script>
alert('이미 싫어요 한 댓글입니다');
location.href='viewAction.action?line_num=<s:property value="redirect_line_num" />&board_num=<s:property value="redirect_board_num" />&currentPage=<s:property value="redirect_currentPage" />';
</script>
</head>
<body>
</body>
</html>

