 <%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml">
 <head>
 <title> ���� ���� ����Ʈ </title>
 
 <link rel="stylesheet" href="/SQUARE/static/css/css.css" type="text/css">
 
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
 </head>
 
 <body> 
 <table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="center"><s:a href="dotChargeList.action?listOption=3"><h2>���� ���� ����Ʈ</h2></s:a></td>
	</tr>
 </table>	
 <table width="1100" border="0" cellspacing="0" cellpadding="2">
 <tr bgcolor="#F3F3F3">				
 <td align="left" width="850">
 <form action="dotChargeList.action">
 <input type="hidden" name="listOption" value='<s:property value="listOption"/>'>
 <select name="searchNum" >
	<option value="1">���̵�</option>
 </select>
 <s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:80px" maxlength="20" />
	 <input name="submit" type="submit" value="�˻�" class="inputb">
 </form>
 </td>
 
 <td align="left" width="500" >
 <strong><s:a href="dotChargeList.action?listOption=3">&nbsp;&nbsp;��ü ����Ʈ&nbsp;</s:a><font color='black'><s:property value="dc_allCount"/></font></strong></td>
 
 <td align="left" width="300" >
 <strong><s:a href="dotChargeList.action?listOption=0">&nbsp;&nbsp;��û ����Ʈ&nbsp;<font color='red'></s:a><s:property value="dc_chargingCount"/></font></strong></td>
 
 <td align="left" width="200" >
 <strong><s:a href="dotChargeList.action?listOption=1">�Ϸ� ����Ʈ&nbsp;<font color='green'></s:a><s:property value="dc_chargedCount"/></font></strong></td>
 
 <td align="left" width="200" align="right">
 <a href="dotExchangeList.action"/><strong>ȯ�� ����Ʈ</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
 
 <td align="left" width="900" >
 <strong>�� ���� �Ϸᷮ: <font color='red'><s:property value="sumCharge"/></font> DOT</strong></td>
 
 <td><input name="list" type="button" value="�ϰ� ����" class="inputb" onClick="grantAll();"></input></td>
 </tr>
 
 <tr bgcolor="#777777">
 <td height="1" colspan="7"></td>
 </tr>
 
 <tr>
 <s:iterator value="list" status="stat">
 
 <td><strong><s:property value="%{#stat.index+1}"/></strong></td>
 <%--<td><strong><s:property value="dc_num" />�۹�ȣ</strong></td>--%>
 
 <td width="200"><strong>
 <a href='memberDetail.action?id=<s:property value="dc_id"/>'>���̵�:&nbsp;</strong><s:property value="dc_id" /></a></td>
 
 <td width="800"><strong>��û��¥:&nbsp;</strong><fmt:formatDate value="${dc_date}" pattern="yy-MM-dd HH:mm" /></td>
 
 <td width="800"><strong>���γ�¥:&nbsp;</strong><fmt:formatDate value="${dc_dated}" pattern="yy-MM-dd HH:mm" /></td>

 <td width="400"><strong>������:&nbsp;</strong><s:property value="dc_value" /> DOT</td>
 
 <td width="400">
 <s:if test="dc_status == 0"><font color='red'><strong>���� �����</strong></font></s:if>
 <s:if test="dc_status == 1"><font color='green'><strong>���� �Ϸ�</strong></font></s:if>
 </td>
 
   <s:if test="dc_status == 0">
 
 <td>
 <s:if test="searchKeyword == NULL">
 <input name="����1" type="button" value="����" class="inputb" 
 onClick="grant1('<s:property value="dc_id" />','<s:property value="dc_num" />','<s:property value="dc_value" />','<s:property value="currentPage" />','<s:property value="listOption" />');"></input>
 </s:if>

 <s:if test="searchKeyword != NULL">
 <input name="����2" type="button" value="����" class="inputb" 
 onClick="grant2('<s:property value="dc_id" />','<s:property value="dc_num" />','<s:property value="dc_value" />','<s:property value="currentPage" />','<s:property value="listOption" />','<s:property value="searchNum" />','<s:property value="searchKeyword" />');"></input>
 </s:if>
 </td>
  </s:if>
  
 <s:if test="searchKeyword != NULL">
 <td><input name="���2" input type="button" value="���" class="inputb" onClick=
 "javascript:location.href='grantingCharge.action?dc_id=<s:property value="dc_id" />&dc_num=<s:property value="dc_num" />&dc_value=<s:property value="dc_value" />&currentPage=<s:property value="currentPage" />&listOption=<s:property value="listOption" />&searchNum=<s:property value="searchNum" />&searchKeyword=<s:property value="searchKeyword" />&dc_status=0'"></td>
 </s:if>
 
 <s:if test="searchKeyword == NULL">
 <td><input name="���1" input type="button" value="���" class="inputb" onClick=
 "javascript:location.href='grantingCharge.action?dc_id=<s:property value="dc_id" />&dc_num=<s:property value="dc_num" />&dc_value=<s:property value="dc_value" />&currentPage=<s:property value="currentPage" />&listOption=<s:property value="listOption" />&dc_status=0'"></td>
 </s:if>
 </tr>
 
 <tr bgcolor="#777777">
 <td height="1" colspan="7"></td>
 </tr>
 
 </s:iterator>

 <s:if test="list.size() <= 0">
 <tr bgcolor="#FFFFFF"  align="center">
 <td colspan="7">���� ��û�� �����ϴ�.</td>
 </tr>	
					
 <tr bgcolor="#777777">
 <td height="1" colspan="7"></td>
 </tr>
 </s:if>
 <tr>
 <td height="3" colspan="7"></td>
 </tr>
 <tr align="center">
 <td colspan="6"><s:property value="pagingHtml" escape="false" /></td>
 </tr> 
 </table>
 </body>
 </html>