<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script>
$(function(){
	   $("#excel").click(function(){
		   $(this).alertmsg('confirm', '确定导出吗！', {displayMode:'slide', okName:'确定', 
       		cancelName:'取消', title:'确认框',
       		okCall:
       			expo
		  	});
		    
		});
});

function expo(){
	$("#excel").attr("disabled",true);
    window.location.href="exportWebStatis.do";
    setTimeout("test()",3000);
}
function test(){
	$("#excel").attr("disabled",false);
}
</script>
<div class="bjui-pageHeader" >
    <form id="pagerForm" data-toggle="ajaxsearch" action="financeStatisInit.do" method="post">
      	<input type="hidden" name="radio" id="radio">
        <div class="bjui-searchBar">
            <br/>
            <button type="button" class="btn-green" data-icon="floppy-o" id="excel" data-confirm-msg="确定要导出信息吗？" data-toggle="doexport">导出</button>&nbsp;
            <br/>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent" >
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center">统计项</th>
                <th align="center">金额</th>
            </tr>
        </thead>
        <tbody>
       		<tr data-id="65" align="center">
				<td>
					网站会员总金额：
				</td>
				<td align="center">
					${webMap.webUserAmount}
				</td>
			</tr>
			<tr data-id="65" align="center">
						<td>
							网站会员总冻结金额：
						</td>
						<td align="center">
							${webMap.webUserFreezeAmount}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							网站会员总待收金额：
						</td>
						<td align="center">
							${webMap.webUserForPI}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							网站收入总金额：
						</td>
						<td align="center">
							${webMap.webComeInAmount}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							网站总VIP金额：
						</td>
						<td align="center">
							${webMap.webVIPAmount}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							网站总学历认证金额：
						</td>
						<td align="center">
							${webMap.webXLAmount}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							网站总借款管理费金额：
						</td>
						<td align="center">
							${webMap.borrowManageFee}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							网站总借款逾期罚息金额：
						</td>
						<td align="center">
							${webMap.borrowFI}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							网站总债权转让手续费：
						</td>
						<td align="center">
							${webMap.creditManageFee}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							后台手动添加费用：
						</td>
						<td align="center">
							${webMap.backAddAmount}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							后台手动扣除费用：
						</td>
						<td align="center">
							${webMap.backDelAmount}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							网站成功充值总额：
						</td>
						<td align="center">
							${webMap.webSucPrepaid}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							网站线上充值总额：
						</td>
						<td align="center">
							${webMap.onlinePrepaid}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							网站线下充值总额：
						</td>
						<td align="center">
							${webMap.downlinePrepaid}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							网站提现总额：
						</td>
						<td align="center">
							${webMap.cashWith}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							网站提现手续费总额：
						</td>
						<td align="center">
							${webMap.cashWithFee}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							所有借款未还总额：
						</td>
						<td align="center">
							${webMap.borrowForPI}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							所有逾期网站垫付未还款金额：
						</td>
						<td align="center">
							${webMap.webAdvinceForP}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							借款逾期网站未垫付未还款金额：
						</td>
						<td align="center">
							${webMap.borrowForAmount}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							所有借款已还款总额：
						</td>
						<td align="center">
							${webMap.borrowHasAmount}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							所有借款正常还款总额：
						</td>
						<td align="center">
							${webMap.borrowNomalRepayAmount}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							借款逾期网站垫付后已还款总额：
						</td>
						<td align="center">
							${webMap.webAdvinceHasP}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							借款逾期的网站未垫付已还款总额：
						</td>
						<td align="center">
							${webMap.webNoAdvinceHasP}
						</td>
					</tr>
					<tr data-id="65" align="center">
						<td>
							借款逾期网站垫付总额：
						</td>
						<td align="center">
							${webMap.webAdviceAmount}
						</td>
					</tr>
        </tbody>
    </table>
</div>
<script type="text/javascript">
	
</script>
