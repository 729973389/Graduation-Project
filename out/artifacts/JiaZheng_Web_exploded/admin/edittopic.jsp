<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="check_logstate.jsp"></jsp:include>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="zh_CN">
<head>
    <base href="<%=basePath%>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>欢迎使用后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
    <script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" type="text/css" href="stylesheets/premium.css">
    <script type="text/javascript" src="js/topic.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>
<body class=" theme-blue">
<div class="content">
    <div class="header">
        <h1 class="page-title">编辑订单评价信息</h1>
    </div>
    <div class="main-content">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div id="myTabContent" class="tab-content">
                    <form action="topic/updateTopic.action" name="myform" method="post" onsubmit="return check()" class="form">

                        <div class="tab-pane active in" id="home">
                            <div class="form-group">
                                <label>评价</label>${topic.contents} <input type="hidden" name="contents" class="form-control" id="contents"
                                                                          value="${topic.contents}" />
                            </div>
                        </div>
                        <div class="tab-pane active in" id="home">
                            <div class="form-group">
                                <label>回复</label>
                                <textarea name="reps" class="form-control" id="reps" style="width: 99%; height: 120px"></textarea>
                            </div>
                        </div>
                        <div>
                            <input type="hidden" name="topicid" id="topicid" value="${topic.topicid}" /><input type="hidden" name="usersid"
                                                                                                               id="usersid" value="${topic.usersid}" /> <input type="hidden" name="ordersid" id="ordersid"
                                                                                                                                                               value="${topic.ordersid}" /> <input type="hidden" name="goodsid" id="goodsid" value="${topic.goodsid}" /> <input
                                type="hidden" name="num" id="num" value="${topic.num}" /> <input type="hidden" name="addtime" id="addtime"
                                                                                                 value="${topic.addtime}" /> <input type="hidden" name="status" id="status" value="已回复" />

                            <button type="submit" id="sub" class="btn btn-primary">提交保存</button>
                            &nbsp;&nbsp;&nbsp;
                            <button type="reset" id="res" class="btn btn-primary">取消重置</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

