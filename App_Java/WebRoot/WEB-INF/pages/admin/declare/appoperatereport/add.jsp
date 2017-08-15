<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<link href="../../../../../css/admin/admin_css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../../../../script/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../../../../../script/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="../../../../../css/admin/popom.js"></script>
<script language="javascript" type="text/javascript" src="../../../../../My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
function doc_upload_success(file, data) {
    var json = $.parseJSON(data)
    
    $(this).bjuiajax('ajaxDone', json)
    if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
        $('#doc_pic').val(json.imgPath)
        $('#doc_pics').val(json.imgName)
        $('#doc_span_pic').html('已上传图片：<img src="'+ json.imgPath +'" width="100">')
    }
}

</script>
<div class="bjui-pageContent">
    <form action="addAppOperateReport.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x85">月份：</label>
                        <input type="text" name="month" id="j_custom_name" data-pattern="yyyy-MM" data-toggle="datepicker"  data-rule="required" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">图片类型：</label>
                        <select id="j_custom_name" name="imgType" data-toggle="selectpicker">
							<option value="1">图片</option>
							<option value="2">封面</option>
						</select>
                    </td>
                </tr>
                <tr>
                    <td>
                    <label for="j_custom_birthday" class="control-label x85">图片：</label>
	                    <div style="display:inline-block; vertical-align:middle;" style="width:50;height:30;">
		                   <div id="doc_pic_up" data-toggle="upload" data-uploader="uploadAppOperateReport.do" 
		                        data-file-size-limit="1024000000"
		                        data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
		                        data-multi="true"
		                        data-on-upload-success="doc_upload_success"
		                        data-button-text="添加">
		                   </div>
		                   <input type="hidden" name="imgPath" id="doc_pic"/>
		                   <input type="hidden" name="imgName" id="doc_pics"/>
		                   <span id="doc_span_pic" ></span>
            			</div>
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