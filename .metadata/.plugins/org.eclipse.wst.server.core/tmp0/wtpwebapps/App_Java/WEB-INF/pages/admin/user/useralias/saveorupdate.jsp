<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script type="text/javascript">

</script>
<div class="bjui-pageContent">
    <form action="saveOrUpdateUserRename.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="tabid" value="${tabid }">
         <input type="hidden" name="id" value="${id }">
         <input type="hidden" name="userId" value="${userMap.userId }">
          <input type="hidden" name="type" value="${type }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x130">用户名：</label>
                       <input type="text" id="j_custom_name" value="${userMap.username }"  readonly="readonly" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x130">真实姓名：</label>
                        <input type="text"  id="j_custom_name" value="${userMap.realName }" readonly="readonly" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x130">别名：</label>
                        <input type="text" name="rename" id="rename" data-rule="required" value="${userMap.rename }"  size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x130">别名使用开始时间：</label>
                         <input type="text" name="startTime" id="startTime"
                          value="<fmt:formatDate value="${userMap.startTime }" pattern="yyyy-MM-dd HH:mm:ss" />" data-toggle="datepicker"
                       data-pattern="yyyy-MM-dd HH:mm:ss" data-rule="required;datetime" size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x130">别名使用结束时间：</label>
                         <input type="text" name="endTime" id="endTime"  data-toggle="datepicker" 
                          value="<fmt:formatDate value="${userMap.endTime }" pattern="yyyy-MM-dd HH:mm:ss" />"
                       data-pattern="yyyy-MM-dd HH:mm:ss" data-rule="required;datetime" size="20">
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