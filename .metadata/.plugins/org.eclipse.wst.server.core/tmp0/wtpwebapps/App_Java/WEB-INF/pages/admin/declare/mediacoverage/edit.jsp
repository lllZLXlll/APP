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
        $('#doc_span_pic').html('已上传图片：<img src="'+ json.imgPath +'" width="100">')
    }
}
$('#doc_pic').val(path);
$('#doc_span_pic').html('已上传图片：<img src="'+ path +'" width="100">')
</script>
<div class="bjui-pageContent">
    <form action="updateMediareportById.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="id" value="${mediaReport.id }">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x85">新闻标题：</label>
                       <input type="text" name="title" id="j_custom_name"  data-rule="required" size="20" value="${mediaReport.title }">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">新闻网址：</label>
                        <input type="text" name="url" id="j_custom_name"  data-rule="url/required" size="20" value="${mediaReport.url }">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">新闻来源：</label>
                        <input type="text" name="source" id="j_custom_name"  data-rule="required" size="20" value="${mediaReport.source }">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">新闻类型：</label>
                        <select id="j_custom_name" name="newsType" data-toggle="selectpicker">
							<option value="1" ${mediaReport.newsType ==1 ?'selected':'' }>公司动态</option>
							<option value="2" ${mediaReport.newsType ==2 ?'selected':'' }>媒体报道</option>
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
	                            data-icon="cloud-upload"
	                            data-dragDrop="true">
	                        </div>
	                        <input type="hidden" name="imgPath" id="doc_pic"/>
	                        <input type="hidden" name="imgPaths" id="doc_pics" value="${mediaReport.imgPath }"/>
                        </div>
                        <span id="doc_span_pic" ></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">新闻简述：</label>
                         <textarea name="content" id="tr_content" data-toggle="kindeditor" data-rule="required" data-upload-json="../resources/admin/bjui/BJUI/plugins/kindeditor_4.1.10/jsp/upload_json.jsp" 
                       		data-file-manager-json="../resources/admin/bjui/BJUI/plugins/kindeditor_4.1.10/jsp/file_manager_json.jsp">${mediaReport.content }</textarea>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="state" value="2" 
					   		${mediaReport.state == 2 ? 'checked':''}
					    />开启 
						<input type="radio" name="state" value="1"
						    ${mediaReport.state == 1 ? 'checked':''}
						/>隐藏
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">序号：</label>
                        <input type="text" name="sort" id="j_custom_name"  data-rule="digits" size="20" value="${mediaReport.sort }">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">发布时间：</label>
                        <input type="text" name="publishTime" id="j_custom_name" data-toggle="datepicker"  data-rule="date" size="20" value="<fmt:formatDate value="${mediaReport.publishTime }" pattern="yyyy-MM-dd"/>">
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