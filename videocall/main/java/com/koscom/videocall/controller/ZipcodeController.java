package com.koscom.videocall.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Locale;

import org.apache.log4j.helpers.Loader;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.koscom.videocall.model.ZipCodeSearchVO;
import com.koscom.videocall.model.ZipcodeVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class ZipcodeController {
	@Autowired
	public static final String ZIPCODE_API_KEY = "c9165a2246a5c7fdd1536623879242";
	public static final String ZIPCODE_API_URL = "http://biz.epost.go.kr/KpostPortal/openapi"; // 요청 URL
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * 우편번호 화면
	 * 
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/zipcode")
	public String zipcode() throws Exception {

		return "zipcode/zipcode";
	}

	/**
	 * 우편번호 검색 결과
	 * 
	 * @param searchTO
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/zipcode/list", method = RequestMethod.POST, produces = "text/planin;charset=UTF-8")
	public @ResponseBody String zip_codeList(Locale locale, @RequestParam("query") String query) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		StringBuilder queryUrl = new StringBuilder();
		queryUrl.append(ZIPCODE_API_URL);
		queryUrl.append("?regkey=");
		queryUrl.append(ZIPCODE_API_KEY);
		queryUrl.append("&target=");
		queryUrl.append("postNew");
		queryUrl.append("&query=");
		queryUrl.append(query.replaceAll(" ", ""));

		logger.info("Welcome koscom zipcode_list! The client locale is {}{}.", locale,queryUrl);
		// document 선언
		Document document = Jsoup.connect(queryUrl.toString()).get();
		// errorCode 선언
		String errorCode = document.select("error_code").text();

		if (null == errorCode || "".equals(errorCode)) {
			Elements elements = document.select("item");
			List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
			ZipcodeVO zipcodeVO = null;

			for (Element element : elements) {
				zipcodeVO = new ZipcodeVO();
				zipcodeVO.setZipcode(element.select("postcd").text());
				// 지번 검색
				zipcodeVO.setAddress(element.select("address").text());
				list.add(zipcodeVO);
			}
			// list 결과 put
			paramMap.put("list", list);
		} else {
			String errorMessage = document.select("message").text();
			paramMap.put("errorCode", errorCode);
			paramMap.put("errorMessage", errorMessage);
		}
		// Gson형태로 paramMap 리턴
		return (new Gson()).toJson(paramMap);
	}
}