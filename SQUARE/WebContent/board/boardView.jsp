<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
<link rel="stylesheet" href="/SQUARE/static/css/boardView.css" type="text/css" />

<script>

widow.onload = function(){
	CKEDITOR.replace('b_content',{
		skin:'kama'
	});
}

function singoSubmit(){
	if(document.singoForm.singo_reason.value == ''){
		alert('신고사유가 공란입니다');
		document.singoForm.singo_reason.focus();
		return false;
	}
}

function commentSubmit(){
	if(document.commentForm.comment_content.value == ''){
		alert('댓글내용을 입력하세요');
		document.commentForm.comment_content.focus();
		return false;
	}
}

function recommentSubmit(){
	if(document.recommentForm.comment_content.value == ''){
		alert('댓글내용을 입력하세요');
		document.recommentForm.comment_content.focus();
		return false;
	}
}
</script>
<script src="/SQUARE/static/js/ckeditor/ckeditor.js"></script>
</head>
<body style="margin:0;">
<%@ include file="/slice/searchBar.jsp" %>
<!-- 신고폼 여기부터 -->
<div class="singoBackGround" id="singoBackGround" onclick="javascript:singoClose();"></div>
<div class="singoWrapper" id="singoWrapper">
      <form method="post" action="singoAction.action" onsubmit="return singoSubmit();" name="singoForm" >
        <input type="hidden" value="<s:property value="board_num"/>" name="board_num"/>
        <input type="hidden" value="<s:property value="resultClass.board_author"/>" name="board_author"/>
        <input type="hidden" value="<s:property value="line_num"/>" name="line_num" />
       <input type="hidden" value="<s:property value="currentPage"/>" name="currentPage"/>
        <!-- 세션아이디 --> 
      
         <span class="singoSubject">신고하기</span>
         <span class="singoText">* 허위신고는 사이트 이용에 불이익이 있을 수 있습니다</span>
        <table class="singoTable">
           <tr>
              <td class="singoTD1">신고자</td><td class="singoTD2"><s:property value="#session.logonID" /></td>
           </tr>
           <tr>
              <td class="singoTD1">신고대상자</td><td class="singoTD2"><s:property value="resultClass.board_author"/></td>
           </tr>
           <tr>
              <td class="singoTD1 singoReason">신고사유</td><td class="singoTD2">
                 <textarea name="singo_reason" class="singoTextarea"></textarea>
              </td>
           </tr>
         </table>
         <div class="singoButtonWrap">
            <input type="submit" class="singoSubmit" value="신고" />
            <input type="button" class="singoCancel" value="취소" onclick="javascript:singoClose();" />
         </div>
      </form>
   </div>
<!-- 신고폼 여기까지 -->
<!-- 리코맨트 폼 시작 -->
<div class="backgroundGray" id="backgroundGray" onclick="javascript:closeCommentForm();"></div>
<div class="recommentWrapper" id="recommentWrapper">
      <form action="writeComment.action" method="post" name="recommentForm" onsubmit="return recommentSubmit();">
         <input type="hidden" value="<s:property value="line_num"/>" name="line_num" />
           <input type="hidden" value="<s:property value="board_num"/>" name="board_num"/>
           <input type="hidden" value="<s:property value="currentPage"/>" name="currentPage"/>
           <input type="hidden" value="0" name="comment_ref" />
           <input type="hidden" value="0" name="comment_re_level" />
         <textarea class="commentInput" placeholder="당신이 던진 돌에 개구리는 죽을 수 있습니다" name="comment_content"></textarea>
         <input type="submit" class="commentSubmit" value="작성" />
      </form>
   </div>
