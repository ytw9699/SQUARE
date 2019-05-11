<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<style>
.header{width: 100%; height: 100px;}
.headerWrapper{width: 75%; margin: 0 auto;margin-top: 20px;}
.logoWrapper{float: left; margin-top: 5px;}
.menuWrapper{display: inline-block; width: 60%; float: left; margin-top: 20px; margin-left: 20px;}
.searchBox{height: 45px; font-size: 20px; box-sizing: border-box; width: 85%; padding: 7px; 
padding-left: 25px; 
border-radius: 8px; border: 1px solid #efefef; color: #5f5f5f; background-color: #efefef;}
.profile_viewprot{width: 50px;height: 50px; float: left; display: inline-block; overflow: hidden; 
border-radius: 40px; margin-top: 18px;}
.viewMyId{color: #5f5f5f; font-size: 20px;margin-top: 33px; margin-left: 11px; display: inline-block;}
.searchButton{width: 10%; font-size: 20px; border: 1px solid #efefef; color: #5f5f5f; 
background-color: #efefef;
padding: 5px; border-radius: 8px; display: inline-block;}
.link_line{width: 35px; margin-left: 30px; display: inline-block;}
.line_menu_body{position: absolute; width: 300px; border: 3px solid #dedede;right: 14%; top: 15%;
border-radius: 8px; display: none; background-color: white; transition: 0.3s; opacity: 0;
z-index: 1000; padding: 20px;}
.line_subjectSpan {float: left; width: 140px; margin-bottom: 7px;}
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { text-decoration: none;}
span.actionSpan {display: inline-block;padding: 10px;margin-bottom: 16px;border-radius: 10px;
transition: 0.3s;}
span.actionSpan:hover {background-color: #ddd;text-decoration: none;}
span.line_list {color: #555;font-size: 15px;font-weight: 600;line-height: 0px;}
.line_subjectLink {transition: 0.3s;width: 100%;display: block;}
.line_subjectLink:hover{color: #12b9ff;font-weight: 600;}
.line_subjectSpan_a{width: 100%;}
    /* 로딩 */
#load {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: fixed;
	display: none;
	opacity: 0.8;
	background: white;
	z-index: 2000;
	text-align: center;
}

#load > img {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 3000;
}
.profile_viewprot img{
	width : 100%;
	height : 50px;

}
</style>

</head>
<body>
<div id="load">
	<img src="/SQUARE/static/img/loading.gif" alt="loading">
</div>
<div class="header">
	
	<div class="headerWrapper">
		<div class="logoWrapper">
			<a href="main.action" style="display: inline-block;" onclick="javascript:loading();">
				<img src="/SQUARE/static/img/logo.png" width="160px" />
			</a>
		</div>
		<div class="menuWrapper">
			<form action="memberSearch.action" name="memberSearchForm" method="post" onsubmit="return searchingValidation();">
				<input type="text" name="search" placeholder="검색어 입력 / @검색어 : 사용자검색" class="searchBox" />
				<input type="submit" value="검색" class="searchButton" />
			</form>
		</div>
		<a href="my.action" style="display: inline-block;">
			<div class="profile_viewprot">
				<s:if test='%{#session.logonImg.equals("0")}'>
					<img src="/SQUARE/static/img/basicProfile.png" width="100%" />
				</s:if>
				<s:else>
					<img src="/SQUARE/static/img/profile_img/<s:property value="#session.logonImg"/>" width="100%" />
				</s:else>
			</div>
			<span class="viewMyId">
				<s:property value="#session.logonName" />
				<%-- ${sessionScope.myInfomation.name } --%>
			</span>
		</a>
		<a href="#" class="link_line">
			<img src="/SQUARE/static/img/menu.png" class="menu_img" width="100%" />
		</a>	
		</div>
		
		<div class="line_menu_body">
			<a href="logout.action">
				<span class="actionSpan">로그아웃</span>
			</a>
			<s:if test="#session.logonAuthority == 1">
			<a href="adminMain.action">
				<span class="actionSpan">관리자페이지</span>
			</a>
			</s:if>
			<p/>
			<span class="line_list">라인목록</span><hr style="border: 1px solid #ddd;">
			<s:iterator value="#session.headerLineList" status="stat">
				<span class="line_subjectSpan" >
					<a href='listAction.action?line_num=<s:property value="line_num" />' class="line_subjectSpan_a">
						<span class="line_subjectLink"><s:property value="line_subject" /></span>
					</a>
				</span>
			</s:iterator>
		</div>
		
		
		
</div>
<script>
$(document).ready(function(){
	var menu= true;
	$('.link_line').click(function(){
		if(menu==true){
			$('.line_menu_body').show();
			$('.line_menu_body').animate({opacity:"1"}, 100);
			menu=false;
			//클로
			$('.menu_img').attr("src","/SQUARE/static/img/close.png");
		}else{
			$('.line_menu_body').animate({opacity:"0"}, 100);
			$('.line_menu_body').hide();
			menu=true;
			//오픈
			$('.menu_img').attr("src","/SQUARE/static/img/menu.png");
			
		}
	});
});

function searchingValidation(){
	if(document.memberSearchForm.search.value == ''){
		alert('검색어를 입력해주세요!');
		document.memberSearchForm.search.focus();
		return false;
	}
	return true;
}

function loading(){
	var loadingDIV = document.getElementById('load');
	loadingDIV.style.display = 'block';
}
</script>
</body>
</html>