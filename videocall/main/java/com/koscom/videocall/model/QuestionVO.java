package com.koscom.videocall.model;

public class QuestionVO {
	private int 	firmno		;
	private String 	qstnrver	;
	private int 	qstnrno		;
	private String 	qstnrvar	;
	private String 	qstnrquest	;
	private int 	qstnrqty	; 
	private String 	answrdupyn	; 
	private int 	asgnscore	;
	private String 	useyn		;
	private String 	regdate		;
	public int getFirmno() {
		return firmno;
	}
	public void setFirmno(int firmno) {
		this.firmno = firmno;
	}
	public String getQstnrver() {
		return qstnrver;
	}
	public void setQstnrver(String qstnrver) {
		this.qstnrver = qstnrver;
	}
	public int getQstnrno() {
		return qstnrno;
	}
	public void setQstnrno(int qstnrno) {
		this.qstnrno = qstnrno;
	}
	public String getQstnrvar() {
		return qstnrvar;
	}
	public void setQstnrvar(String qstnrvar) {
		this.qstnrvar = qstnrvar;
	}
	public String getQstnrquest() {
		return qstnrquest;
	}
	public void setQstnrquest(String qstnrquest) {
		this.qstnrquest = qstnrquest;
	}
	public int getQstnrqty() {
		return qstnrqty;
	}
	public void setQstnrqty(int qstnrqty) {
		this.qstnrqty = qstnrqty;
	}
	public String getAnswrdupyn() {
		return answrdupyn;
	}
	public void setAnswrdupyn(String answrdupyn) {
		this.answrdupyn = answrdupyn;
	}
	public int getAsgnscore() {
		return asgnscore;
	}
	public void setAsgnscore(int asgnscore) {
		this.asgnscore = asgnscore;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "QuestionVO [firmno=" + firmno + ", qstnrver=" + qstnrver + ", qstnrno=" + qstnrno + ", qstnrvar="
				+ qstnrvar + ", qstnrquest=" + qstnrquest + ", qstnrqty=" + qstnrqty + ", answrdupyn=" + answrdupyn
				+ ", asgnscore=" + asgnscore + ", useyn=" + useyn + ", regdate=" + regdate + "]";
	}

	
}





