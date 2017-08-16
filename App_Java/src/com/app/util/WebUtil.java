package com.app.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import net.sf.json.JSONObject;

public class WebUtil {
	public static Log log = LogFactory.getLog(WebUtil.class);

	public static String getBasePath() {
		return getWebPath();

	}

	/**
	 * @MethodName: getWebPath
	 * @Param: WebUtil
	 * @Author: gang.lv
	 * @Date: 2013-5-12 下午10:57:47
	 * @Return:
	 * @Descb: 获取web路径
	 * @Throws:
	 */
	public static String getWebPath() {
		return IConstants.WEB_URL;
	}
	
	public static String getIpArea(String ip) {
		String url = "http://apis.juhe.cn/ip/ip2addr?ip="+ip+"&dtype=&key=0c329e6d0719a08110788ec9f54dd1db";
		HttpClientHelp hch = new HttpClientHelp();
		InputStream is = hch.byGetMethodToInputStream(url);

		// 读取返回内容
		StringBuffer buffer = new StringBuffer();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			String temp;
			while ((temp = br.readLine()) != null) {
				buffer.append(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 		
		log.info("用户注册时查询IP结果:-------> "+buffer.toString());

		String area = "";
		JSONObject json = JSONObject.fromObject(buffer.toString());
		if (json.get("resultcode").equals("200")) { 
			area = json.getJSONObject("result").get("area").toString();
			log.info(ip+":-------> "+area);
		}
		
		return area;
	}
	
}
