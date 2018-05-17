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
		    
		    table{
		    	margin-left:auto;
		    	margin-right:auto;
		    }
		</style>
		<script type="text/javascript">
		
	        
		</script>
	</head>
	<body>    
	      <form id="form1" method="post">
	        <fieldset style="border:none;padding:10px;">
	            <legend><span class="fa fa-tag"></span>基本信息</legend>
	           <div style="padding:5px;">
	        <table>
	            <tr>
	                <td>姓名</td>
	                <td>    
	                    <input name="staffName" class="mini-textbox" required="true"/>
	                </td>
	                <td>性别：</td>
	                <td>                        
	                    <select name="gender" class="mini-radiobuttonlist">
	                        <option value="0">男</option>
	                        <option value="1">女</option>
	                    </select>
	                </td>
	                <td >婚姻：</td>
	                <td >    
	                    <input name="married" class="mini-checkbox" text="已婚"  trueValue="1" falseValue="0" />
	                </td>
	            </tr>
	            
	            <tr>
	                <td >出生日期：</td>
	                <td >    
	                    <input id="birthday" name="birthday" class="mini-datepicker" required="true" emptyText="请选择日期"
	                    	format="yyyy-MM-dd"/>
	                </td>
	                
	                <td >籍贯：</td>
	                <td >    
	                    <input name="hometown" class="mini-textbox"  />
	                </td>
	                
	                <td >学历：</td>
                    <td >    
                        <input name="education" class="mini-combobox" valueField="id" textField="name" url="" />
                    </td>
	            </tr>
	            
	            <tr>
                    <td >毕业院校：</td>
                    <td >    
                        <input name="graduateSchool" class="mini-textbox" />
                    </td>
	            <tr>
	                
	            </tr>
	            <tr>
	                <td >备注：</td>
	                <td colspan="3">    
	                    <input name="remark" class="mini-textarea" style="width:386px;" />
	                </td>
	            </tr>          
	        </table>            
	            </div>
	        </fieldset>
	        
	        <fieldset style="border:none;padding:10px;">
	            <legend><span class="fa fa-tag"></span>工作信息</legend>
	            <div style="padding:5px;">
		            <table>
		                <tr>
		                    <td>员工帐号：</td>
		                    <td>    
		                        <input name="account" class="mini-textbox" required="true" emptyText="请输入帐号"/>
		                    </td>
		                    
		                    <td>员工密码：</td>
		                    <td>    
		                        <input name="password" class="mini-textbox" required="true" emptyText="请输入密码"/>
		                    </td>
		                    
		                    <td>所属部门：</td>
		                    <td>    
		                        <input name="departId" class="mini-combobox" valueField="departId" textField="departName" 
		                            url="${ctx}/depart/getDepartList.do"
		                            onvaluechanged="onDepartChanged" required="true"
		                             emptyText="请选择部门"/>
		                    </td>
		                </tr>
		                <tr>
		                 	<td >职位：</td>
		                    <td >    
		                        <input name="jobId" class="mini-combobox" valueField="jobId" textField="jobName"
		                        url="${ctx}/job/getJobNameAndId.do?departId=1"/>
		                    </td>
		                    
		                    <td>公司名称：</td>
		                    <td>    
		                       <input name="companyId" class="mini-combobox" required="true"  emptyText="请选择公司"
		                       url="${ctx}/company/getAll.do" textField="companyName" valueField="companyId" required="true"/>
		                    </td>
		                    
		                    <td >薪资待遇：</td>
		                    <td >    
		                        <input name="salary" class="mini-textbox" required="true"/>
		                    </td>
		                </tr>
		                <tr>
		                	<td >入职时间：</td>
			                <td >    
			                    <input name="enterTime" class="mini-datepicker" format="yyyy-MM-dd" required="true"  />
			                </td>
		                </tr>
		            </table>
	            </div>
	        </fieldset>
	        <div style="text-align:center;padding:10px;">               
	            <a class="mini-button" iconCls="fa fa-check" onclick="onOk" style="width:70px;margin-right:20px;">确定</a>       
	            <a class="mini-button" iconCls="fa fa-remove" onclick="onCancel" style="width:70px;">取消</a>       
	        </div>        
	    </form>
	    <script type="text/javascript">
	        mini.parse();
	
	        var form = new mini.Form("form1");
	
	      	// 标准方法接口定义
	        function SetData(data) {
	            if (data.action == "edit") {
	                //跨页面传递的数据对象，克隆后才可以安全使用
	                data = mini.clone(data);
	                var url = "${ctx}/staff/getStaffById.do"
                    var  rdata = {staffId:data.staffId};
                    $.post(url,rdata,function(result){
                    	var o = mini.decode(result);
                        form.setData(o);
                        form.setChanged(false);
                    });
	            }
	        }
	
	        function GetData() {
	            var o = form.getData();
	            return o;
	        }
	        
	        function CloseWindow(action) {            
	            if (action == "close" && form.isChanged()) {
	                if (confirm("数据被修改了，是否先保存？")) {
	                    return false;
	                }
	            }
	            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	            else window.close();            
	        }
	        
	        function onOk(e) {
	            SaveData();
	        }
	        
	        function onCancel(e) {
	            CloseWindow("cancel");
	        }
	    
	    	function SaveData() {
			    var data = form.getData(true);            
			    form.validate();
			    if (form.isValid() == false) {
			    	return;
			    }
	            var url = "${ctx}/staff/addStaff.do";
	            $.post(url,data,function(r){
	          	if (r == "ok") {
	          		CloseWindow("save");
			    } else {
					CloseWindow("save");
				}
       		 });
	       }
	    	  
			function onOk() {
				SaveData();
			}
			
			function onCancel() {
				CloseWindow("cancel");
			}
		 
			function onDepartChanged() {
	    		 var departCombo = mini.getbyName("departId");
	             var jobCombo = mini.getbyName("jobId");
	             var departId = departCombo.getValue();
	             jobCombo.load("${ctx}/job/getJobNameAndId.do?departId=" + departId);
	             jobCombo.setValue("");
	    	}
	    </script>
	</body>

</html>