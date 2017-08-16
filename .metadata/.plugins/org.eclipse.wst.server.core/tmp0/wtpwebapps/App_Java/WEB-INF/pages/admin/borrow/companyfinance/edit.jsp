<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent">
    <form action="updateEnterpriseUserBaseInfo.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="userId" value="${userId }">
        <input type="hidden" name="tabid" value="${tabid }">
        <input type="hidden" name="applyId" value="${applyId }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x85">企业名称：</label>
                       <input type="text" name="companyName" id="j_custom_name" value="${companyName }" readonly="readonly" size="25">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">注册资金：</label>
                        <input type="text" name="registeredCapital" id="j_custom_name" value="${enterprise.registeredCapital }"  data-rule="required" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">成立日期：</label>
                        <input type="text" name="registeredTime" id="j_custom_indate" value="${registeredTime }" data-toggle="datepicker" data-rule="required;date" size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">营业执照号：</label>
                        <input type="text" name="businessCode" id="j_custom_name" value="${enterprise.businessCode }"  data-rule="required" size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">注册地址：</label>
                        <input type="text" name="companyAddress" id="j_custom_name" value="${enterprise.companyAddress }" data-rule="required" size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">公司电话：</label>
                        <input type="text" name="companyPhone" id="j_custom_name" value="${enterprise.companyPhone }"  data-rule="required" size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">借款原因：</label>
                       <textarea name="borrowCause" id="j_custom_note"  data-toggle="autoheight"  data-rule="required"  cols="40" rows="6">${enterprise.borrowCause }</textarea>
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