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
	      <form id="form1" method="post">
	        <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend >基本信息</legend>
	           <div style="padding:5px;">
	        <table>
	            <tr>
	                <td style="width:80px;">姓名</td>
	                <td style="width:150px;">    
	                    <input name="staffName" class="mini-textbox" required="true"/>
	                </td>
	                <td style="width:80px;">性别：</td>
	                <td >                        
	                    <select name="gender" class="mini-radiobuttonlist">
	                        <option value="0">男</option>
	                        <option value="1">女</option>
	                    </select>
	                </td>
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
	                
	            </tr>
	            
	            <tr>
                    <td >学历：</td>
                    <td >    
                        <input name="education" class="mini-combobox" valueField="id" textField="name" url="" />
                    </td>
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
	        
	        <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend >工作信息</legend>
	            <div style="padding:5px;">
		            <table style="table-layout:fixed;">
		                <tr>
		                    <td style="width:80px;">员工帐号：</td>
		                    <td style="width:150px;">    
		                        <input name="account" class="mini-textbox" required="true"  emptyText="请输入帐号"/>
		                    </td>
		                    
		                    <td style="width:80px;">员工密码：</td>
		                    <td style="width:150px;">    
		                        <input name="password" class="mini-textbox" required="true"  emptyText="请输入密码"/>
		                    </td>
		                    
		                    <td style="width:80px;">所属部门：</td>
		                    <td style="width:150px;">    
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
		                    
		                    <td style="width:80px;">公司名称：</td>
		                    <td style="width:150px;">    
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
	            <a class="mini-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
	            <a class="mini-button" onclick="onCancel" style="width:60px;">取消</a>       
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