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
    <form action="addActivity.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false" >
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x95">活动标题：</label>
                       	<input type="text" name="title" id="j_custom_name"  data-rule="required" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x95">活动链接地址：</label>
                        <input type="text" name="linkAddress" id="j_custom_name"  data-rule="url" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x95">图片：</label>
                        <div style="display:inline-block; vertical-align:middle;">
	                        <div id="doc_pic_up" data-toggle="upload" data-uploader="uploadActivity.do" 
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
                        <label for="j_custom_birthday" class="control-label x95">活动开始时间：</label>
                        <input type="text"  name="startTime" data-toggle="datepicker"  data-rule="date" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x95">活动结束时间：</label>
                        <input type="text"  name="endTime" data-toggle="datepicker"  data-rule="date" size="20">
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