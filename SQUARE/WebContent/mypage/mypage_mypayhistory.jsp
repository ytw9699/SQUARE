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
		<input type="button" value="��������"  onclick="javascript:location.href='myDotPayForm.action?od=ch'" class="historyButton" />
		<input type="button" value="ȯ������" onclick="javascript:location.href='myDotPayForm.action?od=ex'" class="historyButton" />
	</div>
	<div class="contentWrap">
		<s:if test="od == 'ch'">
			<s:if test="chargeHistoryList.size() == 0">
				���������� �����
			</s:if>
			<s:elseif test="chargeHistoryList.size() > 0">
				<table class="hehe" cellpadding="0" cellspacing="0">
					<tr>
						<td class="tableSubject">������</td>
						<td class="tableSubject">��û����</td>
						<td class="tableSubject">����</td>
						<td class="tableSubject">��������</td>
					<tr>
					<s:iterator value="chargeHistoryList" status="stat">
						<tr>
							<td class="valueTD"><!-- ������ -->
								<s:property value="dc_value" />
							</td>
							<td><!-- ��û��¥ -->
								<s:property value="dc_date" />
							</td>
							<td><!-- ������� -->
								<s:if test="dc_status == 0"><span class="chargeNO">��û�����</span></s:if>
								<s:elseif test="dc_status == 1"><span class="chargeOK">�����Ϸ�</span></s:elseif>
							</td>
							<td><!-- ���γ�¥ -->
								<s:property value="dc_dated" />
							</td>
						</tr>
					</s:iterator>
				</table>
			</s:elseif>
		</s:if>
		<s:elseif test="od == 'ex'">
			<s:if test="exchangeHistoryList.size() == 0">
				ȯ�������� �����
			</s:if>
			<s:elseif test="exchangeHistoryList.size() > 0">
				<table class="hehe" cellpadding="0" cellspacing="0">
					<tr>
						<td class="tableSubject">ȯ����</td>
						<td class="tableSubject">��û����</td>
						<td class="tableSubject">����</td>
						<td class="tableSubject">ȯ������</td>
					<tr>
					<s:iterator value="exchangeHistoryList" status="stat">
						<tr>
							<td class="valueTD"><!-- ������ -->
								<s:property value="de_value" />
							</td>
							<td><!-- ��û��¥ -->
								<s:property value="de_date" />
							</td>
							<td><!-- ������� -->
								<s:if test="de_status == 0"><span class="chargeNO">��û�����</span></s:if>
								<s:elseif test="de_status == 1"><span class="chargeOK">ȯ���Ϸ�</span></s:elseif>
							</td>
							<td><!-- ���γ�¥ -->
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