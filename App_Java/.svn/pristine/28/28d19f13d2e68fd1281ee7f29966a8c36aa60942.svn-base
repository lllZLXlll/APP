<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script type="text/javascript">

</script>
<div class="bjui-pageContent">
    <form action="saveOrUpdateUserGroup.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="tabid" value="${tabid }">
         <input type="hidden" name="id" value="${group.id }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x90">用户组名称：</label>
                       <input type="text" id="groupName" value="${group.groupName }" name="groupName" data-rule="required"  size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x90">备注：</label>
                         <textarea name="groupRemark" id="groupRemark" data-toggle="autoheight" data-rule="required" cols="30" rows="6">${group.groupRemark }</textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x90">提现状态：</label>
                       <input type="checkbox" name="cashStatus" id="cashStatus" ${group.cashStatus eq '1' ?'checked':''} data-toggle="icheck" value="1" >
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x90">用户成员：</label>
                        <textarea name="userNames" id="j_custom_note" data-toggle="autoheight"  data-rule="required" cols="30" rows="6">${userNames }</textarea>
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