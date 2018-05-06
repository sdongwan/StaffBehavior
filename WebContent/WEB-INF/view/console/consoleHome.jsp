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
		 <div class="header" >        
	        <div style="height:40px;line-height:40px;padding-left:15px;font-family:Tahoma;font-size:16px;font-weight:bold;background-color: #3498DB;color:white;">
	            	员工行为分析系统后台管理
	        </div>
    	</div>
	    <ul id="menu1" class="mini-menubar" style="width:100%;"
	            url="${ctx}/tree/treeMenu.do" onitemclick="onItemClick" 
	            textField="text" idField="id" parentField="pid" >
	    </ul>
	    <div class="mini-fit" style="padding-top:5px;">
	        <!--Tabs-->
	        <div id="mainTabs" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;"> 
	            
	        </div>        
	    </div>
    	<div style="line-height:28px;text-align:center;cursor:default">Copyright ©  graduation project by sdongwan from WuYi University  </div>
		<script type="text/javascript">
			mini.parse();
	
		    function showTab(node) {
		        var tabs = mini.get("mainTabs");
	
		        var id = "tab$" + node.id;
		        var tab = tabs.getTab(id);
		        if (!tab) {
		            tab = {};
		            tab.name = id;
		            tab.title = node.text;
		            tab.showCloseButton = true;
		            
		         	// 拼接url
		            if (node.url == "logout") {
		            	 window.location = "${ctx}/console/" + node.url + ".do";
		            }else {
			            tab.url = "${ctx}/admin/" + node.url + ".do";
		            }
	
		            tabs.addTab(tab);
		        }
		        tabs.activeTab(tab);
		    }
		    
		    function onItemClick(e) {        
		        var item = e.item;
		        var isLeaf = e.isLeaf;
	
		        if (isLeaf) {
		            showTab(item);
		        }            
		    }

		</script>
	</body>
</html>