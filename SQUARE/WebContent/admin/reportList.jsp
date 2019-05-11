<!-- 게시글에 '신고 하기' 버튼을 클릭하면  

<게시글의 '신고처리'를하면 DB에 저장된다. 그 저장된 디비를 가지고오면 끝>

1. 신고글 목록 조회
2. 신고글 검색 (아이디 & 제목)
3. 신고글 상세보기 
4. 게시글 블라인드 처리
-->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<link href="/SQUARE/static/css/adminBoard_common.css" rel="stylesheet" type="text/css">
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
<style type="text/css">
#AD_report{background-color: #12b9ff;color: white;}
</style>

</head>
<body style="margin:0;">
<%@ include file="/slice/searchBar.jsp" %>
<%@ include file="/slice/adminBoardBar.jsp" %>
<script>
function bigImg(x) {
    x.style.height = "76px";
    x.style.width = "92px";
}

function normalImg(x) {
    x.style.height = "38px";
    x.style.width = "48px";
}
</script>
<div class="event">

  	
  
	<table cellspacing="0" cellpadding="0">
	      	<tr>
      			<td class="tableSubject">신고번호</td>
      			<td class="tableSubject">게시글번호</td>
				<td class="tableSubject">신고자ID</td>
      	  	 	<td class="tableSubject">피신고자ID</td>
      	  	 	<td class="tableSubject">이유</td>
      	  	 	<td class="tableSubject">신고일자</td>
      	  	 	<td class="tableSubject">블라인드설정</td>
      	  	 	<td class="tableSubject">블라인드해제</td>
      	  	 	<td class="tableSubject">상태</td>
      	   	</tr>
      	      
      	
	      <s:iterator value="list" status="stat">
			
     	       <tr class="reportListTR">
        			<td><s:property value="singo_num" /></td>
        			<td><s:property value="board_num" /></td>
        			<td><s:property value="singo_reporter" /></td>
        			<td><s:property value="singo_badman" /></td>
        			<td>
        			<a href='viewAction.action?line_num=<s:property value="lineNumberList.get(#stat.index)" />&board_num=<s:property value="board_num" />&currentPage=1' class="singoArticleA">
        				<s:property value="singo_reason" />
        			</a>
        			</td>
        			<td><s:property value="singo_regdate" /></td>
        			<td> 
      	  		<input type="button" value="블라인드설정" class="inputb" onClick="javascript:location.href='reportBlind.action?board_num=<s:property value="board_num" />&currentPage=<s:property value="currentPage" />'">     
      	  		</td>
<%--       	  		<c:if test="${bresultClass.board_status >= 1}"><c:out value="0"/></c:if> --%>
      	  		<td>
      	  		<input type="button" value="블라인드해제" class="inputb" onClick="javascript:location.href='reportBlindCancel.action?board_num=<s:property value="board_num" />&currentPage=<s:property value="currentPage" />'">
      	  		</td>
      	  		
      	  		
      	  		<s:if test="%{list_b.get(#stat.index)>=2}">
      	  		<td class="blindStatus">
      	  		<span class="blindOK">블라인드</span>
      	  		</td>	
<%--       	  		<s:property value="list_b.get(#stat.index)"/> --%>
      	  		</s:if>
      	  		<s:elseif test="%{list_b.get(#stat.index)==1}">
      	  			<td class="blindStatus">
      	  			<span class="blindNO">정상</span>
      	  			 </td>
      	  		</s:elseif>
      	  		<s:else>
      	  			<td class="blindStatus">
      	  			<span class="blindCannot">[삭제된 게시글]</span>
      	  			 </td>
      	  		</s:else>
      	  		
<!--         			<tr align="right">  -->
<!--     	  		관리자임을 확인해 줄수 있음 -->
<%--  			 <s:if test ="${ session.userAdmin == '1' }">    --%>
<!--      	  		<td colspan="6">  -->
<%--      	  			<input type="button" value="블라인드처리" class="inputb" onClick="javascript:location.href='reportBlind.action?currentPage=<s:property value="currentPage" />'">  --%>
<!--     	  			</td>  -->
			<%--</s:if> --%> 
  	 	 		</tr>
  	 	 		
  	 	 		<td>
      	      
      	      
	      </s:iterator>
			
	      <s:if test="list.size() <= 0">
				
	     	 <tr bgcolor="F0FFFF"  align="center">
				<td colspan="9" style="padding: 11px;">등록된 신고가 없습니다.</td>
         	 </tr>						
	    		  <tr bgcolor="#777777">
      			<td height="1" colspan="9"></td>
    	    		  </tr>
    		
	      </s:if>
			
			<tr>
  			<td height="20"></td>
  			</tr>
			
	      <tr align="center">
    			<td colspan="9"><s:property value="pagingHtml"  escape="false" /></td>
    	  	  </tr>
    	  	  
    	  	  <tr>
  			<td height="10"></td>
  			</tr>
    	  	  
<!--     	  	<tr align="right"> -->
<!--     	  		관리자임을 확인해 줄수 있음 -->
<%-- 			<%-- <s:if test ="${ session.userAdmin == '1' }">  --%> 
<!--     	  			<td colspan="5"> -->
<%--     	  			<input type="button" value="라인추가" class="inputb" onClick="javascript:location.href='lineCreateForm.action?currentPage=<s:property value="currentPage" />'"> --%>
<!--     	  			</td> -->
<%-- 			<%--</s:if> --%> 
<!--     	 	 </tr> -->
    	 	 
    	 	 
    	 	 <tr align="center">
			<td colspan="9" style="padding: 20px;">
				<form>
					<select name="searchNum" class="selectBox">
						<option value="0">피신고자 ID</option>
						<option value="1">이유</option>
					</select>
					<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:120px; padding: 5px;" maxlength="20" />
					<input name="submit" type="submit" value="검색" class="inputb searchButton">
				</form>
			</td>
		</tr>
	</table> 
</div>
<%@ include file="/slice/footer.jsp" %>
</body>
</html>


























