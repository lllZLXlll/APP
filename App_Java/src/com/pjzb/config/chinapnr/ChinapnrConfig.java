package com.pjzb.config.chinapnr;

import java.util.HashMap;
import java.util.Map;

import com.pjzb.util.PropertiesUtil;

public class ChinapnrConfig {

	// 汇付版本号
	public static final String CHINAPNR_VERSION = PropertiesUtil.getProper("chinapnr_version");

	// 商户号
	public static final String CHINAPNR_MERCUSTID = PropertiesUtil.getProper("chinapnr_merCustId");

	public static final String CHINAPNR_MERID = PropertiesUtil.getProper("chinapnr_merId");

	public static final String CHINAPNR_MERKEYFILE = PropertiesUtil.getProper("chinapnr_merKeyFile");

	public static final String PNRURL = PropertiesUtil.getProper("chinapnr_gateway");

	public static final String pushToRongtu = PropertiesUtil.getProper("pushToRongtu");

	public static String GEE_ID = PropertiesUtil.getProper("gee_id");
	public static String GEE_KEY = PropertiesUtil.getProper("gee_key");

	public static String LIMITIP= PropertiesUtil.getProper("limitIP");

	public static String GIVINGEXGO= PropertiesUtil.getProper("givingExgo");

	public static final String POST = "post";

	public static final String B2C = "B2C";

	public static final String RESPCODE = "RespCode";

	public static final String RESPDESC = "RespDesc";

	public static final String UTF_8 = "UTF-8";

	public static final String MERPRIV = "MerPriv";

	public static final String TRANSAMT = "TransAmt";
	
	public static final String REALTRANSAMT = "RealTransAmt";

	public static final String ORDID = "OrdId";

	public static final String FEEAMT = "FeeAmt";

	public static final String SERVFEE = "ServFee";

	public static final String CREDITDEALAMT = "CreditDealAmt";

	public static final String FEE = "Fee";

	public static final String RESULT_CODE_000 = "000";

	/** 投标最大手续费费率 */
	public static final String MAXTENDERRATE = PropertiesUtil.getProper("MaxTenderRate");
	/** 借款手续费率 */
	public static final String BORROWERRATE = PropertiesUtil.getProper("BorrowerRate");

	public static String CHINAPNR_SIGNTYPE = PropertiesUtil.getProper("chinapnr_signtype");

	public static String CHINAPNR_SERVER_TIME_URL = PropertiesUtil.getProper("chinapnr_server_time_url");

	public static String CHINAPNR_TRANCODE = "8888";

	public static String CHINAPNR_SEE_KEY = PropertiesUtil.getProper("chinapnr_see_key");
	/** 盛汇资产子账户 */
	public static String CHINAPNR_CFB = PropertiesUtil.getProper("chinapnr_cfb");
	/** 咨询代偿子账户 */
	public static String CHINAPNR_DC = PropertiesUtil.getProper("chinapnr_dc");
	/** 咨询咨询费子账户 */
	public static String CHINAPNR_ZXF = PropertiesUtil.getProper("chinapnr_zxf");

	/** 盛汇资产基本借记户 */
	public static String CHINAPNR_JB = PropertiesUtil.getProper("chinapnr_jb");

	/** 盛汇资产专属子账户 */
	public static String CHINAPNR_SYQCJR = PropertiesUtil.getProper("chinapnr_syqcjr");

	/** 盛汇资产保证金账户 */
	public static String CHINAPNR_BZJ = PropertiesUtil.getProper("chinapnr_bzj");

	/** 盛汇资产担保账户1 */
	public static String CHINAPNR_DB = PropertiesUtil.getProper("chinapnr_db");

	/** 盛汇资产风险账户1 */
	public static String CHINAPNR_FX = PropertiesUtil.getProper("chinapnr_fx");

	/**
	 * 后台返回地址
	 */
	public static String CHINAPNR_BGRETURL = PropertiesUtil.getProper("chinapnr_bgRetUrl");

	/**
	 * 前台页面返回url
	 */
	public static String CHINAPNR_RETURL = PropertiesUtil.getProper("chinapnr_retUrl");
	public static String CHINAPNR_RETURL1 = PropertiesUtil.getProper("chinapnr_retUrl1");
	public static String chinapnr_idType = "00";

	public static String CHINAPNR_VERFICATIONCODE = PropertiesUtil.getProper("chinapnr_verficationCode");


	/**
	 * 法大大的配置信息
	 */

	// 法大大的配置信息

	public static String FADADA_API_ID = PropertiesUtil.getProper("fadada_api_id");

	public static String FADADA_APP_SECRET = PropertiesUtil.getProper("fadada_app_secret");

	public static String FADADA_V = PropertiesUtil.getProper("fadada_v");

	public static String FADADA_API_URL = PropertiesUtil.getProper("fadada_api_url");
	public static String FADADA_MIDDLE_CUSTOMER = PropertiesUtil.getProper("fadada_middle_customer");

	public static String ADDEXGO = PropertiesUtil.getProper("addExgo");
	public static String ADDEXGONUM = PropertiesUtil.getProper("addExgoNum");
	public static String ADDEXGOAMOUNT = PropertiesUtil.getProper("addExgoAmount");
	public static String ANNUALRATE = PropertiesUtil.getProper("annualRate");
	public static String ISSENDMESSAGE = PropertiesUtil.getProper("isSendMessage");
	public static String CHUANGLAN_URL = PropertiesUtil.getProper("chuanglan_url");
	public static String CHUANGLAN_ACCOUNT = PropertiesUtil.getProper("chuanglan_account");
	public static String CHUANGLAN_PASSWORD = PropertiesUtil.getProper("chuanglan_password");

