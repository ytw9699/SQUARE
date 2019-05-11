<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>라인 수정</title>
<style type="text/css">
a{
color: black;
}
.button{
    border: 3px solid #202f58;
    background-color : #202f58;
    display: inline-block;
    cursor: pointer;
    font-size: 13px;
    text-decoration: none;
    color: white;
 
}  
.top{
	background-color:#202f58;
	color: white;
}
</style>
</head>
<body>
	<body>
  	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
  		<tr>
  			<td align="center"><h2>라인 수정</h2>
  			<hr align="center" width="50%" size="1" color="gray">
  			</td>
  		</tr>
  	</table>
  

	<form action="lineModify.action" method="post" enctype="multipart/form-data" >
			<s:hidden name="line_num" value="%{resultClass.line_num}" />
			<s:hidden name="currentPage" value="%{currentPage}"/>
			
			
       <table width="700" border="0" cellspacing="0" cellpadding="0" align="center">
        
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		
        <tr>
          <td align="center" width="200" bgcolor="#202f58"><font color="white">라인 이름 </font></td>
          <td align="left" width="500" bgcolor="#FFFFFF">
           &nbsp; <s:textfield name="line_subject" theme="simple" value="%{resultClass.line_subject}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>
        
         <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
          <tr>
	<td align="center" width="100" bgcolor="#202f58"><font color="white">라인 이미지</font></td>
	<td align="left"> &nbsp; <s:file name="upload" theme="simple"/>
	<s:if test="%{resultClass.line_img!=null}"><br/>
	<small>사진이 등록되어있습니다. ${resultClass.line_img}</small>
	<s:hidden name="line_img" value="%{resultClass.line_img}"/>
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
          	<input class="button" type="submit" value="수정" >
            <input class="button" name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='lineList.action?currentPage=<s:property value="currentPage" />'">
          </td>
        </tr>

    </table>
    </form>
</body>
</html>

















