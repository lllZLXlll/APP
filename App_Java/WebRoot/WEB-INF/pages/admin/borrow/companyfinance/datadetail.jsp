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
//护照有效日期  = 签发日期 + 10年
$('#j_custom_issuedate').on('afterchange.bjui.datepicker', function(e, data) {
    var pattern = 'yyyy-MM-dd'
    var start   = end = data.value
    
    end.setFullYear(start.getFullYear() + 10)
    end.setDate(start.getDate() - 1)
    
    $('#j_custom_indate').val(end.formatDate(pattern))
})
</script>
<div class="bjui-pageContent">
    <form action="ajaxDone2.html" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="custom.id" value="edce142bc2ed4ec6b623aacaf602a4de">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                <td width="5%"></td>
                    <td>
                        <label class="control-label x85">${dataNameMap.tmyname_17 }：</label>
                        <div style="display: inline-block; vertical-align: middle;">
                            <div id="j_custom_pic_up" data-toggle="upload" data-uploader="uploadData.do?dialogId=${dialogId }&tmid=${dataNameMap.tmid_17 }&tmyid=${dataNameMap.tmyid_17}&userId=${userId}" 
                                data-file-size-limit="1024000000"
                                data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
                                data-multi="true"
                                data-on-upload-success="pic_upload_success"
                                data-icon="cloud-upload" data-fileObjName="file"></div>
                            <input type="hidden" name="file" value="" id="j_custom_pic">
                        </div>
                    </td>
                    <td>
                         <label class="control-label x120">${dataNameMap.tmyname_18 }：</label>
                        <div style="display: inline-block; vertical-align: middle;">
                            <div id="j_custom_pic_up" data-toggle="upload" data-uploader="uploadData.do?dialogId=${dialogId }&tmid=${dataNameMap.tmid_18 }&tmyid=${dataNameMap.tmyid_18}&userId=${userId}" 
                                data-file-size-limit="1024000000"
                                data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
                                data-multi="true"
                                data-on-upload-success="pic_upload_success"
                                data-icon="cloud-upload"></div>
                            <input type="hidden" name="custom.pic" value="" id="j_custom_pic">
                        </div>
                    </td>
                    <td colspan="2">
                        <label class="control-label x120">${dataNameMap.tmyname_21 }：</label>
                        <div style="display: inline-block; vertical-align: middle;">
                            <div id="j_custom_pic_up" data-toggle="upload" data-uploader="uploadData.do?dialogId=${dialogId }&tmid=${dataNameMap.tmid_21 }&tmyid=${dataNameMap.tmyid_21}&userId=${userId}"
                                data-file-size-limit="1024000000"
                                data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
                                data-multi="true"
                                data-on-upload-success="pic_upload_success"
                                data-icon="cloud-upload"></div>
                            <input type="hidden" name="custom.pic" value="" id="j_custom_pic">
                        </div>
                    </td>
                </tr>
                
                <c:forEach items="${list }" var="data"  varStatus="status">
                	<c:set var="id" value="id_${status.index+1}"></c:set>
                	<c:set var="license" value="license_${status.index+1}"></c:set>
                	<c:set var="bank" value="bank_${status.index+1}"></c:set>
                	<c:set var="imagePathId" value="imagePath_id_${status.index+1}"></c:set>
                	<c:set var="imagePathLicense" value="imagePath_license_${status.index+1}"></c:set>
                	<c:set var="imagePathBank" value="imagePath_bank_${status.index+1}"></c:set>
                	<c:set var="mid" value="mid_id_${status.index+1}"></c:set>
                	<c:set var="midLicense" value="mid_license_${status.index+1}"></c:set>
                	<c:set var="midBank" value="mid_bank_${status.index+1}"></c:set>
                	
                 <tr>
                 <td width="5%"></td>
                    <td>
                    	&nbsp;&nbsp;&nbsp;
                    	<c:if test="${data[id] !=null }">
                    	${status.index+1}
                    	&nbsp; ${data[id] } 
                    	<a href="queryDataImage.do?imagePath=${data[imagePathId] }" data-toggle="dialog" data-id="d" 
					 data-mask="true" data-width="900" data-height="700"><img alt="" src="${data[imagePathId] }" width="40" height="30"></a>
                   	&nbsp;
                    <a href="deleteDataImgById.do?id=${data[mid] }&imagePath=${data[imagePathId] }&userId=${userId}"  data-toggle="doajax" data-confirm-msg="确定要删除法人身份证的该图片吗？">删除</a>
                    </td>
                    	</c:if>
                    	
                    	
                    	
                    </td>
                    <td>
                    	&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
                    	<c:if test="${data[license] !=null }">
                    	${status.index+1}
                    	&nbsp;
                    	${data[license] }
                    	
                    	<a href="queryDataImage.do?imagePath=${data[imagePathLicense] }" data-toggle="dialog" data-id="d" 
						 data-mask="true" data-width="900" data-height="700"><img alt="" src="${data[imagePathLicense] }" width="40" height="30"></a>
                    	&nbsp;
                    <a href="deleteDataImgById.do?id=${data[midLicense] }&imagePath=${data[imagePathLicense] }&userId=${userId}"  data-toggle="doajax" data-confirm-msg="确定要删除营业执照正副本的该图片吗？">删除</a>
                    	</c:if>
                    	
                    </td>
                    <td colspan="2">
                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                    	<c:if test="${data[bank] !=null }">
                    	${status.index+1}
                    		&nbsp;${data[bank] }
                    		<a href="queryDataImage.do?imagePath=${data[imagePathBank] }" data-toggle="dialog" data-id="d" 
					 data-mask="true" data-width="900" data-height="700"><img alt="" src="${data[imagePathBank] }" width="40" height="30"></a>
					 	&nbsp;
                    <a href="deleteDataImgById.do?id=${data[midBank] }&imagePath=${data[imagePathBank] }&userId=${userId}"  data-toggle="doajax" data-confirm-msg="确定要删除企业银行账号的该图片吗？">删除</a>
                    	</c:if>
                    
                    </td>
                </tr>
                </c:forEach>
                
                  <tr>
                <td width="5%"></td>
                    <td>
                       <label class="control-label x85">${otherDataNameMap.tmyname }：</label>
                        <div style="display: inline-block; vertical-align: middle;">
                            <div id="j_custom_pic_up" data-toggle="upload" data-uploader="uploadData.do?dialogId=${dialogId }&tmid=${otherDataNameMap.tmid }&tmyid=${otherDataNameMap.tmyid}&userId=${userId}" 
                                data-file-size-limit="1024000000"
                                data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
                                data-multi="true"
                                data-on-upload-success="pic_upload_success"
                                data-icon="cloud-upload"></div>
                            <input type="hidden" name="file" value="" id="j_custom_pic">
