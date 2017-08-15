<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 

<div class="bjui-pageContent">
    <form action="saveOrUpdateBorrowPurpose.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
          <input type="hidden"  name="tabid" value="${tabid }">
         <input type="hidden" id="selectId" name="id" value="${select.id }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x100">类型：</label>
                      <c:choose>
	                	<c:when test="${ select.typeId ==null or select.typeId ==1 or select.typeId ==2 or select.typeId ==3}">
                         	 <select name="typeId" id="typeId" data-toggle="selectpicker">
	               				<option value="1" ${select.typeId ==1?'selected':''}>借款目的</option>
	               				<option value="2" ${select.typeId ==2?'selected':''}>担保机构</option>
	                			<option value="3" ${select.typeId ==3?'selected':''}>反担保方式</option>
            				</select>
	                	</c:when>
	                	<c:otherwise>
	                		  <input type="text" name="typeId" id="typeId" value="${select.typeId }" readonly="readonly" />
	                	</c:otherwise>
	                </c:choose>
                    </td>
                </tr>
            
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x100">名称：</label>
                        <input type="text" name="selectName" id="selectName" value="${select.selectName }" maxlength="20"  
                        data-rule="required" size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x100">描述：</label>
                       <textarea name="description" id="description"  data-toggle="autoheight" cols="40" rows="8">${select.description }</textarea>
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
	var id=$("#selectId").val();
	if(id.trim().length>0){
		$("#typeId").attr("disabled",true);
	}
</script>

