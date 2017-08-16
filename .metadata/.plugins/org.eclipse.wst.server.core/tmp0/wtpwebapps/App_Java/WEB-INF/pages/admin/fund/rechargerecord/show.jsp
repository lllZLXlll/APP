<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent">
	<table class="table table-condensed table-hover">
	    <tbody>
	        <tr>
	            <td align="center">
	                <label for="j_custom_sale" class="control-label x70">用户名：</label>
	               	<input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.username }">
	            </td>
	            <td align="center">
	                <label for="j_custom_sale" class="control-label x100">真实姓名：</label>
	               	<input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.realName }">
	            </td>
	        </tr>
	        
	         <tr>
	            <td align="center">
	                <label for="j_custom_sale" class="control-label x70">充值类型：</label>
	               <input type="text" id="j_custom_name" size="20" readonly="readonly" value="汇付充值">
	            </td>
	            <td align="center">
	                <label for="j_custom_sale" class="control-label x100">充值银行：</label>
	               <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.bankName }">
	            </td>
	        </tr>
	        
	        <tr>
	        	<td align="center">
	                <label for="j_custom_sale" class="control-label x70">流水号：</label>
	               <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.billcode }">
	            </td>
	            <td align="center">
	                <label for="j_custom_name" class="control-label x100">添加时间/IP：</label>
	                <input width="230px" type="text" id="j_custom_name" readonly="readonly"  size="20" value="<fmt:formatDate value="${item.rechargeTime }" pattern="yyyy-MM-dd"/>/${ item.ipAddress}">
	            </td>
	        </tr>
	        
	         <tr>
	         	<td align="center">
	                <label for="j_custom_name" class="control-label x70">充值总额：</label>
	                <input type="text" id="j_custom_name" readonly="readonly"  size="20" value="${item.rechargeMoney }">
	            </td>
	            <td align="center">
	                <label for="j_custom_sale" class="control-label x100">费率：</label>
	               <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.cost }">
	            </td>
	        </tr>
	        
	        <tr>
        	 	<td align="center">
	                <label for="j_custom_sale" class="control-label x70">实际到账：</label>
	               <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.realMoney }">
	            </td>
	            <td align="center">
	                <label for="j_custom_birthday" class="control-label x100">状&nbsp;&nbsp;态：&nbsp;&nbsp;：</label>
	                <input type="text" id="j_custom_name" size="20" readonly="readonly" value="自动">
	            </td>
	        </tr>
	        
	        <tr>
	        	<td align="center">
	                <label for="j_custom_birthday" class="control-label x70">审核时间：</label>
	                <input type="text" id="j_custom_name" size="20" readonly="readonly" value="<fmt:formatDate value="${item.rechargeTime }" pattern="yyyy-MM-dd"/>">
	            </td>
	            <td align="center">
	                <label for="j_custom_birthday" class="control-label x100">审核备注：</label>
	                <textarea id="remark" name="remark" cols="30" rows="5" readonly="true">自动</textarea>
	            </td>
	        </tr>
	        
	    </tbody>
	</table>
</div>