<!-- 리코맨트 폼 종료 -->
<!-- 기부폼 시작 -->
<div class="donateBackGround" id="donateBackGround" onclick="javascript:donateClose();"></div>
<div class="donateWrapper" id="donateWrapper">
      <form method="post" action="donateAction.action">
         <input type="hidden" value="<s:property value="board_num"/>" name="board_num"/>
         <input type="hidden" value="<s:property value="resultClass.board_author"/>" name="board_author"/>
        <input type="hidden" value="<s:property value="line_num"/>" name="line_num" />
        <input type="hidden" value="<s:property value="board_num"/>" name="board_num"/>
        <input type="hidden" value="<s:property value="currentPage"/>" name="currentPage"/>
        <!-- 세션아이디 --> 
         
         <span class="donaSubject">기부하기</span>
         <span class="donaText">* 기부이후에 환불은 불가능합니다</span>
      
         
         <div class="selectWrap">
         <span class="mydonaText">기부할 DOT</span>
         <select name="donateQuantity" class="donaSelect">
            <option value="10">10 개</option>
            <option value="50">50 개</option>
            <option value="100">100 개</option>
         </select>
         </div>
         <input type="submit" value="기부하기" class="donateSubmit" />
      </form>
   </div>
<!-- 기부폼 끝 -->   

  
       <%--  <table cellspacing="0" cellpadding="2" border="1" width="800">
        <tr>
       	<th><s:property value="resultClass.board_num"/></th>
       	<th>[<s:property value="lineClass.line_subject"/>]</th>
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
        <td><font color="red">*</font>제목</td>
        <td colspan="7">
       <s:property value="resultClass.board_subject"/>
      	</td>
      	<td><strong> 작성자</strong></td>
      	<td colspan="2"><strong><s:property value="resultClass.board_author"/></strong>
      	</td>
        </tr> 
           <tr>
            <td colspan="10"  align="center">
            
            <!-- 업로드한게 없으면 안띄우기 -->
            <s:if test="resultClass.board_upload != null">
             <img src="/SQUARE/static/img/file_upload/${resultClass.board_upload }" width="500" height="300"/>
			</s:if> 
			 <s:property value="resultClass.board_content" escape="false" />       
          </td> 
        </tr> 
      <tr >
      <td colspan="10" align="center">좋아요<s:property value="resultClass.board_up"/><a href="boardUpAction.action?line_num=<s:property value="line_num"/>&board_num=<s:property value="board_num"/>&currentPage=<s:property value="currentPage"/>"><img src="/SQUARE/static/img/thumsup.png" width="20px" height="20px"/></a>
    
     &nbsp;&nbsp;
     <a href="boardDownAction.action?line_num=<s:property value="line_num"/>&board_num=<s:property value="board_num"/>&currentPage=<s:property value="currentPage"/>"><img src="/SQUARE/static/img/thumsdown.jpg" width="20px" height="20px"/></a><s:property value="resultClass.board_down"/>싫어요</td>
   
      </tr>
      <tr>  
      <td colspan="10" align="center">
		<input type="button" value="목록" onclick="javascript:location.href='listAction.action?line_num=<s:property value="line_num"/>&currentPage=<s:property value="currentPage"/>'"/>
		<s:if test="#session.logonID.equals(resultClass.board_author)" >
		<input type="button" value="수정" onclick="javascript:location.href='modifyForm.action?line_num=<s:property value="line_num"/>&board_num=<s:property value="board_num"/>&currentPage=<s:property value="currentPage"/>'"/>
		<input type="button" value="삭제" onclick="javascript:location.href='deleteAction.action?line_num=<s:property value="line_num"/>&board_num=<s:property value="board_num"/>'"/>
    	</s:if>
    	<input type="button" value="기부" onclick="javascript:donateOpen();" />
    	<input type="button" value="신고" onclick="javascript:singoOpen();" />
    	
		<form action="like_boardAction.action" method="post" id="like_board" >
			<input type="hidden" value="<s:property value="board_num"/>" name="board_num"/>
        	<input type="hidden" value="<s:property value="line_num"/>" name="line_num" />
       		<input type="hidden" value="<s:property value="currentPage"/>" name="currentPage"/>
			<input type="hidden" value="<s:property value="checkNumber"/>" name="checkNumber" />
		    
		    
		<s:if test="checkNumber == 1">
		<a href="#" onclick="javascript:document.getElementById('like_board').submit();"><img src="/SQUARE/static/img/star.png"/></a>
		</s:if>
		<s:else>
		<a href="#" onclick="javascript:document.getElementById('like_board').submit();"><img src="/SQUARE/static/img/emptystar.png"/></a>
		</s:else>
		</form>
	</td>
      </tr>
