package com.pjzb.controller.common;

import java.util.List;
import java.util.Map;


import net.sf.json.JSONObject;

/**
 * 画饼状统计图
 * @author Li zeyang
 *
 */
public class Echarts {
	
	/**
	 * 
	 * @param legend 图例 
	 * @param name 图表名称
	 * @param series 数据 Map里面的两个key必须是name,value
	 * @param x 饼状图所在div横轴位置（用百分比表示）
	 * @param y 饼状图所在div纵轴位置（用百分比表示）
	 * @return
	 * @author Li zeyang
	 */
	public JSONObject drawEcharts(List<String> legend,String name,List<Map<String, Object>> series,String x,String y) {
		String obj = "{'tooltip': {'trigger': 'item','formatter': '{a} <br/>{b} : {c} ({d}%)'},"
				+ "'legend': {'orient': 'vertical','x': 'left','data': ["+result(legend)+"]},"
				+ "'toolbox': {'show': true,'feature': {'mark': {'show': true},'dataView': {'show': true,'readOnly': false},'magicType': {'show': true,'type': ['pie','funnel'],'option': {'funnel': {'x': '25%','width': '50%','funnelAlign': 'left','max': 1548}}},'restore': {'show': true},'saveAsImage': {'show': true}}},"
				+ "'calculable': true,"
				+ "'series': [{'name': '"+name+"','type': 'pie','radius': '55%','center': ['"+x+"','"+y+"'],'data': ["+series(series)+"]}]}";
		JSONObject jsObject =JSONObject.fromObject(obj);
		return jsObject; 			 
	}
	
	public String result(List<String> list){
		StringBuffer sb = new StringBuffer();
		for(String s:list){
			sb.append(",'");
			sb.append(s);
			sb.append("'");
		}
		String str = sb.toString().substring(1, sb.toString().length());
		return str;
	}
	
	public String series(List<Map<String, Object>> list){
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<list.size();i++){
			sb.append(",{'value':");
			sb.append(list.get(i).get("value"));
			sb.append(",'name':'");
			sb.append(list.get(i).get("name"));
			sb.append("'}");
		}
		String str = sb.toString().substring(1, sb.toString().length());
		return str;
	}
}
