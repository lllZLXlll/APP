<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%>
<style>
	.p {
		font-size: 18px;
	}
</style>
<script type="text/javascript">

</script>
<div class="bjui-pageHeader">
	<form id="editForm" action="addRepayMentNotice.do" method="post" data-toggle="validate" data-alertmsg="false">
	<input type="hidden" name="tabid" value="${tabid}">
	<input type="hidden" name="id" value="${id}">
	<input type="hidden" name="pageSize" value="${pageBean.pageSize}">
    <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <table width="100%" border="0" cellspacing="1" cellpadding="3">
			<tr>
				<td  align="left" style="padding-left: 50px;" class="blue12"
					 colspan="2">
					<strong>沟通内容：</strong>
				</td>
			</tr>
			<tr>
				<td align="right"
					class="blue12">
				</td>
				<td align="left" class="f66" >
					<textarea name="content" data-toggle="kindeditor" data-rule="required" data-items="forecolor, hilitecolor, bold, italic, underline, removeformat, |, justifyleft, justifycenter, justifyright, insertorderedlist, insertunorderedlist, |, emoticons, link"></textarea>
				</td>
			</tr>
		</table>
		<ul>
        	<li><button type="submit" class="btn-green" data-icon="ok">确定</button></li>
   		</ul>
	</form>
</div>
<div class="bjui-pageContent tableContent">
	<table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
            	<th align="center">序号</th>
                <th align="center">沟通记录</th>
                <th align="center">沟通时间</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${pageBean.page }" var="bean" varStatus="status">
              <tr data-id="65" align="center">
                <td align="center">
					${status.index+1+count }
				</td>
				<td>
					${bean.serviceContent}
				</td>
				<td>
					${bean.serviceTime}
			    </td>
		     </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<div class="bjui-pageFooter">
    <div class="pages">
        <span>每页&nbsp;</span>
        <div class="selectPagesize">
            <select data-toggle="selectpicker" data-toggle-change="changepagesize">
            	<option value="20">20</option>
                <option value="30">30</option>
                <option value="60">60</option>
                <option value="120">120</option>
                <option value="150">150</option>
            </select>
        </div>
        <span>&nbsp;条，共 ${pageBean.totalNum } 条， 共 ${pageBean.totalPageNum } 页    
		</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageBean.totalNum }" data-page-size="${pageBean.pageSize }" data-page-current="1">
    </div>
</div>