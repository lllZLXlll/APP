<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 

<div class="bjui-pageContent">
    <form action="updateMailSet.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
          <input type="hidden"  name="tabid" value="${tabid }">
         <input type="hidden" id="id" name="id" value="${mailSet.id }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x120">SMTP服务器：</label>
                        <input type="text" name="host" id="host" value="${mailSet.host }" maxlength="20"  data-rule="required" size="20">
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">端口号：</label>
                        <input type="text" name="port" id="port" data-rule="required" maxlength="20" value="${mailSet.port }"  size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">邮箱地址：</label>
                        <input type="text" name="mailaddress" id="mailaddress" data-rule="required" maxlength="11" value="${mailSet.mailaddress }" size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">邮箱密码：</label>
                        <input type="text" name="mailpassword" id="mailpassword"  data-rule="required" maxlength="20" value="${mailSet.mailpassword }" size="20">
                    </td>
                </tr>
                
                  <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">发件人Email：</label>
                        <input type="text" name="sendmail" id="sendmail" data-rule="required" value="${mailSet.sendmail }"  size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td id="mgrTd">
                        <label for="j_custom_birthday" class="control-label x120">发件人昵称：</label>
                        <input type="text" name="sendname" id="sendname" value="${mailSet.sendname }" size="20">
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
