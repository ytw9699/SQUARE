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
					<p class="paragraph" id="welcome">SQUARE �� ���Ű��� ȯ���մϴ�!
					<p class="p_input"><input type="text" name="id" class="loginInput"  placeholder="���̵�" maxlength="20" />
					<p class="p_input"><input type="password" name="password" class="loginInput"  placeholder="��й�ȣ�� �Է��ϼ���" />
					<p class="p_loginButton"><input type="submit" value="�α���" class="loginButton" />
					<p class="p_text"><a href="joinForm.action">���� �����</a>
					<p class="p_text"><a href="#" onClick="Animate2id('#c2','easeInOutExpo'); return false">���� ã��</a>
					<!-- onClick="Animate2id('#c2','easeInOutExpo'); return false" -->
				</form>
			</div>
		</div>
		<div id="c2">
				<p><span class="c2_text">����ã��</span>
				<!-- <p><a href="#" onclick="Animate2id('#c3','easeInOutExpo'); return false" >���̵� ã��</a> -->
				<p><input type="button" value="���̵� ã��" onclick="Animate2id('#c3','easeInOutExpo'); return false" class="c2_button" />
				<!-- <p><a href="#" onClick="Animate2id('#c4','easeInOutExpo'); return false" >��й�ȣ ã��</a> -->
				<p><input type="button" value="��й�ȣ ã��" onclick="Animate2id('#c4','easeInOutExpo'); return false" class="c2_button" />
				<!-- <p><a href="#" onClick="Animate2id('#c1'); return false" >���</a> -->
				<p><input type="button" value="���" onclick="Animate2id('#c1'); return false" class="c2_cancel" />
		</div>
		
		<div id="c3">
				<p><span class="c3_text">���̵�ã��</span>
				<span class="c3_subtext">*�̸��ϰ� �̸����� ���̵� ã�� �� �ֽ��ϴ�</span>
				<form action="findID.action" method="post">
				<p><input type="text" name="email" placeholder="�̸���" class="c3_input" />
				<p><input type="text" name="name" placeholder="�̸�" class="c3_input" />
				<p><input type="submit" value="Ȯ��" class="c3_submit" />
				<!-- <p><a href="#" onClick="Animate2id('#c1'); return false">���</a> -->
				<p><input type="button" value="���" onclick="Animate2id('#c1'); return false" class="c3_cancel" />
				</form>
		</div>
		<div id="c4">
				<p><span class="c4_text">��й�ȣã��</span>
				<span class="c4_subtext">*�Է��� �̸��Ϸ� ��й�ȣ �缳�� URL�� ���۵˴ϴ�</span>
				<form action="emailer.action" method="post" >
				<p><input type="text" name="email" placeholder="�̸���" class="c4_input" />
				<p><input type="text" name="id" placeholder="���̵�" class="c4_input" />
				<p><input type="submit" value="Ȯ��" class="c4_submit" />
				<!-- <p><a href="#" onClick="Animate2id('#c1'); return false">���</a> -->
				<p><input type="button" value="���" class="c4_cancel" onclick="Animate2id('#c1'); return false" />
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