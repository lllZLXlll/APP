    
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
		
		function getMarktree(){
			$.post("findMarktree", {
				"action" : "findMarktree"
			}, show, "json");
		};
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
	            v+=nodes[i].name + ",";
	         //   ids+=nodes[i].id + ",";
	          //  ids+="&zipCode="+nodes[i].id;
	          //  alert(nodes[i].id); //获取选中节点的值
	            ids+="{'onelevel':"+nodes[i].id+"},"	
	               }
	           }
	            ids+="]";
	    //      alert(ids);  
	            return ids;
	      }
	   
	   function save(e,treeId,treeNode){
		   var zipCode=onCheck(e,treeId,treeNode);
		//   var zipCode2 ="[{'onelevel':910},{'onelevel':940},]";
		//   alert(zipCode);
		   
		   jQuery.ajax({
			   type: "post",
			   url: "saveArea",
			   dataType : 'text',
			   data : {'zipCode':zipCode},
			   success: function(data,textStatus){
		//	   alert("操作成功");
			   },
			   error: function(xhr,status,errMsg){
			//   alert("操作失败!");
			   }
		});
		   
		   $("#f").attr("action", "addArea");
		   $('#f').submit();
		   
	   }
		
