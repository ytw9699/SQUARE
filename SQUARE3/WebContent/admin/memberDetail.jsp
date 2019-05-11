<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>회원 상세정보</title>
<link rel="stylesheet" href="/SQUARE/static/css/css.css" type="text/css">
 <script language="JavaScript">
function check(){
	alert("수정되었습니다");
	return true;
}
</script>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
<td align="center">
<strong><a href='memberDetail.action?id=<s:property value="encodedID"/>&currentPage=<s:property value="currentPage"/>'><h2>회원 상세정보</h2></a></td>
</tr>
<tr>
<td align="right">
<a href='memberList.action'><h3>회원목록</h3></a>
<a href='memberArticles.action?board_author=<s:property value="encodedID" />&currentPage=<s:property value="currentPage" />'><h3>작성자 글 목록</h3></a>
</td>
<td height="20"></td>
	</tr>
</table>
<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr bgcolor="#777777">
    <td height="1" colspan="2"></td>
  </tr>
  <tr>
    <td bgcolor="#F4F4F4">  아이디 </td>
    <td bgcolor="#FFFFFF">
      &nbsp;&nbsp;<s:property value="resultClass.id" />
    </td>
  </tr>
  <tr bgcolor="#777777">
    <td height="1" colspan="2"></td>	
  </tr>
  <tr>
    <td width="100" bgcolor="#F4F4F4">  이름</td>
    <td width="500" bgcolor="#FFFFFF">
      &nbsp;&nbsp;<s:property value="resultClass.name" />
    </td>
  </tr>
  <tr bgcolor="#777777">
    <td height="1" colspan="2"></td>
  </tr>
  <tr>
    <td bgcolor="#F4F4F4">  주민번호 </td>
    <td bgcolor="#FFFFFF">
      &nbsp;&nbsp;<s:property value="resultClass.jumin" />
    </td>
  </tr>
  <tr bgcolor="#777777">
    <td height="1" colspan="2"></td>	
  </tr>
  <tr>
    <td bgcolor="#F4F4F4">  이메일 </td>
    <td bgcolor="#FFFFFF">
      &nbsp;&nbsp;<s:property value="resultClass.email" />
    </td>
  </tr>
  <tr bgcolor="#777777">
    <td height="1" colspan="2"></td>
  </tr>
  <tr>
    <td bgcolor="#F4F4F4">  주소 </td>
    <td bgcolor="#FFFFFF">
      &nbsp;&nbsp;<s:property value="resultClass.address" />
    </td>
  </tr>
  <tr bgcolor="#777777">
    <td height="1" colspan="2"></td>	
  </tr>
  <tr>
    <td bgcolor="#F4F4F4">  우편번호 </td>
    <td bgcolor="#FFFFFF">
      &nbsp;&nbsp;<s:property value="resultClass.zipcode" />
    </td>
  </tr>
  <tr bgcolor="#777777">
    <td height="1" colspan="2"></td>	
  </tr>
  <tr>
    <td bgcolor="#F4F4F4">  계좌번호 </td>
    <td bgcolor="#FFFFFF">
      &nbsp;&nbsp;<s:property value="resultClass.account" />
    </td>
  </tr>
  <tr bgcolor="#777777">
    <td height="1" colspan="2"></td>	
  </tr>
  <tr>
    <td bgcolor="#F4F4F4">  연락처 </td>
    <td bgcolor="#FFFFFF">
      &nbsp;&nbsp;<s:property value="resultClass.phone_num" />
    </td>
  </tr>
  <tr bgcolor="#777777">
    <td height="1" colspan="2"></td>	
  </tr>
   <tr>
    <td bgcolor="#F4F4F4">  가입일 </td>
    <td bgcolor="#FFFFFF">
      &nbsp;&nbsp;<fmt:formatDate value="${resultClass.reg_date}" pattern="yy-MM-dd HH:mm" />
    </td>
  </tr>
  <tr bgcolor="#777777">
    <td height="1" colspan="2"></td>	
  </tr>
  <tr>
  <td bgcolor="#F4F4F4">  총 보유 DOT </td>
  <td bgcolor="#FFFFFF">
    &nbsp;&nbsp;<s:property value="resultClass.dot_sum" />&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="충전 리스트" class="inputb" 
    onClick="javascript:location.href='dotChargeList.action?searchKeyword=<s:property value="encodedID" />&listOption=3&searchNum=1'">&nbsp;
    
    <input type="button" value="환전 리스트" class="inputb" 
    onClick="javascript:location.href='dotExchangeList.action?searchKeyword=<s:property value="encodedID" />&listOption=3&searchNum=1'">
  </td>
</tr>
<tr bgcolor="#777777">
  <td height="1" colspan="2"></td>	
</tr>
<tr>
  <td bgcolor="#F4F4F4">  계정상태 </td>
  <td bgcolor="#FFFFFF">
        &nbsp;&nbsp;
<s:if test="resultClass.status == 0"><strong><font color='green'>계정 정상</font></strong>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</s:if>
<s:if test="resultClass.status == 1"><strong><font color='orange'>게시글 제한</font></strong>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</s:if>
<s:if test="resultClass.status == 2"><strong><font color='red'>로그인 제한</font></strong>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</s:if>
<input type="button" value="계정 복구 하기" class="inputb" 
onClick="javascript:location.href='restoringMember.action?id=<s:property value="encodedID" />&currentPage=<s:property value="currentPage" />&status=0'">

<input type="button" value="게시글 제한" class="inputb" 
onClick="javascript:location.href='limitingBoard.action?id=<s:property value="encodedID" />&currentPage=<s:property value="currentPage" />&status=1'">

<input type="button" value="로그인 제한" class="inputb" 
onClick="javascript:location.href='limitingLogin.action?id=<s:property value="encodedID" />&currentPage=<s:property value="currentPage" />&status=2'">
</td>
</tr>
   <tr bgcolor="#777777">
      <td height="1" colspan="4"></td>	
    </tr>
     <tr>
      <form action="modMemberEx.action" onsubmit="return check()">
      <input type="hidden" name="id" value=<s:property value="id" /> />
      <input type="hidden" name="currentPage" value=<s:property value="currentPage" /> />
       <s:if test="resultClass2.ex != NULL"> 
       <input type="hidden" name="option" value="1" />
       </s:if>
       <textarea placeholder="뭐라도적어봐테스트"  name="ex2" cols="30" rows="10"></textarea>
      <td bgcolor="#F4F4F4"> 회원특이사항 </td>
      <td><input type="text" name="ex" placeholder="회원의 특이사항을 적어주세요" value='<s:property value="resultClass2.ex" />' size="60">
      <input type="submit" size="5" value="입력 or 수정"></td>
      <td bgcolor="#FFFFFF">
        &nbsp;&nbsp;
      </td>
	</form>
    </tr>
    <tr bgcolor="#777777">
      <td height="1" colspan="4"></td>	
    </tr>
  </table>
 </body>
</html>