<!--                             <span id="j_custom_span_pic"></span> -->
                        </div>
                    </td>
                    <td>
                    </td>
                    <td colspan="2">
                    </td>
                </tr>
                
                 <c:forEach items="${otherDataList }" var="data"  varStatus="status">
                	<c:set var="otherData" value="otherData_${status.index+1}"></c:set>
                	<c:set var="imagePathOtherData" value="imagePath_otherData_${status.index+1}"></c:set>
                	<c:set var="idOtherData" value="mid_otherData_${status.index+1}"></c:set>
                	
                	
                 <tr>
                 <td width="5%"></td>
                    <td colspan="3">
                    	&nbsp;&nbsp;&nbsp;${status.index+1}&nbsp;  ${data[otherData] }
                    <a href="queryDataImage.do?imagePath=${data[imagePathOtherData] }" data-toggle="dialog" data-id="d" 
					 data-mask="true" data-width="900" data-height="700"><img alt="" src="${data[imagePathOtherData] }" width="40" height="30"></a>
                   
                   &nbsp;
                    <a href="deleteDataImgById.do?id=${data[idOtherData] }&imagePath=${data[imagePathOtherData] }&userId=${userId}"  data-toggle="doajax" data-confirm-msg="确定要删除其他资料的该图片吗？">删除</a>
                    </td>
                </tr>
                </c:forEach>
                
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td></td>
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