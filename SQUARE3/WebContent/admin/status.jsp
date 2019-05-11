<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/SQUARE/static/css/css.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>계정</title>
<script>
function apple(){
alert('완료되었습니다');	
location.href='memberDetail.action?id=<s:property value="encodedID" />&currentPage=<s:property value="currentPage"/>';
}
</script>
</head>
<body>
<script>
apple();
</script>
</body>
</html>