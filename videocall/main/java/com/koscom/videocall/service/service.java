package com.koscom.videocall.service;

import java.util.List;

import com.koscom.videocall.model.ChoiceVO;
import com.koscom.videocall.model.ClientVO;
import com.koscom.videocall.model.FirmVO;
import com.koscom.videocall.model.ProductVO;
import com.koscom.videocall.model.QuestionVO;
import com.koscom.videocall.model.ResvCallVO;

public interface service {

	List<ClientVO> getClientList();
	int getClientCount(String email);
	ClientVO getClientInfo(String email, String pwd);
	FirmVO getFirmInfo(int firmno);
	List<FirmVO> getFirmList();
	void insertClient(ClientVO clntvo);
	int updateClient(ClientVO clntvo);
	int getNextClientId();
	boolean AuthClient(ClientVO clntvo);
	List<QuestionVO> getQuestionList(int firmno);
	List<ChoiceVO> getChoiceList(int firmno);
	
	List<ProductVO> getProductListByGrade(int firmno, String invstinclngrd);		

	int addResvCall(ResvCallVO resvcall);	
	ResvCallVO getResvCall(String rsvDt, String clntCi, String prdtCode, int firmNo);
	List<ResvCallVO> getResvCallList(String rsvDt, int firmNo);
	int updateCallCompleteYn(ResvCallVO resvcall);

	
}
