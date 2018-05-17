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
		    
		    #form-depart{
		    	margin-left:auto;
		    	margin-right:auto;
		    }
		    
		    .top_margin_ten{
		    	margin-top:10%;
		    }
		    
		    .top_margin_two{
		    	margin-top:2%;
		    }
		    
		    table tr td{
		    	padding-top:15px;
		    }
		    
		</style>
		<script type="text/javascript">
		
	        
		</script>
	</head>
	<body>
		<div class="container">
		    <table id="form-depart" class="top_margin_ten">
	              <tr>
	                  <td>    
                     		部门编号：<input id="departId" name="departId" class="mini-textbox" allowInput="false" required="true"/>
	                  </td>
	              </tr>
	              <tr>
	                <td>    
                       	部门名称：<input name="departName" class="mini-textbox" required="true"  emptyText="请填写部门名称"/>
	                </td>
	              </tr>
	              <tr>
		              <td>    
			              	公司名称：<input name="companyId" class="mini-combobox" required="true"  emptyText="请选择公司"
			                     url="${ctx}/company/getAll.do" textField="companyName" valueField="companyId" required="true"/>
		              </td>
	              </tr>
	              <tr>
		              <td>
		              		备注：<input name="remark" class="mini-textarea" style="width:386px;height:100px;" />
		              </td>
	              </tr>    
	         </table>
	     </div>
        <div style="text-align:center;padding:10px;">               
            <a class="mini-button" iconCls="fa fa-check" onclick="onSaveDepart" style="width:70px;margin-right:20px;">确定</a>       
            <a class="mini-button" iconCls="fa fa-remove" onclick="onCancel" style="width:70px;">取消</a>       
        </div>  
         <script type="text/javascript">
	   		mini.parse();
	   		mini.get("departId").setValue("${depart.departId}");
	   		var form = new mini.Form("#form-depart"); 
	   		
	   		function onSaveDepart () {
	   		 	form.validate();
	            if (form.isValid() == false) return;
	   		  	// 提交表单数据
	            var data = form.getData();      //获取表单多个控件的数据
	            //var json = mini.encode(data);   //序列化成JSON
	            var url = "${ctx}/depart/addDepart.do";
	   			$.post(url,data,function (r) {
	   				if (r == "ok") {
	   					mini.alert("添加成功");
	   				} else {
	   					mini.alert("添加失败");
	   				}
	   			})
	   		}
          	
	   		function onCancel() {
	   			CloseWindow("close");
	   		}
	   		
		   	function CloseWindow(action) {            
	             if (window.CloseOwnerWindow) {
	             	return window.CloseOwnerWindow(action);
	             } else {
	             	window.close();
	             }
	         }
	    </script>
	</body>
</html>