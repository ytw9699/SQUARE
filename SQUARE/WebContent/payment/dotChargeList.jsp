 <%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml">
 <head>
 <title>SQUARE</title>
 <link rel="stylesheet" href="/SQUARE/static/css/dotChargeList.css" type="text/css" />
  <link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
 <script language="JavaScript">

 function grantAll(var1,var2,var3,var4,var5){
	var result=confirm("���� �����Ͻðڽ��ϱ�?�ٽ� ����� �� �����ϴ�");//confirm�� true false����
	if(result){
 location.href="dotGrangtAll.action";
 alert("���� �Ǿ����ϴ�");
 }
 else{
 alert("��� �Ǿ����ϴ�");	
 }
 }
 function grant1(var1,var2,var3,var4,var5){
	var result=confirm("���� �����Ͻðڽ��ϱ�?�ٽ� ����� �� �����ϴ�");
	if(result){
 location.href="grantingCharge.action?dc_id="+var1+
		 	   "&dc_num="+var2+
	           "&dc_value="+var3+
	           "&currentPage="+var4+
	           "&listOption="+var5+
	           "&dc_status=1";
 alert("���� �Ǿ����ϴ�");
 }
 }
 function grant2(var1,var2,var3,var4,var5,var6,var7){
	var result=confirm("���� �����Ͻðڽ��ϱ�?�ٽ� ����� �� �����ϴ�");
	if(result){
		
 location.href="grantingCharge.action?dc_id="+var1+
			  "&dc_num="+var2+
	          "&dc_value="+var3+
	          "&currentPage="+var4+
	          "&listOption="+var5+
	          "&searchNum="+var6+
	          "&searchKeyword="+var7+
	          "&dc_status=1";
	          
 alert("���� �Ǿ����ϴ�");
 }
 }
 </script>
 <style>
 #AD_charge{
 background-color: #12b9ff;
    color: white;
 }
 </style>
 </head>
 
<body style="margin:0;">
<%@ include file="/slice/searchBar.jsp" %>
<%@ include file="/slice/adminPaymentBar.jsp" %>

<div class="contentWrap">
 <table cellspacing="0" cellpadding="0">
 <tr>				
	 <td>

	 <%-- <s:a href="dotChargeList.action?listOption=3">
	 ��ü ����Ʈ
	 </s:a><font color='black'><s:property value="dc_allCount"/></font></td>
	  --%>
	 <a href="dotChargeList.action?listOption=3" class="anchorButton">
		 ��ü����Ʈ
		 <span class="anchorSummary">
		 	<s:property value="dc_allCount"/>
		 </span>
	 </a>

	 <%-- <s:a href="dotChargeList.action?listOption=0">��û ����Ʈ<font color='red'></s:a><s:property value="dc_chargingCount"/></font></td> --%>
	 <a href="dotChargeList.action?listOption=0" class="anchorButton">
		 ��û ����Ʈ
		 <span class="anchorSummary">
		 	<s:property value="dc_chargingCount"/>
		 </span>
	 </a>
	
	 <%-- <s:a href="dotChargeList.action?listOption=1">�Ϸ� ����Ʈ<font color='green'></s:a><s:property value="dc_chargedCount"/></font></td> --%>
	 <a href="dotChargeList.action?listOption=1" class="anchorButton">
	  	�Ϸ� ����Ʈ
		 <span class="anchorSummary">
		 	<s:property value="dc_chargedCount"/>
		 </span>
	 </a>
 
	<%--  <td>
	 �� ���� �Ϸᷮ: <font color='red'><s:property value="sumCharge"/></font> DOT
	 </td>
	 
	 <td><input name="list" type="button" value="�ϰ� ����" class="inputb" onclick="grantAll();"></input></td> --%>
	 <div class="dc_searchWrap">
	 	 <form action="dotChargeList.action">
		 <input type="hidden" name="listOption" value='<s:property value="listOption"/>' />
		 <select name="searchNum" class="dc_selectBox">
			<option value="1">���̵�</option>
		 </select>
		 <%-- <s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:80px" maxlength="20" /> --%>
		 <input type="text" name="searchKeyword" class="dc_input" maxlength="20" />
			 <input name="submit" type="submit" value="�˻�" class="inputb dc_submit" />
		 </form>
	 </div>
	 </td>
	</tr>
