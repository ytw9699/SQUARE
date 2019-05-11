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
				<form action="passChangePro.action" method="post">
					<p class="paragraph">SQUARE 에 오신것을 환영합니다!
					<p><s:property value="id" />
					<s:hidden name="id" value="%{id}" />
					<p class="paragraph"><input type="text" name="password"  placeholder="변경할 비밀번호를 입력하세요" />
					<p class="paragraph"><input type="password" name="password2"  placeholder="재입력 하세요" />
					<p class="paragraph"><input type="submit" value="변경하기" />
					
					<!-- onClick="Animate2id('#c2','easeInOutExpo'); return false" -->
				</form>
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