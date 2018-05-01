package com.sdongwan.graduate.model;
/**
 * 
 * 部门实体类
 * @author      宋东皖
 * @date        2018年4月21日 下午1:32:52
 */
public class Depart {
	private int departId;
	private String departName;
	private int companyId;
	private int staffNum;
	private String createTime;
	private String updateTime;
	private String remark;
	
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
	 * 部门编号
	 * @return
	 */
	public int getDepartId() {
		return departId;
	}
	
	public void setDepartId(int departId) {
		this.departId = departId;
	}
	
	/**
	 * 部门名称
	 * @return
	 */
	public String getDepartName() {
		return departName;
	}

	public void setDepartName(String departName) {
		this.departName = departName;
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
	 * 员工数量
	 * @return
	 */
	public int getStaffNum() {
		return staffNum;
	}
	
	public void setStaffNum(int staffNum) {
		this.staffNum = staffNum;
	}
	
	/**
	 * 成立时间
	 * @return
	 */
	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
