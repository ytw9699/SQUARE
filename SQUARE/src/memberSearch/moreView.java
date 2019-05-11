package memberSearch;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;


import config.SqlMapper;

public class moreView extends ActionSupport {

	SqlMapClient sqlMapper;
	
	private String k; //bs : 보드제목기준 / bc : 보드내용기준 / bw : 보드작성자기준
	private String key;
	
	List<searchboardVO> moreViewList = new ArrayList<searchboardVO>();
	List<String> lineName = new ArrayList<String>();
	
	//페이징
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction page;
	
	
	
	public moreView() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception {
		
		String queryKeyword = "%"+getKey()+"%";
		
		if(getK().equals("bs")) {
			moreViewList = sqlMapper.queryForList("boardSubjectList", queryKeyword);
		}else if(getK().equals("bc")) {
			moreViewList = sqlMapper.queryForList("boardContentList", queryKeyword);
		}else if(getK().equals("bw")) {
			String writerQueryKeyword = "%"+getKey().substring(1)+"%";
			moreViewList = sqlMapper.queryForList("boardWriterList", writerQueryKeyword);
		}
		
		for(int i = 0 ; i < moreViewList.size() ; i++) {
			lineName.add((String) sqlMapper.queryForObject("selectMoreViewLineName", moreViewList.get(i).getLine_num()));
		}
		
			//lineName
		totalCount = moreViewList.size();
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, getK(), getKey());
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		moreViewList = moreViewList.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}

	public String getK() {
		return k;
	}

	public void setK(String k) {
		this.k = k;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public List<searchboardVO> getMoreViewList() {
		return moreViewList;
	}

	public void setMoreViewList(List<searchboardVO> moreViewList) {
		this.moreViewList = moreViewList;
	}

	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
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

	public pagingAction getPage() {
		return page;
	}

	public void setPage(pagingAction page) {
		this.page = page;
	}

	public List<String> getLineName() {
		return lineName;
	}

	public void setLineName(List<String> lineName) {
		this.lineName = lineName;
	}
	
	
	
}
