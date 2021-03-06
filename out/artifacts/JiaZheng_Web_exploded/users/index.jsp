<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <base href="<%=basePath%>" />
    <title>${title }</title>
    <style type="text/css">
        .slider {
            position: absolute;
            width: 100%;
            height: 425px;
        }

        .slider li, .slider li a {
            list-style: none;
            float: left;
            width: 100%;
            height: 425px;
        }

        .slider img {
            width: 100%;
            height: 425px;
            display: block;
        }

        .slider2 {
            width: 2000px;
        }

        .slider2 li {
            float: left;
        }

        .num {
            position: absolute;
            right: 400px;
            bottom: 20px;
        }

        .num li {
            float: left;
            color: #005aa9;
            text-align: center;
            line-height: 16px;
            width: 16px;
            height: 16px;
            font-family: Arial;
            font-size: 12px;
            cursor: pointer;
            overflow: hidden;
            margin: 3px 1px;
            border: 1px solid #005aa9;
            background-color: #fff;
        }

        .num li.on {
            color: #fff;
            line-height: 21px;
            width: 21px;
            height: 21px;
            font-size: 16px;
            margin: 0 1px;
            border: 0;
            background-color: #005aa9;
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">
        var $s = function(id) {
            return "string" == typeof id ? document.getElementById(id) : id;
        };
        var Class = {
            create : function() {
                return function() {
                    this.initialize.apply(this, arguments);
                }
            }
        }
        Object.extend = function(destination, source) {
            for ( var property in source) {
                destination[property] = source[property];
            }
            return destination;
        }
        var TransformView = Class.create();
        TransformView.prototype = {
            //????????????,????????????,????????????,????????????
            initialize : function(container, slider, parameter, count, options) {
                if (parameter <= 0 || count <= 0)
                    return;
                var oContainer = $s(container), oSlider = $s(slider), oThis = this;
                this.Index = 0;//????????????

                this._timer = null;//?????????
                this._slider = oSlider;//????????????
                this._parameter = parameter;//????????????
                this._count = count || 0;//????????????
                this._target = 0;//????????????

                this.SetOptions(options);

                this.Up = !!this.options.Up;
                this.Step = Math.abs(this.options.Step);
                this.Time = Math.abs(this.options.Time);
                this.Auto = !!this.options.Auto;
                this.Pause = Math.abs(this.options.Pause);
                this.onStart = this.options.onStart;
                this.onFinish = this.options.onFinish;

                oContainer.style.overflow = "hidden";
                oContainer.style.position = "relative";

                oSlider.style.position = "absolute";
                oSlider.style.top = oSlider.style.left = 0;
            },
            //??????????????????
            SetOptions : function(options) {
                this.options = {//?????????
                    Up : true,//????????????(????????????)
                    Step : 5,//???????????????
                    Time : 10,//????????????
                    Auto : true,//??????????????????
                    Pause : 2000,//????????????(Auto???true?????????)
                    onStart : function() {
                    },//?????????????????????
                    onFinish : function() {
                    }//?????????????????????
                };
                Object.extend(this.options, options || {});
            },
            //??????????????????
            Start : function() {
                if (this.Index < 0) {
                    this.Index = this._count - 1;
                } else if (this.Index >= this._count) {
                    this.Index = 0;
                }

                this._target = -1 * this._parameter * this.Index;
                this.onStart();
                this.Move();
            },
            //??????
            Move : function() {
                clearTimeout(this._timer);
                var oThis = this, style = this.Up ? "top" : "left", iNow = parseInt(this._slider.style[style]) || 0, iStep = this
                    .GetStep(this._target, iNow);

                if (iStep != 0) {
                    this._slider.style[style] = (iNow + iStep) + "px";
                    this._timer = setTimeout(function() {
                        oThis.Move();
                    }, this.Time);
                } else {
                    this._slider.style[style] = this._target + "px";
                    this.onFinish();
                    if (this.Auto) {
                        this._timer = setTimeout(function() {
                            oThis.Index++;
                            oThis.Start();
                        }, this.Pause);
                    }
                }
            },
            //????????????
            GetStep : function(iTarget, iNow) {
                var iStep = (iTarget - iNow) / this.Step;
                if (iStep == 0)
                    return 0;
                if (Math.abs(iStep) < 1)
                    return (iStep > 0 ? 1 : -1);
                return iStep;
            },
            //??????
            Stop : function(iTarget, iNow) {
                clearTimeout(this._timer);
                this._slider.style[this.Up ? "top" : "left"] = this._target + "px";
            }
        };
        window.onload = function() {
            function Each(list, fun) {
                for (var i = 0, len = list.length; i < len; i++) {
                    fun(list[i], i);
                }
            }
            ;

            var objs = $s("idNum").getElementsByTagName("li");
            var obj_len = objs.length;
            var tv = new TransformView("idTransformView", "idSlider", 425, obj_len,
                {
                    onStart : function() {
                        Each(objs, function(o, i) {
                            o.className = tv.Index == i ? "on" : "";
                        })
                    }//????????????
                });

            tv.Start();

            Each(objs, function(o, i) {
                o.onmouseover = function() {
                    o.className = "on";
                    tv.Auto = false;
                    tv.Index = i;
                    tv.Start();
                }
                o.onmouseout = function() {
                    o.className = "";
                    tv.Auto = true;
                    tv.Start();
                }
            })

        }
    </script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<div style="clear: both"></div>
<div id="idTransformView" style="height: 425px; overflow: hidden; position: relative;">
    <ul class="slider" id="idSlider">
        <li><img src="pic/001.jpg" /></li>
        <li><img src="pic/002.jpg" /></li>
        <li><img src="pic/003.jpg" /></li>
        <li><img src="pic/004.jpg" /></li>
    </ul>
    <ul class="num" id="idNum">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>

<div class="blank5"></div>
<div class="block clearfix">
    <div class="goodsBox_1">
        <!-- ????????????  -->
        <c:forEach items="${frontList}" var="cate">
            <div class="xm-box">
                <div class="title">
                    <span class="floor-icon"><i></i><b></b> </span>
                    <h2>${cate.catename }</h2>
                    <a class="more" href="index/cate.action?id=${cate.cateid }">?????? </a>
                </div>
                <div id="show_new_area" class="clearfix xm-boxs">
                    <!-- ????????????  -->
                    <c:forEach items="${cate.goodsList}" var="goods">
                        <div class="goodsItem goodsItems">
                            <a href="index/detail.action?id=${goods.goodsid }">
                                <img src="${goods.image }" alt="${goods.goodsname }"
                                     class="goodsimg" /> </a> <br />
                            <p class="f1">
                                <a href="index/detail.action?id=${goods.goodsid }" title="${goods.goodsname }">${goods.goodsname }</a>
                            </p>
                            <p class="">
                                ????????? <font class="f1"> ???${goods.price }??? </font>
                            </p>
                        </div>
                    </c:forEach>
                    <!-- ????????????  -->
                </div>
            </div>
            <div class="blank"></div>
        </c:forEach>
        <!-- ????????????  -->
        <div class="blank"></div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
