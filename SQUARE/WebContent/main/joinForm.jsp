<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="/SQUARE/static/css/main_join.css" type="text/css" />
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
				<img src="/SQUARE/static/img/logo.png" class="joinLogo" />
					<span class="welcomeText">SQUARE �� ���Ű��� ȯ���մϴ�!</span>
						<form action="welcomeSQUARE.action" method="post" name="joinForm" onsubmit="return checking();">
							<input type="text" name="id"  placeholder="���̵�" class="joinInput" maxlength="20" />
							<!-- <span class="idCheckButton">�ߺ�Ȯ��</span> -->
							<input type="button" value="�ߺ�Ȯ��" class="idCheckButton" onclick="openCheckID(this.form);" />
							<input type="password" name="password"  placeholder="��й�ȣ" class="joinInput" maxlength="15" />
							<input type="password" name="password2"  placeholder="��й�ȣ ���Է�" class="joinInput" maxlength="15" />
							<input type="text" name="email" placeholder="�̸���" class="joinInput" maxlength="30" />
							<input type="text" name="name" placeholder="�̸�" class="joinInput" maxlength="4" />
							<input type="text" name="jumin" placeholder="�ֹι�ȣ ���ڸ�" class="joinInput" maxlength="6" />
							<input type="text" name="phone_num" placeholder="����ó 000-0000-0000" class="joinInput" maxlength="13" />
							<input type="text" name="account" placeholder="���¹�ȣ" class="joinInput" maxlength="20" />
							<input type="text" name="zipcode" placeholder="�����ȣ" class="joinInput" />
							<input type="text" name="address" placeholder="���ּ�" class="joinInput" />
						
						
							<input type="submit" value="ȸ������" class="joinOK" />
							<input type="button" value="���" onclick="location.href='main.action'" class="joinCancel" />
							
						</form>
					<!-- onClick="Animate2id('#c2','easeInOutExpo'); return false" -->	
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/SQUARE/static/js/jquery.easing.1.3.js"></script>
<script>
$(".dd").animate({"top": "-=3000px"}, 300000);

var idCheckNumber = -1;

function checking(){
	if(document.joinForm.id.value == ''){
		alert('���̵� �Է��ϼ���');
		document.joinForm.id.focus();
		return false;
	}
	else if(document.joinForm.password.value == ''){
		alert('��й�ȣ�� �Է��ϼ���');
		document.joinForm.password.focus();
		return false;
	}
	else if(document.joinForm.password2.value == ''){
		alert('��й�ȣ�� ���Է��ϼ���')
		document.joinForm.password2.focus();
		return false;
	}
	else if(document.joinForm.password.value != document.joinForm.password2.value){
		alert('��й�ȣ ��Ȯ���� ��Ȯ�� �Է��ϼ���');
		document.joinForm.password.focus();
		return false;
	}
	else if(document.joinForm.email.value == ''){
		alert('�̸����� �Է��ϼ���')
		document.joinForm.email.focus();
		return false;
	}
	else if(document.joinForm.name.value == ''){
		alert('�̸��� �Է��ϼ���')
		document.joinForm.name.focus();
		return false;
	}
	else if(document.joinForm.jumin.value == ''){
		alert('�ֹι�ȣ �� �����ڸ��� �Է��ϼ���')
		document.joinForm.jumin.focus();
		return false;
	}
	else if(document.joinForm.phone_num.value == ''){
		alert('����ó�� �Է��ϼ���');
		document.joinForm.phone_num.focus();
		return false;
	}
	else if(document.joinForm.account.value == ''){
		alert('���¹�ȣ�� �Է��ϼ��� \n\n���� ������ ���˴ϴ�')
		document.joinForm.account.focus();
		return false;
	}
	else if(idCheckNumber == -1){
		alert('���̵� �ߺ�Ȯ���� ���ּ���!');
		document.joinForm.id.focus();
		return false;
	}else
		return true;
}

function openCheckID(u){
	if(u.id.value == ''){
		alert('���̵� �Է��ϼ���!');
		u.id.focus();
		return false;
	}
	url = "checkJoinID.action?id="+u.id.value;
	open(url,"confirm","toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500, height=500");
}
</script>

</body>
</html>