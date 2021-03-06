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
   	<div style="width: 800;margin: 20;">
	    <form id="pagerForm" action="${basePath }admin/handTransferAccountslist.do" method="post" data-toggle="validate">
	    	<input type="hidden" name="tabid" value="${tabid }">
	    	<p class="tips-title">
				<b>温馨提示：</b><br>
				1.手工转账功能的作用是从普金资本企业账户转账至平台的个人账户。<br />
				2.入账人汇付账号请填写收款人汇付账号（即t_user表的ipayAccount）。<br />
				3.每次转账金额不能超过200元，同一个账户每天不能超过600元（转账3次）。<br />
			</p>
			<label>入账人汇付账号</label>
			<input type="text" name="inUsrCustId" value="${inUsrCustId }" class="form-control" size="19" data-rule="required">
			<label>转账金额</label>
			<input type="text" name="transAmt" value="${transAmt }" class="form-control" size="19" data-rule="required">
			<button type="submit" class="btn-default" data-icon="save">开始转账</button>
	    </form>
    </div>
</div>
