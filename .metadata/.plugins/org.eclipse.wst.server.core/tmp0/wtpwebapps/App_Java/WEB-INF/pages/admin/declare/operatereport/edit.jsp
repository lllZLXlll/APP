<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
</script>
<div class="bjui-pageContent">
    <form action="updateBannerById.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="id" value="${banner.id }">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover" width="100%" style="border: none;">
            <tbody>
            	<tr>
            		<th align="center" style="font-size: 25px;border: none;">Banner信息</th>
            	</tr >
           	 	<tr>
                    <td style="border: none;">
                        <label for="j_custom_name" class="control-label x85">图片：</label>
                        <img src="${banner.bannerPath }" width="150px" height="90px"/>
                    </td>
                </tr>
                <tr>
                    <td style="border: none;">
                        <label for="j_custom_name" class="control-label x85">链接：</label>
                        <input type="text" name="link" id="j_custom_name" width="400px"  data-rule="url" size="20" value="${banner.link}">
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>