<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent tableContent">
   	<div style="width: 500;margin-left: 20;margin-top: 20;">
	    <form id="pagerForm" action="${basePath }admin/handSignHeTonglist.do" method="post" data-toggle="validate">
			<label style="font-size: 16px;">借款ID</label>
			<input type="text" name="id" class="form-control" size="19" data-rule="required">
			<button type="submit" class="btn-default" data-icon="save">开始补签合同</button>
	    </form>
    </div>
</div>
