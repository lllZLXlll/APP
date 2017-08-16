package com.app.util;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Random;

import sun.misc.BASE64Decoder;

public class AppUtil {
	public static BASE64Decoder decoder = new sun.misc.BASE64Decoder();  
	
	
	/**
	 * app端userId验证解密
	 * @param Key
	 * @return
	 * @throws Exception
	 */
	public static String checkUserId(String Key){
		String result=null;
		try {
			DesSecurityUtil desSecurityUtil=new DesSecurityUtil();
			try {
				result=desSecurityUtil.decrypt(Key);
			} catch (Exception e) {
				result="-8";
				e.printStackTrace();
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result="-8";
			e.printStackTrace();
			return result;
			
		}
		if(result != null){
			return result.substring(0, result.indexOf(","));
		}else{
			return "-8";
		}
		
	}
	
	/**
	 * app端userId加密
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public static String encryptUserId(String userId){
		try {
			DesSecurityUtil desSecurityUtil=new DesSecurityUtil();
			return desSecurityUtil.encrypt(userId+","+getRandomString(10));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	

	public static String getRandomString(int length) { //length表示生成字符串的长度  
	    String base = "abcdefghijklmnopqrstuvwxyz0123456789";     
	    Random random = new Random();     
	    StringBuffer sb = new StringBuffer();     
	    for (int i = 0; i < length; i++) {     
	        int number = random.nextInt(base.length());     
	        sb.append(base.charAt(number));     
	    }     
	    return sb.toString();     
	 } 
	
    public static boolean GenerateImage(String imgStr, String imgFilePath) {// 对字节数组字符串进行Base64解码并生成图片
        if (imgStr == null) // 图像数据为空
          return false;
        BASE64Decoder decoder = new BASE64Decoder();
        try {
          // Base64解码
          byte[] bytes = decoder.decodeBuffer(imgStr);
          for (int i = 0; i < bytes.length; ++i) {
            if (bytes[i] < 0) {// 调整异常数据
              bytes[i] += 256;
            }
          }
          // 生成jpeg图片
          OutputStream out = new FileOutputStream(imgFilePath);
          out.write(bytes);
          out.flush();
          out.close();
          return true;
        } catch (Exception e) {
          return false;
        }
      }
    
    public static void main(String[] args) throws Exception {
		System.out.println(encryptUserId("1223566871"));
		System.out.println(checkUserId(encryptUserId("1223566871")));
	}
   
}
