<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent">
    <form action="addApply.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x85">企业名称：</label>
                       <input type="text" name="companyname" id="j_custom_name" data-rule="required" size="25">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">注册号：</label>
                        <input type="text" name="registnumber" id="j_custom_name"  data-rule="required" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">联系电话：</label>
                        <input type="text" name="telephone" id="j_custom_name"   data-rule="required" size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">城市所在地：</label>
                        <input type="text" name="cityaddress" id="j_custom_name"   data-rule="required" size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">借款金额：</label>
                        <input type="text" name="borrowAmount" id="j_custom_name"  data-rule="required" size="20">（￥元）
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">借款期限：</label>
                        <input type="text" name="deadline" id="j_custom_name"   data-rule="required" size="20">月
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">借款用途：</label>
                       <textarea name="borrowPurpose" id="j_custom_note"  data-toggle="autoheight" data-rule="required" cols="40" rows="6"></textarea>
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