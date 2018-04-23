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
	private int companyId;
	private int departId;

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
	 * 公司编号
	 * 
	 * @return
	 */
	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	/**
	 * 岗位编号
	 * 
	 * @return
	 */
	public int getDepartId() {
		return departId;
	}

	public void setDepartId(int departId) {
		this.departId = departId;
	}
}
