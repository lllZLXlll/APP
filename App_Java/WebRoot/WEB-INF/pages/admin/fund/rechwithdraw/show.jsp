<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent">
	<table class="table table-condensed table-hover">
	    <tbody>
	        <tr>
	            <td align="center">
	                <label for="j_custom_sale" class="control-label x100">用户名：</label>
	               	<input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.username }">
	            </td>
	            <td align="center">
	                <label for="j_custom_sale" class="control-label x100">充值成功总额：</label>
	               	<input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.r_total }">
	            </td>
	        </tr>
	        
	         <tr>
	            <td align="center">
	                <label for="j_custom_sale" class="control-label x100">提现上额限制：</label>
	               <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.withdraw_max }">
	            </td>
	            <td align="center">
	                <label for="j_custom_sale" class="control-label x100">提现成功总额：</label>
	               <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.w_total }">
	            </td>
	        </tr>
	        
	        <tr>
	        	<td align="center">
	                <label for="j_custom_sale" class="control-label x100">投标成功总额：</label>
	               <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.real_Amount }">
	            </td>
	            <td align="center">
	                <label for="j_custom_name" class="control-label x100">可用余额：</label>
	                <input type="text" id="j_custom_name" readonly="readonly"  size="20" value="${item.usableSum }">
	            </td>
	        </tr>
	        
	         <tr>
	         	<td align="center">
	                <label for="j_custom_name" class="control-label x100">开户名：</label>
	                <input type="text" id="j_custom_name" readonly="readonly"  size="20" value="${item.realName }">
	            </td>
	            <td align="center">
	                <label for="j_custom_sale" class="control-label x100">提现支行：</label>
	               <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.bankName }">
	            </td>
	        </tr>
	        
	        <tr>
        	 	<td align="center">
	                <label for="j_custom_sale" class="control-label x100">提现账号：</label>
	               <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.bankId }">
	            </td>
	            <td align="center">
	                <label for="j_custom_birthday" class="control-label x100">提现总额：</label>
	                <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.sum }">
	            </td>
	        </tr>
	        
	        <tr>
	        	<td align="center">
	                <label for="j_custom_birthday" class="control-label x100">到账金额：</label>
	                <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.realMoney }">
	            </td>
	            <td align="center">
	                <label for="j_custom_birthday" class="control-label x100">手续费：</label>
	                <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.poundage }">
	            </td>
	        </tr>
	        
	        <tr>
	        	<td align="center">
	                <label for="j_custom_birthday" class="control-label x100">状态：</label>
	                <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.status }">
	            </td>
	            <td align="center">
	            	<label for="j_custom_birthday" class="control-label x100">审核人：</label>
	                <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.auditPeople }">
	            </td>
	        </tr>
	        
	        <tr>
	        	<td align="center">
	                <label for="j_custom_birthday" class="control-label x100">审核时间：</label>
	                <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.auditTime }">
	            </td>
	            <td align="center">
	            	<label for="j_custom_birthday" class="control-label x100">审核备注：</label>
	                <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.auditMsg }">
	            </td>
	        </tr>
	        
	        <tr>
	        	<td colspan="2">
	                <label for="j_custom_birthday" class="control-label x100">添加时间/IP：</label>&nbsp;&nbsp;&nbsp;
	                <input type="text" id="j_custom_name" size="30" readonly="readonly" value="<fmt:formatDate value="${item.applyTime }" pattern="yyyy-MM-dd HH:mm:ss"/>/${item.ipAddress}">
	            </td>
	        </tr>
	    </tbody>
	</table>
</div>