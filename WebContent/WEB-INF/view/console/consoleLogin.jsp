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
		
			function updateError(e) {
	            var id = e.sender.name + "_error";
	            var el = document.getElementById(id);
	            if (el) {
	                el.innerHTML = e.errorText;
	            }
	        }
				
	        function onUserNameValidation(e) {                  
	            updateError(e);
	        }
	        
	        function onPwdValidation(e) {        
	            updateError(e);
	        }
	        
		</script>
	</head>
	<body>
		<h2>员工行为分析系统</h2>
		<h3>后台管理登陆</h3>
		<div id="loginWindow" class="mini-window" title="用户登录" style="width:350px;height:165px;" 
   			showModal="true" showCloseButton="false">
			<form action="${ctx}/console/home.do" method="post" id="loginForm">
				<table>
			        <tr>
			            <td>
			            	<label for="username$text">帐号：</label>
			            </td>
			            <td>
			                <input name="account"  id="account" class="mini-textbox" onvalidation="onUserNameValidation" required="true" requiredErrorText="帐号不能为空"/>
			            </td>    
			            <td id="account_error" class="errorText"></td>
			        </tr>
			        <tr>
			            <td>
			            	<label for="pwd$text">密码：</label>
			            </td>
			            <td>
			                <input name="password" id="password" class="mini-password" onvalidation="onPwdValidation" vtype="minLength:5" required="true" minLengthErrorText="密码不能少于5个字符" />
			            </td>
			            <td id="password_error" class="errorText"></td>
			        </tr>            
			        <tr>
			            <td>
			                <input value="登陆" type="submit" />
			            </td>
			            <td>
			                <input value="重置" type="reset"/>
			            </td>
			        </tr>
		    	</table>
		    </form>
	    </div>
    	
		<script type="text/javascript">
			mini.parse();
			var loginWindow = mini.get("loginWindow");
	        loginWindow.show();
		</script>
	</body>
</html>