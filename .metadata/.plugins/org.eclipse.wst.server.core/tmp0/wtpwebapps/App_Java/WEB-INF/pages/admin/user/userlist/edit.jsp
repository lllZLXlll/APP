<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script type="text/javascript">

</script>
<div class="bjui-pageContent">
    <form action="#" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="id" value="${recommendUser.id }">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr >
                    <td>
                        <label for="j_custom_sale" class="control-label x100">用户名：</label>
                       <input type="text" name="userId" id="j_custom_name"   size="20" readonly="readonly"  readonly="readonly" value="${user.username }">
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x100">手机号码：</label>
                        <input type="text" name="maintenanceman" id="j_custom_name"  readonly="readonly"  size="20"  value="${user.cellPhone }">
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x100">身份证：</label>
                        <input type="text" name="maintenanceman" id="j_custom_name"  readonly="readonly"  size="20"  value="${user.idNo }">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x100">真实姓名：</label>
                       <input type="text" name="userId" id="j_custom_name"   size="20" readonly="readonly" value="${user.realName }">
                    </td>
                </tr>
                
                  <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x100">汇付账号：</label>
                       <input type="text" name="userId" id="j_custom_name"   size="20" readonly="readonly" value="${user.ipayAccount }">
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x100">网站积分：</label>
                        <input type="text" name="recommendUserId" id="j_custom_name" readonly="readonly"   data-rule="required" size="20" value="${user.rating }" >
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x100">	信用积分：</label>
                       <input type="text" name="userId" id="j_custom_name"   size="20" readonly="readonly" value="${user.creditrating }">
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x100">注册日期：</label>
                        <input type="text" name="maintenanceman" id="j_custom_name" readonly="readonly"   size="20"  value="${user.createTime }">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x100">最后登录IP：</label>
                        <input type="text" name="maintenanceman" id="j_custom_name"  readonly="readonly"   size="20"  value="${user.lastIP }">
                    </td>
                </tr>
                
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x100">最后登录时间：</label>
                        <input type="text" name="maintenanceman" id="j_custom_name" readonly="readonly"   size="20"  value="${user.lastDate }">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x100">邮箱：</label>
                        <input type="text" name="maintenanceman" id="j_custom_name" readonly="readonly"  size="20"  value="${user.email }">
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
    </ul>
</div>