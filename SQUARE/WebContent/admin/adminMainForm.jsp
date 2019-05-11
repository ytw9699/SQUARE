<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
<style>
.adminMainWrap {
    width: 75%;
    margin: 0 auto;
    min-height: 650px;
    
}
.adminMenuWrap {
    min-height: 600px;
    box-sizing: border-box;
    padding-top: 15%;
    margin: 0 auto;
   	margin-left: 10%;
}
.adminMenu {
    float: left;
    margin-left: 20px;
    transition: 0.3s;
    cursor: pointer;	
}
.adminMenu:hover {
	border: 5px solid #ddd;
}
</style>
</head>
<body style="margin:0;">
<%@ include file="/slice/searchBar.jsp" %>
<div class="adminMainWrap">

	<div class="adminMenuWrap" >
		
		<div class="adminMenu" onclick="location.href='memberList.action'">
			<img src="/SQUARE/static/img/admin_m.png" />
		</div>
		<div class="adminMenu" onclick="location.href='lineList.action'" >
			<img src="/SQUARE/static/img/admin_b.png" />
		</div>
		<div class="adminMenu" onclick="location.href='dotChargeList.action'" >
			<img src="/SQUARE/static/img/admin_p.png" />
		</div>
		
	</div>

</div>
<%@ include file="/slice/footer.jsp" %>
</body>
</html>