	public static String getBankName(String key) {
		Map<String, String> bankMap = new HashMap<String, String>();
		bankMap.put("ICBC", "工商银行");
		bankMap.put("ABC", "农行");
		bankMap.put("CMB", "招行");
		bankMap.put("CCB", "建设银行");
		bankMap.put("BCCB", "北京银行");
		bankMap.put("BJRCB", "北京农村商业银行");
		bankMap.put("BOC", "中国银行");
		bankMap.put("BOCOM", "交通银行");
		bankMap.put("CMBC", "民生银行");
		bankMap.put("BOS", "上海银行");
		bankMap.put("CBHB", "渤海银行");
		bankMap.put("CEB", "光大银行");
		bankMap.put("CIB", "兴业银行");
		bankMap.put("CITIC", "中信银行");
		bankMap.put("CZB", "浙商银行");
		bankMap.put("GDB", "广发银行");
		bankMap.put("HKBEA", "东亚银行");
		bankMap.put("HXB", "华夏银行");
		bankMap.put("HZCB", "杭州银行");
		bankMap.put("NJCB", "南京银行");
		bankMap.put("PINGAN", "平安银行");
		bankMap.put("PSBC", "邮储银行");
		bankMap.put("SDB", "深发银行");
		bankMap.put("SPDB", "浦发");
		bankMap.put("SRCB", "上海农村商业银行");
		return bankMap.get(key);
	}

	public static final String PAGETYPE_2 = "2";

	public static final String USRCUSTID = "UsrCustId";

	public static final String TRXID = "TrxId";

	public static final Double DOUBLE_0 = 0.00d;

	public static final String ERROR_VERIFYSIGN_MSG = "{\"RespCode\":\"-101\",\"RespDesc\":\"发送请求签名错误\"}";

	public static final String PUSHTORONGTU = PropertiesUtil.getProper("pushToRongtu");

	public static final String RONGTUURL = PropertiesUtil.getProper("rongtuURL");

	public static final String DANGANID = PropertiesUtil.getProper("dangan_id");

	/**
	 * 普金资本第一季推广活动 - 新用户首次投标金额大于500奖励活动
	 */
	
	// 活动期数
	public static String ACTIVITY_PHASE = PropertiesUtil.getProper("activity_phase");
	// 活动开始日期
	public static String ACTIVITYSTARTTIME = PropertiesUtil.getProper("activityStartTime");
	// 活动结束日期
	public static String ACTIVITYENDTIME = PropertiesUtil.getProper("activityEndTime");
	
	
	// 是否开启活动
	public static String ISSTARTACTIVITY1 = PropertiesUtil.getProper("isStartActivity1");
	// 首次投资奖励金额奖励起点
	public static String INVESTMONEY = PropertiesUtil.getProper("investMoney");
	
	/**
	 * 普金资本第一季推广活动 - 一起抢标奖活动
	 */
	// 是否开启活动
	public static String ISSTARTACTIVITY2 = PropertiesUtil.getProper("isStartActivity2");
	// 首投，尾投金额起点
	public static String FIRSTLASTINVEST = PropertiesUtil.getProper("firstLastInvest");
	// 首投，奖励金额
	public static String FIRSTINVESTAWARD = PropertiesUtil.getProper("firstInvestAward");
	// 尾投，奖励金额
	public static String LASTINVESTAWARD = PropertiesUtil.getProper("lastInvestAward");
	// 标王奖励金额
	public static String MAXINVESTAWARD = PropertiesUtil.getProper("MaxInvestAward");
	
	/**
	 * 普金资本第一季推广活动 - 邀请好友奖活动
	 */
	// 奖励起点
	public static String INVITEAMOUNT_1 = PropertiesUtil.getProper("inviteAmount_1");
	public static String INVITEAMOUNT_2 = PropertiesUtil.getProper("inviteAmount_2");
	public static String INVITEAMOUNT_3 = PropertiesUtil.getProper("inviteAmount_3");
	
	/**
	 * 普金资本第一季推广活动 - 累计投资奖活动
	 */
	// 是否开启活动
	public static String ISSTARTACTIVITY5 = PropertiesUtil.getProper("isStartActivity5");
	// 奖励起点
	public static String INVESTAMOUNT_1 = PropertiesUtil.getProper("investAmount_1");
	public static String INVESTAMOUNT_2 = PropertiesUtil.getProper("investAmount_2");
	public static String INVESTAMOUNT_3 = PropertiesUtil.getProper("investAmount_3");
	public static String INVESTAMOUNT_4 = PropertiesUtil.getProper("investAmount_4");
	public static String INVESTAMOUNT_5 = PropertiesUtil.getProper("investAmount_5");
	
	/**
	 * 普金资本第二季推广活动 - 投资赢豪礼活动
	 * 规定时间内累计投资金额达到奖励界限即可领取奖励，在活动时间结束后统计
	 */
	// 活动开始日期
	public static String ACTIVITYSTARTTIME_2 = PropertiesUtil.getProper("activityStartTime_2");
	// 活动结束日期
	public static String ACTIVITYENDTIME_2 = PropertiesUtil.getProper("activityEndTime_2");
	
	// 活动统计时间
	public static String STATISTICALTIME = PropertiesUtil.getProper("statisticalTime");
}
