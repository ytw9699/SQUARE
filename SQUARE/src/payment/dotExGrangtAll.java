package payment;
import com.opensymphony.xwork2.ActionSupport;

import com.ibatis.sqlmap.client.SqlMapClient; 

import java.util.*;
import java.io.IOException;
import config.SqlMapper;

public class dotExGrangtAll extends ActionSupport {
	public static SqlMapClient sqlMapper;

	private List<dot_exchangeVO> list = new ArrayList<dot_exchangeVO>();
	 
	public dotExGrangtAll() throws IOException {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception {
	list = sqlMapper.queryForList("selectExGrangtAll");
	//SELECT * FROM dot_charge where dc_status = 0
		for (int i = 0; i < list.size(); i++) {
			sqlMapper.update("memberDot_minus", list.get(i));//dot_chargeVO
	    }
	sqlMapper.update("grantDe_dated");//승인날짜 일괄 바꾸기
	//update dot_charge set dc_dated = sysdate where dc_status = 0
	sqlMapper.update("grantDe_status");//승인상태 일괄 바꾸기
	//update dot_charge set dc_status = 1

	return SUCCESS;
	} 
}