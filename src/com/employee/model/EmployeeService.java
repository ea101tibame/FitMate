package com.employee.model;

import java.sql.Date;
import java.util.List;

public class EmployeeService {
	
	private EmployeeDAO_interface empdao ;
	
	public EmployeeService() {
		empdao = new EmployeeDAO();
	}
	
	public EmployeeVO addEmp (String ename , String eacc ,String email, Date edate, byte[]epic, String esta) {
		EmployeeVO empVO = new EmployeeVO();
		empVO.setEname(ename);
		empVO.setEacc(eacc);
		empVO.setEmail(email);
		empVO.setEdate(edate);
		empVO.setEpic(epic);
		empVO.setEsta(esta);
		
		String epsw = empdao.insertEmp(empVO);	//insertEmp有回傳 String epsw
		
		MailService mSvc = new MailService();
		mSvc.getNewPsw(empVO, epsw);
		
		return empVO ;
	}
	
	public EmployeeVO alterEmp (String ename , String eacc , String epsw , String email, Date edate, byte[]epic, String esta , String empno) {
		EmployeeVO empVO = new EmployeeVO();
		empVO.setEname(ename);
		empVO.setEacc(eacc);
		empVO.setEpsw(epsw);
		empVO.setEmail(email);
		empVO.setEdate(edate);
		empVO.setEpic(epic);
		empVO.setEsta(esta);
		empVO.setEmpno(empno);
		empdao.modifyEmpSta(empVO);
		return empVO ;
	}
	
	public void byeEmp (String empno) {
		empdao.deleteEmp(empno);
	}
	
	public EmployeeVO getOneEmp(String empno) {
		return empdao.selectByEmpno(empno);
	}
	
	public List<EmployeeVO> getAllEmp(){
		return empdao.selectAllEmp();
	}
	
	public EmployeeVO forgetPsw (String eacc , String email) {
		return empdao.forgetPsw(eacc, email);
	}
	
	public EmployeeVO loginCheck (String eacc) {
		return empdao.selectByEacc(eacc);
	}
}
