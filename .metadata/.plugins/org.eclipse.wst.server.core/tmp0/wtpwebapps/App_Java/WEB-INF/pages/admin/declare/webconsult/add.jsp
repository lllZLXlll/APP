<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script type="text/javascript">
function doc_upload_success(file, data) {
    var json = $.parseJSON(data)
    
    $(this).bjuiajax('ajaxDone', json)
    if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
        $('#doc_pic').val(json.imgPath)
        $('#doc_span_pic').html('已上传图片：<img src="'+ json.imgPath +'" width="100">')
    }
}

</script>
<div class="bjui-pageContent">
    <form action="addNews.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="title" class="control-label x85">标题：</label>
                       <input type="text" name="title" id="title"  data-rule="标题:required;" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="announcementType" class="control-label x85">公告类型：</label>
                        <select id="announcementType" name="announcementType" data-toggle="selectpicker">
							<option value="平台公告">平台公告</option>
							<option value="活动公告">活动公告</option>
							<option value="新标预告">新标预告</option>
						</select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="sort" class="control-label x85">序号：</label>
                        <input type="text" name="sort" id="sort"  data-rule="required;number" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="visits" class="control-label x85">浏览次数：</label>
                        <input type="text" name="visits" id="visits"  data-rule="required;number" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="content" class="control-label x85">内容：</label>
                       <textarea name="content" data-toggle="kindeditor" data-rule="内容:required;" data-upload-json="../resources/admin/bjui/BJUI/plugins/kindeditor_4.1.10/jsp/upload_json_web.jsp" 
                       	data-file-manager-json="../resources/admin/bjui/BJUI/plugins/kindeditor_4.1.10/jsp/file_manager_json_web.jsp" ></textarea>
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