package com.koscom.videocall.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.koscom.videocall.model.ChoiceVO;
import com.koscom.videocall.model.ClientVO;
import com.koscom.videocall.model.FirmVO;
import com.koscom.videocall.model.ProductVO;
import com.koscom.videocall.model.QuestionVO;
import com.koscom.videocall.model.ResvCallVO;
import com.koscom.videocall.service.service;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes({ "clntinfo", "firminfo", "invstinclngrd"})
public class HomeController {
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	service serviceImpl;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public View home(Locale locale, Map<String, Object> modelMap) {
		logger.info("Welcome koscom home! The client locale is {}.", locale);
		ClientVO clntvo = new ClientVO();
		modelMap.put("clntvo", clntvo);
		modelMap.put("redirectUrl", "loginform");
		return new RedirectView("{redirectUrl}");
	}

	@RequestMapping(value = "/loginform", method = RequestMethod.GET)
	public String loginform(Locale locale, Map<String, Object> modelMap) {
		logger.info("Welcome loginform! The client locale is {}.", locale);
		ClientVO clntvo = new ClientVO();
		modelMap.put("clntvo", clntvo);
		return "loginForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(ClientVO clntvo, Locale locale, Map<String, Object> modelMap) {
		logger.info("Welcome login! The client locale is {}.", clntvo.toString());

		if (serviceImpl.AuthClient(clntvo) == true) {
			modelMap.put("clntvo", clntvo);
			// 회원정보 쿼리
			ClientVO clntinfo = serviceImpl.getClientInfo(clntvo.getClntemail(), clntvo.getPwd());
			// 회원정보 전달
			modelMap.put("clntinfo", clntinfo);
//			model.addAttribute("clntinfo", clntinfo);
			// 회사리스트 쿼리
			List<FirmVO> listfirm = serviceImpl.getFirmList();
			// 회사리스트 전달
			modelMap.put("listfirm", listfirm);
			return "firmForm";
		} else {
			modelMap.put("clntvo", clntvo);
			modelMap.put("msg", "로그인 오류입나다");
			return "loginForm";
		}
	}

