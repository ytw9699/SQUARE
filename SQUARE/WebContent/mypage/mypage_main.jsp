<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
<link rel="stylesheet" href="/SQUARE/static/css/mypage_main.css" type="text/css" />
</head>
<body>
<%@ include file="/slice/searchBar.jsp" %>

<div id="profileGray"></div>
<div id="modprofile">
	<form action="modMyImg.action" method="post" enctype="multipart/form-data">
		<div class="mainImg">
			<!-- <img id="mainPic" src='#' /> -->
			<s:if test='%{myInfomation.profile_img.equals("0")}'>
				<img src="/SQUARE/static/img/basicProfile.png" id="mainPic" />
			</s:if>
			<s:else>
				<img src="/SQUARE/static/img/profile_img/<s:property value='myInfomation.profile_img' />" id="mainPic" />
			</s:else>
		</div>
     	
     	<label for="ex_file1" class="profileButtons" id="profileSearch">이미지 찾기</label>
     		<!-- <input type="file" id="ex_file1" /> -->
		<input type="file" name="upload" id="ex_file1" />
		<input type="submit" class="profileButtons" id="profileConfirm" value="확인" />
		<input type="button" class="profileButtons" value="기본이미지 사용하기" onclick="javascript:location.href='modMyDefaultImg.action'" />
		<input type="button" class="profileButtons" value="취소" onclick="javascript:closeProfileMod();" />
	</form>
</div>
<div id="chargeDOT">

	<form action="chargeReq.action" method="post">
	<input type="hidden" name="dc_id" value="${myInfomation.id }" />
	<span class="chargeText">충전 DOT</span>
	<select name="dc_value" id="howDot" onchange="changeChageWon();">
		<option>10</option>
		<option>30</option>
		<option>50</option>
		<option>100</option>
	</select><Br>
	<span class="chargeWon" id="chargeWon">1000</span><span class="chargeText">원</span>
	<input type="submit" class="chargeSubmit" value="확인" />
	<input type="button" class="chargeCancel" value="취소" onclick="closeCharge();" />
	</form>
</div>
<div id="rechargeDOT">
	<form action="exchangeReq.action" method="post">
		<span class="chargeText">보유 DOT</span> <span class="chargeWon"><s:property value="myInfomation.dot_sum" /></span>
		<br><span class="chargeText">환전받을 DOT</span>
		<input type="hidden" name="de_id" value="${myInfomation.id }" /> 
		<input type="text" name="de_value" onblur="rechargeCheck();" id="rechargeInput" />
		<br><span class="chargeText">환전받을 금액</span> <span id="rechargeWon" class="chargeWon">0</span><span class="chargeText">원</span>
		<input type="submit" class="chargeSubmit" value="확인" />
		<input type="button" class="chargeCancel" value="취소" onclick="closeCharge();" />
	</form>
</div>

<div class="contentWrap">

	<div class="contentName">
		<span class="bigName"><s:property value="myInfomation.name" /></span><br>
		<span class="smallName"><s:property value="myInfomation.id" /></span>
	</div>
	
	<div class="contentProfile">
		<a href="javascript:openProfileMod();">
			<s:if test='%{myInfomation.profile_img.equals("0")}'>
				<img src="/SQUARE/static/img/basicProfile.png" class="profileImgViewer" />
			</s:if>
			<s:else>
				<img src="/SQUARE/static/img/profile_img/<s:property value='myInfomation.profile_img'/>" class="profileImgViewer" />
			</s:else>
		</a>
	</div>
</div>

