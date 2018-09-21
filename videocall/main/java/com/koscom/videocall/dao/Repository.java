package com.koscom.videocall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.koscom.videocall.model.ChoiceVO;
import com.koscom.videocall.model.ClientVO;
import com.koscom.videocall.model.FirmVO;
import com.koscom.videocall.model.ProductVO;
import com.koscom.videocall.model.QuestionVO;
import com.koscom.videocall.model.ResvCallVO;


public interface Repository {
	
	void insertClient(ClientVO clntvo);
	ClientVO selectetClientInfo(@Param("clntemail") String clntemail, @Param("pwd") String pwd);
	List<ClientVO> getAllClients();
	void updateclient(ClientVO clntvo);
	void deleteClient(ClientVO clntvo);
	String getPassword(String clntemail);
	int getClientCount(String clntemail);
	List<FirmVO> getFirmList();
	int getNextClientId();
	List<ChoiceVO> getChoiceList(int firmno);
	List<QuestionVO> getQuestionList(int firmno);
	FirmVO getFirmInfo(int firmno);

//interface ProductVO	
//	ProductVO getProduct(@Param("prdtCode")String prdtCode, @Param("firmNo")int firmNo);
//	List<ProductVO> getProductList(int firmNo);
	List<ProductVO> getProductListByGrade(@Param("firmno") int firmno, @Param("invstinclngrd")String invstinclngrd);		

	
//interface ResvCallDAO	
	int addResvCall(ResvCallVO resvcall);	
	ResvCallVO getResvCall(@Param("rsvDt")String rsvDt, @Param("clntCi")String clntCi, @Param("prdtCode")String prdtCode, @Param("firmNo")int firmNo);
	List<ResvCallVO> getResvCallList(@Param("rsvDt")String rsvDt, @Param("firmNo")int firmNo);
	int updateCallCompleteYn(ResvCallVO resvcall);

	
	
}