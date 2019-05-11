<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수정폼</title>
</head>
<script src="/SQUARE/static/js/ckeditor/ckeditor.js"></script>
<script>
window.onload = function() {
	CKEDITOR.replace('b_content',{
		skin:'kama'
	});
}
</script>
<style>
.modiWrap{
   width : 876px;
   margin : 0 auto;
   margin-top : 40px;
   min-height: 700px;
}

.headerTopWrap{
   height : 80px;
   background-color : #dde4eb;
   padding : 10px;

}

.lineName{
 font-size : 14px;
 color : #555;
 margin-bottom : 8px;
}

.board_num{
  display : block;
  color : #555;
  font-size : 14px;
  margin-top: 10px;
}

.boardInfo{
 float : right;
 font-size : 14px;
 color : #555;
 margin-right: 15px;

}
.headerMiddleWrap{
 padding : 10px;
}
.boardSubject{
 font-size : 14px;
 
}

#board_subject{
 padding : 5px;
 width : 94%;
 

}
.buttonWrap {
    width: 20%;
    margin: 0 auto;
    margin-top: 40px;
}
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
    .deleteFile {
    display: block;
    font-size: 14px;
    color: #aeaeae;
    margin-top: 16px;
}
span.lastText {
    display: block;
    font-size: 15px;
    color: #aeaeae;
    margin-top: 20px;
    margin-bottom: 20px;
    text-align: center;
}
.lastImage {
    width: 200px;
    margin: 0 auto;
    margin-bottom: 16px;
}
img.lastImg {
    width: 100%;
}
.fileContentWrap {
    text-align: center;
}
</style>
<body>  
        <form action="modifyAction.action" method="post" enctype="multipart/form-data">
        <input type="hidden" value="<s:property value="line_num"/>" name="line_num" /> 
        <input type="hidden" value="<s:property  value="board_num"/>" name="board_num"/>
        <input type="hidden" value="<s:property value="currentPage"/>" name="currentPage"/>
		<input type="hidden" value="<s:property value="board_upload"/>" name="baord_upload"/>
		
		<div class="modiWrap">
       
       		<div class="headerTopWrap">
       		
       		<span class="lineName">
       		[<s:property value="lineClass.line_subject"/> 라인]
       		</span>
       		<span class="board_num">
       		글번호 <s:property value="resultClass.board_num"/>
       		</span>
       		<span class="boardInfo">
       		조회수 <s:property value="resultClass.board_readcount"/> | 등록날짜 <s:property value="resultClass.board_regdate"/> | DOT <s:property value="resultClass.board_dot"/> | 신고수 <s:property value="resultClass.board_singo"/> | 좋아요 <s:property value="resultClass.board_up"/> | 싫어요 <s:property value="resultClass.board_down"/>
       		</span>
       		
       		</div>
       		<div class="headerMiddleWrap">
       		<span class="boardSubject">
       		제목
       		</span>
       		<s:textfield name="board_subject" theme="simple" value="%{resultClass.board_subject}"  maxlength="50"/>
       		
       		</div>
       		<div class="contentWrap">
       			<s:textarea id="b_content" name="board_content" theme="simple" value="%{resultClass.board_content}">
          	<s:property value="resultClass.content" escape="false" />
        </s:textarea>
       		</div>
       		
			 <s:if test="resultClass.board_upload != null ">
			 <span class="lastText">기존 첨부 이미지</span>
			 <div class="lastImage"> 
        	<img src="/SQUARE/static/img/file_upload/${resultClass.board_upload }" class="lastImg" />
       		</div>
       
         
       
   
        </s:if>

       		<div class="fileContentWrap">
       			<input type="file" name="upload" theme="simple"/>
     			<span class="deleteFile">* 첨부사진을 수정하시면 기존 사진은 삭제됩니다. *</span>
       		</div>
       		<div class="buttonWrap">
       			<input type="submit" value="수정" class="ok" />
				<input type="button" value="취소" class="no" onclick="javascript:location.href='viewAction.action?line_num=<s:property value="line_num" />&board_num=<s:property value="board_num"/>' "/>
       		</div>
       
       </div>
		
<%-- <center>
         <table cellspacing="0" cellpadding="0" border="1">
 
  	   <tr>
       	<th><s:property value="resultClass.board_num"/></th>
       	<th><s:property value="lineClass.line_subject"/></th>
       	<th>조회 수</th>
       	<th><s:property value="resultClass.board_readcount"/></th>
       	<th>등록 날짜</th>
       	<th><s:property value="resultClass.board_regdate"/></th>
       	<th>Dot</th>
       	<th><s:property value="resultClass.board_dot"/></th>
       	<th>신고 수</th>
       	<th><s:property value="resultClass.board_singo"/></th>
       	<tr>
       </tr>
       <tr>
       	<td>글번호</td><td><s:property value="resultClass.board_num"/></td>
       	<td>조회수</td><td><s:property value="resultClass.board_readcount"/></td>
       	<td>등록날짜</td><td><s:property value="resultClass.board_regdate"/></td>
       	<td>DOT</td><td><s:property value="resultClass.board_dot"/></td>
       	<td>신고수</td><td><s:property value="resultClass.board_singo"/></td>
       	<td>좋아요</td><td><s:property value="resultClass.board_up"/></td>
       	<td>싫어요</td><td><s:property value="resultClass.board_down"/></td>
       </tr>
       
       
      
      
      	<tr>
        <td><span class="essential">*</span>제목</td>
        <td colspan="9">
        <s:textfield name="board_subject" theme="simple" value="%{resultClass.board_subject}" cssStyle="width:370px" maxlength="50"/>
        </td>
        </tr>
          
        <tr>
           	<td colspan="10">
           	 내용
           	</td>
        </tr>
           
        <tr>
        <td colspan="10">
        <s:textarea id="b_content" name="board_content" theme="simple" value="%{resultClass.board_content}">
          	<s:property value="resultClass.content" escape="false" />
        </s:textarea>
        </td>
  		</tr>
       
        <s:if test="resultClass.board_upload != null ">
        <tr><td colspan="10">기존 첨부 이미지</td></tr>
        
        <tr>
        <td colspan="10">
         <img src="/SQUARE/static/img/file_upload/${resultClass.board_upload }" width="500" height="300"/>"
        </td>
        </tr>
        </s:if>
        
      <tr>
      <td colspan="3">사진첨부</td>
      <td colspan="7">
     
      <input type="file" name="upload" theme="simple"/>
      * 첨부사진을 수정하시면 기존 사진은 삭제됩니다. *
      </td>
      </tr>
       
      <tr>  
      <td colspan="10" >
        <input type="submit" value="수정" />
		<input type="button" value="취소" onclick="javascript:location.href='viewAction.action?line_num=<s:property value="line_num" />&board_num=<s:property value="board_num"/>' "/>
      </td>
      </tr>


</table> --%>

</form>
</body>
</html>