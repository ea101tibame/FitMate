package com.deposit.model;

import java.sql.Timestamp;
import java.util.List;

public class DepService {

	private DepDAO_interface dao;

	public DepService() {
		dao = new DepDAO();
	}

	public DepVO addDep(String depno, String stuno, Timestamp depdate, Integer depprice) {

		DepVO depVO = new DepVO();

		depVO.setDepno(depno);
		depVO.setStuno(stuno);
		depVO.setDepdate(depdate);
		depVO.setDepprice(depprice);

		dao.insert(depVO);

		return depVO;
	}

	public DepVO getOneDep(String depno) {
		return dao.findByPrimaryKey(depno);
	}

	public List<DepVO> getAll() {
		return dao.getAll();
	}
}
