package admin;
import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.sqlmap.client.SqlMapClient; 
import java.util.*;
import java.io.IOException;
import java.net.URLDecoder;

import config.SqlMapper;

public class memberArticles extends ActionSupport {
	public static SqlMapClient sqlMapper;

	private List<boardVO> list = new ArrayList<boardVO>();
	
	private String board_author;
	private int currentPage = 1;//현재 페이지,기본페이지
	
	private int num;
	private int totalCount;//totalCount = list.size(); // 총 게시물의 수,총몇줄
	private int blockCount = 4;	// 한 페이지의  게시물의 수
	private int blockPage = 4; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private memberArticles_pagingAction page; 	// 페이징 클래스

	public memberArticles() throws IOException {
		sqlMapper = SqlMapper.getMapper();
	}
	public String execute() throws Exception {
		/*System.out.println(getBoard_author());//2.ID를 execute가 실행되기전에 이미 디코딩해서 받아오는것
		String decodedID = URLDecoder.decode(getBoard_author(),"euc-kr");//0.ID를 다시 디코딩해서 넣어줄려했는데
		System.out.println(decodedID.toString());
		
		list = sqlMapper.queryForList("selectArticlesAll",decodedID);//1.ID를 다시 디코딩해서 넣어줄려했는데
*/		list = sqlMapper.queryForList("selectArticlesAll",getBoard_author());

		totalCount = list.size(); // 전체 멤버의 갯수를 구한다.
		
		page = new memberArticles_pagingAction(currentPage, totalCount, blockCount, blockPage, num, "",getBoard_author());
		
		pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.
		
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
	
		return SUCCESS;
	}

public String getBoard_author() {
	return board_author;
}
public void setBoard_author(String board_author) {
	this.board_author = board_author;
}

	public List<boardVO> getList() {
		return list;
	}
	public void setList(List<boardVO> list) {
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
	public memberArticles_pagingAction getPage() {
		return page;
	}
	public void setPage(memberArticles_pagingAction page) {
		this.page = page;
	}
}