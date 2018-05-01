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
		<table>
			<tr>
				<td>
					<div>请选择部门</div>
				</td>
				<td>
					<input id="select1" class="mini-treeselect" url="${ctx}/tree/staffTree.do"
			        textField="text" valueField="id" parentField="pid" checkRecursive="true" 
			        showFolderCheckBox="false"  expandOnLoad="true" showClose="true" oncloseclick="onCloseClick"
			        popupWidth="200"/>
				</td>
			</tr>
		</table>
		
	    <div id="datagrid1" class="mini-datagrid" style="width:100%;height:90%;" allowResize="true"
	        url="${ctx}/job/jobList.do" contextMenu="#gridMenu" idField="id" multiSelect="true">
	        <div property="columns">
	            <div field="jobId" width="120" headerAlign="center" allowSort="true">职位编号</div>    
	            <div field="jobName" width="120" headerAlign="center" allowSort="true">职位名称</div>    
                <div field="createTime" width="100">创建时间</div>
                <div field="updateTime" width="100">修改时间</div>
                <div field="remark"  width="200">备注</div>
	        </div>
	    </div>
	    
	    <ul id="gridMenu" name="gridMenu" class="mini-menu" style="display:none;" onbeforeopen="onBeforeOpen">
            <li iconCls="icon-add" onclick="onItemAdd">增加</li>    
            <li iconCls="icon-edit" onclick="onItemUpdate">修改</li>
            <li iconCls="icon-remove" onclick="onItemDel">删除</li>                      
		</ul>

	    <script type="text/javascript">
		   mini.parse();
		   var grid = mini.get("datagrid1");
	       grid.load();
	       function onItemAdd() {
	            mini.open({
	                targetWindow: window,
	                url: "${ctx}/job/add.do",
	                title: "新增部门", width: 500, height: 350,
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
	                url: "${ctx}/job/update.do",
	                title: "编辑员工", width: 700, height: 400,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = { action: "edit", id: row.id };
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
	                   var ids = [];
	                   for (var i = 0, l = rows.length; i < l; i++) {
	                       var r = rows[i];
	                       ids.push(r.id);
	                   }
	                   var id = ids.join(',');
	                   grid.loading("操作中，请稍后......");
	                   $.ajax({
	                       url: "../data/AjaxService.aspx?method=RemoveEmployees&id=" +id,
	                       success: function (text) {
	                           grid.reload();
	                       }
	                   });
	               }
	           } else {
	               alert("请选中一条记录");
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