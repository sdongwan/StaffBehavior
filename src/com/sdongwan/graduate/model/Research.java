package com.sdongwan.graduate.model;
/**
* 问卷调查题目
* @author sdongwan 
* @version 创建时间：2018年4月29日 下午6:51:24
*/
public class Research {
	private int researchId;
	private String question;
	private String createTime;
	private String updateTime;
	private int factorId;
	private int validFlag;
	
	private Factor factor;
	
	/**
	 * 编号
	 * @return
	 */
	public int getResearchId() {
		return researchId;
	}
	public void setResearchId(int researchId) {
		this.researchId = researchId;
	}
	
	/**
	 * 问题
	 * @return
	 */
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
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
	
	/**
	 * 因素编号
	 * @return
	 */
	public int getFactorId() {
		return factorId;
	}
	
	public void setFactorId(int factorId) {
		this.factorId = factorId;
	}
	
	/**
	 * 问卷调查问题启用标志
	 * @return
	 */
	public int getValidFlag() {
		return validFlag;
	}
	public void setValidFlag(int validFlag) {
		this.validFlag = validFlag;
	}
	
	public Factor getFactor() {
		return factor;
	}
	public void setFactor(Factor factor) {
		this.factor = factor;
	}
}
