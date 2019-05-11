package payment;
import com.opensymphony.xwork2.ActionSupport;

import com.ibatis.sqlmap.client.SqlMapClient; 

import java.util.*;
import java.io.IOException;
import config.SqlMapper;


public class dotChargeList extends ActionSupport {
	public static SqlMapClient sqlMapper;
	//dotChargeList.action?searchKeyword=ytw9699&listOption=3&searchNum=1
	private List<dot_chargeVO> list = new ArrayList<dot_chargeVO>();
	private String searchKeyword;
	private int searchNum;
	private int num = 0;//searchNum의 기본값
	private int currentPage = 1;//현재 페이지,기본페이지
	private int totalCount;//totalCount = list.size(); // 총 게시물의 수,총몇줄
	private int blockCount = 5;	// 한 페이지의  게시물의 수
	private int blockPage = 5; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private dotChargeList_pagingAction page; 	// 페이징 클래스
	 
	private String listOption="3";//기본값
	private int dc_allCount;//전체 갯수
	private int dc_chargingCount;//충전 대기중 갯수
	private int dc_chargedCount;//충전 완료 갯수
	private int sumCharge;
	
	public dotChargeList() throws IOException {
		sqlMapper = SqlMapper.getMapper();//ibatis관련 읽어들이는 내용,
	}
	public String execute() throws Exception {
	dc_allCount =(Integer) sqlMapper.queryForObject("dc_allCount");
	System.out.println(dc_allCount);
	if(sqlMapper.queryForObject("sumCharge") == null) {
		sumCharge=0;
	}else if(sqlMapper.queryForObject("sumCharge") != null) {
		sumCharge =(Integer) sqlMapper.queryForObject("sumCharge");
	}
	
	if(getSearchKeyword() != null)
	{
		return search();
	}
	dc_chargingCount =(Integer) sqlMapper.queryForObject("dc_chargingCount");
	//인티저라도 인트에 들어간다 
	dc_chargedCount =(Integer) sqlMapper.queryForObject("dc_chargedCount");//오토박싱 언박싱 개념
	
	if(getListOption().equals("3")) {
		list = sqlMapper.queryForList("dotChargeList");//전체리스트
	}else if (getListOption().equals("0")) {
		list =	sqlMapper.queryForList("dotWatingList");//대기리스트
	}else if(getListOption().equals("1")) {
		list =	sqlMapper.queryForList("dotChargedList");//완료 리스트
	}
	totalCount = list.size(); // 전체 멤버의 갯수를 구한다.
	page = new dotChargeList_pagingAction(currentPage, totalCount, blockCount, blockPage, num, "",getListOption()); 
	pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.
	
	int lastCount = totalCount;// 현재 페이지에서 보여줄 마지막 글의 번호 설정

	if (page.getEndCount() < totalCount)
		lastCount = page.getEndCount() + 1;

	list = list.subList(page.getStartCount(), lastCount);
	
	return SUCCESS;
	} 
	
	public String search() throws Exception {
		
	dc_allCount =(Integer) sqlMapper.queryForObject("dc_allCount");
	sumCharge =(Integer) sqlMapper.queryForObject("sumCharge");//오토박싱 언박싱 개념
	
	if(searchNum == 1){//아이디
		if(getListOption().equals("3")) {
			list = sqlMapper.queryForList("chargeSearchId", "%"+getSearchKeyword()+"%");
		}else if (getListOption().equals("0")) {
	list = sqlMapper.queryForList("requestSearchId", "%"+getSearchKeyword()+"%");//대기리스트
		}else if(getListOption().equals("1")) {
	list = sqlMapper.queryForList("chargedSearchId", "%"+getSearchKeyword()+"%");//완료 리스트
		}
	}
	dc_chargingCount =(Integer) sqlMapper.queryForObject("dc_chargingCount");//오토박싱 언박싱 개념
	
	dc_chargedCount =(Integer) sqlMapper.queryForObject("dc_chargedCount");//오토박싱 언박싱 개념

	totalCount = list.size(); // 전체 멤버의 갯수를 구한다.
	page = new dotChargeList_pagingAction(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword(),getListOption()); 
	pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.

	int lastCount = totalCount;// 현재 페이지에서 보여줄 마지막 글의 번호 설정

	if (page.getEndCount() < totalCount)
	lastCount = page.getEndCount() + 1;

	list = list.subList(page.getStartCount(), lastCount);
	return SUCCESS;
	} 
	
	public int getDc_allCount() {
	return dc_allCount;
	}
	public void setDc_allCount(int dc_allCount) {
	this.dc_allCount = dc_allCount;
	}	
	public int getSumCharge() {
	return sumCharge;
	}
	public void setSumCharge(int sumCharge) {
	this.sumCharge = sumCharge;
	}
	public String getListOption() {
	return listOption;
	}
	public void setListOption(String listOption) {
	this.listOption = listOption;
	}
	public int getDc_chargingCount() {
	return dc_chargingCount;
	}
	public void setDc_chargingCount(int dc_chargingCount) {
	this.dc_chargingCount = dc_chargingCount;
	}
	public int getDc_chargedCount() {
	return dc_chargedCount;
	}
	public void setDc_chargedCount(int dc_chargedCount) {
	this.dc_chargedCount = dc_chargedCount;
	}
	public List<dot_chargeVO> getList() {
		return list;
	}
	public void setList(List<dot_chargeVO> list) {
		this.list = list;
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
	public dotChargeList_pagingAction getPage() {
		return page;
	}
	public void setPage(dotChargeList_pagingAction page) {
		this.page = page;
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
}