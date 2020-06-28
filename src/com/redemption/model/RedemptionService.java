package com.redemption.model;

import java.util.List;

public class RedemptionService {
	
	private RedemptionDAO_interface reddao ;
	
	public RedemptionService() {
		reddao = new RedemptionDAO();
	}
	
	public RedemptionVO addRed (String coano , Integer redprice , String redsta) {
		RedemptionVO redVO = new RedemptionVO();
		redVO.setCoano(coano);
		redVO.setRedprice(redprice);
		redVO.setRedsta(redsta);
		reddao.insertRed(redVO);
		return redVO ;
	}
	
	public List<RedemptionVO> showAllRed(String coano){
		return reddao.selectAllRed(coano);
	}
}
