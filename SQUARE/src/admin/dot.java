package admin;

import com.opensymphony.xwork2.ActionSupport;
import admin.pagingAction_dot;
import admin.dotHistoryVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import config.SqlMapper;
import java.util.*;
import java.io.IOException;

public class dot extends ActionSupport {
	
	SqlMapClient sqlMapper;
	private List<dotHistoryVO> list = new ArrayList<dotHistoryVO>();
	private String searchKeyword;
	private int searchNum;
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction_dot page;
	private int num = 0;
	
	private int dh_num;
	private int dh_donation;
	private String dh_from;
	private String dh_to;
	private Date dh_date;
	private int board_num;
	
	public dot() throws Exception{
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		if(getSearchKeyword() != null)
		{
			return search();
		}
		
		list = sqlMapper.queryForList("selectAll-dh");
		totalCount = list.size(); // 전체 글 갯수를 구한다. 
		
		//pagingAction 객체 생성. 
		page = new pagingAction_dot(currentPage, totalCount, blockCount, blockPage, num, "");
		pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML생성. 
		// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
		int lastCount = totalCount;

		// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 
		//lastCount를 +1 번호로 설정.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
		list = list.subList(page.getStartCount(), lastCount);
		// 수행작업 코딩 
		
		return SUCCESS;
	}
	
	


	public String search() throws Exception {
		

		if(searchNum == 0){
			list = sqlMapper.queryForList("selectSearchID-dh", "%"+getSearchKeyword()+"%");
		}
		if(searchNum == 1){
			list = sqlMapper.queryForList("selectSearchID-dh2", "%"+getSearchKeyword()+"%");
		}
		
		totalCount = list.size();
		page = new pagingAction_dot(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword());
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
		
	}
	
	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public List<dotHistoryVO> getList() {
		return list;
	}

	public void setList(List<dotHistoryVO> list) {
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

	public pagingAction_dot getPage() {
		return page;
	}

	public void setPage_dot(pagingAction_dot page) {
		this.page = page;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getDh_num() {
		return dh_num;
	}

	public void setDh_num(int dh_num) {
		this.dh_num = dh_num;
	}

	public int getDh_donation() {
		return dh_donation;
	}

	public void setDh_donation(int dh_donation) {
		this.dh_donation = dh_donation;
	}

	public String getDh_from() {
		return dh_from;
	}

	public void setDh_from(String dh_from) {
		this.dh_from = dh_from;
	}

	public String getDh_to() {
		return dh_to;
	}

	public void setDh_to(String dh_to) {
		this.dh_to = dh_to;
	}

	public Date getDh_date() {
		return dh_date;
	}

	public void setDh_date(Date dh_date) {
		this.dh_date = dh_date;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	
}
