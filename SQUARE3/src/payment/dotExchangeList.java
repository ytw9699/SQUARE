package payment;
import com.opensymphony.xwork2.ActionSupport;

import com.ibatis.sqlmap.client.SqlMapClient; 

import java.util.*;
import java.io.IOException;
import config.SqlMapper;

public class dotExchangeList extends ActionSupport {
	public static SqlMapClient sqlMapper;

	private List<dot_exchangeVO> list = new ArrayList<dot_exchangeVO>();
	private String searchKeyword;
	private int searchNum;
	private int num = 0;//searchNum의 기본값
	private int currentPage = 1;//현재 페이지,기본페이지
	private int totalCount;//totalCount = list.size(); // 총 게시물의 수,총몇줄
	private int blockCount = 5;	// 한 페이지의  게시물의 수
	private int blockPage = 5; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private dotExchangeList_pagingAction page; 	// 페이징 클래스
	 
	private String listOption="3";//기본값
	private int de_allCount;//전체 갯수
	private int de_exchangingCount;//환전 대기중 갯수
	private int de_exchangedCount;//환전 완료 갯수
	private int sumExchange=1;
	
	public dotExchangeList() throws IOException {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception {
	de_allCount =(Integer) sqlMapper.queryForObject("de_allCount");
	
	if(sqlMapper.queryForObject("sumExchange") == null) {
		sumExchange=0;
	}
	else if(sqlMapper.queryForObject("sumExchange") != null) {
		sumExchange =(Integer) sqlMapper.queryForObject("sumExchange");//오토박싱 언박싱 개념
	}
	
	if(getSearchKeyword() != null)//조건//검색이면
	{
		return search();//서치메소드로 처리
	}
	de_exchangingCount =(Integer) sqlMapper.queryForObject("de_exchangingCount");//오토박싱 언박싱 개념
	
	de_exchangedCount =(Integer) sqlMapper.queryForObject("de_exchangedCount");//오토박싱 언박싱 개념
	
	if(getListOption().equals("3")) {
		list = sqlMapper.queryForList("dotExchangeList");//전체리스트
	}else if (getListOption().equals("0")) {
		list =	sqlMapper.queryForList("dotExWatingList");//대기리스트
	}else if(getListOption().equals("1")) {
		list =	sqlMapper.queryForList("dotExchangedList");//완료 리스트
	}
	totalCount = list.size(); // 전체 멤버의 갯수를 구한다.
	page = new dotExchangeList_pagingAction(currentPage, totalCount, blockCount, blockPage, num, "",getListOption()); 
	pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.
	
	int lastCount = totalCount;// 현재 페이지에서 보여줄 마지막 글의 번호 설정

	if (page.getEndCount() < totalCount)
		lastCount = page.getEndCount() + 1;

	list = list.subList(page.getStartCount(), lastCount);
	return SUCCESS;
	
	} 
	public String search() throws Exception {
	
	de_allCount =(Integer) sqlMapper.queryForObject("de_allCount");
	sumExchange =(Integer) sqlMapper.queryForObject("sumExchange");
	
	if(searchNum == 1){//아이디
		if(getListOption().equals("3")) {
	list = sqlMapper.queryForList("exAllSearchId", "%"+getSearchKeyword()+"%");
		}else if (getListOption().equals("0")) {
	list = sqlMapper.queryForList("exRequestSearchId", "%"+getSearchKeyword()+"%");//대기리스트
		}else if(getListOption().equals("1")) {
	list = sqlMapper.queryForList("exchangedSearchId", "%"+getSearchKeyword()+"%");//완료 리스트
		}
	}
	de_exchangingCount =(Integer) sqlMapper.queryForObject("de_exchangingCount");//오토박싱 언박싱 개념
	
	de_exchangedCount =(Integer) sqlMapper.queryForObject("de_exchangedCount");//오토박싱 언박싱 개념

	totalCount = list.size(); // 전체 멤버의 갯수를 구한다.
	page = new dotExchangeList_pagingAction(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword(),getListOption()); 
	pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.

	int lastCount = totalCount;// 현재 페이지에서 보여줄 마지막 글의 번호 설정

	if (page.getEndCount() < totalCount)
	lastCount = page.getEndCount() + 1;

	list = list.subList(page.getStartCount(), lastCount);
	return SUCCESS;

	}
public List<dot_exchangeVO> getList() {
	return list;
}
public void setList(List<dot_exchangeVO> list) {
	this.list = list;
}
public String getSearchKeyword() {
	return searchKeyword;
}
public void setSearchKeyword(String searchKeyword) {
	this.searchKeyword = searchKeyword;
}
public int getSearchNum() {
	return searchNum;
}
public void setSearchNum(int searchNum) {
	this.searchNum = searchNum;
}
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public int getCurrentPage() {
	return currentPage;
}
public void setCurrentPage(int currentPage) {
	this.currentPage = currentPage;
}
public int getTotalCount() {
	return totalCount;
}
public void setTotalCount(int totalCount) {
	this.totalCount = totalCount;
}
public int getBlockCount() {
	return blockCount;
}
public void setBlockCount(int blockCount) {
	this.blockCount = blockCount;
}
public int getBlockPage() {
	return blockPage;
}
public void setBlockPage(int blockPage) {
	this.blockPage = blockPage;
}
public String getPagingHtml() {
	return pagingHtml;
}
public void setPagingHtml(String pagingHtml) {
	this.pagingHtml = pagingHtml;
}
public dotExchangeList_pagingAction getPage() {
	return page;
}
public void setPage(dotExchangeList_pagingAction page) {
	this.page = page;
}
public String getListOption() {
	return listOption;
}
public void setListOption(String listOption) {
	this.listOption = listOption;
}
public int getDe_allCount() {
	return de_allCount;
}
public void setDe_allCount(int de_allCount) {
	this.de_allCount = de_allCount;
}
public int getDe_exchangingCount() {
	return de_exchangingCount;
}
public void setDe_exchangingCount(int de_exchangingCount) {
	this.de_exchangingCount = de_exchangingCount;
}
public int getDe_exchangedCount() {
	return de_exchangedCount;
}
public void setDe_exchangedCount(int de_exchangedCount) {
	this.de_exchangedCount = de_exchangedCount;
}
public int getSumExchange() {
	return sumExchange;
}
public void setSumExchange(int sumExchange) {
	this.sumExchange = sumExchange;
}

}