package com.sdongwan.graduate.model;
/**
 * 
 * 
 * @author      宋东皖
 * @date        2018年4月21日 下午1:33:32
 */
public class SysUser {
	private int sysUserId;
	private String account;
	private String password;
	private int companyId;
	private int jobId;
	private String createTime;
	private String updateTime;
	

	public int getSysUserId() {
		return sysUserId;
	}
	
	public void setSysUserId(int sysUserId) {
		this.sysUserId = sysUserId;
	}
	
	
	public String getAccount() {
		return account;
	}
	
	public void setAccount(String account) {
		this.account = account;
	}
	

	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public int getCompanyId() {
		return companyId;
	}
	
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	
	public int getJobId() {
		return jobId;
	}
	
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	
	
	public String getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
}
