<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent">
 	<form action="updateWithdrawCheck.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="id" value="${id }">
        <input type="hidden" name="userId" value="${userId }">
        <input type="hidden" name="tabid" value="${tabid }">
        <input type="hidden" name="trxId" value="${item.trxId }">
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
		                <input type="text" id="j_custom_name" size="20" readonly="readonly" name="sum" value="${item.sum }">
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
		        
		         <tr>
		        	<td align="center">
		                <label for="j_custom_birthday" class="control-label x100">到账金额：</label>
		                <input type="text" id="j_custom_name" size="20" readonly="readonly" name="realMoney" value="${item.realMoney }">
		            </td>
		            <td align="center">
		            	<label for="j_custom_birthday" class="control-label x100">手续费：</label>
		                <input type="text" id="j_custom_name" size="20" readonly="readonly" name="poundage" value="${item.poundage }">
		            </td>
		        </tr>
		        
		         <tr>
		        	<td align="center">
		                <label for="j_custom_birthday" class="control-label x100">状态：</label>
		                &nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="radio" name="status" id="j_form_radio1" value="4" data-toggle="icheck" data-label="审核通过">
		                &nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="radio" name="status" id="j_form_radio1" value="5" data-toggle="icheck" checked data-label="审核不通过">
		            </td>
		            <td></td>
		        </tr>
		        
		         <tr>
		        	<td align="center" colspan="2">
		                <label for="j_custom_birthday" class="control-label x100">备注：</label>
	                 	<textarea cols="54" rows="4" name="remark"></textarea>
		            </td>
		        </tr>
		        
		        
		    </tbody>
		</table>
	</form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>