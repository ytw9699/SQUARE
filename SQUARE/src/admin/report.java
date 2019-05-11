package admin;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import admin.pagingAction_singo;
import config.SqlMapper;
import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;

public class report extends ActionSupport {
	
	SqlMapClient sqlMapper;
	
	private List<singoVO> list = new ArrayList<singoVO>();
	private List<Integer> list_b = new ArrayList<Integer>();
	
	private List<Integer> lineNumberList = new ArrayList<Integer>();
	private String searchKeyword;
	private int searchNum;
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction_singo page;
	private int num = 0;
	
	private int singo_num;
	private int board_num;
	private String singo_reporter;
	private String singo_badman;
	private String singo_reason;
	private	Calendar singo_regdate;
	
	private singoVO paramClass; // �뙆�씪誘명꽣瑜� ���옣�븷 媛앹껜
	private singoVO resultClass; //荑쇰━ 寃곌낵 媛믪쓣 ���옣�븷 媛앹껜 
	private boardVO bresultClass; // board_status �솗�씤�빐�꽌 report list�뿉 �몴�떆�빐二쇨린�쐞�븿

	
	public report() throws Exception {
		 sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		return SUCCESS;
	}
	
	public String list() throws Exception{
		if(getSearchKeyword() != null)
		{
			return search();
		}
//		bresultClass = new boardVO();
//		bresultClass = (boardVO)sqlMapper.queryForObject("selectOne-singo",getBoard_num());
		list = sqlMapper.queryForList("selectAll-singo");
		for(int i=0 ; i<list.size(); i++) {
//			list_b = sqlMapper.queryForList("selectStatus",list.get(i).getBoard_num());
			list_b.add((Integer)sqlMapper.queryForObject("selectStatus",list.get(i).getBoard_num()));
		}
		totalCount = list.size(); // �쟾泥� 湲� 媛��닔瑜� 援ы븳�떎. 
		
		//pagingAction 媛앹껜 �깮�꽦. 
		page = new pagingAction_singo(currentPage, totalCount, blockCount, blockPage, num, "");
		pagingHtml = page.getPagingHtml().toString(); // �럹�씠吏� HTML�깮�꽦. 
		// �쁽�옱 �럹�씠吏��뿉�꽌 蹂댁뿬以� 留덉�留� 湲��쓽 踰덊샇 �꽕�젙.
		int lastCount = totalCount;

		// �쁽�옱 �럹�씠吏��쓽 留덉�留� 湲��쓽 踰덊샇媛� �쟾泥댁쓽 留덉�留� 湲� 踰덊샇蹂대떎 �옉�쑝硫� 
		//lastCount瑜� +1 踰덊샇濡� �꽕�젙.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		// �쟾泥� 由ъ뒪�듃�뿉�꽌 �쁽�옱 �럹�씠吏�留뚰겮�쓽 由ъ뒪�듃留� 媛��졇�삩�떎.
		list = list.subList(page.getStartCount(), lastCount);
		for(int i = 0 ; i < list.size() ; i++) {
			lineNumberList.add((Integer) sqlMapper.queryForObject("selectSingoArticleLineNumber", list.get(i).getBoard_num()));
		}
		
		
		return SUCCESS;
	}
	
	public String search() throws Exception{
		if(searchNum == 0){
			list = sqlMapper.queryForList("selectSearchBad", "%"+getSearchKeyword()+"%");
		}
		if(searchNum == 1){
			list = sqlMapper.queryForList("selectSearchReason", "%"+getSearchKeyword()+"%");
		}
		
		totalCount = list.size();
		page = new pagingAction_singo(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword());
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

	public List<singoVO> getList() {
		return list;
	}

	public void setList(List<singoVO> list) {
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

	public pagingAction_singo getPage() {
		return page;
	}

	public void setPage(pagingAction_singo page) {
		this.page = page;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getSingo_num() {
		return singo_num;
	}

	public void setSingo_num(int singo_num) {
		this.singo_num = singo_num;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getSingo_reporter() {
		return singo_reporter;
	}

	public void setSingo_reporter(String singo_reporter) {
		this.singo_reporter = singo_reporter;
	}

	public String getSingo_badman() {
		return singo_badman;
	}

	public void setSingo_badman(String singo_badman) {
		this.singo_badman = singo_badman;
	}

	public String getSingo_reason() {
		return singo_reason;
	}

	public void setSingo_reason(String singo_reason) {
		this.singo_reason = singo_reason;
	}

	public Calendar getSingo_regdate() {
		return singo_regdate;
	}

	public void setSingo_regdate(Calendar singo_regdate) {
		this.singo_regdate = singo_regdate;
	}

	public singoVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(singoVO paramClass) {
		this.paramClass = paramClass;
	}

	public singoVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(singoVO resultClass) {
		this.resultClass = resultClass;
	}

	public List<Integer> getList_b() {
		return list_b;
	}

	public void setList_b(List<Integer> list_b) {
		this.list_b = list_b;
	}

	public List<Integer> getLineNumberList() {
		return lineNumberList;
	}

	public void setLineNumberList(List<Integer> lineNumberList) {
		this.lineNumberList = lineNumberList;
	}
	
	
	
}
