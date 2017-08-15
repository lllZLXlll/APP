<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent">
    <form action="addMaterialsauth.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="tabid" value="${tabid }">
        <input type="hidden" name="userId" value="${userId }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x150">设置资料所属企业的名称：</label>
                       <input type="text" name="companyname" id="j_custom_name" data-rule="required" size="25">
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