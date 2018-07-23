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
                <a class="navbar-brand" href="index.jsp"><span>图书后台管理系统</span></a>
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
            <li class="parent active">
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
            <li><a href="allusers.action"><span class="glyphicon glyphicon-dashboard"></span>用户管理</a></li>
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
                <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
                <li class="active">图书管理</li>
            </ol>
        </div><!--/.row-->
    </div>

    <div class="input-group" style="width: 500px;margin-left: 38%;margin-top: 70px;">

        <input onkeydown="EnterPress()" id="btn-input" type="text"
               style="height: 40px" class="form-control input-md"
               value="<c:if test="${sessionScope.title!=null }">${sessionScope.title}</c:if>" placeholder="输入你要搜索的书籍"/>
        <span class="input-group-btn">
								<button onclick="sousuo()" style="height: 40px" class="btn btn-primary btn-md"
                                        id="btn-todo">搜索</button>
        </span>
    </div>

    <div class="col-sm-offset-2">
        <div class="col-lg-12">
            <button type="button" style="margin-left: 30px" class="btn btn-primary" data-toggle="modal"
                    data-target="#addbook">添加图书
            </button>
            <c:if test="${sessionScope.books!=null }">
                <table class="" id="box-table-a" summary="Employee Pay Sheet">
                    <thead>
                    <tr>
                        <th width="30%"><input type="checkbox" id="inlineCheckbox2" value="option1">书名</th>
                        <th width="10%"></th>
                        <th width="10%">作者</th>
                        <th width="10%">删除</th>
                    </tr>
                    <c:forEach items="${sessionScope.books}" var="b">
                    <tr>
                        <td><label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox1" value="option1"> ${b.title }
                        </label></td>
                        <td><img style="width: 20px;height: 20px" src="image/bianji.png"
                                 onclick="editbook(
                                         '${b.id}',
                                         '${b.title}',
                                         '${b.author}',
                                         '${b.publisherId}',
                                         '${b.categoryId}',
                                         '${b.publishDate}',
                                         '${b.isbn}',
                                         '${b.wordsCount}',
                                         '${b.unitPrice}',
                                         '${b.contentDescription}',
                                         '${b.aurhorDescription}',
                                         '${b.editorComment}',
                                         '${b.toc}',
                                         '${b.clicks}',
                                         '${b.wwwimage}',
                                         '${b.quantity}')"/>
                        </td>
                        <td><span>${b.author}</span></td>
                        <td>
                            <!-- 按钮触发模态框 -->
                            <button type="button" style="width: 60px;height: 30px" class="btn btn-primary"
                                    onclick="detials('${b.title}','${b.id}')">删除
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
            <a href="#" style="color: #fff;text-decoration: none">删除</a></button>
        <button type="button" onclick="firstpage()" class="btn btn-primary">
            <a href="#" style="text-decoration: none; color: #fff">首页</a>
        </button>
        <button type="button" class="btn btn-primary" onclick="toppage()">
            <a href="#" style="text-decoration: none; color: #fff">&lt;上一页</a>
        </button>

        <span>&nbsp;当前第&nbsp;<span id="numberpage"><c:if
                test="${sessionScope.currentpage!=null }">${sessionScope.currentpage}</c:if></span>&nbsp;页&nbsp;</span>
        <button type="button" class="btn btn-primary" onclick="nextpage()">
            <a href="#" style="text-decoration: none; color: #fff">下一页&gt;</a>
        </button>
        <button type="button" class="btn btn-primary" onclick="lastpage()">
            尾页
        </button>
        <c:if test="${sessionScope.pagenumber!=null }">
            <span>共<span id="totalpagenumber">${sessionScope.pagenumber}</span>页，到第</span>
        </c:if>
        <input id="page" type="text" value="" style="width: 30px"><span>页</span>
        <button type="button" class="btn btn-primary" onclick="positionpage()">
            <a href="#" style="text-decoration: none; color: #fff">确定</a>
        </button>
    </div>
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="addbook" tabindex="-1" role="dialog" style=""
         aria-labelledby="addmyModaledit" aria-hidden="true">
        <div class="modal-dialog" style="width: 800px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="addmyModaledit">
                        添加图书
                    </h4>
                </div>
                <form method="post" id="addbookform">
                    <div class="modal-body" style="color: #30a5ff">
                        <span><strong> 图书名字：</strong></span><br>
                        <input type="text" id="addtitle" name="title"
                               class="form-control"
                        ><br>
                        <span><strong> 图书作者：</strong></span>
                        <input type="text" name="author" class="form-control" id="addauthor"><br>
                        <span><strong> 出版日期：</strong></span>
                        <input type="text" class="form-control" name="publishDate" id="addpublishDate"><br>
                        <span><strong> 图书isbn：</strong> </span> <input type="text"
                                                                       name="isbn" class="form-control"
                                                                       id="addisbn"><br>
                        <span> <strong>图书字数：</strong></span> <input type="text"
                                                                    name="wordsCount" class="form-control"
                                                                    id="addwordsCount"><br>
                        <span><strong> 图书单价：</strong></span> <input type="text"
                                                                    class="form-control"
                                                                    name="unitPrice" id="addunitPrice"><br>
                        <span><strong> 图书种类：</strong></span> <input type="text"
                                                                    class="form-control" name="CategoryId"
                                                                    id="addCategoryId"><br>
                        <span><strong> 出版社：</strong></span> <input type="text"
                                                                   class="form-control" name="PublisherId"
                                                                   id="addPublisherId"><br>
                        <span><strong> 图书介绍：</strong></span> <textarea
                            style="height: 200px" name="contentDescription"
                            class="form-control" id="addcontentDescription"></textarea>
                        <span><strong> 作者介绍：</strong></span> <textarea
                            style="height: 100px" name="aurhorDescription"
                            class="form-control" id="addaurhorDescription"></textarea>
                        <span><strong>编辑评论：</strong> </span> <textarea
                            style="height: 100px" name="editorComment"
                            class="form-control" id="addeditorComment"></textarea>
                        <span><strong>图书内容： </strong></span> <textarea
                            style="height: 100px" name="toc"
                            class="form-control" id="addtoc"></textarea>
                        <span> <strong>单击量：</strong></span> <input type="text"
                                                                   name="clicks" class="form-control"
                                                                   id="addclicks"><br>

                        <span><strong>库存：</strong> </span> <input type="text"
                                                                  name="quantity" class="form-control"
                                                                  id="addquantity"><br>
                        <span><strong>图片地址：</strong> </span><br>

                        <span id="wwwimage" name="wwwimage"></span> <br>
                    </div>
                </form>

                <span><strong>添加图片：</strong></span>
                <div>
                    <form id="imageform" action="upload.action" method="post" enctype="multipart/form-data">


                        <input type="file" name="upload" id="addxdaTanFileImg" accept="image/*"
                               onchange="addxmTanUploadImg(this)">
                    </form>
                    <img id="addxmTanImg" style="width: 200px;"/>
                    <div id="addxmTanDiv"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消
                    </button>
                    <button id="addbookbutton" type="button" class="btn btn-primary" data-dismiss="modal">
                        <a href="#" style="color: #fff">添加</a>
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
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
                        编辑图书
                    </h4>
                </div>
                <form id="updatebook" method="post">
                    <div class="modal-body" style="color: #30a5ff">
                        <span><strong> 图书id：</strong></span><br>
                        <input id="updatebookid" readonly="true" type="text" style="color: #000;border:0;"
                               name="id"></input><br>
                        <span><strong> 图书名字：</strong></span><br>
                        <input type="text" id="title" name="title"
                               class="form-control"
                        ><br>
                        <span><strong> 图书作者：</strong></span>
                        <input type="text" class="form-control" id="author" name="author"><br>
                        <span><strong> 出版日期：</strong></span> <input type="text"
                                                                    name="publishDate" class="form-control"
                                                                    id="publishDate"><br>
                        <span><strong> 图书isbn：</strong> </span> <input type="text"
                                                                       name="isbn" class="form-control"
                                                                       id="isbn"><br>
                        <span> <strong>图书字数：</strong></span> <input type="text"
                                                                    name="wordsCount" class="form-control"
                                                                    id="wordsCount"><br>
                        <span><strong> 图书单价：</strong></span> <input type="text"
                                                                    class="form-control"
                                                                    name="unitPrice" id="unitPrice"><br>
                        <span><strong> 图书种类：</strong></span> <input type="text"
                                                                    class="form-control" name="categoryId"
                                                                    id="CategoryId"><br>
                        <span><strong> 出版社：</strong></span> <input type="text"
                                                                   class="form-control" name="publisherId"
                                                                   id="PublisherId"><br>
                        <span><strong> 图书介绍：</strong></span> <textarea
                            style="height: 200px" name="contentDescription"
                            class="form-control" id="contentDescription"></textarea>
                        <span><strong> 作者介绍：</strong></span> <textarea
                            style="height: 100px" name="aurhorDescription"
                            class="form-control" id="aurhorDescription"></textarea>
                        <span><strong>编辑评论：</strong> </span> <textarea
                            style="height: 100px" name="editorComment"
                            class="form-control" id="editorComment"></textarea>
                        <span><strong>图书内容： </strong></span> <textarea
                            style="height: 100px" name="toc"
                            class="form-control" id="toc"></textarea>
                        <span> <strong>单击量：</strong></span> <input type="text"
                                                                   class="form-control"
                                                                   name="clicks" id="clicks"><br>
                        <span><strong>库存：</strong> </span> <input type="text"
                                                                  class="form-control"
                                                                  name="quantity" id="quantity"><br>
                        <span><strong>图片地址：</strong> </span><br>

                        <span id="updatewwwimage" name="wwwimage"></span> <br>
                        <span><strong>修改图片：</strong></span>
                    </div>
                </form>
                <form>
                    <div>
                        <p><input type="file" id="xdaTanFileImg" name="upload"
                                  onchange="xmTanUploadImg(this)" accept="image/*"/>
                        </p>
                        <img id="xmTanImg" style="width: 200px;"/>
                        <div id="xmTanDiv"></div>
                    </div>
                </form>

                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button onclick="updatebook()" type="button" class="btn btn-primary" data-dismiss="modal">
                        提交修改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>

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
                    <span id="bookid"></span>
                    <span id="bookname">确认删除这本书吗？</span></div>
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
    <div style="position:absolute;left:40%;height: 10%; top:130%;" align="center"><a
            style="text-decoration: none;color:#01699F;" href="http://www.miitbeian.gov.cn/">©2016-2017 版权所有
        蜀ICP备16036548号</a></div>
