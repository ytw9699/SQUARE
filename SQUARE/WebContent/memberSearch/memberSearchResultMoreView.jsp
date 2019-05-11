<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
<link rel="stylesheet" href="/SQUARE/static/css/memberSearchResult.css" type="text/css" />
</head>
<body style="margin:0;">
<%@ include file="/slice/searchBar.jsp" %>

<div class="contentWrap"><%-- 
<s:if test="searchKind == 0"> --%>
	<span class="resultKeyword"><s:property value="key" /></span> <span class="resultTest">통합검색결과</span><br>
	
	<span class="resultKind">
		게시판(제목)
	</span>
	<%-- 
	<s:if test="boardSubjectList.size() == 0">
		<span class="nothingSearch">게시판 제목 검색결과가 없습니다!</span><br>
	</s:if>
	<s:else>
	--%>
	
		<s:iterator value="moreViewList" status="stat">
			<a href='viewAction.action?line_num=<s:property value="line_num" />&board_num=<s:property value="board_num" />&currentPage=1'><s:property value="board_subject" /></a> <br>
			<span class="resultSubtext"><s:property value="board_author" /> | <s:property value="lineName.get(#stat.index)" /> 라인 | 조회수 <s:property value="board_readcount" /> | 작성일 <s:property value="board_regdate" /></span>
		</s:iterator>
		
		<s:property value="pagingHtml" escape="false" />
		
		</div>
	<%-- 	
	</s:else>
	<span class="resultKind">
		게시판(내용)
		<s:if test="boardContentListsum > 9"><span class="moreViewSpan"><a href="">검색결과 더보기 (<s:property value="boardContentListsum" />건)</a></span></s:if>
	</span>
	<s:if test="boardContentList.size() == 0">
		<span class="nothingSearch">게시판 내용 검색결과가 없습니다!</span><br>
	</s:if>
	<s:else>
		<s:iterator value="boardContentList" status="stat">
		<a href=""><s:property value="board_subject" /></a> <br>
		<span class="resultSubtext"><s:property value="board_author" /> | <s:property value="boardContentLN.get(#stat.index)" /> 라인 | 조회수 <s:property value="board_readcount" /> | 작성일 <s:property value="board_regdate" /></span>
		</s:iterator>
	</s:else>
	<span class="resultKind">댓글(내용)</span>
	
	<s:if test="commentContentList.size() == 0">
		<span class="nothingSearch">댓글 검색결과가 없습니다!</span><br>
	</s:if>
	<s:else>
		<s:iterator value="commentContentList" status="stat">
			<a href=""><s:property value="comment_content" /></a> <br>
				<span class="resultSubtext"><s:property value="comment_author" /> | 작성일  <s:property value="comment_regdate" /></span>
		</s:iterator>
	</s:else>
</s:if>
<s:elseif test="searchKind == 1">
	<span class="resultKeyword"><s:property value="writeSearch" /></span> <span class="resultTest">작성자검색결과</span><br>
	<span class="resultKind">게시판(작성자)</span>
		<s:if test="boardWriterList.size() == 0">
			<span class="nothingSearch">게시판 작성자 검색결과가 없습니다!</span><br>
		</s:if>
		<s:else>
			<s:iterator value="boardWriterList" status="stat">
				<a href=""><s:property value="board_subject" /></a> <br>
				<span class="resultSubtext"><s:property value="board_author" /> | <s:property value="boardWriterLN.get(#stat.index)" /> 라인 | 조회수 <s:property value="board_readcount" /> | 작성일 <s:property value="board_regdate" /></span>
			</s:iterator>
		</s:else>
		<span class="resultKind">댓글(작성자)</span>
		<s:if test="commentWriterList.size() == 0">
			<span class="nothingSearch">댓글 작성자 검색이 없습니다!</span><br>
		</s:if>
		<s:else>
			<s:iterator value="commentWriterList" status="stat">
				<a href=""><s:property value="comment_content" /></a> <br>
				<span class="resultSubtext"><s:property value="comment_author" /> | 작성일  <s:property value="comment_regdate" /></span>
			</s:iterator>
		</s:else>
</s:elseif>

</div> --%>
<%@ include file="/slice/footer.jsp" %>
</body>
</html>