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
   	<div style="width: 1000;margin: 20;">
	    <form id="pagerForm" action="${basePath }admin/handrepaymentlist.do" method="post" data-toggle="validate">
		    <p class="tips-title">
				<b>温馨提示：</b><br>
				请输入还款订单号(即t_invest_repayment的id)<br>
				使用场景：在借款人对投资人进行还款,如果失败，在此输入<br>
				t_invest_repayment的id进行手工还款，如果最后一期还<br>
				款成功则需要手工更改t_invest的repayStatus为2，即已还款状态
			</p>		 
			<input type="text" name="id" class="form-control" size="19" data-rule="required">
			<button type="submit" class="btn-default" data-icon="save">开始还款</button>
	    </form>
    </div>
</div>
