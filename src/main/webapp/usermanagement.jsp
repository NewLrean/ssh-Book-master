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
                        <li><a href="loginout.action"><span class="glyphicon glyphicon-log-out"></span> 退出登录</a>
                        </li>
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
        <li class="active"><a href="usermanagement.jsp"><span class="glyphicon glyphicon-dashboard"></span>用户管理</a>
        </li>
        <li><a href="order.jsp"><span class="glyphicon glyphicon-th"></span> 订单管理</a></li>
        <li role="presentation" class="divider"></li>
        <li><a href="myinfo.jsp"><span class="glyphicon glyphicon-user"></span>个人信息</a></li>
        <li role="presentation" class="divider"></li>
        <li><a href="systeminfo.jsp"><span class="glyphicon glyphicon-user"></span>系统信息</a></li>
    </ul>

</div>

<div class=" col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">用户管理</li>
        </ol>
    </div>
</div>
<div class="input-group" style="width: 500px;margin-left: 38%;margin-top: 70px;">

    <input onkeydown="EnterPress()" id="btn-input" type="text"
           style="height: 40px" class="form-control input-md"
           value="<c:if test="${sessionScope.selectusername!=null }">${sessionScope.selectusername}</c:if>"
           placeholder="输入你要搜索的用户"/>
    <span class="input-group-btn">
								<button onclick="sousuo()" style="height: 40px" class="btn btn-primary btn-md"
                                        id="btn-todo">搜索</button>
        </span>
</div>
<div class="col-sm-offset-2">
    <div class="col-lg-12">
        <button type="button" style="margin-left: 30px" class="btn btn-primary" data-toggle="modal"
                data-target="#adduser">添加用户
        </button>
        <c:if test="${sessionScope.users!=null }">
            <table class="" id="box-table-a" summary="Employee Pay Sheet">
                <thead>
                <tr>
                    <th width="25%"><input type="checkbox" id="inlineCheckbox2" value="option1">用户名</th>
                    <th width="10%"></th>
                    <th width="10%">用户地址</th>
                    <th width="10%">用户电话</th>
                    <th width="10%">邮箱</th>
                    <th width="20%">用户级别</th>
                    <th width="10%">用户状态</th>
                    <th width="10%">删除</th>
                </tr>
                <c:forEach items="${sessionScope.users}" var="b">
                <tr>
                    <td><label class="checkbox-inline">
                        <input type="checkbox" id="inlineCheckbox1" value="option1"> ${b.username }
                    </label></td>
                    <td><img style="width: 20px;height: 20px" src="image/bianji.png"
                             onclick="edituser(
                                     '${b.id}',
                                     '${b.username}',
                                     '${b.password}',
                                     '${b.address}',
                                     '${b.phone}',
                                     '${b.mail}',
                                     '${b.userrolesId}',
                                     '${b.userstatesId}')"/>
                    </td>
                    <td>${b.address}</td>
                    <td>${b.phone}</td>
                    <td>${b.mail}</td>
                    <td>${b.userrolesId}
                    </td>
                    <td>${b.userstatesId}</td>

                    <td>
                        <!-- 按钮触发模态框 -->
                        <button type="button" style="width: 60px;height: 30px" class="btn btn-primary"
                                onclick="detials('${b.username}','${b.id}')">删除
                        </button>
                    </td>
                </tr>

                </c:forEach>
            </table>
        </c:if>
        </button>
    </div>
</div>
<div style="margin-left: 51.5%;margin-top: 100px">
    <br>
    <p style="color:#f1f4f7;">&nbsp;</p>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModaldelete">
        删除
    </button>
    <button type="button" onclick="firstpage()" class="btn btn-primary">
        首页
    </button>
    <button type="button" class="btn btn-primary" onclick="toppage()">
        &lt;上一页
    </button>

    <span>&nbsp;当前第&nbsp;<span id="numberpage"><c:if
            test="${sessionScope.usercurrentpage!=null }">${sessionScope.usercurrentpage}</c:if></span>&nbsp;页&nbsp;</span>
    <button type="button" class="btn btn-primary" onclick="nextpage()">
        下一页&gt;
    </button>
    <button type="button" class="btn btn-primary" onclick="lastpage()">
        尾页
    </button>
    <c:if test="${sessionScope.userpagenumber!=null }">
        <span>共<span id="totalpagenumber">${sessionScope.userpagenumber}</span>页，到第</span>
    </c:if>
    <input id="page" type="text" value="" style="width: 30px"><span>页</span>
    <button type="button" class="btn btn-primary" onclick="positionpage()">
        确定
    </button>
