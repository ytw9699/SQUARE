package admin;
import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.sqlmap.client.SqlMapClient; 

import java.util.*;
import java.io.IOException;
import config.SqlMapper;

public class memberList extends ActionSupport {
	public static SqlMapClient sqlMapper;

	private List<memberVO> list = new ArrayList<memberVO>();
	private String searchKeyword;
	private int searchNum;
	private int num = 0;//searchNum의 기본값
	
	private int currentPage = 1;//현재 페이지,기본페이지
	private int totalCount;//totalCount = list.size(); // 총 게시물의 수,총몇줄
	private int blockCount = 16;	// 한 페이지의  게시물의 수
	private int blockPage = 4; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private memberList_pagingAction page; 	// 페이징 클래스
	
	public memberList() throws IOException {
		sqlMapper = SqlMapper.getMapper();//ibatis관련 읽어들이는 내용,
	}
	
	public String execute() throws Exception {
	if(getSearchKeyword() != null)//조건//검색이면
	{
		return search();//서치메소드로 처리
	}
	// 모든 멤버를 가져와 list에 넣는다.
	list = sqlMapper.queryForList("selectmemberAll");
	
	totalCount = list.size(); // 전체 멤버의 갯수를 구한다.
	page = new memberList_pagingAction(currentPage, totalCount, blockCount, blockPage, num, ""); 
	pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.
	
	int lastCount = totalCount;// 현재 페이지에서 보여줄 마지막 글의 번호 설정

	if (page.getEndCount() < totalCount)
		lastCount = page.getEndCount() + 1;

	list = list.subList(page.getStartCount(), lastCount);
	return SUCCESS;
	} 

	public String search() throws Exception {
		
		if(searchNum == 0){//이름
	list = sqlMapper.queryForList("selectSearchName", "%"+getSearchKeyword()+"%");
		}
		if(searchNum == 1){//아이디
    list = sqlMapper.queryForList("selectSearchId", "%"+getSearchKeyword()+"%");
    }
		
		totalCount = list.size();
		page = new memberList_pagingAction
	    (currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword());
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if(page.getEndCount() < totalCount)
	    lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}
	public List<memberVO> getList() {
		return list;
	}
	public void setList(List<memberVO> list) {
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
	public memberList_pagingAction getPage() {
		return page;
	}
	public void setPage(memberList_pagingAction page) {
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