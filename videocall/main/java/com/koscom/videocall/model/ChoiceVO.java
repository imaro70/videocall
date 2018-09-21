package com.koscom.videocall.model;

public class ChoiceVO {

	private String firmno; 
	private String qstnrver;
	private String qstnrno;
	private String choicitemno;
	private String choicitemcnts;
	private String choicscore;
	public String getFirmno() {
		return firmno;
	}
	public void setFirmno(String firmno) {
		this.firmno = firmno;
	}
	public String getQstnrver() {
		return qstnrver;
	}
	public void setQstnrver(String qstnrver) {
		this.qstnrver = qstnrver;
	}
	public String getQstnrno() {
		return qstnrno;
	}
	public void setQstnrno(String qstnrno) {
		this.qstnrno = qstnrno;
	}
	public String getChoicitemno() {
		return choicitemno;
	}
	public void setChoicitemno(String choicitemno) {
		this.choicitemno = choicitemno;
	}
	public String getChoicitemcnts() {
		return choicitemcnts;
	}
	public void setChoicitemcnts(String choicitemcnts) {
		this.choicitemcnts = choicitemcnts;
	}
	public String getChoicscore() {
		return choicscore;
	}
	public void setChoicscore(String choicscore) {
		this.choicscore = choicscore;
	}
	@Override
	public String toString() {
		return "ChoiceVO [firmno=" + firmno + ", qstnrver=" + qstnrver + ", qstnrno=" + qstnrno + ", choicitemno="
				+ choicitemno + ", choicitemcnts=" + choicitemcnts + ", choicscore=" + choicscore + "]";
	}
	

	
}




