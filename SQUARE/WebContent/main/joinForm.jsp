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
					<span class="welcomeText">SQUARE 에 오신것을 환영합니다!</span>
						<form action="welcomeSQUARE.action" method="post" name="joinForm" onsubmit="return checking();">
							<input type="text" name="id"  placeholder="아이디" class="joinInput" maxlength="20" />
							<!-- <span class="idCheckButton">중복확인</span> -->
							<input type="button" value="중복확인" class="idCheckButton" onclick="openCheckID(this.form);" />
							<input type="password" name="password"  placeholder="비밀번호" class="joinInput" maxlength="15" />
							<input type="password" name="password2"  placeholder="비밀번호 재입력" class="joinInput" maxlength="15" />
							<input type="text" name="email" placeholder="이메일" class="joinInput" maxlength="30" />
							<input type="text" name="name" placeholder="이름" class="joinInput" maxlength="4" />
							<input type="text" name="jumin" placeholder="주민번호 앞자리" class="joinInput" maxlength="6" />
							<input type="text" name="phone_num" placeholder="연락처 000-0000-0000" class="joinInput" maxlength="13" />
							<input type="text" name="account" placeholder="계좌번호" class="joinInput" maxlength="20" />
							<input type="text" name="zipcode" placeholder="우편번호" class="joinInput" />
							<input type="text" name="address" placeholder="상세주소" class="joinInput" />
						
						
							<input type="submit" value="회원가입" class="joinOK" />
							<input type="button" value="취소" onclick="location.href='main.action'" class="joinCancel" />
							
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
		alert('아이디를 입력하세요');
		document.joinForm.id.focus();
		return false;
	}
	else if(document.joinForm.password.value == ''){
		alert('비밀번호를 입력하세요');
		document.joinForm.password.focus();
		return false;
	}
	else if(document.joinForm.password2.value == ''){
		alert('비밀번호를 재입력하세요')
		document.joinForm.password2.focus();
		return false;
	}
	else if(document.joinForm.password.value != document.joinForm.password2.value){
		alert('비밀번호 재확인을 정확히 입력하세요');
		document.joinForm.password.focus();
		return false;
	}
	else if(document.joinForm.email.value == ''){
		alert('이메일을 입력하세요')
		document.joinForm.email.focus();
		return false;
	}
	else if(document.joinForm.name.value == ''){
		alert('이름을 입력하세요')
		document.joinForm.name.focus();
		return false;
	}
	else if(document.joinForm.jumin.value == ''){
		alert('주민번호 앞 여섯자리를 입력하세요')
		document.joinForm.jumin.focus();
		return false;
	}
	else if(document.joinForm.phone_num.value == ''){
		alert('연락처를 입력하세요');
		document.joinForm.phone_num.focus();
		return false;
	}
	else if(document.joinForm.account.value == ''){
		alert('계좌번호를 입력하세요 \n\n추후 결제에 사용됩니다')
		document.joinForm.account.focus();
		return false;
	}
	else if(idCheckNumber == -1){
		alert('아이디 중복확인을 해주세요!');
		document.joinForm.id.focus();
		return false;
	}else
		return true;
}

function openCheckID(u){
	if(u.id.value == ''){
		alert('아이디를 입력하세요!');
		u.id.focus();
		return false;
	}
	url = "checkJoinID.action?id="+u.id.value;
	open(url,"confirm","toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500, height=500");
}
</script>

</body>
</html>