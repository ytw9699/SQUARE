<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
<style>
.header {
    width: 100%;
    background-color: #666463;
    padding: 15px;
    box-sizing: border-box;
}

span.headerText {
    color: #ffffe6;
    display: inline-block;
    font-size: 25px;
    margin-bottom: 10px;
}

span.x {
    width: 40px;
    display: inline-block;
    float: right;
    margin-right: 10px;
    cursor: pointer;
}
img.xImg {
    width: 100%;
}
.middle {
    width: 85%;
    margin: 0 auto;
    margin-top: 18px;
    border: 3px solid #777777;
    padding: 5%;
    box-sizing: border-box;
}
span.middleText {
    color: #333333;
    font-size: 15px;
}
input.middleInput {
    padding: 5px;
}
input.middleSubmit {
    border: 1px solid #a3c1cb;
    background-color: #e3ecef;
    color: #40575f;
    padding: 5px;
    width: 20%;
    line-height: 18px;
}
.bottom {
    width: 85%;
    border-top: 2px solid #bdbcbc;
    margin: 0 auto;
    margin-top: 20px;
    padding-top: 20px;
    box-sizing: border-box;
    text-align: center;
}
span.canUSE {
    font-size: 15px;
    display: block;
    color: #00af00;
    font-weight: 600;
}

input.useButton {
    color: #444444;
    background-color: white;
    border: 1px solid #a3c1cb;
    padding: 8px;
    margin-top: 30px;
    width: 30%;
}

span.cannotUSE {
    font-size: 15px;
    display: block;
    color: red;
    font-weight: 600;
}
</style>
</head>
<body style="margin:0;">
<div class="header">
	<span class="headerText">
		아이디 중복체크
	</span>
	<span class="x" onclick="self.close();">
		<img src="/SQUARE/static/img/xForCheckID2.png" class="xImg" />
	</span>
</div>
<div class="middle">
	<form name="checkingForm">
		<span class="middleText">
		아이디 검색
		</span>
		<input type="text" name="id" id="id" class="middleInput" maxlength="20" placeholder="아이디를 입력하세요" />
		<input type="submit" value="검색" class="middleSubmit" />
	</form>
</div>
<div class="bottom">
<%-- <s:property value="id" /> --%>
	<s:if test="resultNumber == 1">
	<span class="cannotUSE">
	<s:property value="id" /> 는 이미 사용중인 아이디 입니다
	</span>
	</s:if>
	<s:elseif test="resultNumber == 0">
	<span class="canUSE">
	<s:property value="id" /> 는 사용할 수 있는 아이디입니다
	</span>
	<input type="button" value="사용하기" class="useButton" onclick="setID();" />
	</s:elseif>
</div>
<script>

function setID(){
	opener.idCheckNumber = 1;
	opener.document.joinForm.id.value = '<s:property value="id" />';
	self.close();
}
</script>
</body>
</html>