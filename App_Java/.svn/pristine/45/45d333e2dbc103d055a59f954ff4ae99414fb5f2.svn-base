<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent">
    <form action="addintegralreal.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="id" value="${id }">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover">
            <tbody>
                <tr>
                    <td align="center">
                        <label for="j_custom_sale" class="control-label x100">用户名：</label>
                       <input type="text" size="20" readonly="readonly" value="${item.username }">
                    </td>
                </tr>
                
                 <tr>
                    <td align="center">
                        <label for="j_custom_sale" class="control-label x100">真实姓名：</label>
                       <input type="text" size="20" readonly="readonly" value="${item.realName }">
                    </td>
                </tr>
                
                <tr>
                    <td align="center">
                        <label for="j_custom_name" class="control-label x100">信用积分：</label>
                        <input type="text" readonly="readonly"  size="20" value="${item.creditrating }">
                    </td>
                </tr>
                
                 <tr>
                    <td align="center">
                        <label for="j_custom_sale" class="control-label x100">会员积分：</label>
                       <input type="text" size="20" readonly="readonly" value="${item.rating }">
                    </td>
                </tr>
                
                <tr>
                    <td align="center">
                        <label for="j_custom_birthday" class="control-label x100">选择积分：</label>
                        <select data-toggle="selectpicker" name="type" data-rule="required">
				           	<option value="-1">--请选择--</option>
				           	<option value="1">信用积分</option>
				           	<option value="2">会员积分</option>
				        </select>
                    </td>
                </tr>
                
                <tr>
                    <td align="center">
                        <label for="j_custom_birthday" class="control-label x100" >添加积分：</label>
                        <input type="text" size="20" value="" name="integral" data-rule="required">
                    </td>
                </tr>
                
                 <tr>
                    <td align="center">
                        <label for="j_custom_sale" class="control-label x100">备注：</label>
                       <textarea cols="30" rows="4" name="remark" data-rule="required"></textarea>
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