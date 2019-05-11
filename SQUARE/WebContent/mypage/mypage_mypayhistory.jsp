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
		<input type="button" value="충전내역"  onclick="javascript:location.href='myDotPayForm.action?od=ch'" class="historyButton" />
		<input type="button" value="환전내역" onclick="javascript:location.href='myDotPayForm.action?od=ex'" class="historyButton" />
	</div>
	<div class="contentWrap">
		<s:if test="od == 'ch'">
			<s:if test="chargeHistoryList.size() == 0">
				충전내역이 없어요
			</s:if>
			<s:elseif test="chargeHistoryList.size() > 0">
				<table class="hehe" cellpadding="0" cellspacing="0">
					<tr>
						<td class="tableSubject">충전량</td>
						<td class="tableSubject">요청일자</td>
						<td class="tableSubject">상태</td>
						<td class="tableSubject">승인일자</td>
					<tr>
					<s:iterator value="chargeHistoryList" status="stat">
						<tr>
							<td class="valueTD"><!-- 충전량 -->
								<s:property value="dc_value" />
							</td>
							<td><!-- 요청날짜 -->
								<s:property value="dc_date" />
							</td>
							<td><!-- 현재상태 -->
								<s:if test="dc_status == 0"><span class="chargeNO">요청대기중</span></s:if>
								<s:elseif test="dc_status == 1"><span class="chargeOK">충전완료</span></s:elseif>
							</td>
							<td><!-- 승인날짜 -->
								<s:property value="dc_dated" />
							</td>
						</tr>
					</s:iterator>
				</table>
			</s:elseif>
		</s:if>
		<s:elseif test="od == 'ex'">
			<s:if test="exchangeHistoryList.size() == 0">
				환전내역이 없어요
			</s:if>
			<s:elseif test="exchangeHistoryList.size() > 0">
				<table class="hehe" cellpadding="0" cellspacing="0">
					<tr>
						<td class="tableSubject">환전량</td>
						<td class="tableSubject">요청일자</td>
						<td class="tableSubject">상태</td>
						<td class="tableSubject">환전일자</td>
					<tr>
					<s:iterator value="exchangeHistoryList" status="stat">
						<tr>
							<td class="valueTD"><!-- 충전량 -->
								<s:property value="de_value" />
							</td>
							<td><!-- 요청날짜 -->
								<s:property value="de_date" />
							</td>
							<td><!-- 현재상태 -->
								<s:if test="de_status == 0"><span class="chargeNO">요청대기중</span></s:if>
								<s:elseif test="de_status == 1"><span class="chargeOK">환전완료</span></s:elseif>
							</td>
							<td><!-- 승인날짜 -->
								<s:property value="de_dated" />
							</td>
						</tr>
					</s:iterator>
				</table>
			</s:elseif>
		
		</s:elseif>
	</div>
</div>
<%@ include file="/slice/footer.jsp" %>

</body>
</html>