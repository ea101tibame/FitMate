package com.redemption.model;

import java.util.List;

public class RedemptionService {
	
	private RedemptionDAO_interface reddao ;
	
	public RedemptionService() {
		reddao = new RedemptionDAO();
	}
	
	public RedemptionVO addRed (String coano , Integer redprice) {
		RedemptionVO redVO = new RedemptionVO();
		redVO.setCoano(coano);
		redVO.setRedprice(redprice);
		reddao.insertRed(redVO);
		return redVO ;
	}
	
	public List<RedemptionVO> showAllRed(String coano){
		return reddao.selectAllRed(coano);
	}
	
	public List<RedemptionVO> showAll(){
		return reddao.selectAll();
	}
	
	public void alterRed (String redno) {
		reddao.updateSta(redno);
	}
}
