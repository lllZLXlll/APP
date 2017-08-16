package com.app.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * http请求工具类
 */
public class HttpUtil {
	private static Log log = LogFactory.getLog(HttpUtil.class);

	/**
	 * 发送请求 ,返回请求结果
	 */
	public static String http(String url, Map<String, String> params) {
		URL u = null;
		HttpURLConnection con = null;
		StringBuffer sb = new StringBuffer();
		if (params != null) {
//			log.info("接口参数发送开始");
			for (Entry<String, String> e : params.entrySet()) {
				sb.append(e.getKey());
				sb.append("=");
				sb.append(e.getValue());
				sb.append("&");
//				log.info(e.getKey() + "=============" + e.getValue());
			}
//			log.info("接口参数发送结束");
			sb.deleteCharAt(sb.length() - 1);
			log.info("发送接口参数："+sb);
		} 
		// 发送请求
		try {
			u = new URL(url);
			con = (HttpURLConnection) u.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setUseCaches(false);
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
			OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream(), "UTF-8");
			osw.write(sb.toString());
			osw.flush();
			osw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				con.disconnect();
			}
		}

		// 读取返回内容
		StringBuffer buffer = new StringBuffer();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String temp;
			while ((temp = br.readLine()) != null) {
				buffer.append(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}
}
