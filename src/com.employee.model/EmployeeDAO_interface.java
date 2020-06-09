package com.employee.model;

import java.util.List;

public interface EmployeeDAO_interface {
	
	public void insertEmp (EmployeeVO EmployeeVO);
	public void modifyEmpSta (EmployeeVO EmployeeVO);
	public void deleteEmp (String empno);
	public EmployeeVO selectByEmpno (String empno);
	public List<EmployeeVO> selectAllEmp();
}
