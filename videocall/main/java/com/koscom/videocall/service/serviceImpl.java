package com.koscom.videocall.service;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koscom.videocall.controller.HomeController;
import com.koscom.videocall.dao.Repository;
import com.koscom.videocall.model.ChoiceVO;
import com.koscom.videocall.model.ClientVO;
import com.koscom.videocall.model.FirmVO;
import com.koscom.videocall.model.ProductVO;
import com.koscom.videocall.model.QuestionVO;
import com.koscom.videocall.model.ResvCallVO;

import sample.dao.ResvCallDAO;
import sample.dao.ResvCallDAOImpl;
import sample.dto.ResvCallDTO;


@Service
public class serviceImpl implements service {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	Repository repository;

	public List<ClientVO> getClientList() {
		List<ClientVO> listclntvo = null;
		return listclntvo;
	}

	public int getNextClientId() {
		int nextid = this.repository.getNextClientId();
		return nextid;
	}

	public FirmVO getFirmInfo(int firmno) {
		return this.repository.getFirmInfo(firmno);
	}

	public ClientVO getClientInfo(String clntemail, String pwd) {
		return this.repository.selectetClientInfo(clntemail, pwd);
	}

	public List<FirmVO> getFirmList() {
		List<FirmVO> listfirm = this.repository.getFirmList();
		return listfirm;
	}

	public void insertClient(ClientVO clntvo) {
		this.repository.insertClient(clntvo);
	}

	public int getClientCount(String clntemail) {
		return this.repository.getClientCount(clntemail);
	}

	public int updateClient(ClientVO clntvo) {
		int updateCnt = 0;
		return updateCnt;
	}

	@Override
	public boolean AuthClient(ClientVO clntvo){
		ClientVO repoclntvo = this.repository.selectetClientInfo(clntvo.getClntemail(), clntvo.getPwd());
		try {
		if (repoclntvo.getClntemail() != null && (clntvo.getClntemail().equals(repoclntvo.getClntemail()))) {
			return true;
		} else {
			return false;
		}
		}catch(Exception e) {
			return false;
		}
	}

	public List<QuestionVO> getQuestionList(int firmno) {
		return this.repository.getQuestionList(firmno);
	}

	public List<ChoiceVO> getChoiceList(int firmno) {
		return this.repository.getChoiceList(firmno);
	}
	
	
	public List<ProductVO> getProductListByGrade(int firmno, String invstinclngrd){
		return this.repository.getProductListByGrade(firmno, invstinclngrd);
	}

	@Override
	public int addResvCall(ResvCallVO resvcall) {
		// TODO Auto-generated method stub

		// 예약시작시간은 예약일자 + 예약시간
		String date_s = resvcall.getRsvDt() + resvcall.getRsvSrtTime();
		resvcall.setRsvSrtTime(date_s);
		
		// 예약종료시간은 예약일자 + 예약시간
		date_s = resvcall.getRsvDt() + resvcall.getRsvEndTime();
		
		resvcall.setRsvEndTime(date_s);

		// 최초등록시 통화완료여부.0 
		// resvCall.setCallCmpltYn(request.getParameter("callCmpltYn"));
		resvcall.setCallCmpltYn("0");
		
		// resvCall.setVideoCallNo(request.getParameter("videoCallNo"));
		// sVal = request.getParameter("videoCallNo");
		// 최초등록시 영상통화번호.0 
		resvcall.setVideoCallNo(0);
		int resultCount = this.repository.addResvCall(resvcall);

		return resultCount;
	}

	@Override
	public ResvCallVO getResvCall(String rsvDt, String clntCi, String prdtCode, int firmNo) {
		// TODO Auto-generated method stub
		return this.repository.getResvCall(rsvDt, clntCi, prdtCode, firmNo);
	}

	@Override
	public List<ResvCallVO> getResvCallList(String rsvDt, int firmNo) {

		return this.repository.getResvCallList(rsvDt, firmNo);
	}

	@Override
	public int updateCallCompleteYn(ResvCallVO resvcall) {
		// TODO Auto-generated method stub
		return this.repository.updateCallCompleteYn(resvcall);
	}		

}
