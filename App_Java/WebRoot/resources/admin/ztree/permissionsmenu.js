  
	var setting = {
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			 callback:{
	                onCheck:onCheck
	            }
		};

//		var zNodes =[
//			{ id:1, pId:0, name:"华南", open:true},
//			{ id:11, pId:1, name:"广东省",open:true},
//			{ id:111, pId:11, name:"广州市"},
//			{ id:112, pId:11, name:"深圳市"}
//		];
//		
		var code;
		
		function showCode(str) {
			
			if (!code) code = $("#code");
			code.empty();
			code.append("<li>"+str+"</li>");
		}
		
		
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			$("#py").bind("change");
			$("#sy").bind("change");
			$("#pn").bind("change");
			$("#sn").bind("change");
		});
		
		
		$(function() {
			$.post("getPermissionsMenu.do?id="+$("#roleId").val(), {
				"action" : "getPermissionsMenu.do"
			}, show, "json");
		});
		
		
		var zNodes;


		function show(data) {
			zNodes = data;
			$.fn.zTree.init($("#treeDemo"), setting, data);

		}
		
		
	   function onCheck(e,treeId,treeNode){
	        var treeObj=$.fn.zTree.getZTreeObj("treeDemo"),
	        nodes=treeObj.getCheckedNodes(true),
	         v="";
	        var ids="[";
	         for(var i=0;i<nodes.length;i++){
	            var halfCheck = nodes[i].getCheckStatus();
	            if (!halfCheck.half){
	            ids+="{'menu':"+nodes[i].id+"},"	
	               }
	           }
	            ids+="]";
	            return ids;
	      }
	   
	   
	   $("#savePermiss").click(function(e,treeId,treeNode){
		   var menu=onCheck(e,treeId,treeNode);
		   $("#menu").val(menu);
		   $('#addRole_form').submit();
		});

		
