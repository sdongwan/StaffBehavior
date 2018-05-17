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
		    
		    #factor-form{
		    	margin-left:auto;
		    	margin-right:auto;
		    	margin-top:10%;
		    }
		</style>
		<script type="text/javascript">
		
	        
		</script>
	</head>
	<body>
		 <table  id="factor-form">
               <tr>
                   <td style="width:80px;">因素名称：</td>
                   <td style="width:150px;">    
                       <input name="factorName" class="mini-textbox" valueField="id" 
                           required="true"/>
                   </td>
                   <td >创建时间：</td>
	               <td >    
	               		<input name="createTime" class="mini-datepicker" required="true" emptyText="请选择日期"/>
	               </td>
               </tr>
               <tr>
               		<td >备注：</td>
	                <td colspan="3">    
	                    <input name="remark" class="mini-textarea" style="width:386px;" />
	                </td>
	            </tr>    
           </table>
           <div style="text-align:center;padding:10px;">               
	            <a class="mini-button" onclick="onOk" iconCls="fa fa-check" style="width:70px;margin-right:20px;">确定</a>       
	            <a class="mini-button" onclick="onCancel" iconCls="fa fa-remove" style="width:70px;">取消</a>       
	        </div>  
	    <script type="text/javascript">
	        mini.parse();
	        
			var form = new mini.Form("#factor-form"); 
	   		
	   		function onOk () {
	   		 	form.validate();
	            if (form.isValid() == false) return;
	   		  	// 提交表单数据
	            var data = form.getData(true);      //获取表单多个控件的数据
	            //var json = mini.encode(data);   //序列化成JSON
	            var url = "${ctx}/factor/addFactor.do";
	   			$.post(url,data,function (r) {
	   				if (r == "ok") {
	   					mini.alert("添加成功");
	   				} else {
	   					mini.alert("添加失败");
	   				}
	   			})
	   		}
   		</script>
	</body>
</html>