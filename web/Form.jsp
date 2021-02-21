<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>对比表</title>
        <link rel="stylesheet" type="text/css" href="css/Form.css">
        <!--导航栏-->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/fonts.css">
        <link rel="stylesheet" href="css/style.css" id="main-styles-link">
        <!---->
        <link rel="stylesheet" href="homepage/src/css/insidePage.css" />
        <script type="text/javascript" src="js/echarts.min.js"></script>
        <script type="text/javascript" src="js/xialabiao.js"></script>
        <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>


       <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <!-- Stylesheets-->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800">

      <link rel="stylesheet" type="text/css" href="css/login2.css" />
            <script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
    </head>


    <script language="javascript" type="text/javascript">
        //定义 城市 数据数组
        var cityStreet = [
            "-请选择-",
            "新城区",
            "未央区",
            "临潼区",
            "长安区",
            "雁塔区",
            "灞桥区",
            "高陵区",
            "阎良区",
            "鄂邑区",
            "莲湖区",
            "碑林区",
        ];
        var cityHorsePrice = [
            ["-请选择-"],
            ["天悦东都", "融创西安壹号院", "华清学府城", "保亿风景大院", "太华小区", "西铁家园", "枫禾新苑", "勤奋家苑", "十里铺安居小区", "咸东社区", "韩康苑小区", "巨丰汽贸小区", "博爱雅苑", "逸兴东苑", "陆港公寓", "天马小区", "长缨花园"],
            ["融创观唐宸院", "西安碧桂园文景府", "中南.君启", "绿城桂语蘭庭", "白桦林溪", "辰宫双河湾", "隆源国际YUE公园", "保亿公元印", "新泽星大厦", "未央金茂府", "隆源国际城金街", "绿地创海大厦", "汉唐新都汇", "国王的公寓", "天诚蔷薇公馆",],
            ["生力广场", "隆基泰和铂悦山铂寓", "紫台福邸", "中金金骊福郡", "蓝光长岛国际社区", "金樾公馆", "骊山下的院子", "德杰德裕天下", "融创桃源府", "新城玺樾骊府", "中海阅骊山贤庭", "雁泊台", "米兰阳光", "群星莱骊", "骊景家城", "瑞麟军府北区"],
            ["陕建翠园锦绣", "万科公园大道领域", "金辉长安云筑", "恒大养身谷", "碧桂园云顶", "龙湖天鉅", "融创揽月府", "紫薇生态城", "长安金茂府", "星河9号", "海亮德文郡", "融创珺庭府", "万科城如园商铺", "长安憶", "天浩大时代"],
            ["中华世纪城", "金地中央公园", "南飞鸿十年城罗曼尼", "感恩时代广场", "合景汇峰", "清凉山樾", "群贤道九号", "招商臻观府", "天竹元谷", "奥园和悦府", "卓越里", "香榭御澄", "荣安芙蓉印月", "绿城高新诚园", "美墅", "自在山", "第址",],
            ["白鹿汀州", "西港碧水湾", "西安华南城", "领航悦宸", "颐合府", "碧桂园香湖湾1号", "清凉霸柳自由寓", "3号LOFT商办", "浐灞金融城", "保利林语溪", "立达国际博览城", "臻园阳光", "悦尚锦云", "赢台", "香江湾", "中建锦绣天地", "龙湖新壹城",],
            ["香林郡", "城市蓝湾", "蓝湖九郡", "宝格丽小镇", "融城朗悦", "泾渭国际中心", "奥韵华府", "龙发天泉湾", "九璟台", "蓝光时代", "鹿园华府", "上林苑", "馨悦茗园", "龙发昭慧天街", "逸景佲园", "北方融城", "商品西街",],
            ["陕建荣华臻萃府", "阎良龙记观园", "弘阳昕悦府", "金开御府", "西安凤鸣华府", "幸福里", "宝安紫韵", "中飞海林国际城", "领航中心广场", "泰宇金街", "九洲怡景湾"],
            ["御湖蓝湾", "沣京名苑", "名仕华庭", "朗基天香", "亿丰时代商业综合体", "荣华水岸新城", "大陆桥英郡", "西郡星邑广场", "荣华清荷园", "有色铂金城", "金色家园",],
            ["富力开远城", "老城根蓝光雍锦世家", "阳光台365", "丝路国际中央商务中心", "珑寓", "天朗大兴郡商铺", "亿润锦悦汇", "璀璨上上城", "开远半岛广场", "隆基大厦",],
            ["佳业广场", "汉华曲江中心", "泰华金汇时代", "宏信国际花园商铺", "恒兴文艺广场", "西安公馆天街one", "端里门", "乐居场小区", "湖景嘉苑", "古韵沁园", "长安公馆", "摩登逐层", "尊域", "翡翠明珠", "中铁缤纷新城",],
        ];

        function setCity(id, selectedIndex) {
            var cityHorsePriceElement = cityHorsePrice[selectedIndex];
            var $parent = $('#' + id);
            $parent.children("option").remove();
            for (index in cityHorsePriceElement) {
                var text = cityHorsePriceElement[index];
                var element = document.createElement("option")
                element.textContent = text;
                $parent.append($(element))
            }
        }
    </script>

    <body style="height: fit-content;">
             <nav style="height:60px;" class="rd-navbar rd-navbar-corporate" data-layout="rd-navbar-fixed"
                data-sm-layout="rd-navbar-fixed" data-md-layout="rd-navbar-fixed"
                data-md-device-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-fixed"
                data-lg-device-layout="rd-navbar-fixed" data-xl-layout="rd-navbar-static"
                data-xl-device-layout="rd-navbar-static" data-xxl-layout="rd-navbar-static"
                data-xxl-device-layout="rd-navbar-static" data-lg-stick-up-offset="118px"
                data-xl-stick-up-offset="118px" data-xxl-stick-up-offset="118px" data-lg-stick-up="true"
                data-xl-stick-up="true" data-xxl-stick-up="true">
                <div class="rd-navbar-main-outer" style="background-color: black;height: 60px;">
                    <div class="rd-navbar-main" style="height:60px">
                        <div class="rd-navbar-nav-wrap" id="rd-navbar-nav-wrap-1">
                            <!-- RD Navbar Nav-->
                            <ul class="rd-navbar-nav" style="height:60px">
                                <li class="rd-nav-item active"><a href="index.jsp"><img src="images/favicon.jpg"
                                            style="width: 40px;height: 40px"></a>
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
                                        <%-- <li class="rd-nav-item" style="position: absolute;left:1200px"><a
                                                class="rd-nav-link" href="#">欢迎，${user.userId}</a>--%>
                                            <li class="rd-nav-item" style="position: absolute;left:1200px"><a
                                                    class="rd-nav-link" href="#"><img src="images/头像1.gif" alt=""
                                                        style="height:40px; width: 40px;border-radius: 5px "></a>
                                                <ul class="rd-menu rd-navbar-dropdown">
                                                    <nav class="main_nav">
                                                        <ul>
                                                            <li><span
                                                                    style="padding-left: 5px;color: antiquewhite">欢迎，${user.userId}</span>
                                                            </li>
                                                            <li><a href="index.jsp">查看信息</a></li>
                                                            <li><a
                                                                    href="javascript:location.href='LogoutServlet';">退出登录</a>
                                                            </li>
                                                        </ul>
                                                    </nav>
                                                </ul>
                                            </li>
                                    </c:if>

                                    <%--检测用户名是否存在--%>
                                        <c:if test="${user.userId==null}">
                                            <li class="rd-nav-item"
                                                style="position: absolute;left:1200px ;margin-top: 10px"><a
                                                    class="rd-nav-link" href="#">登录/注册</a>
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

             <div class="cd-user-modal">
		<div class="cd-user-modal-container">
			<ul class="cd-switcher">
				<li><a href="#0">用户登录</a></li>
				<li><a href="#0">注册新用户</a></li>
			</ul>
			<form id="cd-login"> <!-- 登录表单 -->
				<div class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-username" for="signin-username">用户名</label>
						<input class="full-width has-padding has-border"  id="signin-username" type="text" placeholder="输入用户名">
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">密码</label>
						<input class="full-width has-padding has-border" id="signin-password" type="password"  placeholder="输入密码">
					</p>

					<p class="fieldset">
						<input type="checkbox" id="remember-me" checked>
						<label for="remember-me">记住密码</label>
					</p>

					<p class="fieldset">
						<input class="full-width2" type="button" onclick="login()" value="登 &nbsp;&nbsp;&nbsp;录">
					</p>
                </div>
			</form>
        <%--    登录验证--%>
    <script >
        function login() {

            var userId = document.getElementById("signin-username").value;
            var password = document.getElementById("signin-password").value;
            $.ajax({
                type: "POST",//提交数据的方法类型
                dataType: "text",//预期服务器返回的数据类型
                url: "LoginServlet",//后台接收参数的文件地址,后台的一个servlet
                data: {"userId": userId, "password": password},
                success: function (result) {
                        if (result.toString() == "1" ) {
                            //刷新页面，将用户信息展示到右上方
                            window.location.reload();
                        } else {
                            alert("用户名或密码错误");
                        }
                    }
            });
        }
    </script>
			<div id="cd-signup"> <!-- 注册表单 -->
				<form class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-username"  for="signup-username1">用户名</label>
						<input class="full-width has-padding has-border" name="userId" id="signup-username1" type="text" placeholder="输入用户名">
					</p>

					<p class="fieldset">
						<label class="image-replace cd-email" for="signup-password1">密码</label>
						<input class="full-width has-padding has-border" name="password1" id="signup-password1" type="password" placeholder="输入密码">
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password2">确认密码</label>
						<input class="full-width has-padding has-border"  name="password2" id="signup-password2" type="password"  placeholder="确认密码">
					</p>

					<p class="fieldset">
						<input type="checkbox" id="accept-terms">
						<label for="accept-terms">我已阅读并同意 <a href="#0">用户协议</a></label>
					</p>

					<p class="fieldset">
						<input class="full-width2" type="button"  onclick="validate()" value="注册新用户">
					</p>
				</form>
			</div>
			<a href="#0" class="cd-close-form">关闭</a>
		</div>
	</div>
        <%--注册验证--%>
        <script>
            function validate() {
                var user = $("#signup-username1").val();
                var pwd = $("#signup-password1").val();
                var pwd1 = $("#signup-password2").val();
            <!-- 对比两次输入的密码 -->
                if (user==""||pwd==""||pwd1==""){
                    alert("请输入账号或密码");
                }else{
                    if (pwd==pwd1){
                    $.ajax({
                        type: "POST",//提交数据的方法类型
                        dataType: "text",//预期服务器返回的数据类型
                        url: "RegisterServlet",//后台接收参数的文件地址,后台的一个servlet
                        data: {"userId": user, "password1": pwd,"password2":pwd1},
                        success: function (result) {
                            if (result.toString() == "1" ) {
                                //刷新页面，将用户信息展示到右上方
                                window.location.reload();
                            } else {
                                alert("账号已存在");
                            }
                        }
                    });
                    }else{
                        alert("两次密码不一致");
                    }
                }
            }
            </script>



            <div style=" padding-left: 10%; padding-right: 10%; color: black ;font-family: 'Microsoft JhengHei'">
                <div class="search" style=" width:1522px;">
                    <input type="text" placeholder="请输入..." name="" id=" " value="" />
                    <button><i>搜索</i></button>
                </div>
                <form id="form2" action="SelectServlet" method="post">
                    <select id="selProvince" name="town1" onChange="setCity('selCity' ,this.selectedIndex)" style="height: fit-content;font-size: 20px ; border-radius: 3px">
                        <option tabindex="0">-请选择-</option>
                        <option tabindex="1">新城区</option>
                        <option tabindex="2">未央区</option>
                        <option tabindex="3">临潼区</option>
                        <option tabindex="4">长安区</option>
                        <option tabindex="5">雁塔区</option>
                        <option tabindex="6">灞桥区</option>
                        <option tabindex="7">高陵区</option>
                        <option tabindex="8">阎良区</option>
                        <option tabindex="9">鄂邑区</option>
                        <option tabindex="10">莲湖区</option>
                        <option tabindex="11">碑林区</option>
                    </select>
                    <select id="selCity" name="townHouse1" style="height: fit-content;font-size: 20px ; border-radius: 3px">
                        <option>-请选择-</option>
                    </select>
                    <!-- 此处getCity()方法获取的是option标签中的value属性所对应的值，而不是页面显示的值 -->
                    <select id="selProvince2" name="town2" onChange="setCity('selCity2', this.selectedIndex)" style="height: fit-content;font-size: 20px ; border-radius: 3px">
                        <option tabindex="请选">-请选择-</option>
                        <option tabindex="10">新城区</option>
                        <option tabindex="11">未央区</option>
                        <option tabindex="12">临潼区</option>
                        <option tabindex="13">长安区</option>
                        <option tabindex="14">雁塔区</option>
                        <option tabindex="15">灞桥区</option>
                        <option tabindex="16">高陵区</option>
                        <option tabindex="17">阎良区</option>
                        <option tabindex="18">鄂邑区</option>
                        <option tabindex="19">莲湖区</option>
                        <option tabindex="20">碑林区</option>
                    </select>

                    <select id="selCity2" name="townHouse2" style="height: fit-content;font-size: 20px ; border-radius: 3px">
                        <option>-请选择-</option>
                    </select>
                    <input type="submit" value="提交">
                    <input type="reset">
                </form>

                <div class="displayBox" style=" height: 400px;margin-top: 10px; background-image: url(images/pictureHomeConstrast.png);">

                </div>




                <div style="width: 100%;">
                    <div id="table-1" style="color: #2b2b2b">
                        <table class="Modbus" style="color: #2b2b2b">
                            <thead style="color: #2b2b2b">
                                <tr>
                                    <th>楼盘</th>
                                    <th>${house1}</th>
                                    <th>${house2}</th>
                                </tr>
                            </thead>
                            <tr>
                                <td>所在区</td>
                                <td>${town1}</td>
                                <td>${town2}</td>
                            </tr>
                            <tr id="iddw">
                                <td>位置</td>
                                <td>${location1}</td>
                                <td>${location2}</td>
                            </tr>
                            <tr id="first">
                                <td class="item1">价格/m^2</td>
                                <td class="item2">${price1}</td>
                                <td class="item3">${price2}</td>
                            </tr>
                            <tr>
                                <td>大小m^2</td>
                                <td>${area1}</td>
                                <td>${area2}</td>
                            </tr>
                            <tr>
                                <td>户型</td>
                                <td>${houseType1}</td>
                                <td>${houseType2}</td>
                            </tr>

                        </table>
                    </div>

                    <div id="chart-1" style=" width: 49%; position: absolute; top:57%;margin-left: 1px;">
                        <script type="text/javascript">
                            // 基于准备好的dom，初始化echarts实例
                            var myChart = echarts.init(document.getElementById('chart-1'));

                            // 指定图表的配置项和数据
                            var option = {
                                //表名
                                title: {
                                    text: '房价对比'
                                },
                                tooltip: {},
                                //柱状图表示的数据名
                                legend: {
                                    data: ['价格']
                                },
                                //横坐标数据量
                                xAxis: {

                                    data: ["${town1}", "${town2}", "${house1}", "${house2}"]
                                },
                                yAxis: {},
                                series: [{
                                    name: '价格',
                                    type: 'bar',
                                    stack: '2',
                                    barWidth: 60,
                                    data: ["${townPrice1}", "${townPrice2}", "${price1}", "${price2}"]
                                }
                                ]
                            };
                            // 使用刚指定的配置项和数据显示图表。
                            myChart.setOption(option);


                            function setTableValues() {
                                var nodes = document.getElementsByClassName("first");
                                for (node of nodes) {
                                    node.children()
                                }
                            }
                            setInterval(function () {
                                setTableValues()
                            }, 1000)
                        </script>
                    </div>
                </div>
            </div>
            <footer class="section footer-advanced bg-gray-700" style="margin-top: 1000px;">
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

            <div class="snackbars" id="form-output-global"></div>
            <script src="js/core.min.js"></script>
            <script src="js/script.js"></script>
    </body>

    </html>