</table> --%>


<div class="contentWrap">
	<div class="contentHeaderWrap">
	<s:property value="lineClass.line_subject"/>
	</div>
	<div class="contentTopWrap">
		<div class="contentTopLeft">
			<span class="contentSubject"><s:property value="resultClass.board_subject"/></span><br>
			<span class="contentName"><s:property value="authorName" /></span>
			<span class="contentId">[<s:property value="resultClass.board_author"/>]</span>
		</div>
		<div class="contentTopRight">
			<span class="contentWritingInfo">
			<!-- 담아두기 시작 -->
    	<form action="like_boardAction.action" method="post" id="like_board" >
			<input type="hidden" value="<s:property value="board_num"/>" name="board_num"/>
        	<input type="hidden" value="<s:property value="line_num"/>" name="line_num" />
       		<input type="hidden" value="<s:property value="currentPage"/>" name="currentPage"/>
			<input type="hidden" value="<s:property value="checkNumber"/>" name="checkNumber" />
		    
		    
		<s:if test="checkNumber == 1">
		<a href="#" onclick="javascript:document.getElementById('like_board').submit();"><img src="/SQUARE/static/img/star.png"/></a>
		</s:if>
		<s:else>
		<a href="#" onclick="javascript:document.getElementById('like_board').submit();"><img src="/SQUARE/static/img/emptystar.png"/></a>
		</s:else>
		</form>
		<!-- 담아두기 끝 -->
			기부DOT <s:property value="resultClass.board_dot"/> | <s:property value="resultClass.board_regdate"/> | 조회 <s:property value="resultClass.board_readcount"/> | 신고 <s:property value="resultClass.board_singo"/>
			</span>
		</div>
	</div>
	<div class="contentCenterWrap">
		<s:if test="resultClass.board_status == 1">
			<s:if test="resultClass.board_upload != null">
				<img src="/SQUARE/static/img/file_upload/${resultClass.board_upload }" width="500" height="300"/><p/>
			</s:if>
			<s:property value="resultClass.board_content" escape="false" />
		</s:if>
		<s:elseif test="resultClass.board_status == 2">
			<div class="warningText">
				관리자에 의해 블라인드 처리된 글입니다
			</div>
		</s:elseif>
	</div>
	
	<!-- 블라인드아닌 정상글만 좋아요&싫어요 가능 -->
	<s:if test="resultClass.board_status == 1">
	<div class="contentBottomWrap">
		<div class="goodAndBadWrap">
			
			<div class="goodSummaryWrap">
				<span class="goodSumText">
				<s:property value="resultClass.board_up"/>
				</span>
			</div>
			<div class="goodDIV" onclick="location.href='boardUpAction.action?line_num=<s:property value="line_num"/>&board_num=<s:property value="board_num"/>&currentPage=<s:property value="currentPage"/>'">
				<img src="/SQUARE/static/img/boardup.png" class="GNBImg" />
				<span class="goodText">좋아요</span>
			</div>
			
			<div class="badDIV" onclick="location.href='boardDownAction.action?line_num=<s:property value="line_num"/>&board_num=<s:property value="board_num"/>&currentPage=<s:property value="currentPage"/>'">
				<img src="/SQUARE/static/img/boarddown.png" class="GNBImg" />
				<span class="badText">싫어요</span>
			</div>
			<div class="badSummaryWrap">
				<span class="badSumText">
				<s:property value="resultClass.board_down"/>
				</span>
			</div>
		</div>
	</div>
	</s:if>
	
	
	<div class="buttonsWrap">
		<input type="button" value="목록" onclick="javascript:location.href='listAction.action?line_num=<s:property value="line_num"/>&currentPage=<s:property value="currentPage"/>'" class="bottomButtons" />
		<s:if test="#session.logonID.equals(resultClass.board_author)" >
		<input type="button" value="수정" onclick="javascript:location.href='modifyForm.action?line_num=<s:property value="line_num"/>&board_num=<s:property value="board_num"/>&currentPage=<s:property value="currentPage"/>'" class="bottomButtons" />
		<input type="button" value="삭제" onclick="javascript:location.href='deleteAction.action?line_num=<s:property value="line_num"/>&board_num=<s:property value="board_num"/>'" class="bottomButtons" />
    	</s:if>
    	<s:if test="!#session.logonID.equals(resultClass.board_author)" >
	    	<s:if test="resultClass.board_status == 1">
	    	<input type="button" value="기부" onclick="javascript:donateOpen();" class="bottomButtons" />
	    	</s:if>
    	<input type="button" value="신고" onclick="javascript:singoOpen();" class="bottomButtons" />
    	</s:if>
    	
    	<%-- <!-- 담아두기 시작 -->
    	<form action="like_boardAction.action" method="post" id="like_board" >
			<input type="hidden" value="<s:property value="board_num"/>" name="board_num"/>
        	<input type="hidden" value="<s:property value="line_num"/>" name="line_num" />
       		<input type="hidden" value="<s:property value="currentPage"/>" name="currentPage"/>
			<input type="hidden" value="<s:property value="checkNumber"/>" name="checkNumber" />
		    
		    
		<s:if test="checkNumber == 1">
		<a href="#" onclick="javascript:document.getElementById('like_board').submit();"><img src="/SQUARE/static/img/star.png"/></a>
		</s:if>
		<s:else>
		<a href="#" onclick="javascript:document.getElementById('like_board').submit();"><img src="/SQUARE/static/img/emptystar.png"/></a>
		</s:else>
		</form>
		<!-- 담아두기 끝 --> --%>
	</div>
