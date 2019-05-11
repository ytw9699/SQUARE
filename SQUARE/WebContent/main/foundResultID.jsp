<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="/SQUARE/static/css/main_login.css" type="text/css" />
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
</head>
<body>

<div id="all">
<img src="/SQUARE/static/img/longmain.png" style="position: absolute" class="dd"/>
</div>
<div id="viewport">
	<div id="container">
	
		<div id="c1">
			<div class="innerContent">
				<img src="/SQUARE/static/img/logo.png" width="300px"/>
				<p>아이디 검색결과
				<p><strong><s:property value="foundID"/></strong>
				<p><a href="main.action">로그인하러 가기</a>
			</div>
		</div>
		
	</div>
</div>
<script type="text/javascript" src="/SQUARE/static/js/jquery.easing.1.3.js"></script>
<script>
$(".dd").animate({"top": "-=3000px"}, 300000);

function Animate2id(id,ease){ //the id to animate, the easing type
	var animSpeed=1000; //set animation speed
	var $container=$("#container"); //define the container to move
	if(ease){ //check if ease variable is set
		var easeType=ease;
	} else {
    	var easeType="easeOutQuart"; //set default easing type
	}
	//do the animation
    $container.stop().animate({"left": -($(id).position().left)}, animSpeed, easeType);
}
</script>
</body>
</html>