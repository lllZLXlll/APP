<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script type="text/javascript">
</script>
<div class="bjui-pageContent">
    <form action="addAppVersion.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x85">版本号：</label>
                        <input type="text" name="version" id="j_custom_name"  data-rule="required" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">类型：</label>
                        <select id="j_custom_name" name="type" data-toggle="selectpicker">
							<option value="1">安卓</option>
							<option value="2">苹果</option>
						</select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">是否更新：</label>
                        <select id="j_custom_name" name="isUpdate" data-toggle="selectpicker">
							<option value="1">是</option>
							<option value="2">否</option>
						</select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">版本名称：</label>
                        <input type="text" name="versionName" id="j_custom_name"  data-rule="required" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">发布时间：</label>
                        <input type="text" name="publishTime" id="j_custom_name" data-toggle="datepicker"  data-rule="date" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">下载地址：</label>
                        <input type="text" name="downloadPath" id="j_custom_name" data-rule="url" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">描述：</label>
                        <textarea name="descript" data-toggle="kindeditor" data-rule="required" data-items="forecolor, hilitecolor, bold, italic, underline, removeformat, |, justifyleft, justifycenter, justifyright, insertorderedlist, insertunorderedlist, |, emoticons, link"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">文件名称：</label>
                        <input type="text" name="fileName" id="j_custom_name" data-rule="required" size="20">
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