<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%>
<div class="bjui-pageContent">
    <form action="ajaxDone2.html" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="custom.id" value="edce142bc2ed4ec6b623aacaf602a4de">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
            
            	<tr height="26px" >
                    <td colspan="4">
                    &nbsp; &nbsp; &nbsp;
                         <a href="addMaterialsauthInit.do?tabid=${tabid }&userId=${userId}" data-toggle="dialog" data-id="addRecommendDialog" data-mask="true" data-width="700" data-height="600" class="btn btn-blue">增加资料</a>&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                
                <tr height="26px" >
                    <td>
                        <label for="j_custom_sale" class="control-label x85">序号</label>
                    </td>
                    <td>
                        <label for="j_custom_color" class="control-label x85">资料标题</label>
                        
                    </td>
                    <td colspan="2">
                        <label class="control-label x85">操作</label>
                    </td>
                </tr>
                
                <c:forEach items="${dataList }" var="data" varStatus="status">
                	 <tr height="26px">
                    <td>
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                      ${status.index+1 }
                    </td>
                    <td>
                     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        ${data.companyname }
                    </td>
                    <td colspan="2">
                     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        	
					 <a href="queryDataDetail.do?userId=${data.id }&dialogId=dataList-${data.id }-${data.groupid}&groupId=${data.groupid}" data-toggle="dialog" data-id="dataList-${data.id }-${data.groupid}" 
					 data-mask="true" data-width="800" data-height="600">&nbsp;<span class="btn-blue"></span>查看详情</a>
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
                </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
<!--         <li><button type="button" class="btn-close" data-icon="close">取消</button></li> -->
<!--         <li><button type="submit" class="btn-default" data-icon="save">保存</button></li> -->
    </ul>
</div>
