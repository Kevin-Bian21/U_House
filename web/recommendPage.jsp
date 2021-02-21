<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html class="wide wow-animation" lang="en">

        <head>
            <title>推荐页面</title>
            <meta name="format-detection" content="telephone=no">
            <meta name="viewport"
                content="width=device-width height=device-height initial-scale=1.0 maximum-scale=1.0 user-scalable=0">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta charset="utf-8">
            <script src="js/jquery-2.2.0.min.js"></script>
            <script src="js/jquery-1.11.0.min.js"></script>
            <link rel="stylesheet" href="css/bootstrap.css">
            <link rel="stylesheet" href="css/combobox.css">
            <link rel="stylesheet" href="css/fonts.css">
            <link rel="stylesheet" href="css/style.css" id="main-styles-link">
            <link rel="stylesheet" type="text/css"
                href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800">
            <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <link rel='stylesheet'
                href='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css'>
            <link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
            <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:400,700'>
            <link rel="stylesheet" href="css/styleShowPage.css">
            <link rel="stylesheet" href="css/tableRecommend.css">
            <!--价格，面积下拉框-->
            <script src="js/commbobox.js"></script>
            <script src="js/jquery-2.2.0.min.js"></script>
            <!--地区选择-->
            <link rel="stylesheet" href="homepage/assets/bootstrap.min.css">
            <script type="text/javascript" src="js/jquery.min.js"></script>
            <script type="text/javascript" src="homepage/src/JAreaData.js"></script>
            <script type="text/javascript" src="homepage/src/JAreaSelect.js"></script>
            <script type="text/javascript" src="js/handlebars.js"></script>

        </head>


        <body>
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


            <div class="container">
                <div class="mhn-slide owl-carousel" style="margin-top: 70px">
                    <div class="mhn-item">
                        <div class="mhn-inner">

                            <div class="mhn-img" style="background-image: url(images/recommendP1.png);">

                            </div>
                            <div class="mhn-text">
                                <h4>北欧风</h4>
                                <p>没有复杂的造型设计，只有简练的线条设计，比如没有造型的天花吊顶，浅木色的木地板，简约设计的家具组合在一起，
                                    局部再搭配一些绿植、或者亮色的软装搭配，起到点缀的作用。
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="mhn-item">
                        <div class="mhn-inner">

                            <div class="mhn-img" style="background-image: url(images/recommendP2.png);">

                            </div>
                            <div class="mhn-text">
                                <h4>现代简约</h4>
                                <p>重视环保与原料之间的调和与互补，色彩明快跳动,外立面简练流通,外形简洁、功能强,强调室内空间形态和物检的单一性、抽象性。</p>
                            </div>
                        </div>
                    </div>
                    <div class="mhn-item">
                        <div class="mhn-inner">

                            <div class="mhn-img" style="background-image: url(images/recommendP3.png);">

                            </div>
                            <div class="mhn-text">
                                <h4>新中式</h4>
                                <p>将古典语言以现代手法诠释，注入中式的风雅意境，使空间散发着淡然悠远的人文气韵，以现代人的审美需求打造出富有传统韵味的居住空间。</p>
                            </div>
                        </div>
                    </div>
                    <div class="mhn-item">
                        <div class="mhn-inner">

                            <div class="mhn-img" style="background-image: url(images/recommendP4.png);">

                            </div>
                            <div class="mhn-text">
                                <h4>欧式</h4>
                                <p>造型、结构简练大方，整体配套自然和谐，色彩淡雅，与其它色彩搭配有很大的相容性。这种立体感和艺术感给人品味超群的印象。</p>
                            </div>
                        </div>
                    </div>
                    <div class="mhn-item">
                        <div class="mhn-inner">

                            <div class="mhn-img" style="background-image: url(images/recommendP5.png);">

                            </div>
                            <div class="mhn-text">
                                <h4>北欧风</h4>
                                <p>没有复杂的造型设计，只有简练的线条设计，比如没有造型的天花吊顶，浅木色的木地板，简约设计的家具组合在一起，
                                    局部再搭配一些绿植、或者亮色的软装搭配，起到点缀的作用。</p>
                            </div>
                        </div>
                    </div>
                    <div class="mhn-item">
                        <div class="mhn-inner">

                            <div class="mhn-img" style="background-image: url(images/recommendP6.png);">

                            </div>
                            <div class="mhn-text">
                                <h4>现代简约</h4>
                                <p>重视环保与原料之间的调和与互补，色彩明快跳动,外立面简练流通,外形简洁、功能强,强调室内空间形态和物检的单一性、抽象性。</p>
                            </div>
                        </div>
                    </div>
                    <div class="mhn-item">
                        <div class="mhn-inner">

                            <div class="mhn-img" style="background-image: url(images/recommendP7.png);">

                            </div>
                            <div class="mhn-text">
                                <h4>新中式</h4>
                                <p>将古典语言以现代手法诠释，注入中式的风雅意境，使空间散发着淡然悠远的人文气韵，以现代人的审美需求打造出富有传统韵味的居住空间。
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="mhn-item">
                        <div class="mhn-inner">

                            <div class="mhn-img" style="background-image: url(images/recommendP8.png);">

                            </div>
                            <div class="mhn-text">
                                <h4>欧式</h4>
                                <p>造型、结构简练大方，整体配套自然和谐，色彩淡雅，与其它色彩搭配有很大的相容性。这种立体感和艺术感给人品味超群的印象。</p>
                            </div>
                        </div>
                    </div>
                    <div class="mhn-item">
                        <div class="mhn-inner">

                            <div class="mhn-img" style="background-image: url(images/recommendP9.png);">

                            </div>
                            <div class="mhn-text">
                                <h4>北欧风</h4>
                                <p>没有复杂的造型设计，只有简练的线条设计，比如没有造型的天花吊顶，浅木色的木地板，简约设计的家具组合在一起，
                                    局部再搭配一些绿植、或者亮色的软装搭配，起到点缀的作用。</p>
                            </div>
                        </div>
                    </div>
                    <div class="mhn-item">
                        <div class="mhn-inner">

                            <div class="mhn-img" style="background-image: url(images/recommendP10.png);">

                            </div>
                            <div class="mhn-text">
                                <h4>现代简约</h4>
                                <p>重视环保与原料之间的调和与互补，色彩明快跳动,外立面简练流通,外形简洁、功能强,强调室内空间形态和物检的单一性、抽象性。</p>
                            </div>
                        </div>
                    </div>
                    <div class="mhn-item">
                        <div class="mhn-inner">

                            <div class="mhn-img" style="background-image: url(images/recommendP11.png);">

                            </div>
                            <div class="mhn-text">
                                <h4>新中式</h4>
                                <p>将古典语言以现代手法诠释，注入中式的风雅意境，使空间散发着淡然悠远的人文气韵，以现代人的审美需求打造出富有传统韵味的居住空间。</p>
                            </div>
                        </div>
                    </div>
                    <div class="mhn-item">
                        <div class="mhn-inner">

                            <div class="mhn-img" style="background-image: url(images/recommendP12.png);">

                            </div>
                            <div class="mhn-text">
                                <h4>欧式</h4>
                                <p>造型、结构简练大方，整体配套自然和谐，色彩淡雅，与其它色彩搭配有很大的相容性。这种立体感和艺术感给人品味超群的印象。</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>





            <%-- <script>window.jQuery || document.write('
                <script src="js/jquery-1.11.0.min.js"><\/script>')</script>--%>
                <%-- <script src='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js'>
                    </script>--%>
                    <script type="text/javascript">
                        $(function () {
                            $('.mhn-slide').owlCarousel({
                                nav: true,
                                //loop:true,
                                slideBy: 'page',
                                rewind: false,
                                responsive: {
                                    0: { items: 1 },
                                    480: { items: 2 },
                                    600: { items: 3 },
                                    1000: { items: 4 }
                                },
                                smartSpeed: 70,
                                onInitialized: function (e) {
                                    $(e.target).find('img').each(function () {
                                        if (this.complete) {
                                            $(this).closest('.mhn-inner').find('.loader-circle').hide();
                                            $(this).closest('.mhn-inner').find('.mhn-img').css('background-image', 'url(' + $(e.target).attr('src') + ')');
                                        } else {
                                            $(this).bind('load', function (e) {
                                                $(e.target).closest('.mhn-inner').find('.loader-circle').hide();
                                                $(e.target).closest('.mhn-inner').find('.mhn-img').css('background-image', 'url(' + $(e.target).attr('src') + ')');
                                            });
                                        }
                                    });
                                },
                                navText: ['<svg viewBox="0 0 24 24"><path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"></path></svg>', '<svg viewBox="0 0 24 24"><path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg>']
                            });
                        });
                    </script>
                    <div>
                        <div class="container" style="padding-top: 20px;">
                            <div class="alert alert-success" role="alert">
                                <strong>为了更精确的为您提供服务，请选择相应的位置及价格区间</strong>
                            </div>
                            <div id="area-select-box" class="form-inline"></div>
                            <div class="form-item-group" style=" width: 35%;float: left;">
                                <div class="form-item">
                                    <div class="chose-container">
                                        <select name="select" id="selectPrice">
                                            <option tabindex="0">请选择理想价格区间</option>
                                            <option tabindex="1">7000-11000</option>
                                            <option tabindex="2">11000-15000</option>
                                            <option tabindex="3">15000-19000</option>
                                            <option tabindex="4">19000-23000</option>
                                            <option tabindex="5">23000-27000</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-item">
                                    <div class="chose-container">
                                        <select name="select1" id="selectArea">
                                            <option tabindex="0">请选择理想面积区间</option>
                                            <option tabindex="2">80-100</option>
                                            <option tabindex="3">100-120</option>
                                            <option tabindex="4">120-140</option>
                                            <option tabindex="5">140-160</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-item">
                                    <div class="chose-container">
                                        <select name="select2" id="selectAL">
                                            <option tabindex="0">请选择你理想的户型</option>
                                            <option tabindex="0">两室一厅</option>
                                            <option tabindex="0">三室一厅</option>
                                            <option tabindex="0">三室二厅</option>
                                            <option tabindex="0">四室二厅</option>
                                        </select>
                                    </div>
                                    <p><button class="btn btn-success" name="buttonSelectR" onclick="recommendPage()"
                                        id="buttonSelectR" style="margin: 10px 0px;">确认</button></p>
                                </div>
                            </div>

                                    <div id="table-1" style="float: right;width: 55%; margin-top: -2.5%">
                                        <table class="Modbus" style="width: fit-content;">
                                            <thead id="thead">
                                            <tr style="align:center" >
                                                <td>楼盘名称</td>
                                                <td>所在区</td>
                                                <td>具体位置</td>
                                                <td>户型</td>
                                                <td>面积</td>
                                                <td>价格</td>
                                            </tr>
                                                </thead>
                                            <tbody id="tableList">

                                            </tbody>
                                        </table>
                                        <script type="text/x-handlebars-template" id="DataContainer">
                                            {{#each this}}
                                                <tr>
                                                    <td>{{town}}</td>
                                                    <td>{{district}}</td>
                                                    <td>{{location}}</td>
                                                    <td>{{houseType}}</td>
                                                    <td>{{area}}</td>
                                                    <td>{{price}}</td>
                                                </tr>
                                                {{/each}}
                                        </script>
                                </div>
                        </div>
                    </div>
                    <script type="text/javascript">
                        var area = $("#area-select-box").JAreaSelect({
                            prov: 27,
                            city: 2376,
                            dist: 2839,
                            level: 3
                        });
                        function recommendPage() {
                            //将获取到的地理位置转化为string类型，以便后续处理
                            var location = area.getAreaString().toString();
                            var houseArea = $("#selectArea").val();
                            var houseType = $("#selectAL").val();
                            var housePrice = document.getElementById("selectPrice").value;
                            // alert(typeof (local));
                            var cityRecommend = new Array();
                            cityRecommend = location.split(",");
                            var AreaRecommend = new Array();
                            AreaRecommend = houseArea.split("-");
                            var PriceRecommend = new Array();
                            PriceRecommend = housePrice.split("-");
                            if (houseArea == "请选择理想面积区间" || housePrice == "请选择理想价格区间" || houseType == "请选择你理想的户型") {
                                alert("请选择相应的区间或户型");
                            } else {
                                $.ajax({            //几个参数需要注意一下
                                    type: "POST",//提交数据的方法类型
                                    dataType: "json",//预期服务器返回的数据类型
                                    url: "recommendPageServlet",//后台接收参数的文件地址,后台的一个servlet
                                    data: { "block": cityRecommend[2], "minArea": AreaRecommend[0], "maxArea": AreaRecommend[1], "minPrice": PriceRecommend[0], "maxPrice": PriceRecommend[1], "houseType": houseType },
                                    success: function (result) {
                                        console.log(result);//打印服务端返回的数据(调试用)
                                        if (result==""){
                                        alert("没有符合条件的房源");
                                        } else{
                                            var myTemplate = Handlebars.compile($("#DataContainer").html());
                                            //将json对象用刚刚注册的Handlebars模版封装，得到最终的html，插入到基础table中。
                                            $('#tableList').html(myTemplate(result));
                                        }
                                    },
                                })
                            }
                        }
                    </script>



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

                    <div class="snackbars" id="form-output-global"></div>
                    <script src="js/core.min.js"></script>
                    <script src="js/script.js"></script>
        </body>
        </html>