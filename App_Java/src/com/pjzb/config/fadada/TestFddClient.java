/**
* 版权所有：深圳法大大网络科技有限公司
* Copyright 2015 fadada.com Inc.
* All right reserved. 
*====================================================
* 文件名称: TestFddClient.java
* 修订记录：
* No    日期				作者(操作:具体内容)
* 1.    Dec 18, 2015			Mocuishle(创建:创建文件)
*====================================================
* 类描述：(说明未实现或其它不应生成javadoc的内容)
* 
*/
package com.pjzb.config.fadada;

import java.io.File;

/**
 * <h3>概要:</h3> 
 *    FddClient的测试类
 * <br>
 * <h3>功能:</h3>
 * <ol>
 * 		<li>提供对FddClient方法的调用实例</li>
 * </ol>
 * <h3>履历:</h3>
 * <ol>
 * 		<li>2015年12月30日[zhouxw] 新建</li>
 * </ol>
 */
public class TestFddClient {

	public static void main(String[] args) {
		String response  = "Welcome to www.fadada.com!";
		// 个人注册免审核
		response = FddClient.invokeSyncPersonAuto("z010801", "z010801@fdd.com", "431003199101080001", "18926460050");
		// 个人注册需审核
//		response = FddClient.invokeSyncPerson("z12181", "z12181@fdd.com", "431003199112180002", "18926460050");
		// 合同上传
		response = FddClient.invokeUploadDocs("2015122301", new File("D:\\test.docx"), "", ".docx");
		// 手动签署
//		response = FddClient.invokeExtSign("201512181204", "2015121801", "", "www.baidu.com", "1", "647FD6190628006B", "test", "", "","");
		// 自动签署
		response = FddClient.invokeExtSignAuto("201512181212", "647FD6190628006B", "", "", "1", "3", "2015121801",  "test", "1121", "", "");
		// 合同归档
		response = FddClient.invokeContractFilling("2015121801");
		
		System.out.println(response);
	}

	
}
