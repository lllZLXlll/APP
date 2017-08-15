<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent">
	<table class="table table-condensed table-hover">
	    <tbody>
	        <tr>
	            <td align="center">
	                <label for="j_custom_sale" class="control-label x100">用户名：</label>
	               <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.username }">
	            </td>
	        </tr>
	        
	         <tr>
	            <td align="center">
	                <label for="j_custom_sale" class="control-label x100">真实姓名：</label>
	               <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.registnumber }">
	            </td>
	        </tr>
	        
	        <tr>
	            <td align="center">
	                <label for="j_custom_name" class="control-label x100">手机号码：</label>
	                <input type="text" id="j_custom_name" readonly="readonly"  size="20" value="${item.mobilePhone }">
	            </td>
	        </tr>
	        
	         <tr>
	            <td align="center">
	                <label for="j_custom_sale" class="control-label x100">身份证：</label>
	               <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.idNo }">
	            </td>
	        </tr>
	        
	        <tr>
	            <td align="center">
	                <label for="j_custom_birthday" class="control-label x100">开户银行：</label>
	                <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.bankName }">
	            </td>
	        </tr>
	        
	        <tr>
	            <td align="center">
	                <label for="j_custom_birthday" class="control-label x100">支行：</label>
	                <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.branchBankName }">
	            </td>
	        </tr>
	        
	        <tr>
	            <td align="center">
	                <label for="j_custom_birthday" class="control-label x100">银行卡号：</label>
	                <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.cardNo }">
	            </td>
	        </tr>
	    </tbody>
	</table>
</div>