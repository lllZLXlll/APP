<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.p {
		font-size: 18px;
	}
</style>
<script type="text/javascript">

</script>
<div class="bjui-pageContent">
        <table class="table table-condensed table-hover" style="border: none;">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x85">标题：</label>
                    </td>
                    <td class="p" style="font-size: 18px;">
                   		${news.title}
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">公告类型：</label>
                    </td>
                    <td class="p" style="font-size: 18px;">
                   		${news.announcementType}
                    </td>
                </tr>
                <tr>
                    <td>
                       <label for="j_custom_birthday" class="control-label x85">内容：</label>
                    </td>
                    <td class="p" style="font-size: 18px;">
                   		${news.content}
                    </td>
                    <td width="50px"></td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">序号：</label>
                    </td>
                    <td class="p" style="font-size: 18px;">
                   		${news.sort}
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">浏览次数：</label>
                    </td>
                    <td class="p" style="font-size: 18px;">
                   		${news.visits}
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">发布时间：</label>
                    </td>
                    <td class="p" style="font-size: 18px;">
                   		<fmt:formatDate value="${news.publishTime }" pattern="yyyy-MM-dd"/>
                    </td>
                </tr>
            </tbody>
        </table>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">确定</button></li>
    </ul>
</div>