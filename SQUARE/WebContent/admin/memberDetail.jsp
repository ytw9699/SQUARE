<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SQUARE</title>
<link rel="stylesheet" href="/SQUARE/static/css/adminMember_common.css" type="text/css" />
<link rel="stylesheet" href="/SQUARE/static/css/memberDetail.css" type="text/css" />
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
 <script language="JavaScript">
function check(){
	alert("수정되었습니다");
	return true;
}
</script>
<style>
#AD_member{
background-color: #12b9ff;
    color: white;
}
</style>
</head>
<body style="margin:0;">
<%@ include file="/slice/searchBar.jsp" %>
<%@ include file="/slice/adminMemberBar.jsp" %>

<div class="contentWrap">
<table cellspacing="0" cellpadding="0">
  <tr>
  	<td colspan="2">
  	<span class="contentSubject">기본정보</span>
  	</td>
  </tr>
  <tr>
    <td class="contentName">아이디</td>
    <td class="contentValue">
		<s:property value="resultClass.id" />
    </td>
  </tr>
  <tr>
    <td class="contentName">이름</td>
    <td class="contentValue">
    	<s:property value="resultClass.name" />
    </td>
  </tr>
  <tr>
    <td class="contentName">주민번호</td>
    <td class="contentValue">
		<s:property value="resultClass.jumin" />
    </td>
  </tr>
  <tr>
    <td class="contentName">이메일</td>
    <td class="contentValue">
		<s:property value="resultClass.email" />
    </td>
  </tr>
  <tr>
    <td class="contentName">주소</td>
    <td class="contentValue">
    	<s:property value="resultClass.address" />
    </td>
  </tr>
  <tr>
    <td class="contentName">우편번호 </td>
    <td class="contentValue">
		<s:property value="resultClass.zipcode" />
    </td>
  </tr>
  <tr>
    <td class="contentName">계좌번호</td>
    <td class="contentValue">
		<s:property value="resultClass.account" />
    </td>
  </tr>
  <tr>
    <td class="contentName">연락처</td>
    <td class="contentValue">
		<s:property value="resultClass.phone_num" />
    </td>
  </tr>
   <tr>
    <td class="contentName">가입일</td>
    <td class="contentValue">
    	<fmt:formatDate value="${resultClass.reg_date}" pattern="yy-MM-dd HH:mm" />
    </td>
  </tr>
  <tr>
  	<td colspan="2">
  	<span class="contentSubject">계정정보</span>
  	</td>
  </tr>
  <tr>
	  <td class="contentName">총 보유 DOT</td>
	  <td class="contentValue">
	  	<span class="accountText dotText">
	    <s:property value="resultClass.dot_sum" />
	    </span>
	    <input type="button" value="충전 리스트" class="inputb" onclick="javascript:location.href='dotChargeList.action?searchKeyword=<s:property value="encodedID" />&listOption=3&searchNum=1'" />
	    <input type="button" value="환전 리스트" class="inputb" onclick="javascript:location.href='dotExchangeList.action?searchKeyword=<s:property value="encodedID" />&listOption=3&searchNum=1'" />
	  </td>
  </tr>
<tr>
	  <td class="contentName">계정상태</td>
	  <td class="contentValue">

	<s:if test="resultClass.status == 0"><font color='green'><span class="accountText">계정 정상</span></font>
	</s:if>
	<s:if test="resultClass.status == 1"><font color='orange'><span class="accountText">게시글 제한</span></font>
	</s:if>
	<s:if test="resultClass.status == 2"><font color='red'><span class="accountText">로그인 제한</span></font>
	</s:if>
	<input type="button" value="계정 복구 하기" class="inputb" onclick="javascript:location.href='restoringMember.action?id=<s:property value="encodedID" />&currentPage=<s:property value="currentPage" />&status=0'" />
	
	<input type="button" value="게시글 제한" class="inputb" onclick="javascript:location.href='limitingBoard.action?id=<s:property value="encodedID" />&currentPage=<s:property value="currentPage" />&status=1'" />
	
	<input type="button" value="로그인 제한" class="inputb" onclick="javascript:location.href='limitingLogin.action?id=<s:property value="encodedID" />&currentPage=<s:property value="currentPage" />&status=2'" />
	</td>
	</tr>
     <tr>
	     <td class="contentName">회원특이사항 </td>
	     <td class="contentValue">
	      <form action="modMemberEx.action" onsubmit="return check()">
	       <s:if test="resultClass2.ex != NULL"> 
	       <input type="hidden" name="option" value="1" />
	       </s:if>
	      <input type="hidden" name="currentPage" value="<s:property value="currentPage" />" />
	      <input type="hidden" name="id" value="<s:property value="encodedID" />" />
	      
	      <input type="text" name="ex" placeholder="회원의 특이사항을 적어주세요" value='<s:property value="resultClass2.ex" />' size="60" class="exInput" />
	      <input type="submit" size="5" value="수정" class="inputb" />
	      </form>
      </td>
    </tr>
    <tr>
    	<td class="boardListTD">
    	<%-- <a href='memberArticles.action?board_author=<s:property value="encodedID" />&currentPage=<s:property value="currentPage" />'>
		작성자 글 목록
		</a> --%>
		<input type="button" value="작성자 글목록 조회" class="inputb boardListButon" onclick="location.href='memberArticles.action?board_author=<s:property value="encodedID" />&currentPage=<s:property value="currentPage" />'" />
    	</td>
    </tr>
  </table>
  </div>
  <%@ include file="/slice/footer.jsp" %>
 </body>
</html>








