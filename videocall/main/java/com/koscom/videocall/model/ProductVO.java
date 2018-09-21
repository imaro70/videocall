package com.koscom.videocall.model;

public class ProductVO {
	private String 	prdtcode;
	private int 	firmno;	
	private String	prdtnm;
	private String	invstinclngrd;
	private String	mgmtpsnnm;
	private String	opsrtdt;
	private String	openddt;
	private int 	opamt;
	
	public String getPrdtcode() {
		return prdtcode;
	}
	public void setPrdtcode(String prdtcode) {
		this.prdtcode = prdtcode;
	}
	public int getFirmno() {
		return firmno;
	}
	public void setFirmno(int firmno) {
		this.firmno = firmno;
	}
	public String getPrdtnm() {
		return prdtnm;
	}
	public void setPrdtnm(String prdtnm) {
		this.prdtnm = prdtnm;
	}
	public String getInvstinclngrd() {
		return invstinclngrd;
	}
	public void setInvstinclngrd(String invstinclngrd) {
		this.invstinclngrd = invstinclngrd;
	}
	public String getMgmtpsnnm() {
		return mgmtpsnnm;
	}
	public void setMgmtpsnnm(String mgmtpsnnm) {
		this.mgmtpsnnm = mgmtpsnnm;
	}
	public String getOpsrtdt() {
		return opsrtdt;
	}
	public void setOpsrtdt(String opsrtdt) {
		this.opsrtdt = opsrtdt;
	}
	public String getOpenddt() {
		return openddt;
	}
	public void setOpenddt(String openddt) {
		this.openddt = openddt;
	}
	public int getOpamt() {
		return opamt;
	}
	public void setOpamt(int opamt) {
		this.opamt = opamt;
	}
	@Override
	public String toString() {
		return "ProductVO [prdtcode=" + prdtcode + ", firmno=" + firmno + ", prdtnm=" + prdtnm + ", invstinclngrd="
				+ invstinclngrd + ", mgmtpsnnm=" + mgmtpsnnm + ", opsrtdt=" + opsrtdt + ", openddt=" + openddt
				+ ", opamt=" + opamt + "]";
	}
}
