<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 
 <title>환전 통합 리스트</title>
 <link rel="stylesheet" href="/SQUARE/static/css/css.css" type="text/css">
 <script language="JavaScript">

 function grantAll(var1,var2,var3,var4,var5){
	var result=confirm("정말 승인하시겠습니까?다시 취소할 수 없습니다");
	if(result){
 
 location.href="dotExGrangtAll.action";
 alert("승인되었습니다");
 }
 else{
 alert("취소되었습니다");	
 }
 }
 
 function grant1(var1,var2,var3,var4,var5){
	var result=confirm("정말 승인하시겠습니까?다시 취소할 수 없습니다");
	if(result){
		 
 location.href="grantingExchange.action?de_id="+var1+
			  "&de_num="+var2+
	          "&de_value="+var3+
	          "&currentPage="+var4+
	          "&listOption="+var5+
	          "&de_status=1";
	          
 alert("승인되었습니다");
 }
 }
 
 function grant2(var1,var2,var3,var4,var5,var6,var7){
	var result=confirm("정말 승인하시겠습니까?다시 취소할 수 없습니다");//confirm이 true false리턴
	if(result){
		
 location.href="grantingExchange.action?de_id="+var1+
			  "&de_num="+var2+
	          "&de_value="+var3+
	          "&currentPage="+var4+
	          "&listOption="+var5+
	          "&searchNum="+var6+
	          "&searchKeyword="+var7+
	          "&de_status=1";
	          
 alert("승인되었습니다");
 }
 } 
 </script>
 </head>
 <body>
 
 <table width="600" border="0" cellspacing="0" cellpadding="2">
    <tr>
	<td align="center"><s:a href="dotExchangeList.action?listOption=3"><h2>환전 통합  리스트</h2></s:a></td>
	</tr>
</table>
	
<table width="1100" border="0" cellspacing="0" cellpadding="2">
<tr bgcolor="#F3F3F3">				
<td align="left" width="800" >

<form action="dotExchangeList.action">
 <input type="hidden" name="listOption" value='<s:property value="listOption"/>'>
<select name="searchNum" >
	<option value="1">아이디</option>
</select>
<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:80px" maxlength="20" />
	 <input name="submit" type="submit" value="검색" class="inputb">
</form>
</td>

<td align="left" width="500">
<strong><s:a href="dotExchangeList.action?listOption=3">&nbsp;&nbsp;전체 리스트&nbsp;</s:a><font color='black'><s:property value="de_allCount"/></font></strong></td>

<td align="left" width="300">
<strong><s:a href="dotExchangeList.action?listOption=0">요청 리스트&nbsp;<font color='red'></s:a><s:property value="de_exchangingCount"/></font></strong></td>

<td align="left" width="200">
<strong><s:a href="dotExchangeList.action?listOption=1">완료 리스트&nbsp;<font color='green'></s:a><s:property value="de_exchangedCount"/></font></strong></td>

<td align="left" width="200">
<a href="dotChargeList.action"/><strong>충전 리스트</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;</td>

<td align="left" width="800">
<strong>총 환전 완료량: <font color='red'><s:property value="sumExchange"/></font> DOT</strong></td>

<td><input name="list" type="button" value="일괄승인" class="inputb" onClick="grantAll();"></input></td>
</tr>

<tr bgcolor="#777777">
 <td height="1" colspan="7"></td>
</tr>
<s:iterator value="list" status="stat">
<tr>
<%--<td width="200"><strong>글번호<s:property value="de_num" /></strong></td>--%>
<td width="200">
<strong><s:property value="%{#stat.index+1}"/></strong></td>

<td width="200">
<strong><a href='memberDetail.action?id=<s:property value="de_id"/>'>아이디:&nbsp;</strong><s:property value="de_id" /></a></td>

<td width="800">
<strong>요청날짜:&nbsp;</strong><fmt:formatDate value="${de_date}" pattern="yy-MM-dd HH:mm" /></td>

<td width="800">
<strong>승인날짜:&nbsp;</strong><fmt:formatDate value="${de_dated}" pattern="yy-MM-dd HH:mm" /></td>

<td width="500">
<strong>환전량: </strong><s:property value="de_value" /> DOT</td>

<td width="400">
<s:if test="de_status == 0"><font color='red'><strong> 환전 대기중</font></strong></s:if>

<s:if test="de_status == 1"><font color='green'><strong>환전 완료</font></strong></s:if>
</td>

<s:if test="de_status == 0">

<td><s:if test="searchKeyword == NULL">
<input name="승인1" type="button" value="승인" class="inputb" 
onClick="grant1('<s:property value="de_id" />','<s:property value="de_num" />','<s:property value="de_value" />','<s:property value="currentPage" />','<s:property value="listOption" />');"></input>
</s:if>
<s:if test="searchKeyword != NULL">
<input name="승인2" type="button" value="승인" class="inputb" 
onClick="grant2('<s:property value="de_id" />','<s:property value="de_num" />','<s:property value="de_value" />','<s:property value="currentPage" />','<s:property value="listOption" />','<s:property value="searchNum" />','<s:property value="searchKeyword" />');"></input>

</s:if>
</td>   
</s:if>

<s:if test="searchKeyword != NULL">
<td><input name="취소2" type="button" value="취소" class="inputb" onClick=
"javascript:location.href='grantingExchange.action?de_id=<s:property value="de_id" />&de_num=<s:property value="de_num" />&de_value=<s:property value="de_value" />&currentPage=<s:property value="currentPage" />&listOption=<s:property value="listOption" />&searchNum=<s:property value="searchNum" />&searchKeyword=<s:property value="searchKeyword" />&de_status=0'"></td>
</s:if>

<s:if test="searchKeyword == NULL">
<td><input name="취소1" type="button" value="취소" class="inputb" onClick=
"javascript:location.href='grantingExchange.action?de_id=<s:property value="de_id" />&de_num=<s:property value="de_num" />&de_value=<s:property value="de_value" />&currentPage=<s:property value="currentPage" />&listOption=<s:property value="listOption" />&de_status=0'"></td>
</s:if>
</tr>	
<tr bgcolor="#777777"><td height="1" colspan="7"></td></tr>
</s:iterator>	

<s:if test="list.size() <= 0">
<tr bgcolor="#FFFFFF"  align="center"><td colspan="7">환전 요청이 없습니다.</td></tr>	
					
<tr bgcolor="#777777"><td height="1" colspan="5"></td></tr>

</s:if>
 <tr align="center">
	<td colspan="7"><s:property value="pagingHtml" escape="false" /></td>
 </tr>
 
</table>
</body>
</html>