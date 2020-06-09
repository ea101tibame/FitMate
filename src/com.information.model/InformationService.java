package com.information.model;

import java.sql.Date;
import java.util.List;

public class InformationService {

	private InformationDAO_interface infdao ;
	
	public InformationService() {
		infdao = new InformationDAO();
	}
	
	public InformationVO addInf(Date indate , String indesc) {
		InformationVO infVO = new InformationVO();
		infVO.setIndate(indate);
		infVO.setIndesc(indesc);
		infdao.insertInfo(infVO);
		return infVO ;
	}
	
	public InformationVO alterInf (Date indate , String indesc , String inno) {
		InformationVO infVO = new InformationVO();
		infVO.setIndate(indate);
		infVO.setIndesc(indesc);
		infVO.setInno(inno);
		infdao.modifyInfo(infVO);
		return infVO ;
	}
	
	public void byeInf (String inno) {
		infdao.deleteInfo(inno);
	}
	
	public InformationVO getOneInf (String inno) {
		return infdao.selectByInno(inno);
	}
	
	public List<InformationVO> getAllInf (){
		return infdao.selectAllInfo();
	}
}
