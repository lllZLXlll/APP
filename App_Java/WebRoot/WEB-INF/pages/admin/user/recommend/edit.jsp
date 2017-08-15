<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script type="text/javascript">
function pic_upload_success(file, data) {
    var json = $.parseJSON(data)
    
    $(this).bjuiajax('ajaxDone', json)
    if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
        $('#j_custom_pic').val(json.filename).trigger('validate')
        $('#j_custom_span_pic').html('<img src="'+ json.filename +'" width="100" />')
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
    <form action="updateRecommendUserById.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="id" value="${recommendUser.id }">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr >
                    <td>
                        <label for="j_custom_sale" class="control-label x100">被推荐人ID：</label>
                       <input type="text" name="userId" id="j_custom_name"   size="20" readonly="readonly" value="${recommendUser.userId }">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x100">被推荐人姓名：</label>
                       <input type="text" name="userId" id="j_custom_name"   size="20" readonly="readonly" value="${recommendUser.realName }">
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x100">推荐人ID：</label>
                        <input type="text" name="recommendUserId" id="j_custom_name"  data-rule="required" size="20" value="${recommendUser.recommendUserId }" >
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x100">推荐人姓名：</label>
                       <input type="text" name="userId" id="j_custom_name"   size="20" readonly="readonly" value="${recommendUser.recommendUsername }">
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x100">维护人ID：</label>
                        <input type="text" name="maintenanceman" id="j_custom_name"   size="20"  value="${recommendUser.maintenanceman }">
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