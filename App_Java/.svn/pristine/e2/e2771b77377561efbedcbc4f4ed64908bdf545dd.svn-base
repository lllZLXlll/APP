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
                    <td style="font-size: 18px;">
                        <label for="j_custom_sale" class="control-label x85">新闻标题：</label>
                    </td>
                    <td class="p" style="font-size: 18px;">
                    	${mediaReport.title }
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">新闻网址：</label>
                    </td>
                    <td class="p">
                    	${mediaReport.url }
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">新闻来源：</label>
                    </td>
                    <td class="p">
                    	${mediaReport.source }
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">图片：</label>
                    </td>
                    <td>
                    	<img src="${mediaReport.imgPath }" width="100">
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">新闻简述：</label>
                    </td>
                </tr>
                <tr>
                	<td>&nbsp;&nbsp;</td>
                	<td class="p">
                    	${mediaReport.content }
                    </td>
                    <td width="50px"></td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">发布时间：</label>
                    </td>
                    <td class="p">
                    	<fmt:formatDate value="${mediaReport.publishTime }" pattern="yyyy-MM-dd"/>
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">确定</button></li>
    </ul>
</div>