<div class="bottomContentWrap">
<div id="content1">
		<div class="tab">
			<button class="tablinks active" onclick="openList(event,'infomation')">정보</button>
	        <button class="tablinks" onclick="openList(event,'myArticle')">작성게시물</button>
	        <button class="tablinks" onclick="openList(event,'myComment')">작성댓글</button>
	        <button class="tablinks" onclick="openList(event,'likeArticle')">담아둔게시물</button>
	        <button class="tablinks" onclick="openList(event,'myDot')">결제관리</button>
     	</div>
        
        <div id="infomation" class="tabcontent">
	        <h3>기본정보</h3>
	        <form action="modMyInfomation.action" method="post">
	        <input type="hidden" name="id" value=<s:property value="#session.logonID" /> />
	     	<table width="100%" style="margin-bottom: 30px;">
	     		<tr>
	     			<td class="tableText">
	     			이메일
	     			</td>
	     			<td class="tableValue">
	     			<input type="text" name="email" value='<s:property value="myInfomation.email" />' class="infoInput" />
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			이름
	     			</td>
	     			<td class="tableValue">
	     			<input type="text" name="name" value='<s:property value="myInfomation.name" />' class="infoInput" />
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			비밀번호
	     			</td>
	     			<td class="tableValue">
	     			
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			연락처
	     			</td>
	     			<td class="tableValue">
	     			<input type="text" name="phone_num"  value='<s:property value="myInfomation.phone_num" />' class="infoInput" />	
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			우편번호
	     			</td>
	     			<td class="tableValue">
	     			<input type="text" name="zipcode"  value='<s:property value="myInfomation.zipcode" />' class="infoInput" />	
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			상세주소
	     			</td>
	     			<td class="tableValue">
	     			<input type="text" name="address" value='<s:property value="myInfomation.address" />' class="infoInput" />	
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			계좌번호
	     			</td>
	     			<td class="tableValue">
	     			<input type="text" name="account" value='<s:property value="myInfomation.account" />' class="infoInput" />	
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			가입일
	     			</td>
	     			<td class="tableValue">
	     			<%-- <s:property value="myInfomation.reg_date" /> --%>
	     			<fmt:formatDate value="${myInfomation.reg_date }" pattern="yyyy년 MM월 dd일 hh:mm:ss" />
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			계정상태
	     			</td>
	     			<td class="tableValue">
	     			<s:if test="myInfomation.status == 0">
	     			<span class="green">정상</span>
	     			</s:if>
	     			<s:elseif test="myInfomation.status == 1">
	     			<span class="red">게시글 작성 금지</span>
	     			</s:elseif>
	     			</td>
	     		</tr>
	     		
	     	</table>
	     	<input type="submit" value="변경하기" class="infoSubmit" />
	     	</form>
     	</div>
     	<div id="myArticle" class="tabcontent">
	     	<h3>작성게시물</h3>
	     	<p>내가 작성한 게시물 <s:property value="myBoardSum" /> 개 <!-- 작성게시물 개수 --> <br><a href="myPage_myBoardList.action">목록보기 >></a>
     	</div>
     	<div id="myComment" class="tabcontent">
	     	<h3>작성댓글</h3>
	    	<p>내가 작성한 댓글 <s:property value="myCommentSum" /> 개 <!-- 작성댓글개수 --> <br><a href="myPage_myCommentList.action">목록보기 >></a>
    	</div>
    	<div id="likeArticle" class="tabcontent">
	     	<h3>담아둔게시물</h3>
	    	<p>내가 담아둔 게시물 <s:property value="myLikeSum" /> 개 <!-- 담아둔게시물개수 --> <br><a href="myPage_myLikedList.action">목록보기 >></a>
    	</div>
    	<div id="myDot" class="tabcontent">
    		<div class="dotContentWrap">
	     		<span class="dotText">DOT</span> <span class="dotValue"><s:property value="myInfomation.dot_sum"/></span>
	     	</div>
	     	<div class="dotButtonWrap">
		     	<input type="button" class="dotButtons" value="충전하기" onclick="javascript:openCharge();" />
		     	<input type="button" class="dotButtons" value="환전하기" onclick="javascript:openRecharge();" />
		     	<input type="button" class="dotButtons" value="충전 & 환전 내역" onclick="javascript:location.href='myDotPayForm.action?od=ch'" />
		     	<input type="button" class="dotButtons" value="사용내역" onclick="javascript:location.href='myDonationHistoryForm.action?od=give'" />
	     	</div>
    	</div>
    </div>
   </div> 
         
         
  

<%@ include file="/slice/footer.jsp" %>
<script>
var profileBack = document.getElementById('profileGray');
var profileDiv = document.getElementById('modprofile');
var chargeDiv = document.getElementById('chargeDOT');
var rechargeDiv = document.getElementById('rechargeDOT');
var howDot = document.getElementById('howDot');
var chargeWon = document.getElementById('chargeWon');
var rechargeInput = document.getElementById('rechargeInput');
var rechargeWon = document.getElementById('rechargeWon');

window.onload=function(){
   var basic = document.getElementById('infomation');
    
    basic.style.display = 'block';
	
}
$(document).ready(function(){
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
			reader.onload = function (e) { 
			//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
				$('#mainPic').attr('src', e.target.result);
				//이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				//(아래 코드에서 읽어들인 dataURL형식)
			}					
			reader.readAsDataURL(input.files[0]);
			//File내용을 읽어 dataURL형식의 문자열로 저장
		}
	}//readURL()--

	//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
	$("#ex_file1").change(function(){
		//alert(this.value); //선택한 이미지 경로 표시
		readURL(this);
	});
	
 });

function changeChageWon(){
	chargeWon.innerText = howDot.value * 100;
}

function rechargeCheck(){
	var mydot = <s:property value="myInfomation.dot_sum" />
	if(rechargeInput.value > mydot){
		alert('현재 보유량보다 환전액이 많습니다');
		rechargeInput.value='';
		rechargeInput.focus();
	}
	if(rechargeInput.value < 0){
		alert('0보다 작은수를 넣을 수 없습니다');
		rechargeInput.value='';
		rechargeInput.focus();
	}
	if(rechargeInput.value < 10 && rechargeInput.value != ""){
		alert('최소환전가능 DOT은 10입니다');
		rechargeInput.value='';
		rechargeInput.focus();
	}
	
	
	rechargeWon.innerText = rechargeInput.value * 100;
	
		
}
 
function openProfileMod(){
	profileBack.style.display = 'block';
	profileDiv.style.display = 'block';
}
function closeProfileMod(){
	profileBack.style.display = 'none';
	profileDiv.style.display = 'none';
}
function openCharge(){
	profileBack.style.display = 'block';
	chargeDiv.style.display = 'block';
}
function openRecharge(){
	profileBack.style.display = 'block';
	rechargeDiv.style.display = 'block';
	rechargeInput.focus();
}
function closeCharge(){
	profileBack.style.display = 'none';
	chargeDiv.style.display = 'none';
	rechargeDiv.style.display = 'none';
}

function openList(evt, listName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(listName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>
</body>
</html>