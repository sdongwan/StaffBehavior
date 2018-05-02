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
	    <table style="table-layout:fixed;" id="form-depart">
              <tr>
                  <td style="width:80px;" >部门编号：</td>
                  <td style="width:150px;">    
                      <input id="departId" name="departId" class="mini-textbox" allowInput="false" required="true"/>
                  </td>
                  <td style="width:80px;">部门名称：</td>
                  <td style="width:150px;">    
                       <input name="departName" class="mini-textbox" required="true"  emptyText="请填写部门名称"/>
                  </td>
              </tr>
              <tr>
	         	  <td style="width:80px;">公司名称：</td>
	              <td style="width:150px;">    
		              <input name="companyId" class="mini-combobox" required="true"  emptyText="请选择公司"
		                     url="${ctx}/company/getAll.do" textField="companyName" valueField="companyId" required="true"/>
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
            <a class="mini-button" onclick="onSaveDepart" style="width:60px;margin-right:20px;">确定</a>       
            <a class="mini-button" onclick="onCancel" style="width:60px;">取消</a>       
        </div>  
         <script type="text/javascript">
	   		mini.parse();
	   		mini.get("departId").setValue("${depart.departId}");
	   		var form = new mini.Form("#form-depart"); 
	   		
	   		function onSaveDepart () {
	   		 	form.validate();
	            if (form.isValid() == false) return;
	   		  	// 提交表单数据
	            var data = form.getData();      //获取表单多个控件的数据
	            //var json = mini.encode(data);   //序列化成JSON
	            var url = "${ctx}/depart/addDepart.do";
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