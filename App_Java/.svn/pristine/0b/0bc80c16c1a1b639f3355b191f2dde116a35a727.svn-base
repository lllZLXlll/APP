package com.pjzb.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.Map;

import org.xhtmlrenderer.pdf.ITextFontResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;

import com.lowagie.text.pdf.BaseFont;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class FreemarkerUtil {
	private static Configuration cfg;            //模版配置对象 
	
	//初始化FreeMarker配置 
	public static  void init() throws Exception { 
		//创建一个Configuration实例 
		cfg = new Configuration(); 
		//设置FreeMarker的模版文件夹位置 
		//cfg.setDirectoryForTemplateLoading(new File("D:\\work\\wp_zr\\p2p.2015\\src\\ftl")); 
		cfg.setClassForTemplateLoading(FreemarkerUtil.class, "/");
	}
 
	public static Map<String, Object> initDateMap() throws Exception { 
		//构造填充数据的Map 
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("custId", "1231231231231231"); 
		map.put("name", "张三"); 
		map.put("userName", "zhangsan"); 
		map.put("maxMoneyToCN", "一百万"); 
		map.put("maxMoney", 1000); 
		map.put("monthInt", "22222");
		map.put("pYear", "2012");
		map.put("pMonth", "12");
		map.put("pDay", "12");
		map.put("pYearTo", "13");
		map.put("pMonthTo", "12");
		map.put("pDayTo", "12");
		map.put("rate", 12);
		map.put("principalandInterest", 150);
		map.put("tYear", "12");
		map.put("tMonth", "12");
		map.put("tDay", "12");
		
		return map;
	}
	

	public static void templateToHTML(String templateName,Map<String, Object> date,String encoding,String savepath){		
		//创建模版对象 
		Template t;
		try {
			t = cfg.getTemplate(templateName);
			t.setEncoding(encoding);
			FileOutputStream fileOutputStream = new FileOutputStream(savepath);
			OutputStreamWriter outputStreamWriter = new OutputStreamWriter(fileOutputStream,"UTF-8");
			BufferedWriter  writer = new BufferedWriter(outputStreamWriter);
			t.process(date,writer);//在模版上执行插值操作，并输出到制定的输出流中
			//writer.close();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public  void testpdf(String[] args){
	try {
		String templeteName = "invest_agreement.ftl";
		String baseFTL = "template/agreement/";
		String savepathHTML = "/u01/abc1.html";
		String savepathPDF = "/u01/1.pdf";
		String fontPath = "/u01/pj/pj_fonts/simsun.ttf";
		String os = System.getProperty("os.name");
		System.out.println("=====OS:"+os.toLowerCase());
		if(os.toLowerCase().startsWith("win")){  
			savepathHTML = "d:/abc1.html";
			savepathPDF = "d:/1.pdf";
			fontPath = "C:/Windows/fonts/simsun.ttc";
		}
		
		init(); 
		Map<String, Object> map = initDateMap();
		templateToHTML(baseFTL+templeteName,map,"UTF-8",savepathHTML); 
		htmlToPdf(savepathHTML, savepathPDF,fontPath);
	}
	catch (Exception e) {
	} 
	
}
	
	public static void htmlToPdf(String inputFile,String outFile,String fontPath) throws Exception{ 
		OutputStream os = null;  
		os =  new FileOutputStream(outFile);  
		ITextRenderer renderer = new ITextRenderer();  
		ITextFontResolver fontResolver = renderer.getFontResolver();  
		fontResolver.addFont(fontPath, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);      
		String url = new File( inputFile ).toURI().toURL().toString();  
		System.out.println("=============url: "+url);  
		renderer.setDocument(url);  
		renderer.layout();  
		renderer.createPDF(os);  
		System.out.println("======转换成功!");  
		os.close();  
      } 
	  
	public static void main(String[] args) throws Exception {
		String templeteName = "invest_agreement.ftl";
		String baseFTL = "template/agreement/";
		String savepathHTML = "/u01/abc1.html";
		String savepathPDF = "/u01/1.pdf";
		String fontPath = "/u01/pj/pj_fonts/simsun.ttf";
		String os = System.getProperty("os.name");
		System.out.println("=====OS:"+os.toLowerCase());
		if(os.toLowerCase().startsWith("win")){  
			savepathHTML = "d:/abc1.html";
			savepathPDF = "d:/1.pdf";
			fontPath = "C:/Windows/fonts/simsun.ttc";
		}
		
		init(); 
		Map<String, Object> map = initDateMap();
		templateToHTML(baseFTL+templeteName,map,"UTF-8",savepathHTML); 
		htmlToPdf(savepathHTML, savepathPDF,fontPath);
	}
}
