package com.koscom.videocall;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
public class MyTest{
    public static void main(String[] args) throws Exception{
        String articleURL = "https://blog.naver.com/sonagi010/221352727869";   //신문기사 URL
        Document doc = Jsoup.connect(articleURL).get();     // document 객체 생성.
        Elements ele = doc.select("title");          // 아이디가 _article인 div 태그 선택
        String str = ele.text();                            // 값 저장
        System.out.println(str);
    }
}