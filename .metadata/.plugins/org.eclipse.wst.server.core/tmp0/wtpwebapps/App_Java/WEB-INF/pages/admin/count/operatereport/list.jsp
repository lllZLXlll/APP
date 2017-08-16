<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="operateReportInit.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <label>时间：</label> <input type="text" name="beginDate" id="beginDate"  data-toggle="datepicker"
                       data-pattern="yyyy-MM" value="${beginDate }" readonly="readonly" size="20">&nbsp;-&nbsp;
            </label> <input type="text" name="endDate" id="endDate"  data-toggle="datepicker"
                       data-pattern="yyyy-MM" value="${endDate }" readonly="readonly" size="20">
            &nbsp;&nbsp;
            <button type="button" class="btn-default" id="searchButton" data-icon="search">查询</button>&nbsp;
             <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
            </div>
        </div>
        <div class="bjui-moreSearch">
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <tbody>
        <c:forEach items="${pageBean.page }" var="operateReport">
         <tr data-id="65" align="center">
               <td colspan="10"><span style="font-weight:bold;">${operateReport.month }月份运营数据</span></td>
            </tr>
      <tr  align="center">
				<td  >生成时间</td>
				<td  ><fmt:formatDate value="${operateReport.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
				<td  >平台交易总额（元）</td>
				<td  ><fmt:formatNumber value="${operateReport.totalInvestAmount }" type="currency" pattern="#,##0.00"/></td>
				<td  >月交易总额（元）</td>
				<td  ><fmt:formatNumber value="${operateReport.totalMonthAmount }" type="currency" pattern="#,##0.00"/></td>
				<td  >截止待还款总金额（元）</td>
				<td  ><fmt:formatNumber value="${operateReport.monthUnRepayAmount }" type="currency" pattern="#,##0.00"/> </td>
				<td  >总收益（元）</td>
				<td  ><fmt:formatNumber value="${operateReport.totalIncome }" type="currency" pattern="#,##0.00"/>  </td>
				</tr>
				
				<tr align="center">
				<td >月总收益（元）</td>
				<td><fmt:formatNumber value="${operateReport.monthIncome }" type="currency" pattern="#,##0.00"/> </td>
				<td >总用户数</td>
				<td>${operateReport.totalUser }</td>
				<td >月注册人数</td>
				<td>${operateReport.monthUser }</td>
				<td >截止总投资人数</td>
				<td>${operateReport.totalInvestUser }</td>
				<td >月投资人数</td>
				<td>${operateReport.monthInvestUser }</td>
				</tr>
				
				<tr align="center">
				<td >月人均投资金额（元）</td>
				<td><fmt:formatNumber value="${operateReport.monthAvgAmount }" type="currency" pattern="#,##0.00"/></td>
				<td >月笔均投资金额（元）</td>
				<td><fmt:formatNumber value="${operateReport.penAvgAmount }" type="currency" pattern="#,##0.00"/> </td>
				<td >男性所占百分比</td>
				<td>${operateReport.manProp }</td>
				<td >女性所占百分比</td>
				<td>${operateReport.womanProp }</td>
				<td >截止恒金宝待收本金（元）</td>
				<td><fmt:formatNumber value="${operateReport.hjbUnrepay }" type="currency" pattern="#,##0.00"/></td>
				</tr>
    
    
				<tr align="center">
				<td >截止普金宝待收本金（元）</td>
				<td><fmt:formatNumber value="${operateReport.pjbUnrepay }" type="currency" pattern="#,##0.00"/></td>
				<td >截止多金宝待收本金（元）</td>
				<td><fmt:formatNumber value="${operateReport.djbUnrepay }" type="currency" pattern="#,##0.00"/></td>
				<td >截止投资人小于18岁占比</td>
				<td>${operateReport.less18 }</td>
				<td >截止投资人18-24岁占比</td>
				<td>${operateReport.o1824 }</td>
				<td >截止投资人25-29岁占比</td>
				<td>${operateReport.o2529 }</td>
				</tr>
				
				<tr align="center">
				<td >截止投资人30-34岁占比</td>
				<td>${operateReport.o3034 }</td>
				<td >截止投资人35-39岁占比</td>
				<td>${operateReport.o3539 }</td>
				<td >截止投资人40-49岁占比</td>
				<td>${operateReport.o4049 }</td>
				<td >截止投资人超过50岁占比</td>
				<td>${operateReport.exc50 }</td>
				<td >投资人北京区域分布所占比</td>
				<td>${operateReport.beijing }</td>
				</tr>
				
				<tr align="center">
				<td >天津</td>
				<td>${operateReport.tianjin }</td>
				<td >河北</td>
				<td>${operateReport.hebei }</td>
				<td >山西</td>
				<td>${operateReport.shanxi }</td>
				<td >内蒙古</td>
				<td>${operateReport.neimenggu }</td>
				<td >辽宁</td>
				<td>${operateReport.liaoning }</td>
				</tr>
				
				<tr align="center">
				<td >吉林</td>
				<td>${operateReport.jilin }</td>
				<td >黑龙江</td>
				<td>${operateReport.heilongjiang }</td>
				<td >上海</td>
				<td>${operateReport.shanghai }</td>
				<td >江苏</td>
				<td>${operateReport.jiangsu }</td>
				<td >浙江</td>
				<td>${operateReport.zhejiang }</td>
				</tr>
				
				<tr align="center">
				
				<td >安徽</td>
				<td>${operateReport.anhui }</td>
				<td >江西</td>
				<td>${operateReport.jiangxi }</td>
				<td >福建</td>
				<td>${operateReport.fujian }</td>
				<td >山东</td>
				<td>${operateReport.shandong }</td>
				<td >台湾</td>
				<td>${operateReport.taiwan }</td>
				</tr>
				
				<tr align="center">
				<td >河南</td>
				<td>${operateReport.henan }</td>
				<td >湖北</td>
				<td>${operateReport.hubei }</td>
				<td >湖南</td>
				<td>${operateReport.hunan }</td>
				<td >广东</td>
				<td>${operateReport.guangdong }</td>
				<td >广西</td>
				<td>${operateReport.guangxi }</td>
				</tr>
				
				<tr align="center">
				<td >海南</td>
				<td>${operateReport.hainan }</td>
				<td >香港</td>
				<td>${operateReport.hongkong }</td>
				<td >澳门</td>
				<td>${operateReport.macao }</td>
				<td >重庆</td>
				<td>${operateReport.chongqing }</td>
				<td >四川</td>
				<td>${operateReport.sichuan }</td>
				</tr>
				
				<tr align="center">
				<td >云南</td>
				<td>${operateReport.yunan }</td>
				<td >西藏</td>
				<td>${operateReport.tibet }</td>
				<td >贵州</td>
				<td>${operateReport.guizhou }</td>
				<td >陕西</td>
				<td>${operateReport.shaanxi }</td>
				<td >甘肃</td>
				<td>${operateReport.gansu }</td>
				</tr>
				
				<tr align="center">
				<td >青海</td>
				<td>${operateReport.qinghai }</td>
				<td >宁夏</td>
				<td>${operateReport.ningxia }</td>
				<td >新疆</td>
				<td>${operateReport.xinjiang }</td>
				<td ></td>
				<td></td>
				<td ></td>
				<td></td>
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
        <span>&nbsp;条，共 ${pageBean.totalNum } 条， 共 ${pageBean.totalPageNum } 页</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageBean.totalNum }" data-page-size="${pageBean.pageSize }" data-page-current="1">
    </div>
</div>
<script type="text/javascript">
	$("#searchButton").click(function(){
		var beginTime = $("#beginDate").val();
		var endTime = $("#endDate").val();
		beginTime = beginTime.replace(/-/g, '/');
		endTime = endTime.replace(/-/g, "/");
		var date1 = new Date(beginTime); // 开始时间
		var date2 = new Date(endTime); // 结束时间
		var date3=date2.getTime()-date1.getTime();  //时间差的毫秒数
		var beginTimeLength=beginTime.trim().length;
		var endTimeLength=endTime.trim().length;
		if (beginTimeLength == 0 && endTimeLength==0) {
			$('#pagerForm').submit();
		} else {
			if (beginTimeLength == 0 && endTimeLength>0) {
				$(this).alertmsg('warn', '开始时间不能为空');
				return;
			}
			if (beginTimeLength > 0 && endTimeLength==0) {
				$(this).alertmsg('warn', '结束时间不能为空');
				return;
			}
			if (date1 > date2) {
				$(this).alertmsg('warn', '结束时间不能小于开始时间');
				return;
			}else if(date3==0){
				$(this).alertmsg('warn', '开始时间和结束时间不能一样');
				return;
			} else {
				$('#pagerForm').submit();
			}
		}
	});
</script>