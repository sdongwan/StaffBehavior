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
			
		   #menu1{
			   float:right;
			   margin-top:5px;
		   }
		   
		   .mini-menu-border{
		   		border:none;
		   }
		   .mini-menu-horizontal .mini-menu-inner{
		   		background-color: #ffffff;
		   }
		   
		   .header{
		   		height:40px;
		   		line-height:40px;
		   		padding-left:15px;
		   		font-family:Tahoma;
		   		font-size:16px;
		   		font-weight:bold;
		   		background-color: #ffffff;
		   		color:#3498DB;
		   		box-shadow:-1px 0px 1px rgba(0, 0, 0, .04),0px 1px 1px rgba(0, 0, 0, .13),1px 0px 2px rgba(0, 0, 0, .05);
		   }
		   
		   .mini-menu-horizontal .mini-menuitem{
			    margin-right:5px;
			    margin-left:5px;
			    font-weight:none;
			    padding:2px;
			    border-radius: 3px;
		   }
		   
		   .mini-menuitem-text{
		   		 color:#3498DB;
		   }
		   
		   .mini-menuitem-hover,.mini-menu-popup{
		   		border:none;
		   		padding:2px;
		   		background-color:#3498DB;
		   }
		   
		   .mini-menuitem-hover .mini-menuitem-text{
		   		 color:#ffffff;
		   }
		   
		   .mini-menu-popup .mini-menuitem-text{
		   		 color:#ffffff;
		   }
			
		   #bg{
		   		width:500px;
		   		height:500px;
		   		border-radius:250px;
		   }
		   
		   marquee{
		   		font-weight:bold;
		   		font-size:15px;
		   		margin-top:15px;
		   }
		   
		</style>
		<script type="text/javascript">
		
	        
		</script>
	</head>
	<body>
        <div class="header">
            	员工行为分析系统后台管理
           	 <ul id="menu1" class="mini-menubar" 
	            url="${ctx}/tree/treeMenu.do" onitemclick="onItemClick" 
	            textField="text" idField="id" parentField="pid" >
		    </ul>
        </div>
    	
	   
	    <div class="mini-fit" style="padding-top:5px;position:relative;">
	        <!--Tabs-->
	        <div id="bg-container" style="width:500px;height:500px;position: absolute;
       	 		top: 50%;left:50%;transform: translateY(-50%) translateX(-50%);">
	        	<img src="${ctx}/assets/images/console_bg.jpg" id="bg"/>
	        	<marquee behavior="alternate">欢迎进入员工行为评估后台管理界面</marquee>
	        </div>
	        
	        <div id="mainTabs" class="mini-tabs" oncloseclick="onCloseClick" activeIndex="0" style="width:100%;height:100%;display:none;"> 
	            
	        </div>        
	    </div>
    	<div style="line-height:28px;text-align:center;cursor:default">Copyright ©  graduation project by sdongwan from WuYi University  </div>
		<script type="text/javascript">
			mini.parse();
			var tabs = mini.get("mainTabs");
		    function showTab(node) {
		    	if($("#mainTabs").css("display") == "none") {
		    		$("#bg-container").css("display","none");	
		    		$("#mainTabs").css("display","block");
		    	}
		    	
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
		    
		    function onCloseClick() {
		    	var tab = tabs.getActiveTab();
		    	if (!tab){
		    		$("#bg-container").css("display","block");	
		    		$("#mainTabs").css("display","none");
		    	}
		    }

		</script>
	</body>
</html>