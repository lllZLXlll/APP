<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent">
    <form action="saveOrUpdateRole.do" id="addRole_form" data-toggle="validate" data-alertmsg="false">
         <input type="hidden" id="menu" name="menu" value="">
         <input type="hidden"  name="tabid" value="${tabid }">
         <input type="hidden" id="roleId" name="id" value="${id }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                	<td width="10%"><label for="j_custom_sale" class="control-label x85">管理组名称：</label></td>
                    <td width="90%">
                        <input type="text" name="name" id="j_custom_name" maxlength="30"  value="${role.name }" data-rule="required" size="20">
                    </td>
                </tr>
                
                  <tr>
                  <td width="10%"><label for="j_custom_sale" class="control-label x85">管理组描述：</label></td>
                    <td width="90%">
                        <textarea name="description" id="j_custom_note" data-toggle="autoheight" data-rule="required" cols="40" rows="6">${role.description }</textarea>
                    </td>
                </tr>
                
                
                <tr>
                    <td width="10%"><label for="j_custom_sale" class="control-label x85">权限分配：</label></td>
                    <td width="90%">
                       	<ul id="treeDemo" class="ztree"></ul>
                       
                    </td>
                </tr>
                
<!--                 <c:forEach items="${menu }" var="father"> -->
<!--                 	<tr> -->
<!--                     <td width="10%"> -->
<!--                          <input type="checkbox" class="checkboxCtrl" data-group="menu_${father.index }" data-label="${father.summary }"  -->
<!--                          data-toggle="icheck" value="${father.id }"> -->
<!--                     </td > -->
<!--                     <td width="90%" colspan="3"> -->
<!--                     </td> -->
<!--                 </tr> -->
                
<!--               <c:forEach items="${father.son }" var="son" varStatus="status"> -->
<!--                 <c:set var="num" value="${status.index+1}"></c:set> -->
<!--                 <c:if test="${status.count eq 1 || (status.count-1) % 6 eq 0}">     -->
<!--                  <tr> -->
<!--                  <td width="10%"> </td> -->
<!--                     <td width="90%" colspan="3"> -->
<!--                  </c:if>   -->
                   
<!--                         <input type="checkbox" name="menu_${father.index }" id="menu${father.id }"  -->
<!--                         data-toggle="icheck" value="${son.id }" data-label="${son.summary }"> -->
                  
<!--                 	<c:if test="${status.count % 6 eq 0 || status.count eq 6}">     -->
<!--                 	  </td> -->
<!--                  </tr> -->
<!--                  </c:if>    -->
<!--                    </c:forEach> -->
<!--                 </c:forEach> -->
            </tbody>
        </table>
        
<!--            <ul id="ztree1" class="ztree" data-toggle="ztree" data-check-enable="true" -->
<!--                     data-options="{ -->
<!--                         expandAll: true, -->
<!--                         onClick: 'ZtreeClick' -->
<!--                     }" -->
<!--                 > -->
<!--                     <li data-id="1" data-pid="0"  data-faicon-close="cab" data-name="menu_1">表单元素</li> -->
<!--                     <li data-id="10" data-pid="1" data-tabid="form-button" >按钮</li> -->
<!--                     <li data-id="11" data-pid="1" data-tabid="form-input">文本框</li> -->
<!--                     <li data-id="12" data-pid="1" data-tabid="form-select">下拉选择框</li> -->
<!--                     <li data-id="13" data-pid="1" data-tabid="table">复选、单选框</li> -->
<!--                     <li data-id="14" data-pid="1" data-tabid="form">表单综合演示</li> -->
<!--                     <li data-id="2" data-pid="0">表格</li> -->
<!--                     <li data-id="20" data-pid="2"  data-tabid="table" >普通表格</li> -->
<!--                     <li data-id="21" data-pid="2"  data-tabid="table-fixed" >固定表头表格</li> -->
<!--                     <li data-id="22" data-pid="2"  data-tabid="table-edit">可编辑表格</li> -->
<!--                 </ul> -->

	
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="button" id="savePermiss" class="btn-default" data-icon="ok">保存</button></li>
    </ul>
</div>
<link rel="stylesheet" href="${basePath}resources/admin/ztree/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${basePath}resources/admin/ztree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${basePath}resources/admin/ztree/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="${basePath}resources/admin/ztree/permissionsmenu.js"></script>
