package com.app.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class JspToHtml {
	/**
	 * 根据本地模板生成静态页面
	 * 
	 * @param JspFile
	 *            jsp路经
	 * @param HtmlFile
	 *            html路经
	 * @return
	 */
	/*
	 * 1、出借人 2、借款人 3、借款金额 4、借款详细信息 5、代还本金stillPrincipal 6、还款方式paymentMode
	 * 7、借款开始auditTime 8、借款截止时间repayDate 9、借款金额 10、借款期数 11、代收本息 12、满标审核日期
	 */
	public static boolean JspToHtmlFile(String filePath, String HtmlFile, String payName, String reName, String sumAmt,
			String detail, String recivedPrincipal, String recievedInterest, String Mode, String auditTime,
			String repayDate, String investAmount, String deadline, List<Map<String, Object>> investRepayListMap,
			String audit, String jName, String yName, String idNo, String contractNO, String behalfName) {
		// 利息和本金相加
		BigDecimal feeAmtD = new BigDecimal(recivedPrincipal);
		BigDecimal ServFeeD = new BigDecimal(recievedInterest);
		double feeSum = feeAmtD.add(ServFeeD).doubleValue();

		audit = audit.substring(0, 10);
		repayDate = repayDate.substring(0, 10);

		// 读取模板文件转成String格式
		StringBuffer sbStr = new StringBuffer();
		long beginDate = (new Date()).getTime();
		try {
			String tempStr = "";
			FileInputStream is = new FileInputStream(filePath);// 读取模块文件
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			while ((tempStr = br.readLine()) != null) {
				sbStr.append(tempStr);
			}
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		try {
			String str = sbStr.toString();

			// 替换掉模块中相应的地方
			str = str.replaceAll("payName", payName);
			str = str.replaceAll("reName", reName);
			str = str.replaceAll("payAmount", sumAmt);
			str = str.replaceAll("jName", jName);
			str = str.replaceAll("detail", detail);
			str = str.replaceAll("repayDate", repayDate);
			str = str.replaceAll("deadline", deadline);
			str = str.replaceAll("audit", audit);
			str = str.replaceAll("feeSum", Double.toString(feeSum));
			str = str.replaceAll("yName", yName);
			str = str.replaceAll("contractNO", contractNO);
			str = str.replaceAll("idNo", idNo);
			str = str.replaceAll("behalfName", behalfName);

			// 从'invest_repayment_start'开始往前8个字符，从'</tr>'结束往后5个字符，对这些语句进行循环赋值
			String strModel = "";
			strModel = str.substring(str.indexOf("invest_repayment_start") - 8, str.lastIndexOf("</tr>") + 5);

			// 先删除未赋值之前的模板
			str = str.replaceAll(strModel, "strModel");

			// 剔除id的定义
			strModel = strModel.replaceAll("id=\"invest_repayment_start\"", " ");

			// 为模板循环赋值
			StringBuffer strModelList = new StringBuffer();
			if (investRepayListMap != null && investRepayListMap.size() > 0) {
				for (Map<String, Object> investRepay : investRepayListMap) {
					String strBlank = "";
					strBlank = strModel;

					strBlank = strBlank.replaceAll("investAmount", investAmount);
					strBlank = strBlank.replaceAll("recivedPrincipal", investRepay.get("recivedPrincipal") + "");
					strBlank = strBlank.replaceAll("recievedInterest", investRepay.get("recivedInterest") + "");
					strBlank = strBlank.replaceAll("Mode", Mode);
					strBlank = strBlank.replaceAll("repayPeriod", investRepay.get("repayPeriod") + "");
					strBlank = strBlank.replaceAll("repayedDate", investRepay.get("repayDate") + "");
					strModelList.append(strBlank);
				}
			}
			// 添加赋值后的模板
			String strModelLists = strModelList.toString();
			str = str.replaceAll("strModel", strModelLists);

			// 最后替换审核时间
			str = str.replaceAll("auditTime", auditTime);

			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(HtmlFile), "UTF-8"));

			writer.write(str);
			writer.close();
			System.out.println("共用时：" + ((new Date()).getTime() - beginDate) + "ms");
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

//	public static boolean JspToHtmlFileZhuaiQuan(String filePath, String HtmlFile, String contractNO,
//			Map<String, Object> map, Map<String, Object> sumMap, Person personMap, BorrowDebtVo mapContent,
//			Date dateEnd) {
//		// 读取模板文件转成String格式
//		StringBuffer sbStr = new StringBuffer();
//		long beginDate = (new Date()).getTime();
//		try {
//			String tempStr = "";
//			FileInputStream is = new FileInputStream(filePath);// 读取模块文件
//			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
//			while ((tempStr = br.readLine()) != null) {
//				sbStr.append(tempStr);
//			}
//			is.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//			return false;
//		}
//		try {
//			String str = sbStr.toString();
//
//			// 替换掉模块中相应的地方
//			str = str.replaceAll("contractNO", contractNO);// 合同编码
//			str = str.replaceAll("receivName",
//					(map.get("dbrealName").equals("") ? map.get("username") : map.get("dbrealName")) + "");// 受让人姓名
//			str = str.replaceAll("assignorName",
//					(map.get("realName").equals("") ? map.get("username") : map.get("realName")) + "");// 转让人姓名
//			str = str.replaceAll("idNo", map.get("idNo") + "");// 转让人身份证
//			str = str.replaceAll("username", map.get("username") + ""); // 转让人平台用户名
//			str = str.replaceAll("dbisno", map.get("dbisno") + ""); // 受让人身份证
//			str = str.replaceAll("userdbname", map.get("dbusername") + ""); // 受让人平台用户名
//			str = str.replaceAll("borrowRealName", mapContent.getRealName());// 借款人真实姓名
//			str = str.replaceAll("borrowUsername", mapContent.getUsername());// 借款方注册用户名
//			str = str.replaceAll("purpose", mapContent.getPurpose());// 借款用途
//			str = str.replaceAll("annualRate", mapContent.getAnnualRate() + "");// 年利率
//			str = str.replaceAll("paymentMode", mapContent.getPaymentMode());// 还款方式
//			str = str.replaceAll("borrowIdNo", mapContent.getIdNo());// 借款人身份证
//			str = str.replaceAll("auditTime", DateUtil.dateToString(mapContent.getAuditTime()));// 原标的审核时间
//			str = str.replaceAll("auditEndTime",
//					DateUtil.dateToString(mapContent.getAuditTime()) + "/" + DateUtil.dateToString(dateEnd));// 原债权期限
//			str = str.replaceAll("deadline", map.get("debtLimit") + "/" + mapContent.getDeadline());// 待还期数/总期数
//			str = str.replaceAll("manageFee", map.get("manageFee") + "");// 转让管理费
//			str = str.replaceAll("auctionHighPrice", map.get("auctionHighPrice") + "");// 待还期数/总期数
//			// 代收本息 总的代收本息sumRecivedPalInt - 总的已收本息sumPalInt
//			str = str.replaceAll("sumPalIntRecived", (Double.parseDouble(sumMap.get("sumRecivedPalInt") + "")
//					- Double.parseDouble(sumMap.get("sumPalInt") + "")) + "");
//			// 原本金 sumRecivedPal
//			str = str.replaceAll("sumRecivedPal", sumMap.get("sumRecivedPal") + "");
//			// 本次转让债权价值 到期日资产总额
//			str = str.replaceAll("debtSum", map.get("debtSum") + "");
//
//			// 最后替换审核时间
//			str = str.replaceAll("auctionEndTime", map.get("auctionEndTime") + "");
//
//			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(HtmlFile), "UTF-8"));
//
//			writer.write(str);
//			writer.close();
//			System.out.println("共用时：" + ((new Date()).getTime() - beginDate) + "ms");
//		} catch (IOException e) {
//			e.printStackTrace();
//			return false;
//		}
//		return true;
//	}

	/*
	 * 1、map 2、sumMap 3、personMap 4、mapContent
	 */
	public static boolean JspToHtmlFileZhuaiQuan(String filePath, String HtmlFile, String contractNO,
			Map<String, String> map, Map<String, String> sumMap, Map<String, String> personMap,
			Map<String, String> mapContent) {
		// 读取模板文件转成String格式
		StringBuffer sbStr = new StringBuffer();
		long beginDate = (new Date()).getTime();
		try {
			String tempStr = "";
			FileInputStream is = new FileInputStream(filePath);// 读取模块文件
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			while ((tempStr = br.readLine()) != null) {
				sbStr.append(tempStr);
			}
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		try {
			String str = sbStr.toString();

			// 替换掉模块中相应的地方
			str = str.replaceAll("contractNO", contractNO);// 合同编码
			str = str.replaceAll("receivName",
					map.get("dbrealName").equals("") ? map.get("username") : map.get("dbrealName"));// 受让人姓名
			str = str.replaceAll("assignorName",
					map.get("realName").equals("") ? map.get("username") : map.get("realName"));// 转让人姓名
			str = str.replaceAll("idNo", map.get("idNo"));// 转让人身份证
			str = str.replaceAll("username", map.get("username")); // 转让人平台用户名
			str = str.replaceAll("dbisno", map.get("dbisno")); // 受让人身份证
			str = str.replaceAll("userdbname", map.get("dbusername")); // 受让人平台用户名
			str = str.replaceAll("borrowRealName", mapContent.get("realName"));// 借款人真实姓名
			str = str.replaceAll("borrowUsername", mapContent.get("username"));// 借款方注册用户名
			str = str.replaceAll("purpose", mapContent.get("purpose"));// 借款用途
			str = str.replaceAll("annualRate", mapContent.get("annualRate"));// 年利率
			str = str.replaceAll("paymentMode", mapContent.get("paymentMode"));// 还款方式
			str = str.replaceAll("borrowIdNo", mapContent.get("idNo"));// 借款人身份证
			str = str.replaceAll("auditTime", mapContent.get("auditTime"));// 原标的审核时间
			str = str.replaceAll("auditEndTime", mapContent.get("auditTime") + "/" + mapContent.get("auditEndTime"));// 原债权期限
			str = str.replaceAll("deadline", map.get("debtLimit") + "/" + mapContent.get("deadline"));// 待还期数/总期数
			str = str.replaceAll("manageFee", map.get("manageFee"));// 转让管理费
			str = str.replaceAll("auctionHighPrice", map.get("auctionHighPrice"));// 待还期数/总期数
			str = str.replaceAll("sumPalIntRecived",
					(Double.parseDouble(sumMap.get("sumRecivedPalInt")) - Double.parseDouble(sumMap.get("sumPalInt")))
							+ "");// 代收本息 总的代收本息sumRecivedPalInt -
									// 总的已收本息sumPalInt
			str = str.replaceAll("sumRecivedPal", sumMap.get("sumRecivedPal"));// 原本金
																				// sumRecivedPal
			str = str.replaceAll("debtSum", map.get("debtSum"));// 本次转让债权价值
																// 到期日资产总额
			// 最后替换审核时间
			str = str.replaceAll("auctionEndTime", map.get("auctionEndTime"));

			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(HtmlFile), "UTF-8"));

			writer.write(str);
			writer.close();
			System.out.println("共用时：" + ((new Date()).getTime() - beginDate) + "ms");
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/*
	 * @ahor tangjielong 1、甲方转让人 发标人 2、甲方营业执照 发标人 3、乙方应收账款 4、乙方普金资本账户名 5、乙方身份证
	 * 6、合同编号 提前一天才知道 7、投资金额 8、投资时间期限 9、到期时间 10、利率
	 * 
	 * 
	 */
	public static boolean JspToHtmlAndHengda(String filePath, String HtmlFile, String yName, String businessCode,
			String jName, String pjUserName, String yFangIdNo, String contractNO, String stillPrincipal,
			String amountProportion, String auditTime, String repayDate, String annualRate) {
		auditTime = auditTime.substring(0, 10);
		repayDate = repayDate.substring(0, 10);

		// 读取模板文件转成String格式
		StringBuffer sbStr = new StringBuffer();
		long beginDate = (new Date()).getTime();
		try {
			String tempStr = "";
			FileInputStream is = new FileInputStream(filePath);// 读取模块文件
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			while ((tempStr = br.readLine()) != null) {
				sbStr.append(tempStr);
			}
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		try {
			String str = sbStr.toString();

			str = str.replaceAll("yName", yName);
			str = str.replaceAll("businessCode", businessCode);
			str = str.replaceAll("jName", jName);
			str = str.replaceAll("pjUserName", pjUserName);
			str = str.replaceAll("yFangIdNo", yFangIdNo);
			str = str.replaceAll("contractNO", contractNO);
			str = str.replaceAll("stillPrincipal", stillPrincipal);
			str = str.replaceAll("amountProportion", amountProportion);
			str = str.replaceAll("auditTime", auditTime);
			str = str.replaceAll("repayDate", repayDate);
			str = str.replaceAll("annualRate", annualRate);

			// 替换掉模块中相应的地方
			// File f = new File(HtmlFile);
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(HtmlFile), "UTF-8"));

			writer.write(str);
			writer.close();
			System.out.println("共用时：" + ((new Date()).getTime() - beginDate) + "ms");
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 委托授权书转换
	 * 
	 * @param filePath
	 * @param HtmlFile
	 * @return
	 */
	public static boolean JspToHtmlAuth(String filePath, String HtmlFile) {

		String str = "";
		long beginDate = (new Date()).getTime();
		try {
			String tempStr = "";
			FileInputStream is = new FileInputStream(filePath);// 读取模块文件
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			while ((tempStr = br.readLine()) != null)
				str = str + tempStr;
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		try {
			// 当前时间
			String authDate = DateUtil.dateToString(new Date());

			// 替换授权时间
			str = str.replaceAll("authDate", authDate);

			// 替换掉模块中相应的地方
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(HtmlFile), "UTF-8"));

			writer.write(str);
			writer.close();
			System.out.println("共用时：" + ((new Date()).getTime() - beginDate) + "ms");
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 根据url生成静态页面
	 * 
	 * @param u
	 *            动态文件路经 如：http://www.163.com/x.jsp
	 * @param path
	 *            文件存放路经如：x://abc/bbb.html
	 * @return
	 */
	public static boolean JspToHtmlByURL(String u, String path) {
		// 从utl中读取html存为str
		String str = "";
		try {
			URL url = new URL(u);
			URLConnection uc = url.openConnection();
			InputStream is = uc.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			while (br.ready()) {
				str += br.readLine() + "/n";
			}
			is.close();
			// 写入文件
			File f = new File(path);
			BufferedWriter o = new BufferedWriter(new FileWriter(f));
			o.write(str);
			o.close();
			str = "";
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 根据url生成静态页面
	 * 
	 * @param url
	 *            动态文件路经 如：http://www.163.com/x.jsp
	 * @return d
	 */
	public static StringBuffer getHtmlTextByURL(String url) {
		// 从utl中读取html存为str
		StringBuffer sb = new StringBuffer();
		try {
			URL u = new URL(url);
			URLConnection uc = u.openConnection();
			InputStream is = uc.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			while (br.ready()) {
				sb.append(br.readLine() + "/n");
			}
			is.close();
			return sb;
		} catch (Exception e) {
			e.printStackTrace();
			return sb;
		}
	}

}