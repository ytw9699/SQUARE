<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<link rel="stylesheet" href="/SQUARE/static/css/myList_common.css" type="text/css" />
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
</head>
<body style="margin:0;">
<%@ include file="/slice/searchBar.jsp" %>

<div class="contentWrap">

	<div class="contentHeader">
		<span class="contentSubject">댓글 활동</span>
		<span class="contentSum"><s:property value="myCommentSum" /></span>
		<span class="contentSumText">개</span>
	</div>

<table cellpadding="0" cellspacing="0" class="contentList">
	<tr>
		<td class="listHeader">댓글내용</td>
		<td class="listHeader">라인</td>
		<td class="listHeader">작성일</td>
		<td class="listHeader">좋아요</td>
	</tr>
	<s:iterator value="myCommentList" status="stat">
	
		<tr>
			<td class="content_subject">
				<a href="viewAction.action?line_num=<s:property value="line_num" />&board_num=<s:property value="board_num" />&currentPage=1" class="contentLink">
					<s:property value="comment_content" />
				</a>
			</td>
			<td class="content_other"><s:property value="lineNameList.get(#stat.index)" /> 라인</td>
			<td class="content_other"><s:property value="comment_regdate" /></td>
			<td class="content_other"><s:property value="comment_up" /></td>
		</tr>
		
	</s:iterator>

</table>

<div class="pagingWrap">
	<s:property value="pagingHtml" escape="false" />
</div>
</div>
<%@ include file="/slice/footer.jsp" %>
</body>
</html>