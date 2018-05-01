package com.sdongwan.graduate.model;

/**
 * 因素实体类
 * 
 * @author 宋东皖
 * @date 2018年4月21日 下午1:32:57
 */
public class Factor {
	private int factorId;
	private String factorName;
	private String remark;
	private String createTime;
	private String updateTime;

	/**
	 * 因素编号
	 * 
	 * @return
	 */
	public int getFactorId() {
		return factorId;
	}

	public void setFactorId(int factorId) {
		this.factorId = factorId;
	}

	/**
	 * 因素名称
	 * 
	 * @return
	 */
	public String getFactorName() {
		return factorName;
	}

	public void setFactorName(String factorName) {
		this.factorName = factorName;
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
