<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>员工行为分析系统</title>
		<%@include file="/commons/include/system.jsp"%>
		<style type="text/css">
			body{
			    	width:100%;
			    	height:100%;
			    	margin:0;
			    	overflow:hidden;
			    }
		</style>
		<script type="text/javascript">
		
	        
		</script>
	</head>
	<body>
		<div class="mini-splitter" style="width:100%;height:100%;">
			<div size="15%" showCollapseButton="true" style="padding:5px;">
		  		<div class="mini-fit">
	            <ul id="departTree" class="mini-tree" url="${ctx}/tree/departTree.do" 
	            	style="width:100%;"  showTreeIcon="true" textField="text" idField="id" parentField="pid" resultAsTree="false">        
	            </ul>
       		 </div>
		   </div>
		   <div showCollapseButton="true">
		   	   <div class="mini-fit">
			   	   <iframe id="mainframe" frameborder="0" name="main" 
		       	   		style="width:100%;height:100%" border="0">
		       	   		
		       	   </iframe> 
		   	   </div>
		   </div>        
		</div>
		<script type="text/javascript">
			mini.parse();
			var tree = mini.get("departTree");
			var iframe = document.getElementById("mainframe");  
			
			//节点点击事件
        	tree.on("nodeselect", function (e) {
        		var node = e.node;
        		console.log(node);
	            if (e.isLeaf) {
	            	iframe.src = "${ctx}/depart/"+node.url+".do";  
	            }
       		});
        	
		</script>
	</body>
</html>