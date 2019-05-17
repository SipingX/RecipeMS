/* ----------------- Start Document ----------------- */
var xmlHttp;
    //获得用户输入内容的关联信息的函数
    function getMoreContents() {
        //首先要获得用户输入
        var content = document.getElementById("keyword");
        if (content.value == "") {
            clearContent();
            return;
        }
        //然后要给服务器发送用户输入的内容，因为我们采用的是ajax异步发送数据
        //所以我们要使用一个对象，叫做XmlHttp对象
        xmlHttp = createXMLHttp();
        //要给服务器发送数据
//        alert("content.value=" + content.value);
//        alert("escape(content.value)=" + escape(content.value));
//        alert("unescape(content.value)=" + unescape(content.value));
        var url = "SearchRecipe?search=name&keyword=" + content.value;
        //true 表示js脚本会在send()方法之后继续执行，而不会等待来自服务器的响应
        xmlHttp.open("GET", encodeURI(url), true);
        //xmlHttp绑定回调方法，这个回调方法会在xmlHttp状态改变的时候调用
        //xmlHttp的状态0-4，我们只关心4(complete)这个状态，因为
        //当数据传输的过程完成之后，在调用回调方法才有意义
        xmlHttp.onreadystatechange = callback;//无()传递的是函数对象
        xmlHttp.send(null);
    }
    //获得XmlHttp对象
    function createXMLHttp() {
        //对于大多数的浏览器都适用
        var xmlHttp;
        if (window.XMLHttpRequest) {
            xmlHttp = new XMLHttpRequest();
        }
        //要考虑浏览器的兼容性
        if (window.ActiveXObject) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            if (!xmlHttp) {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");

            }
        }
        return xmlHttp;
    }
    //回调函数
    function callback() {
        //4代表完成
        if (xmlHttp.readyState == 4) {
            //200代表服务器响应成功，404代表资源未找到，500代表服务器内部错误
            if (xmlHttp.status == 200) {
                //交互成功，获得相应的数据，是文本格式
                var result = xmlHttp.responseText;
                //解析获得数据
                var json = eval("(" + result + ")");
                //获得数据之后，就可以动态的显示这些数据了，把这些数据展示到输入框下面
                //alert(json);
                setContent(json);
            }
        }
    }
    //设置关联数据的显示
    function setContent(contents) {
        //清空之前的数据
        clearContent();
        //设置位置
        setLocaltion();
        //首先获得关联数据的长度，由此来确定生成多少个tr
        var size = contents.length;
        //设置内容
        for (var i = 0; i < size; i++) {
            var nextNode = contents[i];//代表的是json格式数据的第i个元素
            var tr = document.createElement("tr");
            var td = document.createElement("td");
            td.setAttribute("border", "0");
            td.setAttribute("gbcolor", "#FFFAFA");

            td.onmouseover = function() {
                this.className = 'mouseOver';
            };

            td.onmouseout = function() {
                this.className = 'mouseOut';
            };
            td.onclick = function() {
                //当选择其中的数据时，关联数据自动设置为输入框的数据
            };
            td.onmousedown = function() {
                //当鼠标点击一个关联数据时，自动在输入框添加数据
                document.getElementById("keyword").value = this.innerText;

            };
            //鼠标悬浮于关联数据上时，自动添加到输入框中
            /* td.onmouseover = function(){
                this.className = 'mouseOver';
                if(td.innerText != null)
                document.getElementById("keyword").value =this.innerText;

            } */
            var text = document.createTextNode(nextNode);
            td.appendChild(text);
            tr.appendChild(td);
            document.getElementById("content_table_body").appendChild(tr);
        }
    }

    //清空数据的方法 (输入框失去焦点，输入其他值等)
    function clearContent() {
        var contentTableBody = document.getElementById("content_table_body");
        var size = contentTableBody.childNodes.length;
        for (var i = size - 1; i >= 0; i--) {
            contentTableBody.removeChild(contentTableBody.childNodes[i]);
        }
        //清除关联数据的外边框
        var popDiv = document.getElementById("popDiv").style.border = "none";
    }
    //当输入框失去焦点的时候
    function keywordBlur() {
        clearContent();
    }
    //设置显示关联信息的位置
    function setLocaltion() {
        //关联信息的显示位置要和输入框一致
        var content = document.getElementById("keyword");
        var width = content.offsetWidth;//输入框的长度
        var left = content["offsetLeft"];//到左边框的距离
        var top = content["offsetTop"] + content.offsetHeight;//到顶部的距离(加上输入框本身的高度)
        //获得显示数据的div
        var popDiv = document.getElementById("popDiv");
        popDiv.style.border = "gray 1px solid";
        popDiv.style.left = left + "px";
        popDiv.style.top = top + "px";
        popDiv.style.width = width + "px";
        document.getElementById("content-table").style.width = width + "px";
    }
// ------------------ End Document ------------------ //   