	@RequestMapping(value = "/registerform", method = RequestMethod.GET)
	public String registerform(Locale locale, Map<String, Object> modelMap) {
		logger.info("Welcome registerform! The client locale is {}.", locale);
		ClientVO clntvo = new ClientVO();
		modelMap.put("clntvo", clntvo);
		return "registerForm";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public View register(ClientVO clntvo, Locale locale, Map<String, Object> modelMap) {

		logger.info("Welcome register! The client locale is {}.", locale);
		clntvo.setClntci("tempClientCi");

		clntvo.setClntid(serviceImpl.getNextClientId());
		serviceImpl.insertClient(clntvo);
		clntvo = null;
		modelMap.put("clntvo", clntvo);
		modelMap.put("redirectUrl", "loginform");
		return new RedirectView("{redirectUrl}");
	}

	@RequestMapping(value = "/firmform", method = RequestMethod.GET)
	public String firmform(Locale locale, Map<String, Object> modelMap) {
		logger.info("Welcome firmform! The client locale is {}.", locale);
		List<FirmVO> listfirm = serviceImpl.getFirmList();
		modelMap.put("listfirm", listfirm);
		return "firmForm";
	}

	@RequestMapping(value = "/firm", method = RequestMethod.POST)
	public String firm(
//			@RequestParam(value = "firmno")int firmno,
//			@RequestParam(value = "firmvo")FirmVO firmvo,
			FirmVO firmvo, Locale locale, Map<String, Object> modelMap) {

		logger.info("Welcome firm! The client locale is {}.", locale);

		// 질문 퀴리
		List<QuestionVO> questlist = serviceImpl.getQuestionList(firmvo.getFirmno());
		// 선택지 쿼리
		List<ChoiceVO> choiclist = serviceImpl.getChoiceList(firmvo.getFirmno());
		// 회사정보 쿼리
		FirmVO firmvo1 = serviceImpl.getFirmInfo(firmvo.getFirmno());

//		model.addAttribute("firminfo", firmvo1);
		modelMap.put("firminfo", firmvo1);
		modelMap.put("questlist", questlist);
		modelMap.put("choiclist", choiclist);
		return "questionForm";
	}

	@RequestMapping(value = "/questionform", method = RequestMethod.GET)
	public String questionform(Locale locale, Map<String, Object> modelMap) {
		logger.info("Welcome questionform! The client locale is {}.", locale);
		modelMap.put("invstinclngrd", " ");
		return "questionForm";
	}

	@RequestMapping(value = "/productlist", method = RequestMethod.POST)
	public String productlist(Locale locale, Map<String, Object> modelMap, String invstinclngrd) {
		logger.info("Welcome productlist! The client locale is {}.", locale);
		FirmVO firminfo = (FirmVO) modelMap.get("firminfo");
//		String invstinclngrd = (String) modelMap.get("invstinclngrd");
		System.out.println(firminfo.toString());
		System.out.println(invstinclngrd);
		List<ProductVO> productlist = serviceImpl.getProductListByGrade(firminfo.getFirmno(), invstinclngrd);
		modelMap.put("invstinclngrd", invstinclngrd);
		modelMap.put("productlist", productlist);
		return "productListForm";
	}

	@RequestMapping(value = "/rsrvcallform", method = RequestMethod.POST)
	public String rsrvcallform(Locale locale, Map<String, Object> modelMap, String prdtcode) {
		logger.info("Welcome rsrvcallform! The client locale is {}.", locale);
		modelMap.put("prdtcode", prdtcode);
		ResvCallVO resvcall = null;
		modelMap.put("resvcall", resvcall);
		return "RsrvVideocallForm";
	}
	@RequestMapping(value = "/resvcallinput", method = RequestMethod.POST)
	public String resvcallinput(Locale locale, Map<String, Object> modelMap, ResvCallVO resvcall) {
		logger.info("Welcome resvcallinput! The client locale is {}.", locale);
		
		int result = serviceImpl.addResvCall(resvcall);
		if(result == 1) {
			modelMap.put("resvcall", resvcall);
			modelMap.put("sResult", "등록 성공");   
		}else {
			modelMap.put("sResult", "등록 실패");
		}
		return "RsrvConfirmForm";
	}

//예약 리스트 조회
	@RequestMapping(value = "/resvcalllist", method = RequestMethod.POST)
	public String resvcalllist(Locale locale, Map<String, Object> modelMap, ResvCallVO resvcall) {
		logger.info("Welcome resvcalllist! The client locale is {}.", locale);
		System.out.println(resvcall.toString());
		List<ResvCallVO> resvcalllist = serviceImpl.getResvCallList(resvcall.getRsvDt(), resvcall.getFirmNo());
		modelMap.put("resvcalllist", resvcalllist);
		return "RsrvCallListForm";
	}

	@RequestMapping(value = "/resvcalllistform", method = RequestMethod.GET)
	public String resvcalllistform(Locale locale, Map<String, Object> modelMap, String rsvDt) {
		logger.info("Welcome resvcalllistform! The client locale is {}.", locale);
//		FirmVO firmvo = (FirmVO) modelMap.get("firminfo");
//		System.out.println(rsvDt);
//		List<ResvCallVO> resvcalllist = serviceImpl.getResvCallList(rsvDt, firmvo.getFirmno());
//		modelMap.put("resvcalllist", resvcalllist);
		return "RsrvCallListForm";
	}
//예약 단건 조회
	@RequestMapping(value = "/resvcall", method = RequestMethod.POST)
	public String resvcall(Locale locale, Map<String, Object> modelMap, ResvCallVO resvcall) {
		logger.info("Welcome resvcall! The client locale is {}.", locale);
		FirmVO firmvo = (FirmVO) modelMap.get("firminfo");
		System.out.println(resvcall.toString());

		modelMap.put("resvcall", serviceImpl.getResvCall(resvcall.getRsvDt(), resvcall.getClntCi(), resvcall.getPrdtCode(), firmvo.getFirmno()));
		return "ResvCallListForm";
	}

	@RequestMapping(value = "/checkdupemail", method = RequestMethod.POST)
	@ResponseBody
	public String checkdupemail(Locale locale, @RequestParam("email") String email) throws IOException {
		logger.info("Welcome checkdupemail! The client locale is {}.", locale);
		Map<String, Object> paramMap = new HashMap<String, Object>();

		try { // 중복확인
			paramMap.put("cnt", serviceImpl.getClientCount(email));
//		   return serviceImpl.getClientCount(email);
		} catch (Exception e) {
			e.printStackTrace();
			paramMap.put("cnt", 1);
//		   return 1;
		}
		return (new Gson()).toJson(paramMap);
	}

	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public View logout(Locale locale, Map<String, Object> modelMap, HttpSession session) {
		logger.info("Welcome logout! The client locale is {}.", locale);
		session.invalidate();
		modelMap.put("redirectUrl", "loginform");
		return new RedirectView("{redirectUrl}");
	}

}
