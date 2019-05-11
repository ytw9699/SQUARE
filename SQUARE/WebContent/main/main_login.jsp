<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="/SQUARE/static/css/main_login.css" type="text/css" />
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
</head>
<body onload="document.loginForm.id.focus();">
<div id="load">
	<img src="/SQUARE/static/img/loading.gif" alt="loading">
</div>

<div id="all">
<img src="/SQUARE/static/img/longmain.png" style="position: absolute" class="dd"/>
</div>
<div id="viewport">
	<div id="container">
	
		<div id="c1">
			<div class="innerContent">
				<img src="/SQUARE/static/img/logo.png" width=220px class="mainLogo"/>
				<form action="login.action" method="post" onsubmit="javascript:loading();" name="loginForm">
					<p class="paragraph" id="welcome">SQUARE 에 오신것을 환영합니다!
					<p class="p_input"><input type="text" name="id" class="loginInput"  placeholder="아이디" maxlength="20" />
					<p class="p_input"><input type="password" name="password" class="loginInput"  placeholder="비밀번호를 입력하세요" />
					<p class="p_loginButton"><input type="submit" value="로그인" class="loginButton" />
					<p class="p_text"><a href="joinForm.action">계정 만들기</a>
					<p class="p_text"><a href="#" onClick="Animate2id('#c2','easeInOutExpo'); return false">계정 찾기</a>
					<!-- onClick="Animate2id('#c2','easeInOutExpo'); return false" -->
				</form>
			</div>
		</div>
		<div id="c2">
				<p><span class="c2_text">계정찾기</span>
				<!-- <p><a href="#" onclick="Animate2id('#c3','easeInOutExpo'); return false" >아이디 찾기</a> -->
				<p><input type="button" value="아이디 찾기" onclick="Animate2id('#c3','easeInOutExpo'); return false" class="c2_button" />
				<!-- <p><a href="#" onClick="Animate2id('#c4','easeInOutExpo'); return false" >비밀번호 찾기</a> -->
				<p><input type="button" value="비밀번호 찾기" onclick="Animate2id('#c4','easeInOutExpo'); return false" class="c2_button" />
				<!-- <p><a href="#" onClick="Animate2id('#c1'); return false" >취소</a> -->
				<p><input type="button" value="취소" onclick="Animate2id('#c1'); return false" class="c2_cancel" />
		</div>
		
		<div id="c3">
				<p><span class="c3_text">아이디찾기</span>
				<span class="c3_subtext">*이메일과 이름으로 아이디를 찾을 수 있습니다</span>
				<form action="findID.action" method="post">
				<p><input type="text" name="email" placeholder="이메일" class="c3_input" />
				<p><input type="text" name="name" placeholder="이름" class="c3_input" />
				<p><input type="submit" value="확인" class="c3_submit" />
				<!-- <p><a href="#" onClick="Animate2id('#c1'); return false">취소</a> -->
				<p><input type="button" value="취소" onclick="Animate2id('#c1'); return false" class="c3_cancel" />
				</form>
		</div>
		<div id="c4">
				<p><span class="c4_text">비밀번호찾기</span>
				<span class="c4_subtext">*입력한 이메일로 비밀번호 재설정 URL이 전송됩니다</span>
				<form action="emailer.action" method="post" >
				<p><input type="text" name="email" placeholder="이메일" class="c4_input" />
				<p><input type="text" name="id" placeholder="아이디" class="c4_input" />
				<p><input type="submit" value="확인" class="c4_submit" />
				<!-- <p><a href="#" onClick="Animate2id('#c1'); return false">취소</a> -->
				<p><input type="button" value="취소" class="c4_cancel" onclick="Animate2id('#c1'); return false" />
				</form>
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

function loading(){
	var loadingDIV = document.getElementById('load');
	loadingDIV.style.display = 'block';
	
}
</script>
</body>
</html>