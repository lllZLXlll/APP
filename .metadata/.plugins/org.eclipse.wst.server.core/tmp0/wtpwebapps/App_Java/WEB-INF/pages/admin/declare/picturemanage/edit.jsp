<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
var path = $('#doc_pics').val();
function doc_upload_success(file, data) {
    var json = $.parseJSON(data)
    
    $(this).bjuiajax('ajaxDone', json)
    if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
        $('#doc_pic').val(json.companyImg);
        $('#doc_span_pic').html('已上传图片：<img src="'+ json.companyImg +'" width="100">')
    }
}
$('#doc_pic').val(path);
$('#doc_span_pic').html('已上传图片：<img src="'+ path +'" width="100">')
</script>
<div class="bjui-pageContent">
    <form action="updateIndexRollImg.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="id" value="${picture.id }">
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
	                            data-icon="cloud-upload"
	                            data-dragDrop="true">
	                        </div>
	                        <input type="hidden" name="companyImg" id="doc_pic"/>
	                        <input type="hidden" name="imgPaths" id="doc_pics" value="${picture.companyImg }"/>
                        </div>
                        <span id="doc_span_pic" ></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">类型：</label>
                        <select id="j_custom_name" name="type" data-toggle="selectpicker">
                        	<option value="1" ${picture. type ==1?'selected':''}>友情链接</option>
							<option value="2" ${picture. type ==2?'selected':''}>投资广告</option>
							<option value="3" ${picture. type ==3?'selected':''}>首页滚动图片</option>
						</select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x85">序号：</label>
                       	<input type="text" name="serialCount" id="j_custom_name" readonly="readonly" value="${picture.serialCount }"  data-rule="required" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">排序：</label>
                        <input type="text" name="ordershort" id="j_custom_name"  data-rule="number" size="20" value="${picture.ordershort}">
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-default" data-icon="save">修改</button></li>
    </ul>
</div>