package com.member.entity;

public class Member {
	private String memId;
	private String memName;
	private String memPwd;
	
	public Member() {
		super();
	}
	
	public Member(String memId, String memName, String memPwd) {
		super();
		this.memId = memId;
		this.memName = memName;
		this.memPwd = memPwd;
	}
	
	public Member(String memId, String memPwd) {
		this(memId, null, memPwd);
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	@Override
	public String toString() {
		return "Member [memId=" + memId + ", memName=" + memName + ", memPwd=" + memPwd + "]";
	}
	
	
}
