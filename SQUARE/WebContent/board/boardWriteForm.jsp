<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
<script src="/SQUARE/static/js/ckeditor/ckeditor.js"></script>
<script>
window.onload = function() {
	CKEDITOR.replace('b_content',{
		skin:'kama'
	});
}
</script>
<style>
.ok{
background-color: #e3ecef;
    color: #40575f;
    border: 1px solid #a3c1cb;
    padding: 7px;
    width: 70px;}
 .no{
 background-color: white;
    color: #444;
    border: 1px solid #a3c1cb;
    padding: 7px;
    width: 70px;
    }
    .text1 {
 font-size: 14px;
 color :  #555;
 
}
.text2{
 font-size: 14px;
 color :  #555;
 
}

.text3 {
 font-size: 14px;
 color :  #555;
 
}
.text4{
 font-size: 14px;
 color :  #555;

}
.tableWrap {
    min-height: 700px;
}
#board_subject{
 width : 90%;
 padding : 5px;
 

}
</style>
</head>
<body style="margin:0;">

<%@ include file="/slice/searchBar.jsp" %>
		
		<form action="writeAction.action" method="post" enctype="multipart/form-data">
        <input type="hidden" value="<s:property value="line_num"/>" name="line_num" /> 
         <center>
         <div class="tableWrap">
         <table cellspacing="0" cellpadding="2"  width="800">
         <tr>
	         <td><span class="text1">필수입력사항</span></td>
	         <td><span class="text2">[<s:property value="lineClass.line_subject"/> 라인]</span></td>
      	 </tr>
      	 <tr>
             <td width="100" ><span class="text3">제목</span></td>
             <td width="100" >
            <s:textfield name="board_subject" theme="simple" value="%{resultClass.board_subject}"  maxlength="50"/>
             </td>
           </tr>
           <tr>
            <td colspan="2"  width="600">
             
              <s:textarea id="b_content" name="board_content" theme="simple" value="%{resultClass.board_content}">
            	<%-- <s:property value="resultClass.content" escape="false" /> --%>
            </s:textarea>
           
          </td>
         
        
        </tr>
      <tr>
      <td width="100">사진첨부</td>
      <td width="500"><input type="file" value="첨부파일" name="upload"/>
      
      </td>
      </tr>
    
      <tr>  
      <td colspan="10" align="center" style="padding: 40px;">
          
		<input type="submit" value="글작성" class="ok" />
		<input type="button" value="취소" class="no" onclick="javascript:location.href='listAction.action?line_num=<s:property value="line_num" /> '" />
      </td>
      </tr>


</table>
</div>
</center>
</form>
<%@ include file="/slice/footer.jsp" %>
</body>
</html>