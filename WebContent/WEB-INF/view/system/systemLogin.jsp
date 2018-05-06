<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>员工行为分析调查</title>
		<%@include file="/commons/include/system.jsp"%>
		<script src="${ctx}/assets/miniui/boot.js" type="text/javascript"></script>
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
		<h2>员工行为分析调查系统</h2>
		<h3>员工登陆</h3>
		<div class="mini-fit">
			<form id="loginForm">
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
			            	<a class="mini-button" onclick="onLogin" style="width:60px;margin-right:10px;">登录</a>  
			            </td>
			            <td>
			                <a class="mini-button" onclick="onCancel" style="width:60px;">重置</a>      
			            </td>
			        </tr>
		    	</table>
		    </form>
	    </div>
    	<div style="line-height:28px;text-align:center;cursor:default">Copyright ©  graduation project by sdongwan from WuYi University  </div>
		<script type="text/javascript">
			mini.parse();
			
	        var form = new mini.Form("#loginForm");
	        
	        function onLogin() {
	   		 	form.validate();
	            if (form.isValid() == false) return;
	   		  	// 提交表单数据
	            var data = form.getData();      //获取表单多个控件的数据
	            var account = data.account;
	            var url = "${ctx}/system/research.do";
	   			$.post(url,data,function (r) {
	   				if (r == "ok") {
		   	            mini.loading("登录成功，马上转到系统...", "登录成功");
		   	            setTimeout(function () {
		   	                window.location = "${ctx}/system/toResearch.do?account="+account;
		   	            }, 1500);
	   				} else {
	   					mini.loading("登录失败，尝试重新登录", "登录失败");
		   				setTimeout(function () {
		   	                window.location = "${ctx}/system/login.do";
		   	            }, 1500);
	   				}
	   			})
	   		}
	        
	        function onCancel() {
	        	form.clear();
	        }
		</script>
	</body>
</html>