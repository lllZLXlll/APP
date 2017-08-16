<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script type="text/javascript">
function check(){//确认充值
	  var AmtsRegExp =/^(([1-9]\d{0,9})|0)(\.\d{1,2})?$/;
	  var uid = $('#userId').val();
	  var money = $('#money').val();  	
	  var admin = 'admin';  	
	  if(money == ''){
		 $(this).alertmsg('warn', '请输入充值金额');
		 return;
	  }
  	  
	  //充值
	  var param={uid:uid,money:money,admin:admin};
	  $.post("ipayPayment.do",JSON.stringify(param),function(data){
		  $("#btnSave").attr("disabled",false);
	        	if(data.error==0){      		
	        		var obj = window.open("about:blank");   
	                obj.document.write(data.html); 
	                $(this).dialog('closeCurrent');
	        	}else{
	        		$(this).alertmsg('warn', data.msg);
	        	}	
	  });
		      
	}
</script>
<div class="bjui-pageContent" id="htmlDiv">
    <form action="ipayPayment.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="tabid" value="${tabid }">
        <input type="hidden" name="userId" id="userId" value="${usermap.userId }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr >
                    <td>
                        <label for="j_custom_sale" class="control-label x100">用户名：</label>
                       <input type="text" name="username" id="j_custom_name"   size="20" readonly="readonly" value="${usermap.username }">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x100">真实姓名：</label>
                        <input type="text" name="realName" id="j_custom_name"  data-rule="required" readonly="readonly" size="20" value="${usermap.realName }" >
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x100">用户手机号：</label>
                       <input type="text" name="cellPhone" id="j_custom_name"   size="20" readonly="readonly" value="${usermap.cellPhone  }">
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x100">充值金额：</label>
                        <input type="text" name="money" id="money"   size="20"  data-rule="number">
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="button" class="btn-default" onclick="check();" id="btnSave">确定</button></li>
    </ul>
</div>