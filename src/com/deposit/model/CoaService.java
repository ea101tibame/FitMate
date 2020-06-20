package com.deposit.model;

import java.util.List;

public class CoaService {

	private CoaDAO_interface dao;

	public CoaService() {
		dao = new CoaJDBCDAO();
	}

	public CoaVO addCoa(String coaname, String coapsw, String coamail, String coatel, String coaacc, Integer coapoint,
			String coasta, byte[] coapic, String coasex, Integer coasctotal, Integer coascqty ) {

		CoaVO coaVO = new CoaVO();

		coaVO.setCoaname(coaname);
		coaVO.setCoapsw(coapsw);
		coaVO.setCoamail(coamail);
		coaVO.setCoatel(coatel);
		coaVO.setCoaacc(coaacc);
		coaVO.setCoapoint(coapoint);
		coaVO.setCoasta(coasta);
		coaVO.setCoapic(coapic);
		coaVO.setCoasex(coasex);
		coaVO.setCoasctotal(coasctotal);
		coaVO.setCoascqty(coascqty);

		dao.insert(coaVO);

		return coaVO;
	}

	public CoaVO updateCoa(String coano, String coaname, String coapsw, String coamail, String coatel, String coaacc, Integer coapoint,
			String coasta, byte[] coapic, String coasex, Integer coasctotal, Integer coascqty) {

		CoaVO coaVO = new CoaVO();

		coaVO.setCoaname(coaname);
		coaVO.setCoapsw(coapsw);
		coaVO.setCoamail(coamail);
		coaVO.setCoatel(coatel);
		coaVO.setCoaacc(coaacc);
		coaVO.setCoapoint(coapoint);
		coaVO.setCoasta(coasta);
		coaVO.setCoapic(coapic);
		coaVO.setCoasex(coasex);
		coaVO.setCoasctotal(coasctotal);
		coaVO.setCoascqty(coascqty);
		dao.update(coaVO);

		return coaVO;
	}

	public void deleteCoa(String coano) {
		dao.delete(coano);
	}

	public CoaVO getOneCoa(String coano) {
		return dao.findByPrimaryKey(coano);
	}

	public List<CoaVO> getAll() {
		return dao.getAll();
	}
}
