<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<link href="/SQUARE/static/css/adminBoard_common.css" rel="stylesheet" type="text/css">
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
<style type="text/css">
#AD_line{background-color: #12b9ff; color: white; }
</style>

</head>
<body style="margin:0;">
<%@ include file="/slice/searchBar.jsp" %>
<%@ include file="/slice/adminBoardBar.jsp" %>


<script>
function bigImg(x) {
    x.style.height = "76px";
    x.style.width = "76px";
}

function normalImg(x) {
    x.style.height = "38px";
    x.style.width = "38px";
}

// var myWindow;
// function lineAdd() {
//    myWindow=  window.open("http://localhost:8080/SQUARE/lineCreateForm.action",'','width=700,height=400');
// }

// function closeAdd(){
// 	if(myWindow){
// 	myWindow.close();
// 	}
//}
</script>

<!-- 현재 myWindo -->

<div class="event">
	
  	
  
	<table cellpadding="0" cellspacing="0">
	      	<tr>
      			<td class="tableSubject">번호</td>
      			<td class="tableSubject">라인사진</td>
				<td class="tableSubject">라인이름</td>
      	  	 	<td class="tableSubject">생성일자</td>
      	   	</tr>
      	      
      	   
	
	 			
	      <s:iterator value="list" status="stat">

			<s:url id="viewURL" action="lineDetail" >
				<s:param name="line_num">
					<s:property value="line_num" />
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>
			
     	      <tr>
        			<td><s:property value="line_num" /></td>
        			
        			<td><img onmouseover="bigImg(this)" onmouseout="normalImg(this)" src="/SQUARE/static/img/line_img/<s:property value="line_img" />"  width="38" height="38"></td>
<%--         			<td style="border-bottom: 1px solid #666;"><s:property value="line_img" /></td> --%>
        			<%-- <td class="lineListTD" onclick="location.href='<s:property value="%{viewURL}" />'"> --%>
        			<td class="lineListTD" onclick="location.href='lineDetail.action?currentPage=<s:property value="currentPage" />&line_num=<s:property value="line_num" />'">
        			
        			<%-- <s:a href="lineDetail.action?currentPage=<s:property value="currentPage" />&line_num=<s:property value="line_num" />">
        			</s:a> --%>
        			<s:property value="line_subject" />
        			
        			</td>
        			<td><s:property value="line_regdate" /></td>
        			
      	      </tr>
      	      
	      </s:iterator>
			
	      <s:if test="list.size() <= 0">
				
	     	 <tr>
				<td colspan="5">등록된 라인이 없습니다.</td>
         	 </tr>						
	    		  <tr>
      			<td height="1" colspan="5"></td>
    	    		  </tr>
    		
	      </s:if>
			
			<tr>
  			<td height="10"></td>
  		</tr>
			
			<tr align="right">
    	  		<!-- 관리자임을 확인해 줄수 있음 -->
			<%-- <s:if test ="${ session.userAdmin == '1' }">  --%>
    	  			<td colspan="5" style="padding: 15px;">
    	  			<input type="button" value="라인추가" class="inputb lineAdd" onClick="javascript:location.href='lineCreateForm.action?currentPage=<s:property value="currentPage" />'">
<!--     	  			<input type="button" value="라인추가" class="inputb" onClick="lineAdd()"> -->
    	  			</td>
			<%--</s:if> --%>
    	 	 </tr>
		
			
	      <tr align="center">
    			<td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
    	  	  </tr>
    	  	  
    	  	
    	 	 
    	 	 
    	 	 <tr align="center">
			<td colspan="5" style="padding: 15px;">
				<form method="post">
					<select name="searchNum" class="selectBox">
						<option value="0">라인이름</option>
						<option value="1">라인번호</option>
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





