</div>


<!-- 여기서부터 내가쓴거 [시작] -->
<!-- 블라인드아닌 정상글만 댓글서비스 가능 -->
<s:if test="line_num == '581' && memberAuthority == 1">
<s:if test="resultClass.board_status == 1">
<div class="commentWrap">
	<span class="commentsSum">
		<s:property value="commentsList.size()" />
	</span>
	<span class="commentsSumText">개의 댓글이 있습니다.</span><br>
	<div class="inputWrapper">
		<form action="writeComment.action" method="post" name="commentForm" onsubmit="return commentSubmit();">
           <input type="hidden" value="<s:property value="line_num"/>" name="line_num" />
           <input type="hidden" value="<s:property value="board_num"/>" name="board_num"/>
           <input type="hidden" value="<s:property value="currentPage"/>" name="currentPage"/>
           <input type="hidden" value="0" name="comment_ref" />
           <input type="hidden" value="0" name="comment_re_level" />
         <textarea class="commentInput" placeholder="당신이 던진 돌에 개구리는 죽을 수 있습니다" name="comment_content"></textarea>
         <input type="submit" class="commentSubmit" value="작성" />
      </form>
   </div>
   <div class="listWrapper">
      <s:iterator value="commentsList" status="stat">
      
      <s:if test="comment_re_level == 0"><div class="commentContentWrapper"></s:if>
      
      <s:elseif test="comment_re_level != 0"><div class="commentContentWrapper recomment"></s:elseif>
      		<div class="commenterImgWrap">
      			<img src="/SQUARE/static/img/profile_img/<s:property value="commenterImg.get(#stat.index)" />" onerror="this.src='/SQUARE/static/img/basicProfile.png'" class="commenterProfileImg" />
      		</div>
      		<div class="commentWriter">
            <span class="commenterName">
            	<s:property value="commenterName.get(#stat.index)" />
            </span>
            <span class="commenterId">
            	[관리자]
            </span><br>
               <%-- <s:property value="comment_regdate" /> --%>
            <span class="comment_regDate">
               <s:property value="regtimeTextList.get(#stat.index)" />
            </span>
            </div>
            
            <!-- 코맨트상태가 정상이면 정상적으로 내용출력 -->
            <s:if test="comment_status == 0">
               <span class="commentContent">
                 <s:property value="comment_content" />
               </span>
            </s:if>
            <s:elseif test="comment_status == 1">
               <span class="deletedComments">삭제된 댓글입니다</span>
            </s:elseif>
            
            <!-- 삭제버튼 -->
            <s:if test="comment_status == 0">
            
           <%--  <s:if test="#session.logonID == comment_author">
	            <div class="deleteComment" onclick="javascript:deleteAction(<s:property value="comment_num" />,<s:property value="line_num"/>,<s:property value="board_num"/>,<s:property value="currentPage"/>);">
	               <img src="/SQUARE/static/img/delete.png" class="commentGoodImg" />
	            </div>
	        </s:if> --%>
	        <s:if test='%{#session.logonID.equals(resultClass.board_author) or #session.logonID.equals(comment_author)}'>
	            <div class="deleteComment" onclick="javascript:deleteAction(<s:property value="comment_num" />,<s:property value="line_num"/>,<s:property value="board_num"/>,<s:property value="currentPage"/>);">
	               <img src="/SQUARE/static/img/delete.png" class="commentGoodImg" />
	            </div>
	        </s:if> 
	        
	       
            </s:if>
            
            <!-- 조건부 리플버튼 -->
            <s:if test="comment_re_level == 0 && comment_status == 0">
              
               <div class="commentGood" onclick="javascript:openCommentForm(<s:property value="comment_ref" />);">
               <img src="/SQUARE/static/img/comment.png" class="commentGoodImg" />
               <span class="recommentSum"><s:property value="recommentSum.get(#stat.index)" /></span>
            </div>
            </s:if>
            
            <s:if test="comment_status == 0 ">
            <!-- 비추버튼 -->
            <div class="commentBad" onclick="javascript:downAction(<s:property value="comment_num" />,'세션값',<s:property value="line_num"/>,<s:property value="board_num"/>,<s:property value="currentPage"/>);">
               <img src="/SQUARE/static/img/down.png" class="commentBadImg" />
               <span class="badSum"><s:property value="comment_down" /></span>
            </div>
            
            <!-- 추천버튼 -->
            <div class="commentGood" onclick="javascript:upAction(<s:property value="comment_num" />,'세션값',<s:property value="line_num"/>,<s:property value="board_num"/>,<s:property value="currentPage"/>);">
               <img src="/SQUARE/static/img/up.png" class="commentGoodImg" />
               <span class="goodSum"><s:property value="comment_up" /></span>
            </div>
            </s:if>
         </div>
      
      </s:iterator>
   </div>

</div>
</s:if>
</s:if>

<s:elseif test="line_num == '581' && memberAuthority == 0 ">
<s:if test="resultClass.board_status == 1">
<div class="commentWrap">
	<span class="commentsSum">
		<s:property value="commentsList.size()" />
	</span>
	<span class="commentsSumText">개의 댓글이 있습니다.</span><br>
	
   <div class="listWrapper">
      <s:iterator value="commentsList" status="stat">
      
      <s:if test="comment_re_level == 0"><div class="commentContentWrapper"></s:if>
      
      <s:elseif test="comment_re_level != 0"><div class="commentContentWrapper recomment"></s:elseif>
      		<div class="commenterImgWrap">
      			<img src="/SQUARE/static/img/profile_img/<s:property value="commenterImg.get(#stat.index)" />" onerror="this.src='/SQUARE/static/img/basicProfile.png'" class="commenterProfileImg" />
      		</div>
      		<div class="commentWriter">
            <span class="commenterName">
            	<s:property value="commenterName.get(#stat.index)" />
            </span>
            <span class="commenterId">
            	[관리자]
            </span><br>
               <%-- <s:property value="comment_regdate" /> --%>
            <span class="comment_regDate">
               <s:property value="regtimeTextList.get(#stat.index)" />
            </span>
            </div>
            
            <!-- 코맨트상태가 정상이면 정상적으로 내용출력 -->
            <s:if test="comment_status == 0">
               <span class="commentContent">
                 <s:property value="comment_content" />
               </span>
            </s:if>
            <s:elseif test="comment_status == 1">
               <span class="deletedComments">삭제된 댓글입니다</span>
            </s:elseif>
            
            <!-- 삭제버튼 -->
            <s:if test="comment_status == 0">
            
           <%--  <s:if test="#session.logonID == comment_author">
	            <div class="deleteComment" onclick="javascript:deleteAction(<s:property value="comment_num" />,<s:property value="line_num"/>,<s:property value="board_num"/>,<s:property value="currentPage"/>);">
	               <img src="/SQUARE/static/img/delete.png" class="commentGoodImg" />
	            </div>
	        </s:if> --%>
	        <s:if test='%{#session.logonID.equals(resultClass.board_author) or #session.logonID.equals(comment_author)}'>
	            <div class="deleteComment" onclick="javascript:deleteAction(<s:property value="comment_num" />,<s:property value="line_num"/>,<s:property value="board_num"/>,<s:property value="currentPage"/>);">
	               <img src="/SQUARE/static/img/delete.png" class="commentGoodImg" />
	            </div>
	        </s:if> 
	        
	       
            </s:if>
            
            <!-- 조건부 리플버튼 -->
           
            
            <s:if test="comment_status == 0 ">
            <!-- 비추버튼 -->
            <div class="commentBad" onclick="javascript:downAction(<s:property value="comment_num" />,'세션값',<s:property value="line_num"/>,<s:property value="board_num"/>,<s:property value="currentPage"/>);">
               <img src="/SQUARE/static/img/down.png" class="commentBadImg" />
               <span class="badSum"><s:property value="comment_down" /></span>
            </div>
            
            <!-- 추천버튼 -->
            <div class="commentGood" onclick="javascript:upAction(<s:property value="comment_num" />,'세션값',<s:property value="line_num"/>,<s:property value="board_num"/>,<s:property value="currentPage"/>);">
               <img src="/SQUARE/static/img/up.png" class="commentGoodImg" />
               <span class="goodSum"><s:property value="comment_up" /></span>
            </div>
            </s:if>
         </div>
      
      </s:iterator>
   </div>

</div>

</s:if>
</s:elseif>


<s:else>
<s:if test="resultClass.board_status == 1">
<div class="commentWrap">
	<span class="commentsSum">
		<s:property value="commentsList.size()" />
	</span>
	<span class="commentsSumText">개의 댓글이 있습니다.</span><br>
	<div class="inputWrapper">
		<form action="writeComment.action" method="post" name="commentForm" onsubmit="return commentSubmit();">
           <input type="hidden" value="<s:property value="line_num"/>" name="line_num" />
           <input type="hidden" value="<s:property value="board_num"/>" name="board_num"/>
           <input type="hidden" value="<s:property value="currentPage"/>" name="currentPage"/>
           <input type="hidden" value="0" name="comment_ref" />
           <input type="hidden" value="0" name="comment_re_level" />
         <textarea class="commentInput" placeholder="당신이 던진 돌에 개구리는 죽을 수 있습니다" name="comment_content"></textarea>
         <input type="submit" class="commentSubmit" value="작성" />
      </form>
   </div>
   <div class="listWrapper">
      <s:iterator value="commentsList" status="stat">
      
      <s:if test="comment_re_level == 0"><div class="commentContentWrapper"></s:if>
      
      <s:elseif test="comment_re_level != 0"><div class="commentContentWrapper recomment"></s:elseif>
      		<div class="commenterImgWrap">
      			<img src="/SQUARE/static/img/profile_img/<s:property value="commenterImg.get(#stat.index)" />" onerror="this.src='/SQUARE/static/img/basicProfile.png'" class="commenterProfileImg" />
      		</div>
      		<div class="commentWriter">
            <span class="commenterName">
            	<s:property value="commenterName.get(#stat.index)" />
            </span>
            <span class="commenterId">
            	[<s:property value="comment_author" />]
            </span><br>
               <%-- <s:property value="comment_regdate" /> --%>
            <span class="comment_regDate">
               <s:property value="regtimeTextList.get(#stat.index)" />
            </span>
            </div>
            
            <!-- 코맨트상태가 정상이면 정상적으로 내용출력 -->
            <s:if test="comment_status == 0">
               <span class="commentContent">
                  <s:property value="comment_content" />
               </span>
            </s:if>
            <s:elseif test="comment_status == 1">
               <span class="deletedComments">삭제된 댓글입니다</span>
            </s:elseif>
            
            <!-- 삭제버튼 -->
            <s:if test="comment_status == 0">
            
           <%--  <s:if test="#session.logonID == comment_author">
	            <div class="deleteComment" onclick="javascript:deleteAction(<s:property value="comment_num" />,<s:property value="line_num"/>,<s:property value="board_num"/>,<s:property value="currentPage"/>);">
	               <img src="/SQUARE/static/img/delete.png" class="commentGoodImg" />
	            </div>
	        </s:if> --%>
	        <s:if test='%{#session.logonID.equals(resultClass.board_author) or #session.logonID.equals(comment_author)}'>
	            <div class="deleteComment" onclick="javascript:deleteAction(<s:property value="comment_num" />,<s:property value="line_num"/>,<s:property value="board_num"/>,<s:property value="currentPage"/>);">
	               <img src="/SQUARE/static/img/delete.png" class="commentGoodImg" />
	            </div>
	        </s:if> 
	        
	       
            </s:if>
            
            <!-- 조건부 리플버튼 -->
            <s:if test="comment_re_level == 0 && comment_status == 0">
              
               <div class="commentGood" onclick="javascript:openCommentForm(<s:property value="comment_ref" />);">
               <img src="/SQUARE/static/img/comment.png" class="commentGoodImg" />
               <span class="recommentSum"><s:property value="recommentSum.get(#stat.index)" /></span>
            </div>
            </s:if>
            
            <s:if test="comment_status == 0 ">
            <!-- 비추버튼 -->
            <div class="commentBad" onclick="javascript:downAction(<s:property value="comment_num" />,'세션값',<s:property value="line_num"/>,<s:property value="board_num"/>,<s:property value="currentPage"/>);">
               <img src="/SQUARE/static/img/down.png" class="commentBadImg" />
               <span class="badSum"><s:property value="comment_down" /></span>
            </div>
            
            <!-- 추천버튼 -->
            <div class="commentGood" onclick="javascript:upAction(<s:property value="comment_num" />,'세션값',<s:property value="line_num"/>,<s:property value="board_num"/>,<s:property value="currentPage"/>);">
               <img src="/SQUARE/static/img/up.png" class="commentGoodImg" />
               <span class="goodSum"><s:property value="comment_up" /></span>
            </div>
            </s:if>
         </div>
      
      </s:iterator>
   </div>

</div>
</s:if>
</s:else>

<script>
var donateBackGround = document.getElementById('donateBackGround');
var donateWrapper = document.getElementById('donateWrapper');
function donateOpen(){
   donateBackGround.style.display = 'block';
   donateWrapper.style.display = 'block';
}
function donateClose(){
   donateBackGround.style.display = 'none';
   donateWrapper.style.display = 'none';
}
var background = document.getElementById('backgroundGray');
var recommentForm = document.getElementById('recommentWrapper');

function openCommentForm(ref){
   background.style.display = 'block';
   recommentForm.style.display = 'block';
   document.recommentForm.comment_ref.value = ref;
   document.recommentForm.comment_content.focus();

}
function closeCommentForm(){
   background.style.display = 'none';
   recommentForm.style.display = 'none';
}
function upAction(comment_num,id,line_num,board_num,currentPage){
   location.href='commentUp.action?comment_num='+comment_num+'&id='+id+'&line_num='+line_num+'&board_num='+board_num+'&currentPage='+currentPage;
}

function downAction(comment_num,id,line_num,board_num,currentPage){
   location.href='commentDown.action?comment_num='+comment_num+'&id='+id+'&line_num='+line_num+'&board_num='+board_num+'&currentPage='+currentPage;
}

function deleteAction(comment_num,line_num,board_num,currentPage){
   location.href='deleteComment.action?comment_num='+comment_num+'&line_num='+line_num+'&board_num='+board_num+'&currentPage='+currentPage;
}
var singoBackground = document.getElementById('singoBackGround');
var singoForm = document.getElementById('singoWrapper');
function singoOpen(){
   singoBackground.style.display = 'block';
   singoForm.style.display = 'block';
}
function singoClose(){
   singoBackground.style.display = 'none';
   singoForm.style.display = 'none';
}
</script>
<%@ include file="/slice/footer.jsp" %>
</body>
</html>