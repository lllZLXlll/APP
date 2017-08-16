<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
var path = $('#doc_pics').val();
function doc_upload_success(file, data) {
    var json = $.parseJSON(data)
    
    $(this).bjuiajax('ajaxDone', json)
    if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
        $('#doc_pic').val(json.imgPath);
   		$('#doc_Name').val(json.imgName)
        $('#doc_span_pic').html('已上传图片：<img src="'+ json.imgPath +'" width="100">')
    }
}
$('#doc_pic').val(path);
$('#doc_span_pic').html('已上传图片：<img src="'+ path +'" width="100">')
</script>
<div class="bjui-pageContent">
    <form action="updateAppOperateReportById.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="id" value="${apporp.id }">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover" style="border: none;">
            <tbody>
           	 	<tr>
                    <td style="border: none;">
                        <label for="j_custom_birthday" class="control-label x85">图片：</label>
                        <div style="display:inline-block; vertical-align:middle;">
	                        <div id="doc_pic_up" data-toggle="upload" data-uploader="uploadAppOperateReport.do" 
	                            data-file-size-limit="1024000000"
	                            data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
	                            data-multi="true"
	                            data-on-upload-success="doc_upload_success"
	                            data-icon="cloud-upload"
	                            data-dragDrop="true">
	                        </div>
	                        <input type="hidden" name="imgPath" id="doc_pic"/>
	                        <input type="hidden" name="imgName" id="doc_Name" value="${apporp.imgName }"/>
	                        <input type="hidden" name="imgPaths" id="doc_pics" value="${apporp.imgPath }"/>
                        </div>
                        <span id="doc_span_pic" ></span>
                    </td>
                </tr>
                <tr>
                    <td style="border: none;">
                        <label for="j_custom_sale" class="control-label x85">月份：</label>
                        <input type="text" name="month" id="j_custom_name" data-pattern="yyyy-MM" data-toggle="datepicker"  data-rule="required" size="20" value="${apporp.month }">
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