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
     	
     	<label for="ex_file1" class="profileButtons" id="profileSearch">�̹��� ã��</label>
     		<!-- <input type="file" id="ex_file1" /> -->
		<input type="file" name="upload" id="ex_file1" />
		<input type="submit" class="profileButtons" id="profileConfirm" value="Ȯ��" />
		<input type="button" class="profileButtons" value="�⺻�̹��� ����ϱ�" onclick="javascript:location.href='modMyDefaultImg.action'" />
		<input type="button" class="profileButtons" value="���" onclick="javascript:closeProfileMod();" />
	</form>
</div>
<div id="chargeDOT">

	<form action="chargeReq.action" method="post">
	<input type="hidden" name="dc_id" value="${myInfomation.id }" />
	<span class="chargeText">���� DOT</span>
	<select name="dc_value" id="howDot" onchange="changeChageWon();">
		<option>10</option>
		<option>30</option>
		<option>50</option>
		<option>100</option>
	</select><Br>
	<span class="chargeWon" id="chargeWon">1000</span><span class="chargeText">��</span>
	<input type="submit" class="chargeSubmit" value="Ȯ��" />
	<input type="button" class="chargeCancel" value="���" onclick="closeCharge();" />
	</form>
</div>
<div id="rechargeDOT">
	<form action="exchangeReq.action" method="post">
		<span class="chargeText">���� DOT</span> <span class="chargeWon"><s:property value="myInfomation.dot_sum" /></span>
		<br><span class="chargeText">ȯ������ DOT</span>
		<input type="hidden" name="de_id" value="${myInfomation.id }" /> 
		<input type="text" name="de_value" onblur="rechargeCheck();" id="rechargeInput" />
		<br><span class="chargeText">ȯ������ �ݾ�</span> <span id="rechargeWon" class="chargeWon">0</span><span class="chargeText">��</span>
		<input type="submit" class="chargeSubmit" value="Ȯ��" />
		<input type="button" class="chargeCancel" value="���" onclick="closeCharge();" />
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
			<button class="tablinks active" onclick="openList(event,'infomation')">����</button>
	        <button class="tablinks" onclick="openList(event,'myArticle')">�ۼ��Խù�</button>
	        <button class="tablinks" onclick="openList(event,'myComment')">�ۼ����</button>
	        <button class="tablinks" onclick="openList(event,'likeArticle')">��ƵаԽù�</button>
	        <button class="tablinks" onclick="openList(event,'myDot')">��������</button>
     	</div>
        
        <div id="infomation" class="tabcontent">
	        <h3>�⺻����</h3>
	        <form action="modMyInfomation.action" method="post">
	        <input type="hidden" name="id" value=<s:property value="#session.logonID" /> />
	     	<table width="100%" style="margin-bottom: 30px;">
	     		<tr>
	     			<td class="tableText">
	     			�̸���
	     			</td>
	     			<td class="tableValue">
	     			<input type="text" name="email" value='<s:property value="myInfomation.email" />' class="infoInput" />
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			�̸�
	     			</td>
	     			<td class="tableValue">
	     			<input type="text" name="name" value='<s:property value="myInfomation.name" />' class="infoInput" />
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			��й�ȣ
	     			</td>
	     			<td class="tableValue">
	     			
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			����ó
	     			</td>
	     			<td class="tableValue">
	     			<input type="text" name="phone_num"  value='<s:property value="myInfomation.phone_num" />' class="infoInput" />	
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			�����ȣ
	     			</td>
	     			<td class="tableValue">
	     			<input type="text" name="zipcode"  value='<s:property value="myInfomation.zipcode" />' class="infoInput" />	
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			���ּ�
	     			</td>
	     			<td class="tableValue">
	     			<input type="text" name="address" value='<s:property value="myInfomation.address" />' class="infoInput" />	
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			���¹�ȣ
	     			</td>
	     			<td class="tableValue">
	     			<input type="text" name="account" value='<s:property value="myInfomation.account" />' class="infoInput" />	
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			������
	     			</td>
	     			<td class="tableValue">
	     			<%-- <s:property value="myInfomation.reg_date" /> --%>
	     			<fmt:formatDate value="${myInfomation.reg_date }" pattern="yyyy�� MM�� dd�� hh:mm:ss" />
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			��������
	     			</td>
	     			<td class="tableValue">
	     			<s:if test="myInfomation.status == 0">
	     			<span class="green">����</span>
	     			</s:if>
	     			<s:elseif test="myInfomation.status == 1">
	     			<span class="red">�Խñ� �ۼ� ����</span>
	     			</s:elseif>
	     			</td>
	     		</tr>
	     		
	     	</table>
	     	<input type="submit" value="�����ϱ�" class="infoSubmit" />
	     	</form>
     	</div>
     	<div id="myArticle" class="tabcontent">
	     	<h3>�ۼ��Խù�</h3>
	     	<p>���� �ۼ��� �Խù� <s:property value="myBoardSum" /> �� <!-- �ۼ��Խù� ���� --> <br><a href="myPage_myBoardList.action">��Ϻ��� >></a>
     	</div>
     	<div id="myComment" class="tabcontent">
	     	<h3>�ۼ����</h3>
	    	<p>���� �ۼ��� ��� <s:property value="myCommentSum" /> �� <!-- �ۼ���۰��� --> <br><a href="myPage_myCommentList.action">��Ϻ��� >></a>
    	</div>
    	<div id="likeArticle" class="tabcontent">
	     	<h3>��ƵаԽù�</h3>
	    	<p>���� ��Ƶ� �Խù� <s:property value="myLikeSum" /> �� <!-- ��ƵаԽù����� --> <br><a href="myPage_myLikedList.action">��Ϻ��� >></a>
    	</div>
    	<div id="myDot" class="tabcontent">
    		<div class="dotContentWrap">
	     		<span class="dotText">DOT</span> <span class="dotValue"><s:property value="myInfomation.dot_sum"/></span>
	     	</div>
	     	<div class="dotButtonWrap">
		     	<input type="button" class="dotButtons" value="�����ϱ�" onclick="javascript:openCharge();" />
		     	<input type="button" class="dotButtons" value="ȯ���ϱ�" onclick="javascript:openRecharge();" />
		     	<input type="button" class="dotButtons" value="���� & ȯ�� ����" onclick="javascript:location.href='myDotPayForm.action?od=ch'" />
		     	<input type="button" class="dotButtons" value="��볻��" onclick="javascript:location.href='myDonationHistoryForm.action?od=give'" />
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
			var reader = new FileReader(); //������ �б� ���� FileReader��ü ����
			reader.onload = function (e) { 
			//���� �о���̱⸦ ���������� ȣ��Ǵ� �̺�Ʈ �ڵ鷯
				$('#mainPic').attr('src', e.target.result);
				//�̹��� Tag�� SRC�Ӽ��� �о���� File������ ����
				//(�Ʒ� �ڵ忡�� �о���� dataURL����)
			}					
			reader.readAsDataURL(input.files[0]);
			//File������ �о� dataURL������ ���ڿ��� ����
		}
	}//readURL()--

	//file ������� �̹����� ����(���� ����) �Ǿ����� ó���ϴ� �ڵ�
	$("#ex_file1").change(function(){
		//alert(this.value); //������ �̹��� ��� ǥ��
		readURL(this);
	});
	
 });

function changeChageWon(){
	chargeWon.innerText = howDot.value * 100;
}

function rechargeCheck(){
	var mydot = <s:property value="myInfomation.dot_sum" />
	if(rechargeInput.value > mydot){
		alert('���� ���������� ȯ������ �����ϴ�');
		rechargeInput.value='';
		rechargeInput.focus();
	}
	if(rechargeInput.value < 0){
		alert('0���� �������� ���� �� �����ϴ�');
		rechargeInput.value='';
		rechargeInput.focus();
	}
	if(rechargeInput.value < 10 && rechargeInput.value != ""){
		alert('�ּ�ȯ������ DOT�� 10�Դϴ�');
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