<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script type="text/javascript">
function pic_upload_success(file, data) {
    var json = $.parseJSON(data);
     var that = this;
    $(this).bjuiajax('ajaxDone', json)
    if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
        $('#j_custom_pic').val(json.filename).trigger('validate')
        $('#j_custom_span_pic').html('<img src="'+ json.filename +'" width="100" />');
        that.$element.dialog('refresh', json.dialogid);
    }
}
function do_OK(json, $form) {
    console.log(json)
    console.log($form)
}

</script>
<div class="bjui-pageContent">
    <form action="ajaxDone2.html" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="custom.id" value="edce142bc2ed4ec6b623aacaf602a4de">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
             <c:if test="${admin.id != -1 and admin.loanUserId != -100 }">
                <tr>
                <td width="20%"></td>
                    <td colspan="2">
                        <label class="control-label x85">上传资料：</label>
                        <div style="display: inline-block; vertical-align: middle;">
                            <div id="j_custom_pic_up" data-toggle="upload" data-uploader="uploadLoanAfterData.do?type=1&id=${id }&dialogId=${dialogId}&inspectId=${inspectId}" 
                                data-file-size-limit="1024000000"
                                data-file-type-exts="*.docx;*.xlsx;*.doc;*.xls;*.pptx"
                                data-on-upload-success="pic_upload_success"
                                data-icon="cloud-upload" data-fileObjName="file"></div>
                            <input type="hidden" name="file" value="" id="j_custom_pic">
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="control-label x85">上传图片：</label>
                        <div style="display: inline-block; vertical-align: middle;">
                            <div id="j_custom_pic_up" data-toggle="upload" data-uploader="uploadLoanAfterData.do?type=2&id=${id }&dialogId=${dialogId}&inspectId=${inspectId}" 
                                data-file-size-limit="1024000000"
                                data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
                                data-multi="true"
                                data-on-upload-success="pic_upload_success"
                                data-icon="cloud-upload" data-fileObjName="file"></div>
                            <input type="hidden" name="file" value="" id="j_custom_pic">
                        </div>
                    </td>
                </tr>
                </c:if>
                  <tr>
                    <td width="20%"><label>序号</label></td>
                    <td width="40%"><label>文件名称</label></td>
                    <td width="40%"><label>操作</label></td>
               	 </tr>
               		 
                <c:forEach items="${dataList }" var="data" varStatus="status">
                 <tr>
                    <td >${status.index+1+count } </td>
                    <td>
                      <c:choose>
							<c:when test="${data.type=='1' }">
								<a href="../${data.filePath }" target="view_frame">${data.fileName }</a>
							</c:when>
							<c:otherwise>
								<a href="../${data.filePath }" target="view_frame"><img  src="../${data.filePath }" width="40" height="30"></a>
							</c:otherwise>
					</c:choose>
                     </td>
                    <td>
                    
                     <c:choose>
	                	<c:when test="${admin.id != -1 and admin.loanUserId != -100 }">
	                	<a href="deleteLoanManageMonthInspectData.do?id=${data.id }&filePath=${data.filePath }&type=${data.type}&loanmanagerId=${data.loanmanagerId}&inspectId=${inspectId}" class="btn btn-red" data-toggle="doajax" 
                    data-confirm-msg="确定要删除吗？">删除</a>
	                	</c:when>
	                	<c:otherwise>
	                		-
	                	</c:otherwise>
	                </c:choose>
	                
                    </td>
               		 </tr>
                </c:forEach>
                <tr>
                <td colspan="3"></td>
                </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
<!--         <li><button type="button" class="btn-close" data-icon="close">取消</button></li> -->
    </ul>
</div>