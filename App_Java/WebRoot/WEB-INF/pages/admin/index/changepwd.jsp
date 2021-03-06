<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../../include/base.jsp"%> 

<div class="bjui-pageContent">
	<form id="j_pwschange_form" action="${basePath }admin/updatePassword.do" data-toggle="validate" method="post">
		<input type="hidden" name="id" value="test">
        <hr>
        <div class="form-group">
            <label for="j_pwschange_username" class="control-label x85">帐&nbsp;&nbsp;号：</label>&nbsp;&nbsp;${userName}
        </div><br>
        <div class="form-group">
            <label for="j_pwschange_oldpassword" class="control-label x85">旧密码：</label>
            <input type="password" data-rule="required" name="oldpassword" id="j_pwschange_oldpassword"  size="20">
        </div>
        <div class="form-group" style="margin: 20px 0 20px; ">
            <label for="j_pwschange_newpassword" class="control-label x85">新密码：</label>
            <input type="password" data-rule="新密码:required; password" name="newpassword" id="j_pwschange_newpassword" size="20">
        </div>
        <div class="form-group">
            <label for="j_pwschange_secpassword" class="control-label x85">确认密码：</label>
            <input type="password" data-rule="确认密码:required;match(newpassword)" name="confirmPassword" id="j_pwschange_secpassword" size="20">
        </div>
	</form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close">取消</button></li>
        <li><button type="submit" class="btn-default">保存</button></li>
    </ul>
</div>
