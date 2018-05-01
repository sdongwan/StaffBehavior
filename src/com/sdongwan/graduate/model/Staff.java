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
	private int gender;
	private String salary;
	private String education;
	private String graduateSchool;
	private int married;
	private String birthday;
	private String remark;
	private String createTime;
	private String updateTime;
	private String hometown;
	
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
	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
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
	public int getMarried() {
		return married;
	}

	public void setMarried(int married) {
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
	
	/**
	 * 备注
	 * @return
	 */
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	/**
	 * 创建日期
	 * @return
	 */
	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	/**
	 * 修改日期
	 * @return
	 */
	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * 籍贯
	 * @return
	 */
	public String getHometown() {
		return hometown;
	}

	public void setHometown(String hometown) {
		this.hometown = hometown;
	}
	
}
