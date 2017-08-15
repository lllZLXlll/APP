<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 

<div class="bjui-pageContent">
    <form action="updateSiteInformationById.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
          <input type="hidden"  name="tabid" value="${tabid }">
         <input type="hidden" id="id" name="id" value="${siteInformation.id }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x120">站点名称：</label>
                        <input type="text" name="siteName" id="siteName" value="${siteInformation.siteName }" maxlength="30"  data-rule="required" >
                    </td>
                    
                    <td>
                        <label for="j_custom_name" class="control-label x120">公司名称：</label>
                        <input type="text" name="companyName" id="companyName" value="${siteInformation.companyName }" maxlength="30"  data-rule="required">
                    </td>
                    
                </tr>
                
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">邮编：</label>
                        <input type="text" name="postcode" id="postcode" data-rule="required" maxlength="30" value="${siteInformation.postcode }">
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label x120">地址：</label>
                        <input type="text" name="address" id="address" value="${siteInformation.address }" maxlength="50"  data-rule="required">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">负责人：</label>
                        <input type="text" name="principal" id="principal" data-rule="required" maxlength="30" value="${siteInformation.principal }">
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label x120">联系人：</label>
                        <input type="text" name="contact" id="contact" value="${siteInformation.contact }" maxlength="30"  data-rule="required">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">电话号码：</label>
                        <input type="text" name="telephone" id="telephone"  data-rule="required" maxlength="30" value="${siteInformation.telephone }">
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label x120">手机号码：</label>
                        <input type="text" name="cellphone" id="cellphone" value="${siteInformation.cellphone }" maxlength="30"  data-rule="required" >
                    </td>
                </tr>
                
                  <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">传真：</label>
                        <input type="text" name="fax" id="fax" data-rule="required" value="${siteInformation.fax }" maxlength="30">
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label x120">邮箱：</label>
                        <input type="text" name="emial" id="emial" value="${siteInformation.emial }" maxlength="30"  data-rule="required" >
                    </td>
                </tr>
                
                 <tr>
                    <td id="mgrTd">
                        <label for="j_custom_birthday" class="control-label x120">QQ：</label>
                        <input type="text" name="qq" id="qq" value="${siteInformation.qq }"data-rule="required" maxlength="30" >
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label x120">服务电话：</label>
                        <input type="text" name="servicePhone" id="servicePhone" value="${siteInformation.servicePhone }" maxlength="30"  data-rule="required">
                    </td>
                </tr>
                
                  <tr>
                    <td id="mgrTd">
                        <label for="j_custom_birthday" class="control-label x120">ICP证书号：</label>
                        <input type="text" name="certificate" id="certificate" value="${siteInformation.certificate }" data-rule="required" maxlength="50" >
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label x120">站点域名：</label>
                        <input type="text" name="regionName" id="regionName" value="${siteInformation.regionName }" maxlength="50"  data-rule="required" >
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
