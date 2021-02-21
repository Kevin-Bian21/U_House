var province = document.getElementById("province");
var city = document.getElementById("city");
var district = document.getElementById("district");
var street = document.getElementById("street");

var provinceData = area;
var cityData;
var districtData;
var streetData;

// 获取所有的省 初始化省
createOpt(province, provinceData);

// 初始化市
cityData = provinceData[province.value][0];
createOpt(city, cityData);

// 初始化 区
districtData = cityData[city.value];
for (var i = 0; i < districtData.length; i++) {
    createOpt(district, districtData[i]);
}

// 初始化 街道
streetData = districtData[0][district.value];
var streetArr = streetData.replace(/[" "]/g, "").split("、");
createOpt(street, streetArr);

// 点击省 改变市 区 街道
district.onchange = function () {
    streetData = districtData[district.value][0];
    // 清空 【市】 中 option 样式
    clearOpt(street);
    createOpt(street, streetData);

    // 改变 区
    changeDis();

    // 改变街道
    changeStr();
}

// 点击市 改变区 街道
city.onchange = changeDis;
// 点击区 改变街道
district.onchange = changeStr;
// 封装 创建 option
// sel(select标签)  data(需要遍历的数据)
function createOpt(sel, data) {
    // 如果data是对象
    if (data.constructor === Object) {
        for (var x in data) {
            var opt = document.createElement("option");
            opt.innerHTML = x;
            sel.appendChild(opt);
        }
    } else if (data.constructor === Array) {// 如果data是数组
        for (var i = 0; i < data.length; i++) {
            var opt = document.createElement("option");
            opt.innerHTML = data[i];
            sel.appendChild(opt);
        }
    }
}

// 封装清空的option 样式
function clearOpt(sel) {
    var opts = sel.options;
    for (var i = 0; i < opts.length; i++) {
        sel.removeChild(opts[i]);
        --i;
    }
}

// 封装 改变 区 街道
function changeDis() {
    // 先清 option 样式
    clearOpt(district);
    districtData = cityData[city.value];
    for (var i = 0; i < districtData.length; i++) {
        createOpt(district, districtData[i]);
    }
    changeStr();
}

function changeStr(){
    clearOpt(street);
    // 获取区的option 元素集合
    var disopts = district.options;
    // 获取option 元素 索引
    var districtIndex = disopts.selectedIndex;
    // 获取option 数据
    var strIndex = district.value;
    // 获取 街道
    streetData = districtData[districtIndex][strIndex];
    streetArr = streetData.replace(/[" "]/,"").split("、");
    createOpt(street,streetArr);
}
