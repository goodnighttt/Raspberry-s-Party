function Popup() {
    document.getElementById("popup").style.display = "block";
    document.getElementById("image").style.display = "block";

    // 获取签到时间
    var data = new Date();
    var year = data.getFullYear(); //获取年份
    var month = data.getMonth() + 1; //获取月份
    var today = data.getDate(); //获取当日
    var year = year.toString();
    var month = month.toString();
    var today = today.toString();
    var nian = '年';
    var yue = '月';
    var ri = '日';
    var o = '0';
    var hours = data.getHours();
    var min = data.getMinutes();
    var mao = ':';
    var signday = year + nian + o + month + yue + o + today + ri; //签到年月日拼接
    var signmin = hours + mao + min; // 签到小时分钟
    document.getElementById('todays').innerHTML = signday; //更新签到日期
    document.getElementById('signMin').innerHTML = signmin; //更新签到时间
}

function closePopup() {
    document.getElementById("popup").style.display = "none";
}

function nextpic()
{
    //随机抽签
   // document.getElementById("image").src = '../src/已完成-大吉.png'; //动态设定src
    var num=Math.floor(Math.random()*5)+1;
    switch (num) {
        case 1:
            document.getElementById("image").src = '../src/已完成-大吉.png'; //动态设定src
            break;
        case 2:
            document.getElementById("image").src = '../src/已完成-吉.png';
            break;
        case 3:
            document.getElementById("image").src = '../src/已完成-中吉.png';
            break;
        case 4:
            document.getElementById("image").src = '../src/已完成-小吉.png';
            break;
        case 5:
            document.getElementById("image").src = '../src/已完成-末吉.png';
            break;
    }
}