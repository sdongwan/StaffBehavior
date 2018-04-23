package com.sdongwan.graduate.model;
/**
 * 
 * 部门实体类
 * @author      宋东皖
 * @date        2018年4月21日 下午1:32:52
 */
public class Depart {
	private int departId;
	private String postName;
	private int companyId;
	private int staffNum;
	private String createTime;
	
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
	public String getPostName() {
		return postName;
	}
	
	public void setPostName(String postName) {
		this.postName = postName;
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
}
