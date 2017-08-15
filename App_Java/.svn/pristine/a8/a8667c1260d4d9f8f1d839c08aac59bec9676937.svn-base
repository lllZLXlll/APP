/**
* 版权所有：深圳法大大网络科技有限公司
* Copyright 2015 fadada.com Inc.
* All right reserved. 
*====================================================
* 文件名称: FddConstant.java
* 修订记录：
* No    日期				作者(操作:具体内容)
* 1.    Dec 18, 2015			Mocuishle(创建:创建文件)
*====================================================
* 类描述：(说明未实现或其它不应生成javadoc的内容)
* 
*/
package com.pjzb.config.fadada;

import com.pjzb.util.PropertiesUtil;

/**
 * <h3>概要:</h3> 
 *    法大大服务配置类
 * <br>
 * <h3>功能:</h3>
 * <ol>
 * 		<li>通过getValue()获取实际值</li>
 * </ol>
 * <h3>履历:</h3>
 * <ol>
 * 		<li>2015年12月17日[zhouxw] 新建</li>
 * </ol>
 */
public enum FddConstant {

	/**
	 * apiId
	 */
	API_ID("200001"),

	/**
	 * 密钥
	 */
	APP_SECRET("zUy2Ag3mM9TLe3lm4oO0WK4J"),

	/**
	 * 版本
	 */
	V("2.0"),
	
	/**
	 * 地址
	 */
	API_URL("http://test.api.fabigbig.com:8888/api/"),
	
	/**
	 * 个人注册，审核
	 */
	URL_SYNCPERSON("syncPerson.action"),
	
	/**
	 * 个人注册，免审核
	 */
	URL_SYNCPERSON_AUTO("syncPerson_auto.action"),
	
	/**
	 * 企业注册，免审核
	 */
	URL_SYNCCOMPANY_AUTO("syncCompany_auto.action"),
	
	/**
	 * 上传文档
	 */
	URL_UPLOADDOCS("uploaddocs.api"),
	
	/**
	 * 手动签署
	 */
	URL_EXTSIGN("extsign.action"),
	
	/**
	 * 自动签署
	 */
	URL_EXTSIGN_AUTO("extsign_auto.action"),
	
	/**
	 * 合同查看
	 */
	URL_Document_View("documentView.action"), 
	/**
	 * 合同归档
	 */
	URL_CONTRACTFILING("contractFiling.action"), 
	/** 身份证检验 */
	URL_CHECKIDCARD("checkIdCard.action"), 
	
	/** 修改用户信息 */
	URL_INFOCHANGE("infochange.action");
	/**
	 * 值
	 */
	private String value;
	
	/**
	 * 概要：FddConstant类的构造函数
	 */
	FddConstant(){};
	/**
	 * 概要：FddConstant类的构造函数
	 * @param val
	 */
	FddConstant(String val){
		this.value = val;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	public static final String FADADA_MIDDLE_CUSTOMER = PropertiesUtil.getProper("fadada_middle_customer");
	
}
