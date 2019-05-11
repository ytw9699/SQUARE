<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<style>
.subMenuWrap {
    width: 75%;
    margin: 0 auto;
}
.MenuButtonWrap{
	border-bottom: 1px solid #12b9ff;
    height: 48px;
}
input.subMenuButton {
    border: none;
    padding: 15px;
    font-size: 14px;
    width: 9%;
    float: left;
    background-color: white;
    transition: 0.3s;
    outline: none;
    cursor: pointer;
}
input.subMenuButton:hover {
    background-color: #12b9ff;
    color: white;
}
</style>
<body>
<div class="subMenuWrap">
	<div class="MenuButtonWrap">
		<input type="button" value="皋牢" class="subMenuButton" onclick="location.href='adminMain.action'" />
		<input type="button" value="面傈包府" class="subMenuButton" id="AD_charge" onclick="location.href='dotChargeList.action'" />
		<input type="button" value="券傈包府" class="subMenuButton" id="AD_exchange" onclick="location.href='dotExchangeList.action'" />
		<input type="button" value="DOT郴开" class="subMenuButton" id="AD_dot" onclick="location.href='dotList.action'" />
	</div>
</div>
</body>
</html>