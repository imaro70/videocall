package com.koscom.videocall.model;

public class ResvCallVO {
	private String 	rsvDt;
	private String	clntCi;
	private String	prdtCode;
	private int 	firmNo;
	private String	hpNo;
	private String	rsvSrtTime;
	private String	rsvEndTime;
	private String	callCmpltYn;
	private int 	videoCallNo;
	public String getRsvDt() {
		return rsvDt;
	}
	public void setRsvDt(String rsvDt) {
		this.rsvDt = rsvDt;
	}
	public String getClntCi() {
		return clntCi;
	}
	public void setClntCi(String clntCi) {
		this.clntCi = clntCi;
	}
	public String getPrdtCode() {
		return prdtCode;
	}
	public void setPrdtCode(String prdtCode) {
		this.prdtCode = prdtCode;
	}
	public int getFirmNo() {
		return firmNo;
	}
	public void setFirmNo(int firmNo) {
		this.firmNo = firmNo;
	}
	public String getHpNo() {
		return hpNo;
	}
	public void setHpNo(String hpNo) {
		this.hpNo = hpNo;
	}
	public String getRsvSrtTime() {
		return rsvSrtTime;
	}
	public void setRsvSrtTime(String rsvSrtTime) {
		this.rsvSrtTime = rsvSrtTime;
	}
	public String getRsvEndTime() {
		return rsvEndTime;
	}
	public void setRsvEndTime(String rsvEndTime) {
		this.rsvEndTime = rsvEndTime;
	}
	public String getCallCmpltYn() {
		return callCmpltYn;
	}
	public void setCallCmpltYn(String callCmpltYn) {
		this.callCmpltYn = callCmpltYn;
	}
	public int getVideoCallNo() {
		return videoCallNo;
	}
	public void setVideoCallNo(int videoCallNo) {
		this.videoCallNo = videoCallNo;
	}
	@Override
	public String toString() {
		return "ResvCallVO [rsvDt=" + rsvDt + ", clntCi=" + clntCi + ", prdtCode=" + prdtCode + ", firmNo=" + firmNo
				+ ", hpNo=" + hpNo + ", rsvSrtTime=" + rsvSrtTime + ", rsvEndTime=" + rsvEndTime + ", callCmpltYn="
				+ callCmpltYn + ", videoCallNo=" + videoCallNo + "]";
	}
}
