<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent tableContent">
   	<div style="width: 300;margin-left: 20;">
	    <form id="pagerForm" action="${basePath }admin/updateExGoSum.do" method="post" data-toggle="validate">
	    	<input type="hidden" name="tabid" value="${tabid }">
	    	<input type="hidden" name="id" value="${item.id }">
	    	<br />
			<label style="font-size: 16px;">体验金金额：</label>
			<input type="text" name="invmAmount" value="${item.invmAmount }" class="form-control" size="19" data-rule="required">
			<br />
			<br />
			<button type="submit" class="btn-default" data-icon="save">修改</button>
	    </form>
    </div>
</div>
