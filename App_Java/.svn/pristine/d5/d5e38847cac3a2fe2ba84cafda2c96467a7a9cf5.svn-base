<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script type="text/javascript" src="../../../../../script/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" href="../../../../../kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="../../../../../kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="../../../../../kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="../../../../../kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="../../../../../kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript" src="../../../../../script/jquery.shove-1.0.js"></script>
<script type="text/javascript">
function fuzhi(){
	$("#tr_content").val(editor_content.html());
	return true;
}

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
    <form action="addMediareport.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x85">新闻标题：</label>
                       <input type="text" name="title" id="title"  data-rule="required;" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">新闻网址：</label>
                        <input type="text" name="url" id="url"  data-rule="required;url;" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">新闻来源：</label>
                        <input type="text" name="source" id="source"  data-rule="required;" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">新闻类型：</label>
                        <select id="j_custom_name" name="newsType" data-toggle="selectpicker">
							<option value="1">公司动态</option>
							<option value="2">媒体报道</option>
						</select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">图片：</label>
                        <div style="display:inline-block; vertical-align:middle;">
	                        <div id="doc_pic_up" data-toggle="upload" data-uploader="uploadDataMediareport.do" 
	                            data-file-size-limit="1024000000"
	                            data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
	                            data-multi="true"
	                            data-on-upload-success="doc_upload_success"
	                            data-icon="cloud-upload">
	                        </div>
	                        <input type="hidden" name="imgPath" id="doc_pic"/>
	                        <span id="doc_span_pic" ></span>
                  		</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">序号：</label>
                        <input type="text" name="sort" id="sort"  data-rule="required;digits" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">新闻简述：</label>
                        <textarea name="content" id="tr_content" data-toggle="kindeditor" data-rule="required;" data-upload-json="../resources/admin/bjui/BJUI/plugins/kindeditor_4.1.10/jsp/upload_json.jsp" 
                       		data-file-manager-json="../resources/admin/bjui/BJUI/plugins/kindeditor_4.1.10/jsp/file_manager_json.jsp">${news.content}</textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-default" data-icon="save" onclick="fuzhi()">保存</button></li>
    </ul>
</div>