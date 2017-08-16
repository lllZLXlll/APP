<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script type="text/javascript">
function doc_upload_success(file, data) {
    var json = $.parseJSON(data)
    
    $(this).bjuiajax('ajaxDone', json)
    if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
        $('#doc_pic').val(json.companyImg)
        $('#doc_span_pic').html('已上传图片：<img src="'+ json.companyImg +'" width="100">')
    }
}
</script>
<div class="bjui-pageContent">
    <form action="addIndexRollImgInfo.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false" >
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">图片：</label>
                        <div style="display:inline-block; vertical-align:middle;">
	                        <div id="doc_pic_up" data-toggle="upload" data-uploader="uploadPicture.do" 
	                            data-file-size-limit="1024000000"
	                            data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
	                            data-multi="true"
	                            data-on-upload-success="doc_upload_success"
	                            data-icon="cloud-upload">
	                        </div>
	                        <input type="hidden" name="companyImg" id="doc_pic"/>
	                        <span id="doc_span_pic" ></span>
                  		</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">类型：</label>
                        <select id="j_custom_name" name="type" data-toggle="selectpicker">
                        	<option value="1">友情链接</option>
							<option value="2">投资广告</option>
							<option value="3">首页滚动图片</option>
						</select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x85">序号：</label>
                       	<input type="text" name="serialCount" id="j_custom_name" readonly="readonly" value="${serialCount }"  data-rule="required" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">排序：</label>
                        <input type="text" name="ordershort" id="j_custom_name"  data-rule="number" size="20">
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