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
		    <table style="table-layout:fixed;" id="job-form">
		    
               <tr>
                   <td style="width:80px;">部门名称：</td>
                   <td style="width:150px;">    
                   	   <input  name="jobId" class="mini-hidden" >
                       <input name="departId" class="mini-combobox" valueField="departId"  
                           required="true"
                           textField="departName"
                           url="${ctx}/depart/getDepartList.do"
                           emptyText="请选择部门"
                           />
                   </td>
                   <td style="width:80px;">职位名称：</td>
                   <td style="width:150px;">    
                       <input name="jobName" class="mini-textbox" valueField="id" 
                           required="true"
                           />
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
	            <a class="mini-button" onclick="onUpdateJob" style="width:60px;margin-right:20px;">确定</a>       
	            <a class="mini-button" onclick="onCancel" style="width:60px;">取消</a>       
	        </div>  
	        <script type="text/javascript">
		   		mini.parse();
		   		
		   		var form = new mini.Form("#job-form"); 
		   		
		   		function onOk () {
		   		 	form.validate();
		            if (form.isValid() == false) {
		            	return;
		            }
		            
		   		  	// 提交表单数据
		            var data = form.getData(true);      //获取表单多个控件的数据
		            //var json = mini.encode(data);   //序列化成JSON
		            var url = "${ctx}/job/addJob.do";
		   			$.post(url,data,function (r) {
		   				if (r == "ok") {
		   					mini.alert("添加成功");
		   				} else {
		   					mini.alert("添加失败");
		   				}
		   			})
		   		}
		   		
			   	   function SetData(data) {
	                   if (data.action == "edit") {
	                       //跨页面传递的数据对象，克隆后才可以安全使用
	                       data = mini.clone(data);
	                       var url = "${ctx}/job/getJobById.do"
	                       var  rdata = {jobId:data.jobId};
	                       $.post(url,rdata,function(result){
	                       	var o = mini.decode(result);
	                           form.setData(o);
	                           form.setChanged(false);
	                       });
	                   }
	               }
		   	   
			   	 function SaveData() {
	                 var data = form.getData(true);            
	                 form.validate();
	                 if (form.isValid() == false) {
	                 	return;
	                 }
	                 
	                 var url = "${ctx}/job/updateJob.do";
	                 $.post(url,data,function(r){
	                 	if (r == "ok") {
	                 		CloseWindow("save");
	 	   				} else {
	 	   					CloseWindow("save");
	 	   				}
	                 });
	             }
	             
	             function onCancel() {
	             	CloseWindow("cancel");
	             }
	             
	             function onUpdateJob() {
	             	SaveData();
	             }
	             
	             
                function CloseWindow(action) {            
                    if (action == "close" && form.isChanged()) {
                        if (confirm("数据被修改了，是否先保存？")) {
                            return false;
                        }
                    }
                    if (window.CloseOwnerWindow) {
                    	return window.CloseOwnerWindow(action);
                    } else {
                    	window.close();
                    }
                }
	                
	    	</script>
	</body>
</html>