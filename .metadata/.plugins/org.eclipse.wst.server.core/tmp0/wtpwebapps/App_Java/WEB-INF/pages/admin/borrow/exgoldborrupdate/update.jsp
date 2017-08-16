<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent">
    <form action="updatExGoAccount.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="id" value="${id }">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover">
            <tbody>
                <tr>
                    <td align="center">
                        <label for="j_custom_sale" class="control-label x100">标的类型：</label>
                       <input type="text" id="j_custom_name" size="18" readonly="readonly" name="borrowTitle" value="${item.borrowTitle }">
                    </td>
                </tr>
                
                 <tr>
                    <td align="center">
                        <label for="j_custom_sale" class="control-label x100">借款期限：</label>
                       <input type="text" id="j_custom_name" data-rule="required" size="18" name="deadline" value="${item.deadline }月">
                    </td>
                </tr>
                
                <tr>
                    <td align="center">
                        <label for="j_custom_name" class="control-label x100">借款总额：</label>
                        <input type="text" id="j_custom_name" data-rule="required" size="18" name="borrowAmount" value="${item.borrowAmount }">
                    </td>
                </tr>
                
                 <tr>
                    <td align="center">
                        <label for="j_custom_sale" class="control-label x100">借款利率：</label>
                       <input type="text" id="j_custom_name" data-rule="required" size="18" name="annualRate" value="${item.annualRate }">
                    </td>
                </tr>
                
                <tr>
                    <td align="center">
                        <label for="j_custom_birthday" class="control-label x100">描述：</label>
                         <textarea cols="18" rows="4" id="j_custom_name" data-rule="required" name="detail">${item.detail }</textarea>
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