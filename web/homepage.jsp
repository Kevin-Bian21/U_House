<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">
<head>
    <title></title>
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width height=device-height initial-scale=1.0 maximum-scale=1.0 user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/fonts.css">
    <link rel="stylesheet" href="css/style.css" id="main-styles-link">

    <link rel="stylesheet" href="homepage/src/css/insidePage.css" />
	<link rel="stylesheet" href="homepage/assets/bootstrap.min.css">
	<link rel="stylesheet" href="homepage/src/css/jareaselect.css">
	<script src="homepage/src/echarts.min.js"></script>
	<script type="text/javascript" src="homepage/assets/jquery.min.js"></script>
	<script type="text/javascript" src="homepage/src/JAreaData.js"></script>
	<script type="text/javascript" src="homepage/src/JAreaSelect.js"></script>
	<script type="text/javascript" src="homepage/src/JAreaSelect2.js"></script>
	<script type="text/javascript" src="js/handlebars.js"></script>


</head>
<body>
           <nav style="height: 60px" class="rd-navbar rd-navbar-corporate" data-layout="rd-navbar-fixed" data-sm-layout="rd-navbar-fixed" data-md-layout="rd-navbar-fixed" data-md-device-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-fixed" data-lg-device-layout="rd-navbar-fixed" data-xl-layout="rd-navbar-static" data-xl-device-layout="rd-navbar-static" data-xxl-layout="rd-navbar-static" data-xxl-device-layout="rd-navbar-static" data-lg-stick-up-offset="118px" data-xl-stick-up-offset="118px" data-xxl-stick-up-offset="118px" data-lg-stick-up="true" data-xl-stick-up="true" data-xxl-stick-up="true">
            <div class="rd-navbar-main-outer" style="background-color: black" style="height: 60px">
              <div class="rd-navbar-main" style="height: 60px">
                <div style="height: 60px" class="rd-navbar-nav-wrap" id="rd-navbar-nav-wrap-1">
                  <!-- RD Navbar Nav-->
                  <ul class="rd-navbar-nav" style="height: 55px" >
                    <li class="rd-nav-item active"><a href="index.jsp"><img src="images/favicon.jpg" style="width: 40px;height: 40px"></a>
                    </li>
                    <li class="rd-nav-item"><a class="rd-nav-link" href="homepage.jsp">房价查询</a>
                    </li>
                    <li class="rd-nav-item"><a class="rd-nav-link" href="Form.jsp">房价对比</a></li>

                    </li>
                    <li class="rd-nav-item"><a class="rd-nav-link" href="recommendPage.jsp">楼盘推荐</a></li>

                    <li class="rd-nav-item"><a class="rd-nav-link" href="#">帮助</a>
                      <!-- RD Navbar Dropdown-->
                      <ul class="rd-menu rd-navbar-dropdown">
                        <li class="rd-dropdown-item"><a class="rd-dropdown-link" href="#">网页引导</a></li>
                        <li class="rd-dropdown-item"><a class="rd-dropdown-link" href="#">功能引导</a></li>
                        <li class="rd-dropdown-item"><a class="rd-dropdown-link" href="#">反馈</a></li>
                      </ul>
                    </li>
                    <li class="rd-nav-item"><a class="rd-nav-link" href="#">关于</a>
                      <!-- RD Navbar Dropdown-->
                      <ul class="rd-menu rd-navbar-dropdown">
                        <li class="rd-dropdown-item"><a class="rd-dropdown-link" href="#">网页介绍</a></li>
                        <li class="rd-dropdown-item"><a class="rd-dropdown-link" href="#">功能介绍</a></li>
                        <li class="rd-dropdown-item"><a class="rd-dropdown-link" href="#">组织介绍</a></li>

                      </ul>
                    </li>
                  <%-- 判断后端session中是否存在用户信息--%>
                  <c:if test="${user.userId!=null}">
