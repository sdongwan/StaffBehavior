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
	        url="${ctx}/staff/staffList.do"  idField="id" multiSelect="true">
	        <div property="columns">
	            <div type="checkcolumn" ></div>     
	            <div field="staffId" width="120" headerAlign="center" allowSort="true">员工编号</div>     
	            <div field="staffName" width="120" headerAlign="center" allowSort="true">员工姓名</div>   
	            <div field="account" width="120" headerAlign="center" allowSort="true">员工帐号</div>   
	            <div field="password" width="120" headerAlign="center" allowSort="true">员工密码</div>    
	            <div header="工作信息">
	                <div property="columns">
	                	<div field="companyId" width="120">所在公司</div>
	                    <div field="departId" width="120">所属部门</div>
	                    <div field="jobId" width="100">职位</div>
	                    <div field="enterTime" width="100">入职时间</div>
	                    <div field="workYear" width="100">工作年限</div>
	                    <div field="salary" dataType="currency" currencyUnit="￥" align="right" width="100" allowSort="true">薪资</div>
	                </div>
	            </div>
	            <div header="基本信息">
	                <div property="columns">
	                    <div field="gender" width="100" >性别</div>
	                    <div field="birthday" width="100" >出生日期</div>
	                    <div field="married" width="100" align="center" renderer="onMarriedRenderer">婚否</div>
	                </div>
	            </div>
	            <div header="学历信息" align="center">
	                <div property="columns">
	                    <div field="education" width="100">学历</div>
	                    <div field="graduateSchool" width="120">毕业院校</div>
	                </div>
	            </div>     
				<div field="remark" width="100">备注</div>   
				<div field="createTime" width="100" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">创建日期</div>    
	            <div field="updateTime" width="100" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true" >修改日期</div>             
	        </div>
	    </div>
	    <script type="text/javascript">
	        mini.parse();
	
	        var grid = mini.get("datagrid1");
	        grid.load();
	
	        function add() {
	            mini.open({
	                targetWindow: window,
	                url: "${ctx}/staff/add.do",
	                title: "新增员工", width: 700, height: 400,
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
	                    url: "${ctx}/staff/update.do",
	                    title: "编辑员工", width: 700, height: 400,
	                    onload: function () {
	                        var iframe = this.getIFrameEl();
	                        var data = { action: "edit", staffId: row.staffId};
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
	                   var id = rows[0].staffId;
	                   //grid.loading("操作中，请稍后......");
	                   var url = "${ctx}/staff/delStaff.do";
	                   var data = {staffId : id};
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
                alert("请选中一条记录");
            }
        }
        function search() {
            var key = mini.get("key").getValue();
            grid.load({ key: key });
        }
        
        function onKeyEnter(e) {
            search();
        }
        
    </script>
	</body>
</html>