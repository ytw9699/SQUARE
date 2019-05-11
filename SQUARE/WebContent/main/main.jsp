<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="/SQUARE/static/css/main.css" type="text/css" />
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />

</head>
<body>
<div id="load">
	<img src="/SQUARE/static/img/loading.gif" alt="loading">
</div>
<%@ include file="/slice/searchBar.jsp" %>
	<div class="topContentWrap">
	
	<s:iterator value="hotList" status="hotstat">
		

		<div class="view third-effect" >
		<img src="/SQUARE/static/img/line_img/<s:property value="line_img" />" class="hotImg" onerror="this.src='/SQUARE/static/img/basicProfile.png'" />
		
        <div class="mask" onclick="javascript:gotoHotLine(<s:property value="line_num" />);">
			<a href="#" class="info">Read More</a>
			<div class="hotTextWrap">
			<span class="hotLineText"><s:property value="line_subject" /></span>
			<span class="hotLineText">ㅡ</span>
			<span class="hotLineText">보드 <s:property value="hotSumList.get(#hotstat.index)" /> 개</span>
			</div>
		</div>
		</div>
		

		<%-- <div class="hotLineBox">
		
			<img src="/SQUARE/static/img/profile_img/test.png" class="hotimg" onmouseover="" />
			<a href="#" class="hotLineBoxAnchor"></a>
			<span class="hotLineText"><s:property value="line_subject" /></span>
			<span class="hotLineText">ㅡ</span>
			<span class="hotLineText">보드 <s:property value="hotSumList.get(#hotstat.index)" /> 개</span>
			
		</div> --%>
	
	</s:iterator>
	</div> 
	<div class="bottomContentWrap">
	<c:set var="indexing" value="0" />
		<s:iterator value="boardBoundingList" status="boundstat">
			<div class="lineBox">
				<%-- <strong><s:property value="mainList.get(#boundstat.index+8)" /></strong> --%>
				<%-- 라인번호는 <s:property value="mainList.get(#boundstat.index)" /><br> --%>
				<span class="lineBottomSubject" onclick="location.href='listAction.action?line_num=<s:property value="mainList.get(#boundstat.index+8)" />&currentPage=1'">
				<s:property value="nomalListName.get(#boundstat.index)" />
				</span>
				
				<s:iterator value="boardBoundingList.get(#boundstat.index)" status="substat" >
	
					<span class="boardBottomSubject">
						<a href='viewAction.action?line_num=<s:property value="line_num" />&board_num=<s:property value="board_num" />&currentPage=1' class="board_subject_a">
						<span class="jjumm">·</span> <s:property value="board_subject" /> 
						</a>
						<%-- <s:if test="%{boardCommentSumList.get(#substat.index) != 0}"> --%>
						<span class="commentSummary">
						<%-- (<s:property value="boardCommentSumList.get()" />) --%>
						<c:if test="${ requestScope.boardCommentSumList[indexing] != 0 }">
							(${ requestScope.boardCommentSumList[indexing] })
						</c:if>
						<c:set var="indexing" value="${indexing+1 }" />
						<%-- <s:property value="#boundstat.index" />
						<s:property value="#substat.index" /> --%>
						</span>
						<%-- </s:if> --%>
					</span>

				</s:iterator>
			</div>
		</s:iterator> 
	</div>
<%-- <p>현재 로그인된 아이디el: ${sessionScope.logonID }
<p>현재 로그인된 아이디s: <s:property value="#session.logonID" /> --%>

<script>
function gotoHotLine(line_num){
	location.href='listAction.action?line_num='+line_num;
}
function loading(){
	var loadingDIV = document.getElementById('load');
	loadingDIV.style.display = 'block';
}
</script>
<%@ include file="/slice/footer.jsp" %>
</body>
</html>