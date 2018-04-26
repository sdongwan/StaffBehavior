package com.sdongwan.graduate.model;
/**
 * 员工实体类
 * 
 * @author      宋东皖
 * @date        2018年4月21日 下午1:33:10
 */
public class Staff {
	private int staffId;
	private int departId;
	private int companyId;
	private String staffName;
	private String account;
	private String password;
	private int jobId;
	private int workYear;
	private String enterTime;
	private String gender;
	private String salary;
	private int age;
	private String education;
	private String graduateSchool;
	private String married;
	private String birthday;
	
	/**
	 * 员工编号
	 * @return
	 */
	public int getStaffId() {
		return staffId;
	}
	
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	
	/**
	 * 
	 * @return
	 */
	public int getDepartId() {
		return departId;
	}
	
	public void setDepartId(int departId) {
		this.departId = departId;
	}
	
	/**
	 * 公司编号
	 * @return
	 */
	public int getCompanyId() {
		return companyId;
	}
	
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	
	/**
	 * 员工姓名
	 * @return
	 */
	public String getStaffName() {
		return staffName;
	}
	
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	
	/**
	 * 职位编号
	 * @return
	 */
	public int getJobId() {
		return jobId;
	}
	
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	
	/**
	 * 工作年限
	 * @return
	 */
	public int getWorkYear() {
		return workYear;
	}
	
	public void setWorkYear(int workYear) {
		this.workYear = workYear;
	}
	
	/**
	 * 系统登陆账号
	 * @return
	 */
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	/**
	 * 系统登陆密码
	 * @return
	 */
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 入职时间
	 * @return
	 */
	public String getEnterTime() {
		return enterTime;
	}

	public void setEnterTime(String enterTime) {
		this.enterTime = enterTime;
	}
	
	/**
	 * 年龄
	 * @return
	 */
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * 工资
	 * @return
	 */
	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	/**
	 * 年龄
	 * @return
	 */
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	/**
	 * 学历
	 * @return
	 */
	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	
	/**
	 * 毕业院校
	 * @return
	 */
	public String getGraduateSchool() {
		return graduateSchool;
	}

	public void setGraduateSchool(String graduateSchool) {
		this.graduateSchool = graduateSchool;
	}

	/**
	 * 婚姻
	 * @return
	 */
	public String getMarried() {
		return married;
	}

	public void setMarried(String married) {
		this.married = married;
	}

	/**
	 * 出生日期
	 * @return
	 */
	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
}
