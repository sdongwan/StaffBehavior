package com.sdongwan.graduate.model;
/**
 * 职位实体类
 * 
 * @author      宋东皖
 * @date        2018年4月21日 下午1:33:03
 */
public class Job {
	private int jobId;
	private String jobName;
	private int departId;
	private String createTime;
	private String updateTime;
	private String remark;
	
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
	 * 职位名称
	 * @param jobName
	 */
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	
	public String getJobName() {
		return jobName;
	}
	
	/**
	 * 职位成立时间
	 * @return
	 */
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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
