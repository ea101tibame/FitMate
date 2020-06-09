package com.employee.model;

public class EmployeeVO implements java.io.Serializable{
	
	private String empno ;
	private String ename ;
	private String eacc ;
	private String epsw ;
	private byte[ ] epic ;		//圖片陣列
	private String esta ;
	
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getEacc() {
		return eacc;
	}
	public void setEacc(String eacc) {
		this.eacc = eacc;
	}
	public String getEpsw() {
		return epsw;
	}
	public void setEpsw(String epsw) {
		this.epsw = epsw;
	}
	public byte[] getEpic() {
		return epic;
	}
	public void setEpic(byte[] epic) {
		this.epic = epic;
	}
	public String getEsta() {
		return esta;
	}
	public void setEsta(String esta) {
		this.esta = esta;
	}
	
	
}