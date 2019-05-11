<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<link href="/SQUARE/static/css/adminBoard_common.css" rel="stylesheet" type="text/css">
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
<style type="text/css">
#AD_dot{background-color: #12b9ff; color: white;}
</style>
</head>
<body style="margin:0;">
<%@ include file="/slice/searchBar.jsp" %>
<%@ include file="/slice/adminPaymentBar.jsp" %>

<div class="event">
	
  	
  
	<table cellspacing="0" cellpadding="0">
	      	<tr class="tableSubjectTr">
      			<td class="tableSubject">기부번호</td>
      			<td class="tableSubject">기부금액</td>
				<td class="tableSubject">기부자</td>
      	  	 	<td class="tableSubject">수혜자</td>
      	  	 	<td class="tableSubject">기부일시</td>
      	  	 	<td class="tableSubject">게시글번호</td>
      	   	</tr>
      	      
      	 

	      <s:iterator value="list" status="stat">

<%-- 			<s:url id="viewURL" action="lineDetail" > --%>
<%-- 				<s:param name="line_num"> --%>
<%-- 					<s:property value="line_num" /> --%>
<%-- 				</s:param> --%>
<%-- 				<s:param name="currentPage"> --%>
<%-- 					<s:property value="currentPage" /> --%>
<%-- 				</s:param> --%>
<%-- 			</s:url> --%>
			
     	      <tr class="dotListTR">
        			<td><s:property value="dh_num" /></td>
        			<td><s:property value="dh_donation" /></td>
        			<td><s:property value="dh_from" /></td>
        			<td><s:property value="dh_to" /></td>
        			<td><s:property value="dh_date" /></td>
        			<td><s:property value="board_num" /></td>
      	      </tr>
      	      
	      </s:iterator>
			
	      <s:if test="list.size() <= 0">
				
	     	 <tr bgcolor="#FFFFFF"  align="center">
				<td colspan="6">등록된 기부 히스토리가 없습니다.</td>
         	 </tr>						
	    		  <tr bgcolor="#777777">
      			<td height="1" colspan="6"></td>
    	    		  </tr>
    		
	      </s:if>
			
	      <tr>
    			<td colspan="6"><s:property value="pagingHtml"  escape="false" /></td>
    	  	  </tr>
    	 	 
    	 	 <tr>
			<td colspan="6" style="padding: 20px;">
				<form>
					<select name="searchNum" class="selectBox">
						<option value="0">기부자이름</option>
						<option value="1">수혜자이름</option>
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

















