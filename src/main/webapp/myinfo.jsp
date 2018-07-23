<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>图书后台管理系统</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<c:if test="${sessionScope.username!=null }">
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><span>图书后台管理系统</span></a>
                <ul class="user-menu">
                    <li class="dropdown pull-right">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span
                                class="glyphicon glyphicon-user"></span>欢迎您！${sessionScope.username}<span
                                class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span> 个人信息</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-cog"></span> 系统设置</a></li>
                            <li><a href="loginout.action"><span class="glyphicon glyphicon-log-out"></span> 退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <form role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="搜索">
            </div>
        </form>
        <ul class="nav menu">
            <li class="parent">
                <a href="index.jsp">
                    <span class="glyphicon glyphicon-stats"></span>图书管理<span data-toggle="collapse"
                                                                             href="#sub-item-1"
                                                                             class="icon pull-right"><em
                        class="glyphicon glyphicon-s glyphicon-plus"></em></span>
                </a>
                <ul class="children collapse" id="sub-item-1">
                    <li>
                        <a class="" href="publishers.jsp
">
                            <span class="glyphicon glyphicon-share-alt"></span>出版社种类
                        </a>
                    </li>
                    <li>
                        <a class="" href="categorys.jsp">
                            <span class="glyphicon glyphicon-share-alt"></span>图书种类
                        </a>
                    </li>
                    <li>
                        <a class="" href="nationalitys.jsp">
                            <span class="glyphicon glyphicon-share-alt"></span>图书国籍
                        </a>
                    </li>
                </ul>
            </li>
            <li><a href="usermanagement.jsp"><span class="glyphicon glyphicon-dashboard"></span>用户管理</a></li>
            <li><a href="order.jsp"><span class="glyphicon glyphicon-th"></span> 订单管理</a></li>
            <li role="presentation" class="divider"></li>
            <li class="active"><a href="myinfo.jsp"><span class="glyphicon glyphicon-user"></span>个人信息</a></li>
            <li role="presentation" class="divider"></li>
            <li ><a href="systeminfo.jsp"><span class="glyphicon glyphicon-user"></span>系统信息</a></li></ul>

    </div>

    <div class=" col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
                <li class="active">个人信息</li>
            </ol>
        </div><!--/.row-->
    </div>
    <div style="position:absolute;left:40%;height: 10%; top:155%;" align="center"><a
            style="text-decoration: none;color:#01699F;" href="http://www.miitbeian.gov.cn/">©2016-2017 版权所有
        蜀ICP备16036548号</a></div>
</c:if>
<span id="id"></span>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/chart.min.js"></script>
<script src="js/chart-data.js"></script>
<script src="js/easypiechart.js"></script>
<script src="js/easypiechart-data.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script>
</script>
</body>

</html>
