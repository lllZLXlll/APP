<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent">
    <form action="updateState.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="id" value="${item.id }">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover">
            <tbody>
                <tr>
                    <td align="center">
                        <label for="j_custom_sale" class="control-label x100">企业名称：</label>
                       <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.companyname }">
                    </td>
                </tr>
                
                 <tr>
                    <td align="center">
                        <label for="j_custom_sale" class="control-label x100">注册号：</label>
                       <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.registnumber }">
                    </td>
                </tr>
                
                <tr>
                    <td align="center">
                        <label for="j_custom_name" class="control-label x100">联系人：</label>
                        <input type="text" id="j_custom_name" readonly="readonly"  size="20" value="${item.tname }">
                    </td>
                </tr>
                
                 <tr>
                    <td align="center">
                        <label for="j_custom_sale" class="control-label x100">联系电话：</label>
                       <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.telephone }">
                    </td>
                </tr>
                
                <tr>
                    <td align="center">
                        <label for="j_custom_birthday" class="control-label x100">城市所在地：</label>
                        <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.cityaddress }">
                    </td>
                </tr>
                
                <tr>
                    <td align="center">
                        <label for="j_custom_birthday" class="control-label x100">借款金额：</label>
                        <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.borrowAmount }">
                    </td>
                </tr>
                
                <tr>
                    <td align="center">
                        <label for="j_custom_birthday" class="control-label x100">借款期限：</label>
                        <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.deadline }">
                    </td>
                </tr>
                
                <tr>
                    <td align="center">
                        <label for="j_custom_birthday" class="control-label x100">借款用途：</label>
                        <input type="text" id="j_custom_name" size="20" readonly="readonly" value="${item.borrowPurpose }">
                    </td>
                </tr>
                
                <tr>
                    <td align="center">
                        <label for="j_custom_birthday" class="control-label x100">状态：</label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <c:choose>
			            	 <c:when test="${item.state == 0 }">
				       			<input type="radio" name="state" value="1" data-toggle="icheck" data-label=" 已处理">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				            	<input type="radio" name="state" checked="checked" value="0" data-toggle="icheck" data-label=" 未处理">&nbsp;&nbsp;
				            </c:when>
				            <c:when test="${item.state == 1 }">
				       			<input type="radio" name="state" checked="checked" value="1" data-toggle="icheck" data-label=" 已处理">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				            	<input type="radio" name="state" value="0" data-toggle="icheck" data-label=" 未处理">&nbsp;&nbsp;
				            </c:when>
			            </c:choose>
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