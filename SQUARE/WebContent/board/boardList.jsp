<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
<link rel="stylesheet" href="/SQUARE/static/css/boardList.css" type="text/css" />
<title>SQUARE</title>
<script>
window.onload=function(){
	   var basic = document.getElementById('goodBoard');
	   basic.style.display = 'block';
}

function openList(evt, listName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(listName).style.display = "block";
    evt.currentTarget.className += " active";
}


</script>
</head>
<body style="margin:0;">
<%@ include file="/slice/searchBar.jsp" %>

   
 	<div class="content1">
 	<div class="lineInfoo">
 	<span class="lineInfoospan"><s:property value="lineClass.line_subject"/> 라인</span>
 	</div>
 	<div class="tab">
 	 <span class="bestOnlyText">BEST</span>
 	 <%-- <strong>베스트</strong> --%>
 	 <!-- 추가사항 -->
 	 
 	 <div class="tabButtonWrap">
	 	 <input type="button" class="tablinks active" onclick="openList(event,'goodBoard')" value="추천순" />
	 	 <input type="button" class="tablinks" onclick="openList(event,'reple')" value="댓글순" />
	 	 <input type="button" class="tablinks" onclick="openList(event,'readhit')" value="조회순" />
	 	 <input type="button" class="tablinks" onclick="openList(event,'donate')" value="기부순" />
     </div>
 	</div>
 	
 	<div id="reple" class="tabcontent">
 	<ul>
 		<s:iterator value="commentsBestList" status="stat">
 		
 			<li>
 			<s:if test="#stat.index == 0">
 				<span class="BestRedNumber"><s:property value="#stat.index+1" /></span>
 			</s:if>
 			<s:elseif test="#stat.index != 0">
 				<span class="BestNumber"><s:property value="#stat.index+1" /></span>
 			</s:elseif>
 			
 			<a href='viewAction.action?line_num=<s:property value="line_num" />&board_num=<s:property value="board_num" />&currentPage=1'>
 				<span class="bestSubject"><s:property value="board_subject" /></span>
 			</a>
 			 	<span class="bestCommentCounting">
 				<s:if test="commentsBestComment.get(#stat.index) != 0">
 				(<s:property value="commentsBestComment.get(#stat.index)" />)
 				</s:if>
 				</span>
 			</li>
 		</s:iterator>
 	</ul>
    </div> 
    <div id="readhit" class="tabcontent">
 	<ul>
 		<s:iterator value="readcountBestList" status="stat">
 			<li>
 			<s:if test="#stat.index == 0">
 			<span class="BestRedNumber"><s:property value="#stat.index+1" /></span>
 			</s:if>
 			<s:else>
 			<span class="BestNumber"><s:property value="#stat.index+1" /></span>
 			</s:else>
 			
 			<a href='viewAction.action?line_num=<s:property value="line_num" />&board_num=<s:property value="board_num" />&currentPage=1'>
	 			<span class="bestSubject"><s:property value="board_subject" /></span>
	 			</a>
	 			<span class="bestCommentCounting">
	 			<s:if test="readcountBestComment.get(#stat.index) != 0">
	 			(<s:property value="readcountBestComment.get(#stat.index)" />)
	 			</s:if>
	 			</span> 
	 			 <span class="countingText"> 조회 <s:property value="board_readcount" /></span>
 			</li>
 		</s:iterator>
 	</ul>
    </div> 
    
    <div id="donate" class="tabcontent">
 	<ul>
 		<s:iterator value="donationBestList" status="stat">
 			<li>
 			<s:if test="#stat.index == 0">
 			<span class="BestRedNumber"><s:property value="#stat.index+1" /></span>
 			</s:if>
 			<s:else>
 			<span class="BestNumber"><s:property value="#stat.index+1" /></span>
 			</s:else>
 			
 			<a href='viewAction.action?line_num=<s:property value="line_num" />&board_num=<s:property value="board_num" />&currentPage=1'>
 			<span class="bestSubject"><s:property value="board_subject" /></span>
 			</a>
 			<span class="bestCommentCounting">
 			<s:if test="donationBestComment.get(#stat.index) != 0">
 			(<s:property value="donationBestComment.get(#stat.index)" />)
 			</s:if>
 			</span>
 			<span class="countingText"> 기부 <s:property value="board_dot" /></span>
 			</li>
 		</s:iterator>
 	</ul>
    </div> <!-- 여기까지는 tabcontent --> 
 	
 	<div id="goodBoard" class="tabcontent">
 	<ul>

 		<s:iterator value="goodBestList" status="stat">
 			<li>
 			<s:if test="#stat.index == 0">
 			<span class="BestRedNumber"><s:property value="#stat.index+1" /></span>
 			</s:if>
 			<s:else>
 			<span class="BestNumber"><s:property value="#stat.index+1" /></span>
 			</s:else>
 			<a href='viewAction.action?line_num=<s:property value="line_num" />&board_num=<s:property value="board_num" />&currentPage=1'>
 			<span class="bestSubject"><s:property value="board_subject" /></span> 
 			</a>
 			<span class="bestCommentCounting">
 			<s:if test="goodBestComment.get(#stat.index) != 0">
 			(<s:property value="goodBestComment.get(#stat.index)" />)
 			</s:if>
 			</span>
 			 <span class="countingText">추천 <s:property value="board_up" /></span>
 			</li>
 		</s:iterator>
 	</ul>
    </div> <!-- 여기까지는 tabcontent --> 
 	
 	
 	</div>  <!-- content1 -->
    <div class="content2">
    
 	<table cellpadding="0" cellspacing="0" >
  	
       <s:iterator value="list" status="stat">
	       <s:url id="viewURL" action="viewAction">
	           <s:param name="board_num">
			   		<s:property value="board_num" />
			   </s:param>
			   <s:param name="currentPage">
			   		<s:property value="currentPage" />
			   </s:param>
	       </s:url>
	        <!--경계 -->
	       <tr>
	         <td>
	            <div class="profileDIV">
	            	<img src="/SQUARE/static/img/profile_img/<s:property value="imgList.get(#stat.index)" />" onerror="this.src='/SQUARE/static/img/basicProfile.png'" class="boardProfile" />
	            </div>
	            <div class="subjectDIV">
	         	<s:a href="%{viewURL}"><s:property value="board_subject"/></s:a>
	         	
	         	<s:if test="commentSumaryList.get(#stat.index) != 0">
	         		<span class="boardListComments">(<s:property value="commentSumaryList.get(#stat.index)" />)</span>
	         	</s:if>
	         	<br>
	    		<span class="boardName"><s:property value="nameList.get(#stat.index)" /></span>
	           	<span class="boardAuthor">[<s:property value="board_author"/>]</span>
	           	</div>
	         </td>
	         <td>
	         <div class="boardInfoWrap">
	         	<div class="infoImg">
	         		<img src="/SQUARE/static/img/won.png" class="infoCon" />
	         	</div>
	         	<span class="infoText">
	         		 <s:property value="board_dot"/>
	         	</span>
	         </div>
	         
	         <div class="boardInfoWrap">
	         	<div class="infoImg">
	         		<img src="/SQUARE/static/img/up.png" class="infoCon" />
	         	</div>
	         	<span class="infoText">
	         		<s:property value="board_up"/>
	         	</span>
	         </div>
	         
	         <div class="boardInfoWrap">
	         	<div class="infoImg">
	         		<img src="/SQUARE/static/img/view.png" class="infoCon" />
	         	</div>
	         	<span class="infoText">
	         		<s:property value="board_readcount"/>
	         	</span>
	         </div>
	         
	        
	         
	         </td>
   		   </tr>
         
     	</s:iterator>
   	<s:if test="list.size()<=0" >
	   	<tr>
	   		<td colspan="5" >등록된 게시물이 없어요!</td>
	   	</tr>
	</s:if>
  </table>

 

	<s:if test="#session.logonStatus == 0">
		<div class="writeButtonWrap">
  	 		<input type="button" value="글쓰기" onclick="javascript:location.href='writeForm.action?currentPage=<s:property value="currentPage"/>&line_num=<s:property value="line_num"/>'" class="writeButton2"/>
  		</div>
  	</s:if>
  	 <div class="pagingWrap">
  	 	<s:property value="pagingHtml" escape="false"/> 
  	 </div>
    <div class="searchWrap">
	   <form method="post">
	      <select name="SearchN" class="selectBox2"> 
	      	<option value="0">글쓴이</option>
	      	<option value="1">글내용</option>
	      	<option value="2">글제목</option>
	      	
	      </select>
	      <input type="text" placeholder="검색어" name="searchKeyword" class="searchBox2"/>
	      <input type="submit" value="검색" class="searchButton2" />
	   </form> 
 	</div>
  </div> 
  

<%@ include file="/slice/footer.jsp" %>
</body>
</html>
