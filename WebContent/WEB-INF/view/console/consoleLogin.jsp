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
			    	background: url(${ctx}/assets/images/login_bgx.gif);
				    background-color: rgba(0, 0, 0, 0);
				    background-image: url("${ctx}/assets/images/login_bgx.gif");
				    background-repeat: repeat;
				    background-attachment: scroll;
				    background-clip: border-box;
				    background-origin: padding-box;
				    background-position-x: 0%;
				    background-position-y: 0%;
				    background-size: auto auto;
			    }
			    
		    h2{
		    	font-size: 1.8em;
				text-align: center;
				color:#0091e6;
		    }
			    
		    .copyright{
			    line-height:28px;
			    text-align:center;
				font-size: 1em;
		    }
			   
		 	.login {
			    margin: 150px auto 0 auto;
		        margin-right: auto;
		        margin-left: auto;
			    min-height: 350px;
			    max-width: 350px;
			    padding: 40px;
			    background-color: #ffffff;
			    margin-left: auto;
			    margin-right: auto;
			    border-radius: 4px;
			    overflow-x: hidden;
			    box-sizing: border-box;
			    padding: 2.5em;
				border-radius: 0.3em;
				-webkit-border-radius: 0.3em;
				-o-border-radius: 0.3em;
				-moz-border-radius: 0.3em;
				box-shadow: 0px 0px 15px #545454;
			 }
			
			label{
				font-size: 1.0em;
				color: #333;
				font-weight: 400;
			}
			h4{
				font-size: 1.5em;
				padding-bottom: 28px;
				color: #0091e6;
				text-align: center;
			}
			
			.mini-textbox,.mini-password{
				background-color: #f0f0f0;
				padding: 9px;
				width: 93.4%;
				font-size: 1.1em;
				margin: 3px 0px 25px;
				color: #666666;
				background: #f0f0f0;
				border: none;
				font-weight: 400;
				outline: none;
				-webkit-transition: all 0.3s ease-out;
				-moz-transition: all 0.3s ease-out;
				-ms-transition: all 0.3s ease-out;
				-o-transition: all 0.3s ease-out;
				transition: all 0.3s ease-out;
				border-radius: 0.2em;
				-webkit-border-radius: 0.2em;
				-o-border-radius: 0.2em;
				-moz-border-radius: 0.2em;
			}
			.mini-button{
				background: #0091e6;
				color:#ffffff;
				color: #FFF;
				font-size: 0.9em;
				border-radius: .3em;
				-webkit-border-radius: .3em;
				-moz-border-radius: .3em;
				-o-border-radius: .3em;
				border-color:#0091e6;
				outline: none;
				font-weight: 600;
				font-size: 0.9em;
			}
			
			a:active{
				color:#000000;
			}
			
			input:-webkit-autofill {
	        	-webkit-box-shadow: 0 0 0px 1000px white inset;
		    }
		    
		    body .mini-error .mini-textbox-border{
		    	border-color:#ffffff;
		    	background-color:#ffffff;
		    }
		    
		    .mini-required .mini-textbox-border{
		    	background-color:#ffffff;
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
		<div class="mini-fit">
			<div class="login">
				<h2>员工行为评估系统</h2>
				<h4>管理员登录</h4>
				<form id="loginForm" style="width:100%;">
					<div>
						<label for="username$text">帐号：</label>
					</div>
					<div>
						<input name="account" autocomplete="off" id="account" class="mini-textbox" onvalidation="onUserNameValidation" required="true" requiredErrorText="帐号不能为空"/>
					</div>
				    
				    <div>
				    	<label for="pwd$text">密码：</label>
				    </div>
				    <div>
				    	<input name="password" autocomplete="off" id="password" class="mini-password" onvalidation="onPwdValidation" vtype="minLength:5" required="true" minLengthErrorText="密码不能少于5个字符"/>
				    </div>
				    
				    <div style="text-align:center;">
					    <a class="mini-button" onclick="onLogin" style="width:60px;margin-right:10px;">登录</a>       
					    <a class="mini-button" onclick="onCancel" style="width:60px;">重置</a>  
				    </div>
			    </form>
		    	</div>
    	</div>
    	<div class="copyright">Copyright ©  graduation project by sdongwan from WuYi University  </div>
		<script type="text/javascript">
			mini.parse();
	        var form = new mini.Form("#loginForm");
	        
	        function onLogin () {
	   		 	form.validate();
	            if (form.isValid() == false) return;
	   		  	// 提交表单数据
	            var data = form.getData();      //获取表单多个控件的数据
	            var url = "${ctx}/console/home.do";
	   			$.post(url,data,function (r) {
	   				if (r == "ok") {
		   	            mini.loading("登录成功，马上转到系统...", "登录成功");
		   	            setTimeout(function () {
		   	                window.location = "${ctx}/console/toHome.do";
		   	            }, 1500);
	   				} else {
	   					mini.loading("登录失败，尝试重新登录", "登录失败");
		   				setTimeout(function () {
		   	                window.location = "${ctx}/console/login.do";
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