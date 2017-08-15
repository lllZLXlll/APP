<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent">
    <form action="addRedmoneyrecord.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x100">用户ID：</label>
                       <input type="text" name="userId" id="j_custom_name"  data-rule="required" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x100">类型：</label>
                        <select name="redmoneytype" id="redmoneytype" data-toggle="selectpicker" data-rule="required">
                <option value="">请选择</option>
                <option value="1" ${redmoneytype =='1'?'selected':''}>代金券</option>
                <option value="2" ${redmoneytype =='2'?'selected':''}>现金券</option>
            </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x100">使用截止时间：</label>
                       <input type="text" name="useendtime" id="bidTime"  data-toggle="datepicker"
                       data-pattern="yyyy-MM-dd HH:mm:ss" data-rule="required;datetime" size="20">
                    </td>
                </tr>
                
                  <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x100">金额：</label>
                       <input type="text" name="sum" id="j_custom_name"  data-rule="required" size="20">
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