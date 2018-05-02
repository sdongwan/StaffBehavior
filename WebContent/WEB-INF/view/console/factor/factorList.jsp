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
			div {
				text-align:center;
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
	                    <td style="width:100%;">
	                        <a class="mini-button" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="mini-button" iconCls="icon-add" onclick="edit()">编辑</a>
	                        <a class="mini-button" iconCls="icon-remove" onclick="remove()">删除</a>       
	                    </td>
	                    <td style="white-space:nowrap;">
	                        <input id="key" class="mini-textbox" emptyText="请输入姓名" style="width:150px;" onenter="onKeyEnter"/>   
	                        <a class="mini-button" onclick="search()">查询</a>
	                    </td>
	                </tr>
	            </table>           
	        </div>
   		</div>
	    <div id="datagrid1" class="mini-datagrid" style="width:100%;height:90%;" allowResize="true"
	        url="${ctx}/factor/list.do"  idField="factorId" multiSelect="true">
	        <div property="columns">
	            <div field="factorId" width="120" headerAlign="center" allowSort="true">因素编号</div>    
	            <div field="factorName" width="120" headerAlign="center" allowSort="true">因素名称</div>    
                <div field="remark" width="120">备注</div>
                <div field="createTime" width="100">创建时间</div>
                <div field="updateTime" width="100">修改时间</div>
	        </div>
	    </div>
	    <script type="text/javascript">
	        mini.parse();
	
	        var grid = mini.get("datagrid1");
	        grid.load();
	
	        function add() {
	
	            mini.open({
	                targetWindow: window,
	                url: "${ctx}/factor/add.do",
	                title: "新增因素", width: 700, height: 400,
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
	
	        function edit() {
	         
	            var row = grid.getSelected();
	            if (row) {
	                mini.open({
	                    url: "${ctx}/factor/update.do",
	                    title: "编辑因素", width: 700, height: 400,
	                    onload: function () {
	                        var iframe = this.getIFrameEl();
	                        var data = { action: "edit", factorId: row.factorId };
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
        function remove() {
           var rows = grid.getSelecteds();
           if (rows.length > 0) {
               if (confirm("确定删除选中记录？")) {
                   var id = rows[0].factorId;
                   //grid.loading("操作中，请稍后......");
                   var url = "${ctx}/factor/delFactor.do";
                   var data = {jobId : id};
                   $.post(url,data,function (r){
                	   if (r == "ok") {
	   	   					mini.alert("删除成功");
	   	   				 	grid.reload();
	   	   				} else {
	   	   					mini.alert("删除失败");
	   	   				}
                   }) ;
               }
           } else {
               mini.alert("请选中一条记录");
           }
        }
        
        function search() {
            var key = mini.get("key").getValue();
            grid.load({ key: key });
        }
        
        function onKeyEnter(e) {
            search();
        }
        
        function onGenderRenderer(e) {
            for (var i = 0, l = Genders.length; i < l; i++) {
                var g = Genders[i];
                if (g.id == e.value) return g.text;
            }
            return "";
        }
    </script>
	</body>
</html>