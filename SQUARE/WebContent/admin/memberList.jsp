<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>SQUARE</title>
 <link rel="stylesheet" href="/SQUARE/static/css/adminMember_common.css" type="text/css" />
 <link rel="stylesheet" href="/SQUARE/static/css/adminMember_memberList.css" type="text/css" /> 
 
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

<div class="contentWrapper">
	<table  cellspacing="0" cellpadding="2">
		<tr bgcolor="#F3F3F3" style="height: 50px;">				
			<td>
			<span class="totalText">전체</span>
			<span class="totalSumText"><s:property value="totalCount"/></span>
			</td>
			<td colspan="5">
			
			<div class="memberSearchBox" >
				<form>
				<select name="searchNum" class="searchSelectBox" >
					<option value="0">이름</option>
					<option value="1">아이디</option>
				</select>
				<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:100px" maxlength="20" />
				<input name="submit" type="submit" value="검색" class="inputb memberSearchSubmit" />
				</form>
			</div>
			</td>
		</tr>
</table>
<div class="infoWrap">
	<s:iterator value="list" status="stat">
	<div class="memberInfoWrap" onclick="location.href='memberDetail.action?id=<s:property value='id' />&currentPage=<s:property value='currentPage' />'" >
		<div class="memberProfile">
			<%-- <s:property value="profile_img" /> --%>
			<!-- <img src="/SQUARE/static/img/basicProfile.png" class="memberImage" /> -->
			<img src="/SQUARE/static/img/profile_img/<s:property value="profile_img" />" class="memberImage" onerror="this.src='/SQUARE/static/img/basicProfile.png'" />
		</div>
		<div class="memberInfo">
			<span class="memberName"><s:property value="name" /></span> <br/>
			<span class="memberId"><s:property value="id" /></span>
		</div>
	</div>
	</s:iterator>
</div>

<%-- <tr bgcolor="#777777"><td height="1" colspan="5"></td></tr>

<s:iterator value="list" status="stat">
 <s:url id="viewURL" action="memberDetail" >
	<s:param name="id"><s:property value="id" />
	</s:param>
	<s:param name="currentPage"><s:property value="currentPage" />
	</s:param>
 </s:url>
<tr>
<td width="200"><s:a href="%{viewURL}">아이디:<s:property value="id" /></s:a></td>
</tr>

<tr>
<td><s:a href="%{viewURL}">이름:<s:property value="name" /></s:a></td>
</tr>

<tr bgcolor="#777777"><td height="1" colspan="5"></td></tr>
</s:iterator> --%>

<s:if test="list.size() <= 0">

<div class="thereIsNoMemeber">
등록된 회원이 없습니다.
</div>

					
<tr bgcolor="#777777"><td height="1" colspan="5"></td></tr>

</s:if>

	<div class="pagingWrap">
		<s:property value="pagingHtml" escape="false" />
	</div>

</div>
<%@ include file="/slice/footer.jsp" %>
</body>
</html>