</table>

 
<table class="bottomTable" cellpadding="0" cellspacing="0">
	<tr>
		<td class="bottomSubject">��û���̵�</td>
		<td class="bottomSubject">��û��¥</td>
		<td class="bottomSubject">���γ�¥</td>
		<td class="bottomSubject">������</td>
		<td class="bottomSubject" colspan="2">����</td>
	</tr>
 <s:iterator value="list" status="stat">
	<tr>
	 <td>
	 	<a href='memberDetail.action?id=<s:property value="dc_id"/>'><s:property value="dc_id" /></a>
	 </td>
	 <td>
	 	<fmt:formatDate value="${dc_date}" pattern="yy-MM-dd HH:mm" />
	 </td>
	 <td>
	 	<fmt:formatDate value="${dc_dated}" pattern="yy-MM-dd HH:mm" />
	 </td>
	 <td>
	 	<s:property value="dc_value" />
	 </td>
	 <td>
		 <s:if test="dc_status == 0"><font color='red'>���� �����</font></s:if>
		 <s:if test="dc_status == 1"><font color='green'>���� �Ϸ�</font></s:if>
	 
	 <s:if test="dc_status == 0">
	 	
		<s:if test="searchKeyword == NULL">
			<input name="����1" type="button" value="����" class="OKbutton" onclick="grant1('<s:property value="dc_id" />','<s:property value="dc_num" />','<s:property value="dc_value" />','<s:property value="currentPage" />','<s:property value="listOption" />');" />
		</s:if>
		<s:if test="searchKeyword != NULL">
			<input name="����2" type="button" value="����" class="OKbutton" onclick="grant2('<s:property value="dc_id" />','<s:property value="dc_num" />','<s:property value="dc_value" />','<s:property value="currentPage" />','<s:property value="listOption" />','<s:property value="searchNum" />','<s:property value="searchKeyword" />');" />
		</s:if>
	 	
	 </s:if>
  	</td>
	<%--  <s:if test="searchKeyword != NULL">
		 <td>
		 	<input name="���2" type="button" value="���" class="inputb" onclick="javascript:location.href='grantingCharge.action?dc_id=<s:property value="dc_id" />&dc_num=<s:property value="dc_num" />&dc_value=<s:property value="dc_value" />&currentPage=<s:property value="currentPage" />&listOption=<s:property value="listOption" />&searchNum=<s:property value="searchNum" />&searchKeyword=<s:property value="searchKeyword" />&dc_status=0'" />
		 </td>
	 </s:if>
 
	 <s:if test="searchKeyword == NULL">
	 	<td>
	 		<input name="���1" type="button" value="���" class="inputb" onclick="javascript:location.href='grantingCharge.action?dc_id=<s:property value="dc_id" />&dc_num=<s:property value="dc_num" />&dc_value=<s:property value="dc_value" />&currentPage=<s:property value="currentPage" />&listOption=<s:property value="listOption" />&dc_status=0'" />
	 	</td>
	 </s:if> --%>
	 </tr>
 
 </s:iterator>

	 <s:if test="list.size() <= 0">
		 <tr bgcolor="#FFFFFF"  align="center">
		 <td colspan="7">���� ��û�� �����ϴ�.</td>
		 </tr>
	 </s:if>
	 <tr align="center">
	 <td colspan="6"><s:property value="pagingHtml" escape="false" /></td>
	 </tr> 
 </table>
 </div>
 <%@ include file="/slice/footer.jsp" %>
 </body>
 </html>