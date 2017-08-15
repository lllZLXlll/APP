<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script>
	var sort;

	function inputFocus(obj) {
		sort = $(obj).val();
	}

	function inputBlur(obj) {
		var input  = $(obj);
		var id = input.attr('name');
		var val = input.val();
		val = val.replace(/(^\s*)|(\s*$)/g, "");
		if (sort != val) {
			if (val == null || val == '' || isNaN(val) || val <= 0) {
				alert('请输入正确的数字序号');
				input.val(sort);
			} else {
				$.get("updateSortByid.do?tabid=${tabid}", {bannerId:id,sort:val}, function(data) {
					
					if (data.statusCode == 200) {
						$(this).alertmsg('info', data.message, {displayMode:'fade', displayPosition:'middlecenter', okName:'确定'});
						input.val(val);
					} else {
						input.val(sort);
					}
				});
			}
		}
	}
		
</script>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="toBanner.do" method="post">
      	<input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <a href="addBannerInit.do?tabid=${tabid }" data-toggle="dialog" data-id="changepwd_page" data-mask="true" data-width="500" data-height="500" class="btn btn-blue">&nbsp;上传Banner</a>&nbsp;&nbsp;
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center">序号</th>
            	<th align="center">文件</th>
                <th align="center">上传时间</th>
                <th align="center">链接</th>
                <th align="center">类型</th>
                <th align="center">是否显示</th>
                <th align="center">序号(点击修改)</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="banner" varStatus="status">
              <tr data-id="65" align="center">
              	<td>${status.index+1+count }</td>
	            <td align="center" class="pic" >
					<a href="${banner.bannerPath }" target="_blank" title="查看图片"><img src="${banner.bannerPath }" width="30px" height="20px"/></a>
				</td>
            	<td ><fmt:formatDate value="${banner.uploadTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td>${banner.link }</td>
                <td align="center">
				   <c:if test="${banner.type == 1 }">
			 			PC端 
				   </c:if>
				   <c:if test="${banner.type == 2 }">
				   		wap端
				   </c:if>
				   <c:if test="${banner.type == 3 }">
				   		App端
				   </c:if>
			   </td>
			   <td align="center">
			   	   <c:if test="${banner.isShow == 1 }">是</c:if>
			   	   <c:if test="${banner.isShow == 2 }">否</c:if>
			   </td>
			   <td align="center" style="width:15%;">
			   		<input alt="序号" type="text" name="${banner.id }" 
			   		class="sort" value="${banner.sort }" style="width:25px;height:25px;border: none;" onfocus="inputFocus(this)" onblur="inputBlur(this)" />
			   </td>
                <td>
                <a style="cursor:pointer;" href="updateBannerByIdInit.do?id=${banner.id}&tabid=${tabid }" data-toggle="dialog" data-id="updateBannerByIdInit" data-mask="true" data-width="700" data-height="500" class="btn btn-green"> 编辑 </a>
                	<a href="deleteBannerById.do?id=${banner.id }" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
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
        <span>&nbsp;条，共 ${pageBean.totalNum } 条， 共 ${pageBean.totalPageNum } 页</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageBean.totalNum }" data-page-size="${pageBean.pageSize }" data-page-current="1">
    </div>
</div>
<script type="text/javascript">
	
</script>
