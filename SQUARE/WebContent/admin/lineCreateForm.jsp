<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>라인 추가</title>
<link href="static/css/lineList.css" rel="stylesheet" style="text/css">
<style type="text/css">

a{
color: black;
text-decoration: none;
}
.event{
margin : 20px; 
line-height: 2.5em;
color: black;
text-align: center;
}
body  {
    background-image: url("/SQUARE/static/img/background.jpg");
    
}

</style>
<script>
function formSubmit(){
	if(document.lineMakingForm.line_subject.value == ''){
		alert('라인의 이름을 입력하세요');
		document.lineMakingForm.line_subject.focus();
		return false;
	}
}
</script>
</head>
<body>
<script>

</script>
<div class="event">
	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
 		<tr>
 			<td align="center"><h2>라인 추가</h2></td>
 		</tr>
 	</table>
 	
 	<s:if test="resultClass == NULL">
 		<form action="lineCreate.action" method="post" enctype="multipart/form-data" name="lineMakingForm" onsubmit="return formSubmit();">
	 </s:if>
 
 	<s:else>
 		<form action="lineModify.action" method="post" enctype="multipart/form-data" name="lineMakingForm" onsubmit="return formSubmit();">
 		<s:hidden name="line_num" value="%{resultClass.line_num}"/>
 		<s:hidden name="currentPage" value="%{currentPage}"/>
 	</s:else>
 	
 	<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
 		
 		<tr bgcolor="#777777">
 			<td height="1" colspan="2"></td>
 		</tr>
 		
 		<tr>
 			<td width="100" bgcolor="#F4F4F4"><font color="#FF0000"></font>라인이름</td>
          	<td width="500" bgcolor="#FFFFFF" align="left" >&nbsp;&nbsp;
            <s:textfield name="line_subject" theme="simple"  value="%{resultClass.line_subject}" cssStyle="width:370px" maxlength="50"/>
         	 </td>
 		</tr>
 		
 		<tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <tr>
          <td bgcolor="#F4F4F4" >라인 이미지</td>
          <td bgcolor="#FFFFFF" align="left">&nbsp;&nbsp;
            <s:file name="upload" theme="simple"/>
            
            <s:if test="resultClass.line_img != NULL">
		&nbsp; * <s:property value="resultClass.line_img" /> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
	</s:if>
						
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        <tr>
          <td height="10" colspan="2"></td>
        </tr>
        
        
        <tr>
          <td align="right" colspan="2">
          	<input name="submit" type="submit" value="작성완료" class="inputb"  >
            <input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='lineList.action?currentPage=<s:property value="currentPage" />'">
          </td>
        </tr>
 		
 	
 	</table>
</div>
</body>
</html>