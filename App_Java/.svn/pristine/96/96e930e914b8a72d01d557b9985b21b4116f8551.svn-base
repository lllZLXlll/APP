<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%>
<html>
	<head>
		<title>更新内容</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<script>
		 function getValue(){  
		    var radio = document.getElementsByName("statu");  
		    for (i=0; i<radio.length; i++) {  
		        if (radio[i].checked) {  
		            $("#status").val(radio[i].value);
		        }  
		    }  
		}   
		</script>
	</head>
	<div class="bjui-pageContent">
		   <form action="updateNetWorkById.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
		       <input type="hidden" name="id" value="${netWork.id }">
		       <input type="hidden" name="tabid" value="${tabid }">
		       <input type="hidden" name="status" id="status" value="${netWork.status }"/>
		       <table class="table table-condensed table-hover" width="100%">
		           <tbody>
							<tr > 
								<td width="100" height="28px;"  class="main_alll_h2" style="border: none;">
									关闭网站
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;border: none;" align="right"
									class="blue12">
									关闭前台网站：
								</td>
								<td style="border: none;">
									<input type="radio" name="statu" value="1"
									    ${netWork.status == 1 ? 'checked':''} onclick="getValue()"
									/>开启
									<input type="radio" name="statu" value="2" 
								   		${netWork.status == 2 ? 'checked':''} onclick="getValue()"
								    />关闭 
							    </td>
							</tr>
							<tr>
								<td style="height: 25px;border: none;" align="right" class="blue12" >
									内容：
								</td>
								<td align="left" class="f66" style="border: none;">
									<textarea name="content" data-toggle="kindeditor" data-rule="required" data-items="forecolor, hilitecolor, bold, italic, underline, removeformat, |, justifyleft, justifycenter, justifyright, insertorderedlist, insertunorderedlist, |, emoticons, link">${netWork.content }</textarea>
								</td>
							</tr>
							<tr><td style="height: 25px;border: none;"></td></tr>
							<tr>
								<td style="height: 25px;border: none;"></td>
								<td style="height: 25px;border: none;">
									<button type="submit" class="btn btn-blue" data-icon="save">保存</button>
								</td>
							</tr>
						</tbody>
				</table>
		</form>
		</div>
</html>
