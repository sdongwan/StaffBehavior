<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>员工行为分析系统</title>
		<%@include file="/commons/include/system.jsp"%>
		<script src="${ctx}/assets/miniui/echarts.min.js" type="text/javascript"></script>
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
		<h1>PieChart</h1>
	    <a class="mini-button" onclick="showChartWindow()">打开图表</a>
	    <div id="win1" class="mini-window" title="PieChart" style="width:580px;height:450px;"
	         showToolbar="false" showFooter="true" showModal="true" allowResize="true">
	        <div class="ct" id="chart1" style="height:100%;width:100%;">></div>
	    </div>
		<script type="text/javascript">
			mini.parse();
			 var option = {
		        title: {
		            text: '某站点用户访问来源',
		            subtext: '纯属虚构',
		            x: 'center'
		        },
		        tooltip: {
		            trigger: 'item',
		            formatter: "{a} <br/>{b} : {c} ({d}%)"
		        },
		        legend: {
		            orient: 'vertical',
		            left: 'left',
		            data: ['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎']
		        },
		        series: [
		            {
		                name: '访问来源',
		                type: 'pie',
		                radius: '55%',
		                center: ['50%', '60%'],
		                data: [
		                    { value: 335, name: '直接访问' },
		                    { value: 310, name: '邮件营销' },
		                    { value: 234, name: '联盟广告' },
		                    { value: 135, name: '视频广告' },
		                    { value: 1548, name: '搜索引擎' }
		                ],
		                itemStyle: {
		                    emphasis: {
		                        shadowBlur: 10,
		                        shadowOffsetX: 0,
		                        shadowColor: 'rgba(0, 0, 0, 0.5)'
		                    }
		                }
		            }
		        ]
		    };

		    function buildChart() {
		        var chart1 = echarts.init(document.getElementById('chart1'));
		        chart1.setOption(option);
		    }
		    
		    function showChartWindow() {
		        var win = mini.get("win1");
		        win.show();
		        buildChart();
		    }
		    
		    showChartWindow()
		</script>
	</body>
</html>