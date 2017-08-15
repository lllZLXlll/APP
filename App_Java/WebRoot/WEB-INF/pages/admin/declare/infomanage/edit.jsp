<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">

</script>
<div class="bjui-pageContent">
    <form action="updateInfoManageById.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="id" value="${message.id }">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x85">栏目名称：</label>
                       <input type="text" name="title" id="j_custom_name"  readonly="readonly" size="20" value="${message.columName}">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">内容：</label>
                        <textarea name="content" data-toggle="kindeditor" data-rule="required" data-upload-json="../resources/admin/bjui/BJUI/plugins/kindeditor_4.1.10/jsp/upload_json_info.jsp" 
                       		data-file-manager-json="../resources/admin/bjui/BJUI/plugins/kindeditor_4.1.10/jsp/file_manager_json_info.jsp">${message.content}</textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">序号：</label>
                        <input type="text" name="sort" id="j_custom_name"  data-rule="digits" size="20" value="${message.sort}">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">发布时间：</label>
                        <input type="text" name="publishTime" id="j_custom_name" data-toggle="datepicker"  data-rule="date" size="20" value="<fmt:formatDate value="${message.publishTime }" pattern="yyyy-MM-dd"/>">
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