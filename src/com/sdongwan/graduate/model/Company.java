package com.sdongwan.graduate.model;
/**
 * 公司实体类
 * 
 * @author      宋东皖
 * @date        2018年4月21日 下午1:32:45
 */
public class Company {
	private int companyId;
	private String companyName;
	private String companyAddress;
	private String companyPhone;
	private String createTime;
	private String updateTime;
	private String remark;
	
	
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
	 * 公司名称
	 * @return
	 */
	public String getCompanyName() {
		return companyName;
	}
	
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	/**
	 * 公司地址ַ
	 * @return
	 */
	public String getCompanyAddress() {
		return companyAddress;
	}
	
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	
	/**
	 * 公司电话
	 * @return
	 */
	public String getCompanyPhone() {
		return companyPhone;
	}
	
	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}
	
	/**
	 * 创建时间
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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
