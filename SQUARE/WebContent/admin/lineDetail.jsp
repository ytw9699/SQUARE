<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko"  xmlns="http://www.w3.org/1999/xhtml" >
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="/SQUARE/static/css/adminBoard_common.css" rel="stylesheet" type="text/css">
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
<head>
<title>SQUARE</title>
<style type="text/css">
#AD_line{background-color: #12b9ff; color: white; }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="margin:0;">
<%@ include file="/slice/searchBar.jsp" %>
<%@ include file="/slice/adminBoardBar.jsp" %>
	<div class="event">
	<table cellspacing="0" cellpadding="0">	
		<tr>
			<td class="tableSubject">라인 번호</td>
			<td class="tableSubject">라인 생성일자</td>
			<td class="tableSubject">라인 이름</td>
			<td class="tableSubject">라인 이미지</td>
		</tr>
		<tr>
			<td>
				<s:property value="%{resultClass.line_num}"/> 
			</td>
			<td>
				<s:property value="%{resultClass.line_regdate}"/> 
			</td>
			<td>
				<s:property value="%{resultClass.line_subject}"/>					 
			</td>
			<td>
				<img src="/SQUARE/static/img/line_img/<s:property value="%{resultClass.line_img}" />" width="150" height="150">				
			</td>
		</tr>
			<%-- <tr>
				<td>라인 번호</td>
			
				<td>
				&nbsp; <s:property value="%{resultClass.line_num}"/> 
				</td>
				
				<td>라인 생성일자</td>

				<td>
				&nbsp; <s:property value="%{resultClass.line_regdate}"/> 
				</td>
			</tr>
			
			<tr>
				<td>라인 이름</td>
				<td>
				&nbsp; <s:property value="%{resultClass.line_subject}"/>					 
				</td>
			</tr>		
		
			<tr>
				<td>라인 이미지</td>
			
				<td>
				&nbsp;	<img src="/SQUARE/static/img/line_img/<s:property value="%{resultClass.line_img}" />" width="150" height="150">				
				</td>
			</tr> --%>
		
		</table>
	
		<div class="lineDeatilButtonWrap">
			<input name="list" type="button" value="목록" class="inputb lineDetailButton" onClick="javascript:location.href='lineList.action?currentPage=<s:property value="currentPage" />'">
	<%-- 		<s:if test ="resultClass.Name == '${session.memberName }' || '${ session.userAdmin == '1' }'" > --%>
	  	  	<input name="list" type="button" value="수정" class="inputb lineDetailButton" onClick="javascript:location.href='lineModForm.action?line_num=<s:property value="resultClass.line_num" />&currentPage=<s:property value="currentPage" />'">
			<input name="list" type="button" value="삭제" class="inputb lineDetailButton" onClick="javascript:location.href='lineDelete.action?line_num=<s:property value="resultClass.line_num" />&currentPage=<s:property value="currentPage" />'">
<%-- 		</s:if> --%>
		</div>
		
</div>
<%@ include file="/slice/footer.jsp" %>
</body>
</html>






































