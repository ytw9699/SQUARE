<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQUARE</title>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="/SQUARE/static/img/T4.png" rel="icon" type="image/x-icon" />
<style>
.listWrap {
    width: 75%;
    margin: 0 auto;
    min-height: 700px;
    margin-top: 30px;
}
td {
    text-align: center;
    padding: 10px;
    border-bottom: 1px solid #e0e0e0;
}

td.tableSubject {
    border-top: 2px solid #373f52;
    text-align: center;
    background-color: #f2f2f4;
    padding: 7px;
    color: #949494;
}
input.historyButton {
    border: 1px solid #a3c1cb;
    background-color: #e3ecef;
    color: #40577f;
    padding: 8px;
    font-size: 17px;
    width: 100px;
}

table.hehe {
    width: 100%;
    margin-top: 20px;
}

span.chargeOK {
    color: #00a900;
    font-weight: 600;
}

span.chargeNO {
    color: red;
    font-weight: 600;
}
td.valueTD {
    color: #ff7e00;
    font-size: 14px;
    font-weight: 600;
}
</style>
</head>
<body style="margin:0;">
<%@ include file="/slice/searchBar.jsp" %>

<div class="listWrap">

	<div class="buttonWrap">
		<input type="button" value="기부내역" onclick="javascript:location.href='myDonationHistoryForm.action?od=give'" class="historyButton" />
		<input type="button" value="받은내역" onclick="javascript:location.href='myDonationHistoryForm.action?od=take'" class="historyButton" />
	</div>
	
	<div class="contentWrap">
	
	<s:if test="od == 'give'">
		<s:if test="myGiveList.size() == 0">
				기부내역이 없습니다!
		</s:if>
		<s:elseif test="myGiveList.size() > 0">
				<table class="hehe" cellpadding="0" cellspacing="0">
					<tr>
						<td class="tableSubject">기부대상자</td>
						<td class="tableSubject">기부량</td>
						<td class="tableSubject">날짜</td>
						<td class="tableSubject">게시물</td>
					<tr>
					<s:iterator value="myGiveList" status="stat">
						<tr>
							<td><!-- 기부대상자 -->
								<s:property value="dh_to" />
							</td>
							<td class="valueTD"><!-- 기부량 -->
								<s:property value="dh_donation" />
							</td>
							<td><!-- 날짜 -->
								<s:property value="dh_date" />
							</td>
							<td><!-- 게시물 -->
								<s:property value="board_num" />
							</td>
						</tr>
					</s:iterator>
				</table>
		</s:elseif>
		
	</s:if>
	
	
	<s:elseif test="od == 'take'">
		<s:if test="myTakeList.size() == 0">
				기부받은 내역이 없습니다!
		</s:if>
		<s:elseif test="myTakeList.size() > 0">
				<table class="hehe" cellpadding="0" cellspacing="0">
					<tr>
						<td class="tableSubject">기부자</td>
						<td class="tableSubject">기부량</td>
						<td class="tableSubject">날짜</td>
						<td class="tableSubject">게시물</td>
					<tr>
					<s:iterator value="myTakeList" status="stat">
						<tr>
							<td><!-- 기부대상자 -->
								<s:property value="dh_from" />
							</td>
							<td class="valueTD"><!-- 기부량 -->
								<s:property value="dh_donation" />
							</td>
							<td><!-- 날짜 -->
								<s:property value="dh_date" />
							</td>
							<td><!-- 게시물 -->
								<s:property value="board_num" />
							</td>
						</tr>
					</s:iterator>
				</table>
			</s:elseif>
	</s:elseif>
<!-- 	<div class="contentWrap"> -->
	
	
	
	
	
	
	
	
	
	</div>
	

</div>

<%@ include file="/slice/footer.jsp" %>
</body>
</html>