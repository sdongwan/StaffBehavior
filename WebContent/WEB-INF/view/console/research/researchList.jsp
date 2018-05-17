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
		    
		     .mini-button{
		    	color:#ffffff;
		    	background-color:#3498DB;
		    	border-color:#3498DB;
		    }
		    
		    .mini-button:active,.mini-button:hover{
		    	color:#3498DB;
		    	background-color:#ffffff;
		    	border-color:#ffffff;
		    }
		</style>
		<script type="text/javascript">
			
	        
		</script>
	</head>
	<body>
		<div style="width:100%;margin-top:15px;">
	        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	                <tr>
	                    <td style="white-space:nowrap;">
	                        <input id="key" class="mini-textbox" emptyText="请输入姓名" style="width:150px;" onenter="onKeyEnter"/>   
	                        <a class="mini-button" iconCls="fa fa-search" onclick="search()">查询</a>
	                    </td>
	                </tr>
	            </table>           
	        </div>
   		</div>
	    <div id="datagrid1" class="mini-datagrid" style="width:100%;height:90%;" allowResize="true"
	        url="${ctx}/research/listResearch.do" contextMenu="#gridMenu" idField="id" multiSelect="true">
	        <div property="columns">
	            <div field="researchId" width="120" headerAlign="center" allowSort="true">问卷题目标号</div>    
	            <div field="question" width="120" headerAlign="center" allowSort="true">调查问题</div>    
                <div field="factorId" width="100">因素分类</div>
                <div field="validFlag" width="100">是否在用</div>
                <div field="createTime" width="120">创建时间</div>
                <div field="updateTime" width="100">修改时间</div>
	        </div>
	    </div>
	    
	    <ul id="gridMenu" name="gridMenu" class="mini-menu" style="display:none;" onbeforeopen="onBeforeOpen">
            <li iconCls="fa fa-plus" onclick="onItemAdd">增加</li>    
            <li iconCls="fa fa-edit" onclick="onItemUpdate">修改</li>
            <li iconCls="fa fa-remove" onclick="onItemDel">删除</li>                      
		</ul>

	    <script type="text/javascript">
		   mini.parse();
	       var grid = mini.get("datagrid1");
	       grid.load();
	       
	       function onItemAdd() {
	            mini.open({
	                targetWindow: window,
	                url: "${ctx}/research/add.do",
	                title: "新增问卷题目", width: 500, height: 350,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = { action: "new" };
	                    iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
	                    grid.reload();
	                }
	            });
	        }
	
	        function onItemUpdate() {
	         
	           var row = grid.getSelected();
	           if (row) {
	            mini.open({
	                url: "${ctx}/research/update.do",
	                title: "编辑员工", width: 700, height: 400,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = { action: "edit", researchId: row.researchId };
	                    iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
	                    //var iframe = this.getIFrameEl();
	                    grid.reload();
	                }
	            });
	          } else {
	              mini.alert("请选中一条记录");
	          }
       		}
	       function onItemDel() {
	           var rows = grid.getSelecteds();
	           if (rows.length > 0) {
	               if (confirm("确定删除选中记录？")) {
	                   grid.loading("操作中，请稍后......");
	                   var url = "${ctx}/research/delResearch.do";
	                   var data = {researchId:rows[0].researchId}
	                   $.post(url,data,function(r){
	                	   if (r == "ok" ) {
	                		   grid.reload();
	                	   }
	                   } );
	               }
	           } else {
	               mini.alert("请选中一条记录");
	           }
	       	}
       
	      document.oncontextmenu = function()
	      {
	    	  return false // 禁止鼠标右键菜单显示
	      };   
	      document.body.onmouseup = function(e){ // 在body里点击触发事件
	         if(e.button===2){                  // 如果button=1（鼠标左键），button=2（鼠标右键），button=0（鼠标中间键）
	             console.log(e);               // 将传进去的参数打印出来
	             console.log(e.offsetY);      // 打印出鼠标点击的Y轴坐标
	             console.log(e.offsetX);     // 打印出鼠标点击的X轴坐标
	             mini.get("gridMenu").showAtPos(e.offsetX,e.offsetY);
	         }
	      } 
	      
	      function onBeforeOpen(e) {
	    	    var grid = mini.get("datagrid1");
	    	    var menu = e.sender;
    	        //阻止浏览器默认右键菜单
    	        e.htmlEvent.preventDefault();
    	        return;
	    	}
	    </script>
	</body>
</html>