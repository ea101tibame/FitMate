package com.employee.model;

import java.util.List;

public class EmployeeService {
	
	private EmployeeDAO_interface empdao ;
	
	//servlet呼叫的service
	public EmployeeService() {
		empdao = new EmployeeDAO();
	}
	
	public EmployeeVO addEmp (String ename , String eacc , String epsw , String esta) {
		EmployeeVO empVO = new EmployeeVO();
		empVO.setEname(ename);
		empVO.setEacc(eacc);
		empVO.setEpsw(epsw);
		empVO.setEsta(esta);
		empdao.insertEmp(empVO);
		return empVO ;
	}
	
	public EmployeeVO alterEmp (String ename , String eacc , String epsw , String esta , String empno) {
		EmployeeVO empVO = new EmployeeVO();
		empVO.setEname(ename);
		empVO.setEacc(eacc);
		empVO.setEpsw(epsw);
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
}
