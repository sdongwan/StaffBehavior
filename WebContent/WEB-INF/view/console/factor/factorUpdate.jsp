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
		 <table style="table-layout:fixed;">
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
	            <a class="mini-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
	            <a class="mini-button" onclick="onCancel" style="width:60px;">取消</a>       
	        </div>  
	    <script type="text/javascript">
	        mini.parse();
			
	        
   		</script>
	</body>
</html>