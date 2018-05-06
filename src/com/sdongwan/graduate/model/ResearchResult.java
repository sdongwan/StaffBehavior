package com.sdongwan.graduate.model;
/**
* @author sdongwan 
* @version 创建时间：2018年5月6日 下午2:04:13
*/
public class ResearchResult {
	private int resultId;
	private int researchId;
	private int staffId;
	private String researchReply;
	private String createTime;
	
	public int getResultId() {
		return resultId;
	}
	
	public void setResultId(int resultId) {
		this.resultId = resultId;
	}
	
	public int getResearchId() {
		return researchId;
	}
	
	public void setResearchId(int researchId) {
		this.researchId = researchId;
	}
	
	public int getStaffId() {
		return staffId;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	
	public String getResearchReply() {
		return researchReply;
	}
	public void setResearchReply(String researchReply) {
		this.researchReply = researchReply;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
}
