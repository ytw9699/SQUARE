<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SQUARE</title>
<link rel="stylesheet" href="/SQUARE/static/css/memberArticlesList.css" type="text/css" />
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
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
<%--  <tr>
	<td>
		<a href='memberArticles.action?board_author=<s:property value="board_author"/>&currentPage=<s:property value="currentPage"/>'>
		��ü<font color='red'><s:property value="totalCount"/></font>
		</a>
	</td>
	<td>
		<s:a href="memberList.action">ȸ�����</s:a>
	</td>
</tr> --%>
<tr>
	<td class="topTableSubjectTD">
	<span class="subjectText">�ۼ��� ��ϰԽù�</span>
	<span class="subjectSum"><s:property value="totalCount"/></span>
	<span class="subjectText">��</span>
	</td>
</tr>
</table>

<table class="bottomTable" cellspacing="0" cellpadding="0">
	<tr>
		<td class="bottomSubject">���ι�ȣ</td>
		<td class="bottomSubject">�۹�ȣ</td>
		<td class="bottomSubject">����</td>
		<td class="bottomSubject">��ȸ��</td>
		<td class="bottomSubject">�ۼ���</td>
		<td class="bottomSubject">�Ű�Ƚ��</td>
		<td class="bottomSubject">�ۻ���</td>
		<td class="bottomSubject">����ε�</td>
	</tr>
<s:iterator value="list" status="stat">
	<tr>
		<td><s:property value="line_num" /></td>
		<td><s:property value="board_num" /></td>
		<td class="bottomTableBS">
			<a href='viewAction.action?line_num=<s:property value="line_num" />&board_num=<s:property value="board_num" />&currentPage=1'>
				<s:property value="board_subject" />
			</a>
		</td>
		<td><s:property value="board_readcount" /></td>
		<td width="250">
			<fmt:formatDate value="${board_regdate}" pattern="yy-MM-dd HH:mm" /><s:property value="" />
		</td>
		<td>
			<s:if test="board_singo > 2"><font color='red'><s:property value="board_singo" /></font>
			</s:if>
			<s:if test="board_singo < 3"><s:property value="board_singo" />
			</s:if>
		</td>
		<td>
			<s:if test="board_status == 1"><font color='green'>����ε� ������</font>
			</s:if>
			<s:if test="board_status == 2"><font color='red'>����ε� ������</font>
			</s:if>
		</td>
		<td>
			<s:if test="board_status == 2">
			<input name="list" type="button" value="����ε� ����" class="inputb" onclick="javascript:location.href='memberBlind.action?line_num=<s:property value="line_num"/>&currentPage=<s:property value="currentPage"/>&board_num=<s:property value="board_num" />&board_author=<s:property value="board_author"/>&blindOption=1'"/>
			</s:if>
			
			<s:if test="board_status == 1">
			<input name="list" type="button" value="����ε� ����" class="inputb" onclick="javascript:location.href='memberBlind.action?line_num=<s:property value="line_num"/>&currentPage=<s:property value="currentPage"/>&board_num=<s:property value="board_num" />&board_author=<s:property value="board_author"/>&blindOption=2'"/>
			</s:if>
		</td>
	</tr>
</s:iterator>

	<s:if test="list.size() <= 0">
		<tr bgcolor="#FFFFFF"  align="center">
			<td align="center" colspan="8">��ϵ� ���� �����ϴ�.</td>
		</tr>
	</s:if>	
						
	<tr align="center" >
		<td colspan="8"><s:property value="pagingHtml" escape="false" /></td>
   </tr>
</table>
</div>
<%@ include file="/slice/footer.jsp" %>
</body>
</html>