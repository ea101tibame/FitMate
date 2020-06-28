package com.redemption.model;

import java.sql.Timestamp;
import java.util.List;

public class RedService {

	private RedDAO_interface dao;

	public RedService() {
		dao = new RedDAO();
	}

	public RedVO addRed(String redno, String coano, Timestamp reddate, Integer redprice) {

		RedVO redVO = new RedVO();

		redVO.setRedno(redno);
		redVO.setCoano(coano);
		redVO.setReddate(reddate);
		redVO.setRedprice(redprice);

		dao.insert(redVO);

		return redVO;
	}

	public RedVO getOneDep(String redno) {
		return dao.findByPrimaryKey(redno);
	}

	public List<RedVO> getAll() {
		return dao.getAll();
	}
}