<%--                    <li class="rd-nav-item"style="position: absolute;left:1200px"><a  class="rd-nav-link" href="#">欢迎，${user.userId}</a>--%>
                    <li class="rd-nav-item"style="position: absolute;left:1200px"><a  class="rd-nav-link" href="#"><img src="images/头像1.gif" alt="" style="height:40px; width: 40px;border-radius: 5px "></a>
                    <ul class="rd-menu rd-navbar-dropdown" >
                    <nav class="main_nav">
			                <ul>
                            <li><span style="padding-left: 5px;color: antiquewhite">欢迎，${user.userId}</span></li>
                            <li><a  href="index.jsp">查看信息</a></li>
				            <li><a  href="javascript:location.href='LogoutServlet';">退出登录</a></li>
			                </ul>
		             </nav>
                     </ul>
                    </li>
                  </c:if>

                 <%--检测用户名是否存在--%>
                 <c:if test="${user.userId==null}">
                	<li class="rd-nav-item" style="position: absolute;left:1200px ;margin-top: 10px"><a class="rd-nav-link" href="#">登录/注册</a>
                    <ul class="rd-menu rd-navbar-dropdown">
                      <nav class="main_nav">
			                <ul>
                            <li><a class="cd-signin" href="#0">登录</a></li>
				            <li><a class="cd-signup" href="#0">注册</a></li>
			                </ul>
		                  </nav>
                      </ul>
                      </li>
                 </c:if>
                      <!-- RD Navbar Dropdown-->
                  </ul>
                </div>
              </div>
            </div>
          </nav>



<div style="padding-left: 10%; padding-right: 10%; background-color: rgb(241, 241, 241); color: #2b2b2b; ">
<div >
        <div id="area-select-box" class="form-inline" style="background-color: rgb(241,241,241)"></div>
        <div><p><button class="btn btn-success" name="buttonSelectR" onclick="selectPlace()"
              id="buttonSelectR" style="margin: 10px 0px;">确认</button></p>
        </div>
