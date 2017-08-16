package com.app.util;

import java.text.FieldPosition;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

public class GenerateSequenceNo {

	private static final FieldPosition HELPER_POSITION = new FieldPosition(0);
	
	private final static Format dateFormat = new SimpleDateFormat("yyyyMMddHHmmssS");

	private static int seq = 0;

	private static final int MAX = 9;
	
	private static Random random=new Random();

	/**
	 * 时间格式生成序列
	 * 
	 * @return String
	 */
	public static synchronized String generateSequenceNo() {

		Calendar rightNow = Calendar.getInstance();

		StringBuffer sb = new StringBuffer();
		

		dateFormat.format(rightNow.getTime(), sb, HELPER_POSITION);
		if (seq == MAX) {
			seq = 0;
		} else {
			seq++;
		}
		sb.append(random.nextInt(90)+10);
		sb.append(seq);
		return sb.toString();
	}
	
}