</c:if>

<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/chart.min.js"></script>
<script src="js/chart-data.js"></script>
<script src="js/easypiechart.js"></script>
<script src="js/easypiechart-data.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script type="text/javascript">

    //判断浏览器是否支持FileReader接口
    if (typeof FileReader == 'undefined') {
        document.getElementById("xmTanDiv").InnerHTML = "<h1>当前浏览器不支持FileReader接口</h1>";
        //使选择控件不可操作
        document.getElementById("xdaTanFileImg").setAttribute("disabled", "disabled");
    }

    //选择图片，马上预览
    function xmTanUploadImg(obj) {
        var imgname = $("#addxdaTanFileImg").val();
        var n = imgname.substr(12, imgname.length);
        alert(imgname);
        $("#updatewwwimage").text("https://www.jzp.com/img/" + n);
        var file = obj.files[0];

        console.log(obj);
        console.log(file);
        console.log("file.size = " + file.size);  //file.size 单位为byte

        var reader = new FileReader();

        //读取文件过程方法
        reader.onloadstart = function (e) {
            console.log("开始读取....");
        }
        reader.onprogress = function (e) {
            console.log("正在读取中....");
        }
        reader.onabort = function (e) {
            console.log("中断读取....");
        }
        reader.onerror = function (e) {
            console.log("读取异常....");
        }
        reader.onload = function (e) {
            console.log("成功读取....");

            var img = document.getElementById("xmTanImg");
            img.src = e.target.result;
            //或者 img.src = this.result;  //e.target == this
        }

        reader.readAsDataURL(file)
    };
    //选择图片，马上预览
    function addxmTanUploadImg(obj) {
        var imgname = $("#addxdaTanFileImg").val();
//        C:\fakepath\
        var n = imgname.substr(12, imgname.length);
        // alert(imgname);
        $("#wwwimage").text("https://www.jzp.com/img/" + n);
        var file = obj.files[0];

        console.log(obj);
        console.log(file);
        console.log("file.size = " + file.size);  //file.size 单位为byte

        var reader = new FileReader();

        //读取文件过程方法
        reader.onloadstart = function (e) {
            console.log("开始读取....");
        }
        reader.onprogress = function (e) {
            console.log("正在读取中....");
        }
        reader.onabort = function (e) {
            console.log("中断读取....");
        }
        reader.onerror = function (e) {
            console.log("读取异常....");
        }
        reader.onload = function (e) {
            console.log("成功读取....");

            var img = document.getElementById("addxmTanImg");
            img.src = e.target.result;
            //或者 img.src = this.result;  //e.target == this
        }

        reader.readAsDataURL(file)
    };
