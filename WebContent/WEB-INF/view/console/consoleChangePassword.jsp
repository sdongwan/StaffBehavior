<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>修改密码</title>
		<%@include file="/commons/include/system.jsp"%>
		<style type="text/css">
			body{
			    	width:100%;
			    	height:100%;
			    	margin:0;
			    	overflow:hidden;
			    }
		</style>
	</head>
	<body>
		<div id="form1">
			<table>
			 	<tr>
	                <td>
	                    <label for="account">请输入账号：</label>
	                </td>
	                <td>
	                    <input name="account" errorMode="none"  class="mini-password" required="true" requiredErrorText="密码不能为空"/>                    
	                </td>    
	                <td id="account_error" class="errorText"></td>
	            </tr>
	             <tr>
	                <td>
	                    <label for="password">请输入密码：</label>
	                </td>
	                <td>
	                    <input name="password" errorMode="none"  class="mini-password" required="true" requiredErrorText="密码不能为空"/>                    
	                </td>    
	                <td id="password_error" class="errorText"></td>
	            </tr>
	            <tr>
	                <td>
	                    <label for="newpassword">请输入新密码：</label>
	                </td>
	                <td>
	                    <input name="newpassword" errorMode="none"  class="mini-password" required="true" requiredErrorText="密码不能为空"/>                    
	                </td>    
	                <td id="newpassword_error" class="errorText"></td>
	            </tr> 
	            <tr>
	            	<td>
		            	<div  class="mini-button" onclick="changePasswd">确定</div>
		            </td>
	            </tr>           
	        </table>
	    </div>
		<script type="text/javascript">
			mini.parse();
			function changePasswd () {
			    var form = new mini.Form("#form1");

	            form.validate();
	            if (form.isValid() == false) return;

	            //提交数据
	            var data = form.getData();      
	            var json = mini.encode(data);
	            var url = "${ctx}/sysUser/changePasswd.do"
	            $.post(url,data,function(r){
	            	if (r == "ok") {
	            		mini.alert("密码修改成功");
	            	}else {
	            		mini.alert("密码修改失败");
	            	}
	            })
			}
		</script>
	</body>
</html>