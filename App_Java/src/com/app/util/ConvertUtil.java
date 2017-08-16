package com.app.util;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.shove.Convert;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;

public class ConvertUtil {
	public static Log log = LogFactory.getLog(ConvertUtil.class);

	public static String dateConvert(Date date, String dateType) {
		String string = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(dateType);
			string = sdf.format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return string;
	}

	public static Date dateConvert(String date, String dateType) {
		Date date2 = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(dateType);
			date2 = sdf.parse(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date2;
	}

	public static Integer convertInteger(String intStr) {
		Integer integer = 0;
		try {
			integer = Integer.parseInt(intStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return integer;
	}

	public static Long convertLong(String LongStr) {
		Long long1 = 0L;
		try {
			long1 = Long.parseLong(LongStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return long1;
	}

	public static Double convertDouble(String doubleStr) {
		Double double1 = 0d;
		try {
			double1 = Double.parseDouble(doubleStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return double1;
	}

	public static String convertString(Object object) {
		String string = "0";
		try {
			string = String.valueOf(object);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return string;
	}

	// string转换为json对象
	public static JSONObject convertJsonObject(Object object) {
		JSONObject jsonObject = null;
		try {
			jsonObject = JSONObject.fromObject(object);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObject;
	}

	public static Date addDate(Date date, int type, int value) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(type, value);
		return calendar.getTime();
	}

	// Bean --> Map
	public static Map<String, Object> transBeanToMap(Object obj) {
		if (obj == null) {
			return null;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
			PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
			for (PropertyDescriptor property : propertyDescriptors) {
				String key = property.getName();

				// 过滤class属性
				if (!key.equals("class")) {
					// 得到property对应的getter方法
					Method getter = property.getReadMethod();
					Object value = getter.invoke(obj);

					map.put(key, value);
				}

			}
		} catch (Exception e) {
			System.out.println("transBean2Map Error " + e);
		}
		return map;
	}

	// Bean --> Map
	public static Map<String, String> transBeanToMapString(Object obj) {

		if (obj == null) {
			return null;
		}
		Map<String, String> map = new HashMap<String, String>();
		try {
			BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
			PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
			for (PropertyDescriptor property : propertyDescriptors) {
				String key = property.getName();

				// 过滤class属性
				if (!key.equals("class")) {
					// 得到property对应的getter方法
					Method getter = property.getReadMethod();
					String value = String.valueOf(getter.invoke(obj));
					map.put(key, value);
				}

			}
		} catch (Exception e) {
			System.out.println("transBean2Map Error " + e);
		}

		return map;
	}

	public static String filteSqlInfusion(String input) {
		if ((input == null) || (input.trim() == "")) {
			return "";
		}
		if (!StringUtils.isNumeric(input)) {
			return input.replace("'", "’").replace("update", "ｕｐｄａｔｅ").replace("drop", "ｄｒｏｐ").replace("delete", "ｄｅｌｅｔｅ").replace("exec", "ｅｘｅｃ").replace("create", "ｃｒｅａｔｅ")
					.replace("execute", "ｅｘｅｃｕｔｅ").replace("where", "ｗｈｅｒｅ").replace("truncate", "ｔｒｕｎｃａｔｅ").replace("insert", "ｉｎｓｅｒｔ");
		}
		return input;
	}

	/**
	 * 天标计算
	 * 
	 * @param borrowSum
	 * @param yearRate
	 * @param borrowTime
	 * @return
	 */
	public static Map<String, Object> rateCalculateDay(double borrowSum, double yearRate, int borrowTime) {
		if (borrowSum < 0 || yearRate < 0 || borrowTime < 0) {
			return null;
		}
		DecimalFormat df = new DecimalFormat("#.00");
		// 月利率
		double i = yearRate * 1f / 12;
		// 所借本金
		double sum = Double.valueOf(df.format(borrowSum));

		// 所还利息
		double monForRate = Convert.strToDouble(df.format(sum * i * borrowTime / 30), 0);

		double val = borrowSum + monForRate;

		Map<String, Object> map = addToMap(borrowTime, val, borrowSum, monForRate, 0, i, val);

		return map;

	}

	/**
	 * 
	 * @param mon
	 *            月份
	 * @param monPay
	 *            月还本息
	 * @param monForA
	 *            月还本金
	 * @param monForRate
	 *            月还利息
	 * @param payRemain
	 *            本息余额
	 * @param monRate
	 *            月利率
	 * @param allPay
	 *            总还本息
	 * @return
	 */
	public static Map<String, Object> addToMap(int mon, double monPay, double monForA, double monForRate, double payRemain, double monRate, double allPay) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mon", mon);
		// 保留两位小数，不够两位小数的以0补齐
		map.put("monForRateA", String.format("%.2f", monPay));
		map.put("monForA", String.format("%.2f", monForA));
		map.put("monForRate", String.format("%.2f", monForRate));
		map.put("rateARemain", String.format("%.2f", payRemain));
		map.put("monRate", String.format("%.2f", monRate));
		map.put("allPay", String.format("%.2f", allPay));
		return map;
	}

	public static String FilteSqlInfusion(String input) {
		if ((input == null) || (input.trim() == "")) {
			return "";
		}
		if (!StringUtils.isNumeric(input)) {
			return input.replace("'", "’").replace("update", "ｕｐｄａｔｅ").replace("drop", "ｄｒｏｐ").replace("delete", "ｄｅｌｅｔｅ").replace("exec", "ｅｘｅｃ").replace("create", "ｃｒｅａｔｅ")
					.replace("execute", "ｅｘｅｃｕｔｅ").replace("where", "ｗｈｅｒｅ").replace("truncate", "ｔｒｕｎｃａｔｅ").replace("insert", "ｉｎｓｅｒｔ");
		}
		return input;
	}

	/**
	 * 计算两个时间之间相差的秒数
	 * 
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public static long diffTimes(Date startDate, Date endDate) {
		long days = 0;
		long start = startDate.getTime();
		long end = endDate.getTime();
		// 一天的毫秒数1000 * 60 * 60 * 24=86400000
		days = (end - start) / 1000;
		return days;
	}

	/**
	 * @describe:Object转换为String：字符串null，一个""或n个""(" "),都转为null值，
	 *                                               如果该对象为null或者是"null"
	 *                                               字符串或者n个空格或者换行时出现异常
	 *                                               ，统一转为null值，以便统一处理
	 * @param object
	 * @return
	 */
	public static String objToStrConvert(Object object) {
		String string = null;
		try {
			if (object != null) {
				String s = String.valueOf(object).trim();
				if (s.length() > 0 && !s.equals("null")) {
					return s;
				} else {
					return string;
				}
			} else {
				return string;
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("**************Object转换为String异常**************");
			return string;
		}
	}

	/**
	 * 
	 * @describe:保留String类型的两位小数（四舍五入） 
	 *                                 如果该对象为null或者是null字符串或者n个空格或者换行时出现异常，统一转为"0.00"
	 *                                 字符串,以便统一处理
	 * @author: xiaojin
	 * @param d
	 * @return
	 */
	public static String doubleToString(Object object) {
		String s = "0.00";
		try {
			if (object != null) {
				String s2 = String.valueOf(object).trim();
				if (s2.length() > 0 && !s2.equals("null")) {
					DecimalFormat df = new DecimalFormat("0.00");
					return df.format(Double.parseDouble(s2));
				} else {
					return s;
				}
			} else {
				return s;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			log.info("**************保留String类型的两位小数（四舍五入）异常**************");
		}
		return s;
	}

	/**
	 * 
	 * @describe:保留String类型的三位小数（四舍五入） 
	 *                                 如果该对象为null或者是null字符串或者n个空格或者换行时出现异常，统一转为"0.00"
	 *                                 字符串,以便统一处理
	 * @author: xiaojin
	 * @param d
	 * @return
	 */
	public static String doubleToStrThree(Object object) {
		String s = "0.000";
		try {
			if (object != null) {
				String s2 = String.valueOf(object).trim();
				if (s2.length() > 0 && !s2.equals("null")) {
					DecimalFormat df = new DecimalFormat("0.000");
					return df.format(Double.parseDouble(s2));
				} else {
					return s;
				}
			} else {
				return s;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			log.info("**************保留String类型的三位小数（四舍五入）异常**************");
		}
		return s;
	}

	
	/**
	 * 
	 * @describe:保留Double类型的两位小数（四舍五入） 
	 *                                 如果该对象为null或者是null字符串或者n个空格或者换行时出现异常，统一转为double类型的值0
	 *                                 .00,以便统一处理
	 * @author: xiaojin
	 * @param object
	 * @return
	 */
	public static double objToDoubleConvert(Object object) {
		double d = 0.00d;
		try {
			if (object != null) {
				String s = String.valueOf(object).trim();
				if (s.length() > 0 && !s.equals("null")) {
					d = Double.parseDouble(s);
					BigDecimal bg = new BigDecimal(d);
					return bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				} else {
					return d;
				}
			} else {
				return d;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			log.info("**************保留Double类型的两位小数（四舍五入）异常**************");
			return d;
		}
	}

	/**
	 * 
	 * @describe:object类型转Long类型 
	 *                           如果该对象为null或者是null字符串或者n个空格或者换行时出现异常，统一转为long类型的值0
	 *                           ,以便统一处理
	 * @author: xiaojin
	 * @param object
	 * @return
	 */
	public static long objToLongConvert(Object object) {
		long l = 0;
		try {
			if (object != null) {
				String s = String.valueOf(object).trim();
				if (s.length() > 0 && !s.equals("null")) {
					return Long.parseLong(s);
				} else {
					return l;
				}
			} else {
				return l;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			log.info("**************object类型转Long类型 异常**************");
			return l;
		}
	}
	
	
	/**
	 * 
	 *@describe:obj->Long->str
	 * @author: xiaojin
	 * @param object
	 * @return
	 */
	public static String LongToStrConvert(Object object) {
		String s1 = "0";
		try {
			if (object != null) {
				String s = String.valueOf(object).trim();
				if (s.length() > 0 && !s.equals("null")) {
					return String.valueOf(Long.parseLong(s));
				} else {
					return s1;
				}
			} else {
				return s1;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			log.info("**************object类型转Long类型 异常**************");
			return s1;
		}
	}

	/**
	 * 
	 * @describe:object类型转int类型 
	 *                          如果该对象为null或者是null字符串或者n个空格或者换行时出现异常，统一转为int类型的值0,
	 *                          以便统一处理
	 * @author: xiaojin
	 * @param object
	 * @return
	 */
	public static int objToIntConvert(Object object) {
		int i = 0;
		try {
			if (object != null) {
				String s = String.valueOf(object).trim();
				if (s.length() > 0 && !s.equals("null")) {
					return Integer.parseInt(s);
				} else {
					return i;
				}
			} else {
				return i;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			log.info("**************object类型转int类型 异常**************");
			return i;
		}
	}

	/**
	 * 
	 * @describe:获取上传路径
	 * @author: xiaojin
	 * @param folder
	 * @return
	 */
	public static String getUploadPath(String folder) {
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH) + 1;
		int year = cal.get(Calendar.YEAR);
		return "upload" + folder + year + "/" + month + "/";
	}
	
	public static <T> T xmltoBean(String xmlStr, Class<T> cls) {
		XStream xstream = new XStream(new DomDriver());
		xstream.processAnnotations(cls);
		@SuppressWarnings("unchecked")
		T t = (T) xstream.fromXML(xmlStr);
		return t;
	}
}
