<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>�ۼ��� �۸�� ��ȸ</title>
<link rel="stylesheet" href="/SQUARE/static/css/css.css" type="text/css">
</head>
<body>
<table width="1000" border="0" cellspacing="0" cellpadding="2">
	<tr>
<td align="center"><strong><a href='memberArticles.action?board_author=
<s:property value="board_author"/>'><h2>�ۼ��� �� ���</h2></a></td>
	</tr>
</table>	
<table width="1000" border="0" cellspacing="0" cellpadding="2">
 <tr bgcolor="#F3F3F3">
	<td align="left" width="50"><strong><a href='memberArticles.action?board_author=
<s:property value="board_author"/>&currentPage=<s:property value="currentPage"/>'>��ü&nbsp;<font color='red'><s:property value="totalCount"/></font></a></strong></td>
	<td align="left"><s:a href="memberList.action"><strong>ȸ�����</strong></s:a></td>
</tr>
<tr bgcolor="#777777"><td height="1" colspan="8"></td></tr>

 <table width="1000" border="0" cellspacing="0" cellpadding="2">
 <tr align="center" bgcolor="#F3F3F3">
<td align="left" width="150"><strong>���ι�ȣ</strong></td>
<td width="100"><strong>�۹�ȣ&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
<td align="center" width="100"><strong>����</strong></td>
<td width="100"><strong>��ȸ��</strong></td>
<td width="100"><strong>�ۼ���</strong></td>
<td width="100"><strong>�Ű�Ƚ��</strong></td>
<td width="200"><strong>�ۻ���</strong></td>
<td width="200"><strong>����ε�</strong></td>

<s:iterator value="list" status="stat">
<tr>
<td><s:property value="line_num" /></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="board_num" /></td>
<td width="350">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href='viewAction.action?line_num=<s:property value="line_num" />&board_num=<s:property value="board_num" />'>
	<s:property value="board_subject" />
</a> 
</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="board_readcount" /></td>
<td width="250">&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${board_regdate}" pattern="yy-MM-dd HH:mm" /><s:property value="" /></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<s:if test="board_singo > 2"><font color='red'><s:property value="board_singo" /></font>
</s:if>
<s:if test="board_singo < 3"><s:property value="board_singo" />
</s:if>
</td>
<td>&nbsp;
<s:if test="board_status == 0"><font color='green'><strong>����ε� ������</strong></font>
</s:if>
<s:if test="board_status == 1"><font color='red'><strong>����ε� ������</strong></font>
</s:if>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<s:if test="board_status == 1">
<input name="list" type="button" value="����ε� ����" class="inputb" onClick=
"javascript:location.href='memberBlind.action?line_num=<s:property value="line_num"/>&currentPage=<s:property value="currentPage"/>&board_num=<s:property value="board_num" />&board_author=<s:property value="board_author"/>&blindOption=0'"/>
</s:if>

<s:if test="board_status == 0"></font>
<input name="list" type="button" value="����ε� ����" class="inputb" onClick=
"javascript:location.href='memberBlind.action?line_num=<s:property value="line_num"/>&currentPage=<s:property value="currentPage"/>&board_num=<s:property value="board_num" />&board_author=<s:property value="board_author"/>&blindOption=1'"/>
</s:if>

</td>
</td>
</s:iterator>

<s:if test="list.size() <= 0">
<tr bgcolor="#FFFFFF"  align="center">
<td align="center" colspan="8">��ϵ� ���� �����ϴ�.
</td>
</tr>
</s:if>						
<tr bgcolor="#777777">
<td height="1" colspan="8"></td>
</tr>
  <tr align="center" >
	<td colspan="8"><s:property value="pagingHtml" escape="false" /></td>
      </tr>
</table>
   </body>
</html>