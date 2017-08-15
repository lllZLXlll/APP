<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../../include/base.jsp"%>
<script type="text/javascript">
	
</script>
<div class="bjui-pageHeader" style="background:#FFF;">
	<div style="padding: 0 15px;height: 600px">
		<div style="float:left; width:300px;margin-left:20px;margin-top: 20px">
			<div class="alert alert-info" role="alert"
				style="margin:0 0 5px; padding:10px;">
				 <div style="margin-bottom: 5px;margin-top: 8px;font-weight:bold;">借款管理</div>
				
				借款等待资料审核： <a href="#" style="color: red;">(${map.ddcount })</a>条<br /> 
				借款初审审核： <a href="#" style="color: red;">(${map.pcount })</a>条<br /> 
				借款满标审核： <a href="borrowFullScale.do?tabid=submenu-tab-81"  data-toggle="navtab" data-id="submenu-tab-81" 
				data-title="满标借款" style="color: red;">(${map.fcount })条</a><br />
				申请债权转让： <a href="queryApplyDebtInit.do?tabid=submenu-tab-86&debtStatus=1"  data-toggle="navtab" data-id="submenu-tab-86" 
				data-title="债权转让" style="color: red;">(${map.zccount })条</a><br /> 
				债权转让中：<a href="queryApplyDebtInit.do?tabid=submenu-tab-86&debtStatus=2"  data-toggle="navtab" data-id="submenu-tab-86" 
				data-title="债权转让" style="color: red;">(${map.zacount })条</a><br />
			</div>
		</div>

		<div style="float:left; width:300px;margin-left:20px;margin-top: 20px">
			<div class="alert alert-info" role="alert"
				style="margin:0 0 5px; padding:10px;">
				 <div style="margin-bottom: 5px;margin-top: 8px;font-weight:bold;">认证管理</div> 
				用户基本信息审核(待审核)：<a href="#" style="color: red;">(${map.jbxxcount })</a>条<br /> 
				用户基本资料审核(待审核)：  <a href="#" style="color: red;">(${map.jbzlcount })</a>条<br /> 
				额度申请(审核中)：<a href="#" style="color: red;">(${map.edcount })</a>条<br />
				可选资料认证：<a href="#" style="color: red;">(${map.kxcount })</a>条<br /> 
			</div>
		</div>

		<div style="float:left; width:300px;margin-left:20px;margin-top: 20px">
			<div class="alert alert-info" role="alert"
				style="margin:0 0 5px; padding:10px;">
				 <div style="margin-bottom: 5px;margin-top: 8px;font-weight:bold;">资金管理</div> 
				 
				等待审核的提现(审核中)： <a href="queryAllWithdrawInit.do?tabid=submenu-tab-50&state=1"  data-toggle="navtab" data-id="submenu-tab-50" 
				data-title="充值提现审核" style="color: red;">(${map.ddtxcount })条</a><br /> 
				
				转账中的提现(转账中)：<a href="queryAllWithdrawInit.do?tabid=submenu-tab-50&state=4"  data-toggle="navtab" data-id="submenu-tab-50" 
				data-title="充值提现审核" style="color: red;">(${map.zctxcount })条</a><br /> 
			</div>
		</div>
		
		<c:if test="${admin.id==-1 or admin.roleId== 16 }">
				<div style="float:left; width:300px;margin-left:20px;margin-top: 20px">
			<div class="alert alert-info" role="alert"
				style="margin:0 0 5px; padding:10px;">
				 <div style="margin-bottom: 5px;margin-top: 8px;font-weight:bold;">贷后管理</div> 
				待处理的月检： <a href="borrowInspectionInit.do?tabid=submenu-tab-607"  data-toggle="navtab" data-id="submenu-tab-607" 
				data-title="项目部未处理月检" style="color: red;">(${map.borrowInspectionCount })条</a><br /> 
				
			</div>
		</div>
		</c:if>
		
		
		<div class="row" style="margin-left:170px; margin-top:10px;">
			<div class="col-md-6" style="padding:5px;"></div>
			<div class="col-md-6" style="padding:5px;"></div>
		</div>
	</div>
</div>