</div>
<div style="position:absolute;left:40%;height: 10%; top:125%;" align="center"><a
        style="text-decoration: none;color:#01699F;" href="http://www.miitbeian.gov.cn/">©2016-2017 版权所有
    蜀ICP备16036548号</a></div>


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" style="margin-top: 10%" tabindex="-1"
     role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    删除图书
                </h4>
            </div>
            <div class="modal-body" style="color: #000">
                <span id="userid"></span>
                <span id="usernameid">确认删除这本书吗？</span></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="deletebook()" data-dismiss="modal">
                    <a style="text-decoration: none; color: #fff">删除</a>
                </button>
            </div>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="adduser" tabindex="-1" role="dialog" style=""
     aria-labelledby="myModaladduser" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModaladduser">
                    添加用户
                </h4>
            </div>

            <form id="adduserform" method="post">
                <div class="modal-body" style="color: #30a5ff">
                    <span><strong> 用户id：</strong></span><br>
                    <input type="text" class="form-control"
                           name="id"><br>
                    <span><strong> 用户名：</strong></span><br>
                    <input type="text" name="username"
                           class="form-control"
                    ><br>
                    <span><strong> 用户地址：</strong></span> <input type="text"
                                                                name="address" class="form-control"
                ><br>
                    <span><strong> 用户电话：</strong> </span> <input type="text"
                                                                 name="phone" class="form-control"
                ><br>
                    <span> <strong>用户邮箱：</strong></span> <input type="text"
                                                                name="mail" class="form-control"
                ><br>
                    <span><strong> 用户等级：</strong></span> <input type="text"
                                                                class="form-control"
                                                                name="userrolesId"><br>
                    <span><strong> 用户状态：</strong></span> <input type="text"
                                                                class="form-control" name="userstatesId"
                ><br>
                </div>
            </form>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button id="addbookbutton" type="button" class="btn btn-primary" data-dismiss="modal">
                    确认添加
                </button>
            </div>
        </div>
    </div>

</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="edit" tabindex="-1" role="dialog" style=""
     aria-labelledby="myModaledit" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModaledit">
                    编辑用户
                </h4>
            </div>

            <form id="updateuser" method="post">
                <div class="modal-body" style="color: #30a5ff">
                    <span><strong> 用户id：</strong></span><br>
                    <input id="updateuserid" readonly="true" type="text" style="color: #000;border:0;"
                           name="id"><br>
                    <span><strong> 用户名：</strong></span><br>
                    <input type="text" id="username" name="username"
                           class="form-control"
                    ><br>
                    <span><strong> 用户地址：</strong></span> <input type="text"
                                                                name="address" class="form-control"
                                                                id="address"><br>
                    <span><strong> 用户电话：</strong> </span> <input type="text"
                                                                 name="phone" class="form-control"
                                                                 id="phone"><br>
                    <span> <strong>用户邮箱：</strong></span> <input type="text"
                                                                name="mail" class="form-control"
                                                                id="mail"><br>
                    <span><strong> 用户等级：</strong></span> <input type="text"
                                                                class="form-control"
                                                                name="userrolesId" id="userrolesId"><br>
                    <span><strong> 用户状态：</strong></span> <input type="text"
                                                                class="form-control" name="userstatesId"
                                                                id="userstatesId"><br>
                </div>
            </form>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button onclick="updateuser()" type="button" class="btn btn-primary" data-dismiss="modal">
                    提交修改
                </button>
            </div>
        </div>
    </div>

</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModaldelete" style="margin-top: 10%" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabeldelete" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabeldelete">
                    批量删除图书
                </h4>
            </div>
            <div class="modal-body" style="color: #000">
                <span>确认删除您所选择的书吗？</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">
                    <a href="#" style="text-decoration: none; color: #fff">删除</a>
                </button>
            </div>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="nofindbook" style="margin-top: 10%" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabeldeletenofindbook" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabeldeletenofindbook">
                    搜索结果
                </h4>
            </div>
            <div class="modal-body" style="color: #000">
                <span>对不起，没有找到您想要的结果!</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">
                    <a href="#" style="text-decoration: none; color: #fff">确定</a>
                </button>
            </div>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="alertlastpage" style="margin-top: 10%" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabeldeletealertlastpage" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabeldeletealertlastpage">
                    下一页
                </h4>
            </div>
            <div class="modal-body" style="color: #000">
                <span>亲已经是最后一页了哦!</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">
                    <a href="#" style="text-decoration: none; color: #fff">确定</a>
                </button>
            </div>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="alerttoppage" style="margin-top: 10%" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabeldeletetoppage" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabeldeletetoppage">
                    上一页
                </h4>
            </div>
            <div class="modal-body" style="color: #000">
                <span>亲已经是第一页了哦!</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">
                    <a href="#" style="text-decoration: none; color: #fff">确定</a>
                </button>
            </div>
        </div>
    </div>
