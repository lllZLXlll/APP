<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script type="text/javascript">
function pic_upload_success(file, data) {
    var json = $.parseJSON(data)
    
    $(this).bjuiajax('ajaxDone', json)
    if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
        $('#j_custom_pic').val(json.filename).trigger('validate')
        $('#j_custom_span_pic').html('<img src="'+ json.filename +'" width="100" />')
    }
}
function do_OK(json, $form) {
    console.log(json)
    console.log($form)
}
</script>
<div class="bjui-pageContent">
    <form action="addEmp.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x85">员工编号：</label>
                       <input type="text" name="empNo" id="j_custom_name"  data-rule="required" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">员工姓名：</label>
                        <input type="text" name="empName" id="j_custom_name"  data-rule="required" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">性别：</label>
                        <input type="text" name="empSex" id="j_custom_name"   size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">出生日期：</label>
                        <input type="text"  name="empBirthday" data-toggle="datepicker"  data-rule="date" size="20" data-pattern="yyyy-MM-dd">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">身份证号：</label>
                        <input type="text" name="empIdentityCard" id="j_custom_name"   size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">手机号：</label>
                        <input type="text" name="empTelephone" id="j_custom_name"   size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">邮箱：</label>
                        <input type="text" name="empEmail" id="j_custom_name"   size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">所属部门：</label>
                        <input type="text" name="empDepartment" id="j_custom_name"   size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">职位：</label>
                        <input type="text" name="empJobs" id="j_custom_name"   size="20">
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