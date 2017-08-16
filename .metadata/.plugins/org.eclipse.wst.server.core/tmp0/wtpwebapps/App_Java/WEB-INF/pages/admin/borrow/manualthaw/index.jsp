<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<style type="text/css">
	p.tips-title {
	    padding: 10px 20px 10px 50px;
	    line-height: 26px;
	    background-color: #fff5db;
	    border: 1px solid #f5c77f;
	    color:#777;
	    font-size: 16px;
	}
</style>
<div class="bjui-pageContent tableContent">
   	<div style="width: 500;margin: 20;">
	    <form id="pagerForm" action="${basePath }admin/borrowHandUnfreeze.do" method="post" data-toggle="validate">
	    	<p class="tips-title">
				<b>温馨提示：</b><br>
				请输入解冻流水号（即t_invest表的trxId）
			</p>
			<label style="font-size: 16px;">解冻流水号</label>
			<input type="text" name="id" class="form-control" size="19" data-rule="required">
			<button type="submit" class="btn-default" data-icon="save">开始解冻</button>
	    </form>
    </div>
</div>