</script>
<script>

    !function ($) {
        $(document).on("click", "ul.nav li.parent > a > span.icon", function () {
            $(this).find('em:first').toggleClass("glyphicon-minus");
        });
        $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
    }(window.jQuery);

    $(window).on('resize', function () {
        if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
    })
    $(window).on('resize', function () {
        if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
    })

    function detials(title, id) {
        $("#bookname").text('确认删除' + title + '这本书吗？');
        $("#bookid").text(id);
        $('#myModal').modal('show');

    }
    function deletebook() {
        var bookid = $("#bookid").text();
        // alert(bookid);
        $.ajax({
            url: "deletebook.action",
            data: {id: bookid},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result) {
                    window.location.href = "index.jsp";
                }
                else {
                    alert("删除失败！");
                }
            }
        })
    }
    function updatebook() {
        $.ajax({
            url: "updatebook.action",
            data: $("#updatebook").serialize(),
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result) {
                    window.location.href = "index.jsp";
                }
                else {
                    alert("更新失败！");
                }
            }
        })
    }

    function editbook(id,
                      title,
                      author,
                      PublisherId,
                      CategoryId,
                      publishDate,
                      isbn,
                      wordsCount,
                      unitPrice,
                      contentDescription,
                      aurhorDescription,
                      editorComment,
                      toc,
                      clicks,
                      wwwimage,
                      quantity) {
        $("#updatebookid").val(id);
        $("#title").val(title);
        $("#author").val(author);
        $("#PublisherId").val(PublisherId);
        $("#CategoryId").val(CategoryId);
        $("#publishDate").val(publishDate);
        $("#isbn").val(isbn);
        $("#wordsCount").val(wordsCount);
        $("#unitPrice").val(unitPrice);
        $("#contentDescription").text(contentDescription);
        $("#aurhorDescription").text(aurhorDescription);
        $("#editorComment").text(editorComment);
        $("#toc").text(toc);
        $("#clicks").val(clicks);
        $("#updatewwwimage").text(wwwimage);
        $("#quantity").val(quantity);

        $('#edit').modal('show');
    }
    function EnterPress(e) { //传入 event
        var e = e || window.event;
        if (e.keyCode == 13) {
            var value = $("#btn-input").val();
            $.ajax({
                url: "selecttitle.action",
                data: {title: value},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result) {
                        location.href = "index.jsp";
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
            url: "selecttitle.action",
            data: {title: value},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result) {
                    location.href = "index.jsp";
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
                url: "indexpage.action",
                data: {title: value, index: c},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result) {
                        location.href = "index.jsp";
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
                url: "indexpage.action",
                data: {title: value, index: c},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result) {
                        location.href = "index.jsp";
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
            url: "indexpage.action",
            data: {title: value, index: 1},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result) {
                    location.href = "index.jsp";
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
            url: "indexpage.action",
            data: {title: value, index: totalpagenumber},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result) {
                    location.href = "index.jsp";
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
                url: "indexpage.action",
                data: {title: value, index: page},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result) {
                        location.href = "index.jsp";
                    }
                    else {

                    }
                }
            })
        }
    }


    $(document).ready(function () {
        $("#addbookbutton").click(function () {

            $.ajax({
                url: "addbook.action",
                data: $("#addbookform").serialize(),
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result) {
                        $("#imageform").submit();
                        window.location.href = "index.jsp";
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
