<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SQUARE</title>
<link rel="stylesheet" href="/SQUARE/static/css/adminMember_common.css" type="text/css" />
<link rel="stylesheet" href="/SQUARE/static/css/memberDetail.css" type="text/css" />
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
 <script language="JavaScript">
function check(){
	alert("�����Ǿ����ϴ�");
	return true;
}
</script>
<style>
#AD_member{
background-color: #12b9ff;
    color: white;
}
</style>
</head>
<body style="margin:0;">
<%@ include file="/slice/searchBar.jsp" %>
<%@ include file="/slice/adminMemberBar.jsp" %>

<div class="contentWrap">
<table cellspacing="0" cellpadding="0">
  <tr>
  	<td colspan="2">
  	<span class="contentSubject">�⺻����</span>
  	</td>
  </tr>
  <tr>
    <td class="contentName">���̵�</td>
    <td class="contentValue">
		<s:property value="resultClass.id" />
    </td>
  </tr>
  <tr>
    <td class="contentName">�̸�</td>
    <td class="contentValue">
    	<s:property value="resultClass.name" />
    </td>
  </tr>
  <tr>
    <td class="contentName">�ֹι�ȣ</td>
    <td class="contentValue">
		<s:property value="resultClass.jumin" />
    </td>
  </tr>
  <tr>
    <td class="contentName">�̸���</td>
    <td class="contentValue">
		<s:property value="resultClass.email" />
    </td>
  </tr>
  <tr>
    <td class="contentName">�ּ�</td>
    <td class="contentValue">
    	<s:property value="resultClass.address" />
    </td>
  </tr>
  <tr>
    <td class="contentName">�����ȣ </td>
    <td class="contentValue">
		<s:property value="resultClass.zipcode" />
    </td>
  </tr>
  <tr>
    <td class="contentName">���¹�ȣ</td>
    <td class="contentValue">
		<s:property value="resultClass.account" />
    </td>
  </tr>
  <tr>
    <td class="contentName">����ó</td>
    <td class="contentValue">
		<s:property value="resultClass.phone_num" />
    </td>
  </tr>
   <tr>
    <td class="contentName">������</td>
    <td class="contentValue">
    	<fmt:formatDate value="${resultClass.reg_date}" pattern="yy-MM-dd HH:mm" />
    </td>
  </tr>
  <tr>
  	<td colspan="2">
  	<span class="contentSubject">��������</span>
  	</td>
  </tr>
  <tr>
	  <td class="contentName">�� ���� DOT</td>
	  <td class="contentValue">
	  	<span class="accountText dotText">
	    <s:property value="resultClass.dot_sum" />
	    </span>
	    <input type="button" value="���� ����Ʈ" class="inputb" onclick="javascript:location.href='dotChargeList.action?searchKeyword=<s:property value="encodedID" />&listOption=3&searchNum=1'" />
	    <input type="button" value="ȯ�� ����Ʈ" class="inputb" onclick="javascript:location.href='dotExchangeList.action?searchKeyword=<s:property value="encodedID" />&listOption=3&searchNum=1'" />
	  </td>
  </tr>
<tr>
	  <td class="contentName">��������</td>
	  <td class="contentValue">

	<s:if test="resultClass.status == 0"><font color='green'><span class="accountText">���� ����</span></font>
	</s:if>
	<s:if test="resultClass.status == 1"><font color='orange'><span class="accountText">�Խñ� ����</span></font>
	</s:if>
	<s:if test="resultClass.status == 2"><font color='red'><span class="accountText">�α��� ����</span></font>
	</s:if>
	<input type="button" value="���� ���� �ϱ�" class="inputb" onclick="javascript:location.href='restoringMember.action?id=<s:property value="encodedID" />&currentPage=<s:property value="currentPage" />&status=0'" />
	
	<input type="button" value="�Խñ� ����" class="inputb" onclick="javascript:location.href='limitingBoard.action?id=<s:property value="encodedID" />&currentPage=<s:property value="currentPage" />&status=1'" />
	
	<input type="button" value="�α��� ����" class="inputb" onclick="javascript:location.href='limitingLogin.action?id=<s:property value="encodedID" />&currentPage=<s:property value="currentPage" />&status=2'" />
	</td>
	</tr>
     <tr>
	     <td class="contentName">ȸ��Ư�̻��� </td>
	     <td class="contentValue">
	      <form action="modMemberEx.action" onsubmit="return check()">
	       <s:if test="resultClass2.ex != NULL"> 
	       <input type="hidden" name="option" value="1" />
	       </s:if>
	      <input type="hidden" name="currentPage" value="<s:property value="currentPage" />" />
	      <input type="hidden" name="id" value="<s:property value="encodedID" />" />
	      
	      <input type="text" name="ex" placeholder="ȸ���� Ư�̻����� �����ּ���" value='<s:property value="resultClass2.ex" />' size="60" class="exInput" />
	      <input type="submit" size="5" value="����" class="inputb" />
	      </form>
      </td>
    </tr>
    <tr>
    	<td class="boardListTD">
    	<%-- <a href='memberArticles.action?board_author=<s:property value="encodedID" />&currentPage=<s:property value="currentPage" />'>
		�ۼ��� �� ���
		</a> --%>
		<input type="button" value="�ۼ��� �۸�� ��ȸ" class="inputb boardListButon" onclick="location.href='memberArticles.action?board_author=<s:property value="encodedID" />&currentPage=<s:property value="currentPage" />'" />
    	</td>
    </tr>
  </table>
  </div>
  <%@ include file="/slice/footer.jsp" %>
 </body>
</html>








