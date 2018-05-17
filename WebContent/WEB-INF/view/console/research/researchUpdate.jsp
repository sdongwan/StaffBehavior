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
			
		</style>
		<script type="text/javascript">
		
	        
		</script>
	</head>
	<body>
		<table style="table-layout:fixed;" id="research-form">
               <tr>
                   <td style="width:80px;">问卷题目：</td>
                   <td style="width:150px;">    
                       <input name="researchId" class="mini-hidden"/>
                       <input name="question" class="mini-textbox" valueField="id" 
                           required="true"/>
                   </td>
                   <td >因素分类：</td>
	               <td >    
	               		<input name="factorId" class="mini-textbox" required="true" emptyText="请选择因素分类"/>
	               </td>
               </tr>
               <tr>
	                <td >是否有效：</td>
	                <td >    
	                    <input name="validFlag" class="mini-textbox" />
	                </td>
	            </tr>    
           </table>
           <div style="text-align:center;padding:10px;">               
	            <a class="mini-button" onclick="onOk" iconCls="fa fa-check" style="width:70px;margin-right:20px;">确定</a>       
	            <a class="mini-button" onclick="onCancel" iconCls="fa fa-remove" style="width:70px;">取消</a>       
	        </div>  
	    <script type="text/javascript">
	        mini.parse();
	        var form = new mini.Form("#research-form"); 
	   		
	   		function onOk () {
	   			SaveData();
	   		}
	   		
	   	   function SetData(data) {
               if (data.action == "edit") {
                   //跨页面传递的数据对象，克隆后才可以安全使用
                   data = mini.clone(data);
                   var url = "${ctx}/research/getResearchById.do"
                   var rdata = {researchId:data.researchId};
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
                 
                 var url = "${ctx}/research/updateResearch.do";
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