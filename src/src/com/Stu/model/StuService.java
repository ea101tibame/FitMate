package com.Stu.model;

import java.util.List;

public class StuService {

	private StuDAO_interface dao;

	public StuService() {
		dao = new StuJDBCDAO();
	}

	public StuVO addStu(String stuname, String stupsw, String stumail, String stutel, String stuadd, Integer stupoint,
			String stusta, String stusex, java.sql.Date stubir, byte[] stupic) {

		StuVO stuVO = new StuVO();

		stuVO.setStuname(stuname);
		stuVO.setStupsw(stupsw);
		stuVO.setStumail(stumail);
		stuVO.setStutel(stutel);
		stuVO.setStuadd(stuadd);
		stuVO.setStupoint(stupoint);
		stuVO.setStusta(stusta);
		stuVO.setStusex(stusex);
		stuVO.setStubir(stubir);
		stuVO.setStupic(stupic);
		dao.insert(stuVO);

		return stuVO;
	}

	public StuVO updateStu(Integer s_no, String stuname, String stupsw, String stumail, String stutel, String stuadd,
			Integer stupoint, String stusta, String stusex, java.sql.Date stubir, byte[] stupic) {

		StuVO stuVO = new StuVO();

		stuVO.setStuname(stuname);
		stuVO.setStupsw(stupsw);
		stuVO.setStumail(stumail);
		stuVO.setStutel(stutel);
		stuVO.setStuadd(stuadd);
		stuVO.setStupoint(stupoint);
		stuVO.setStusta(stusta);
		stuVO.setStusex(stusex);
		stuVO.setStubir(stubir);
		stuVO.setStupic(stupic);
		dao.update(stuVO);

		return stuVO;
	}

	public void deleteStu(String stuno) {
		dao.delete(stuno);
	}

	public StuVO getOneStu(String stuno) {
		return dao.findByPrimaryKey(stuno);
	}

	public List<StuVO> getAll() {
		return dao.getAll();
	}
}
