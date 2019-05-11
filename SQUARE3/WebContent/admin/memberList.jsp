<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>SQUARE회원목록</title>
 <link rel="stylesheet" href="/SQUARE/static/css/css.css" type="text/css">
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2">
<tr>
 <td align="center"><img src="/SQUARE/static/img/logo.png" width="100px" /></td>
</tr>
<tr>
 <td align="center"><s:a href="memberList.action">회원목록</s:a></td>
</tr>
</table>	
<table width="600" border="0" cellspacing="0" cellpadding="2">
<tr bgcolor="#F3F3F3">				
<td align="left" width="5"><strong><s:a href="memberList.action">전체&nbsp;<font color='red'><s:property value="totalCount"/></font></s:a></strong></td>
<td align="right" width="400 "colspan="5">
 
 <form>
<select name="searchNum" >
	<option value="0">이름</option>
	<option value="1">아이디</option>
</select>
<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:100px" maxlength="20" />
	 <input name="submit" type="submit" value="검색" class="inputb">
 </form>
 
</td>
</tr>

<tr bgcolor="#777777"><td height="1" colspan="5"></td></tr>

<s:iterator value="list" status="stat">
 <s:url id="viewURL" action="memberDetail" >
	<s:param name="id"><s:property value="id" />
	</s:param>
	<s:param name="currentPage"><s:property value="currentPage" />
	</s:param>
 </s:url>
<tr>
<td width="200"><s:a href="%{viewURL}">아이디:<s:property value="id" /></s:a></td>
<td>
<img src="/SQUARE/static/img/profile_img/<s:property value="profile_img" />" width="50" height="50"/>
</td>
</tr>
<tr>
<td><s:a href="%{viewURL}">이름:<s:property value="name" /></s:a></td>
</tr>

<tr bgcolor="#777777"><td height="1" colspan="5"></td></tr>
</s:iterator>

<s:if test="list.size() <= 0">
<tr bgcolor="#FFFFFF"  align="center">
 <td colspan="7">등록된 회원이 없습니다.</td>
</tr>	
					
<tr bgcolor="#777777"><td height="1" colspan="5"></td></tr>

</s:if>
 <tr align="center">
	<td colspan="7"><s:property value="pagingHtml" escape="false" /></td>
 </tr>
</table>
</body>
</html>