</div>
     <div id="chart-1" style="height: 600px">
        <%--	各个市的房价柱状图--%>
	</div>

    <script type="text/javascript">
                var area = $("#area-select-box").JAreaSelect({
                      prov: 27,
                      city: 2376,
                    dist: 2839,
                    level: 3
                });
           function selectPlace() {
                var location = area.getAreaString().toString();
                var city = new Array();
                city = location.split(",");
			function loadData(Data) {
			$.ajax({            //几个参数需要注意一下
				type: "POST",//提交数据的方法类型
				async: false, //同步执行
				dataType: "json",//预期服务器返回的数据类型
				url: "homepageServlet",//后台接收参数的文件地址,后台的一个servlet
				data: {"city": city[1]},
				success: function (result) {
					if (result) {
						console.log(result);
						console.log("haha");
						// alert("测试成功");
						//初始化option.xAxis[0]中的data
						option1.xAxis[0].data = [];
						for (let i = 0; i < result.length; i++) {
							option1.xAxis[0].data.push(result[i].town);
							console.log(option1.xAxis[i]);
						}
						//初始化option.series[0]中的data
						option1.series[0].data = [];
						for (let i = 0; i < result.length; i++) {
							option1.series[0].data.push(result[i].price);
							console.log(option1.series[i]);
						}

						option2.series[0].data = [];
						for (let i = 0; i < 10; i++) {
							option2.series[0].data.push(result[i].historyPrice);
						}

						option3.series[0].data =[];
                        for (let i = 0; i < 11; i++) {
                            option3.series[0].data.push(result[i].forecast);
                        }
						/*
						* 此处的代码是为了能够拿到后端给我们返回的json数据，进而使用相应的js工具来实现将数据显示到页面上
						* */
						//获取需要放数据的容器
						// var container = document.querySelector('#container');
						// //也就是获取我们定义的模板的dom对象。主要是想获取里面的内容（innerHTML）
						// var templateDom = document.querySelector('#template');
						// //编译模板的里的内容
						// var template = Handlebars.compile(templateDom.innerHTML);
						// //把后台获取到的数据渲染到页面
						// container.innerHTML = template(result);

						var myTemplate = Handlebars.compile($("#container").html());
						//将json对象用刚刚注册的Handlebars模版封装，得到最终的html，插入到基础table中。
						$('#tableList').html(myTemplate(result));
					}
				}
			});
		}
			//第一个图
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('chart-1'));
			// 指定图表的配置项和数据
			var option1 = {
				//表名
				title: {
					text: city[0] + city[1] + '各区房价'
				},
				tooltip: {},
				//柱状图表示的数据名
				legend: {
					data: ['价格']
				},
				//横坐标数据量
				xAxis: [{
					type : 'category',
					axisLabel: {interval: 0}
					// data:["陕","甘","宁"]
				}],
				yAxis: {

                },
				series: [{
					name: '价格',
					type: 'bar'
					// data: [0,0,1]
				}]
			};
			loadData(option1);
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option1);

			//第二个图
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('chart-2'));
			// var dataTread = [820, 932, 901, 934, 1290, 1330, 1320, 801, 954, 1210, 1130, 1420];
			// 指定图表的配置项和数据
			var option2 = {
				title: {
					text: '近十年房价变化概览'
				},
				tooltip : {
						trigger: 'axis',
						axisPointer: {
							type: 'cross',
							label: {
								backgroundColor: '#6a7985'
							}
						}
					},
				xAxis: {
					type: 'category',
					data: ['2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021'],
					name: '年份',     //关键代码
					nameTextStyle: {         //关键代码
						padding: [10, 0, 0, -10],
					},
					axisTick: {show: false},
					// boundaryGap: false, // 将此属性设置为false即可让其在两侧显示
				},
				yAxis: {
					type: 'value',
                    barwidth:5,
				},
				series: [{
					// data: dataTread,
					type: 'line',
                    // symbol: 'circle', //折线点设置为实心点
					symbolSize: 6, //折线点的大小
					itemStyle: {
                        normal: {
                            color: "blue", //折线点的颜色
                            lineStyle: {
                                color: "green" //折线的颜色
                            }
                        }
                    }
				}]
			};
			loadData(option2);
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option2);

			//第三个图
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('chart-3'));
			var dataForecast = [820, 932, 901, 934, 1290, 1330, 1320];

			// 指定图表的配置项和数据
			var option3 = {
				title: {
					text: '未来一年房价变化预测'
				},
                tooltip : {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'cross',
                        label: {
                            backgroundColor: '#6a7985'
                        }
                    }
                },

				xAxis: {
					type: 'category',
					data: ["二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
				},
				yAxis: {
					type: 'value'
				},
				series: [{
					// data: dataForecast,
					type: 'line',
                    // symbol: 'circle', //折线点设置为实心点
					symbolSize: 6, //折线点的大小
					itemStyle: {
                        normal: {
                            color: "green", //折线点的颜色
                            lineStyle: {
                                color: "blue" //折线的颜色
                            }
                        }
                    }
				}]
			};
			loadData(option3);
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option3);
        }
	</script>



	<script type="text/javascript">
		var city;
        function select() {
			var buttonSelect = $(".btn-danger").html();
			// alert(buttonSelect);
			// if(buttonSelect.Value=="选择区域"){
			// 	false
			// }
			// else {
			city = new Array();
			city = buttonSelect.split(",");

			// }
                    </script>


<!--房价表格具体信息的表格-->
	<div id="table-1">
		<table class="Modbus">
			<thead>
            <tr align="left" >
                <td>地区</td>
                <td>价格</td>
                <td>环比增长</td>
            </tr>
       	 	</thead>
			<tbody id="tableList">

			</tbody>
		</table>
		<%--
			此处使用的是handlerbars工具，来实现将拿到的json数据通过相应的方法来将渲染到对应位置
			 {{后端传来的json数据}}
		--%>
        <%-- <tbody id="container"> --%>
            <!--//表格内容使用模板渲染 -->
		<script type="text/x-handlebars-template" id="container">
			{{#each this}}
                <tr>
                    <td>{{town}}</td>
                    <td>{{price}}</td>
                    <td>{{growth}}</td>
                </tr>
                {{/each}}
        </script>
	</div>
	<div id="chart-2" style="height: 400px">
        <%--   第二个图表--%>
	</div>
	<div id="chart-3" style="height: 400px">
        <%--  第三个图表--%>
	</div>

	<div id="bottom">版权所有：Cloud & House</div>

   </div>

        <footer class="section footer-advanced bg-gray-700"
            style="margin-top: 600px;  position: relative;bottom: 0;">
            <div class="footer-advanced-aside">
                <div class="container">
                    <div class="footer-advanced-layout"><a class="brand" href="daohanglan.html"><img
                                src="images/logo2.jpg" alt="" width="25px" height="26px" /></a>
                        <!-- Rights-->
                        <p class="rights">Wedonot@konw whatshould.wewrite/sothis/name.<a target="_blank"
                                href="null.html">网站关于</a></p>
                    </div>
                </div>
            </div>
        </footer>

            <script src="js/core.min.js"></script>
            <script src="js/script.js"></script>
    </body>
    </html>