</div>
<span id="id"></span>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/chart.min.js"></script>
<script src="js/chart-data.js"></script>
<script src="js/easypiechart.js"></script>
<script src="js/easypiechart-data.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script>
    function detials(username, id) {
        $("#usernameid").text('确认删除' + username + '这个用户吗？');
        $("#userid").text(id);
        $('#myModal').modal('show');

    }
    function deletebook() {
        var userid = $("#userid").text();
        $.ajax({
            url: "deleteuser.action",
            data: {id: userid},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result) {
                    window.location.href = "usermanagement.jsp";
                }
                else {
                    alert("删除失败！");
                }
            }
        })
    }
    function updateuser() {
        $.ajax({
            url: "updateuser.action",
            data: $("#updateuser").serialize(),
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result) {
                    window.location.href = "usermanagement.jsp";
                }
                else {
                    alert("更新失败！");
                }
            }
        })
    }
    function edituser(id,
                      username,
                      password,
                      address,
                      phone,
                      mail,
                      userrolesId,
                      userstatesId) {
        $("#updateuserid").val(id);
        $("#username").val(username);
        $("#address").val(address);
        $("#phone").val(phone);
        $("#mail").val(mail);
        $("#userrolesId").val(userrolesId);
        $("#userstatesId").val(userstatesId);
        $('#edit').modal('show');
    }
    function EnterPress(e) { //传入 event
        var e = e || window.event;
        if (e.keyCode == 13) {
            var value = $("#btn-input").val();
            $.ajax({
                url: "selectuser.action",
                data: {selectusername: value},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result) {
                        location.href = "usermanagement.jsp";
                    }
                    else {
                        $('#nofindbook').modal('show');
                    }
                }
            })
        }
    }

    function sousuo() {
        var value = $("#btn-input").val();
        $.ajax({
            url: "selectuser.action",
            data: {selectusername: value},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result) {
                    location.href = "usermanagement.jsp";
                }
                else {
                    $('#nofindbook').modal('show');
                }
            }
        })
    }
    function nextpage() {
        var totalpagenumber = $("#totalpagenumber").text();
        var value = $("#btn-input").val();
        var currentpage = $("#numberpage").text();
        var c = Number(currentpage) + Number(1);
        if (Number(totalpagenumber) == Number(currentpage)) {
            $('#alertlastpage').modal('show');
        }
        else {
            $.ajax({
                url: "userindexpage.action",
                data: {selectusername: value, index: c},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result) {
                        location.href = "usermanagement.jsp";
                    }
                    else {

                    }
                }
            })
        }
    }
    function toppage() {
        var value = $("#btn-input").val();
        var currentpage = $("#numberpage").text();
        var c = Number(currentpage) - Number(1);
        if (currentpage == 1) {
            $('#alerttoppage').modal('show');
        }
        else {
            $.ajax({
                url: "userindexpage.action",
                data: {title: value, index: c},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result) {
                        location.href = "usermanagement.jsp";
                    }
                    else {

                    }
                }
            })
        }
    }
    function firstpage() {
        var value = $("#btn-input").val();
        $.ajax({
            url: "userindexpage.action",
            data: {username: value, index: 1},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result) {
                    location.href = "usermanagement.jsp";
                }
                else {

                }
            }
        })
    }
    function lastpage() {
        var value = $("#btn-input").val();
        var totalpagenumber = $("#totalpagenumber").text();
        $.ajax({
            url: "userindexpage.action",
            data: {username: value, index: totalpagenumber},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result) {
                    location.href = "usermanagement.jsp";
                }
                else {

                }
            }
        })
    }
    function positionpage() {
        var value = $("#btn-input").val();
        var page = $("#page").val();
        if (page.length != 0) {

            $.ajax({
                url: "userindexpage.action",
                data: {username: value, index: page},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result) {
                        location.href = "usermanagement.jsp";
                    }
                    else {

                    }
                }
            })
        }
    }
    function selchange() {
        var sel = document.getElementById('sel');
        alert(sel.options[sel.selectedIndex].text);
        alert(sel.options[sel.selectedIndex].value);
    }

    $(document).ready(function () {
        $("#addbookbutton").click(function () {

            $.ajax({
                url: "adduser.action",
                data: $("#adduserform").serialize(),
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result) {
                        $("#imageform").submit();
                        window.location.href = "usermanagement.jsp";
                    }
                    else {
                        alert("添加失败！");
                    }
                }
            })
        });
    });
</script>
</body>

</html>
