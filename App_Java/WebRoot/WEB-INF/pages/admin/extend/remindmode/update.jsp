<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent">
    <form action="updateApproveNoticeTemplateById.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
          <input type="hidden"  name="tabid" value="${tabid }">
         <input type="hidden" id="id" name="id" value="${map.id }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
            
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x100">标示名：</label>
                        <input type="text" id="nid" value="${map.nid }" readonly="readonly">
                    </td>
                </tr>
                
                   <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x100">提醒类型：</label>
                        <input type="text"  id="title" value="${map.title }" maxlength="30"  
                        data-rule="required" >
                    </td>
                </tr>
                
                
                  <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x100">名称：</label>
                        <input type="text" name="name" id="name" value="${map.name }" maxlength="30"  
                        data-rule="required" >
                    </td>
                </tr>
                
                
                  <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x100">模板：</label>
                       <textarea name="template" id="template"  data-toggle="autoheight" data-rule="required" cols="45" rows="10">${map.template }</textarea>
                    </td>
                </tr>
                
                 <tr>
                    <td>
                    <label for="j_custom_name" class="control-label x100">&nbsp;</label>
                       <span style="color: red">*带有“[]”字符的为系统调用字符，不可修改。谢谢配合！</span>
                    </td>
                </tr>
                
                  <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x100">排序：</label>
                        <input type="text" name="sort" id="sort" value="${map.sort }" maxlength="20"  
                        data-rule="required" >
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
<script type="text/javascript">

</script>

