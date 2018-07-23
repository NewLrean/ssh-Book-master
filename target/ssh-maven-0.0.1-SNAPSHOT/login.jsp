<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>图书后台管理系统</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="css/daterangepicker.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div class="row" style="margin-top: 10%">
    <div class="col-xs-8 col-xs-offset-1 col-sm-2 col-sm-offset-2 col-md-4 col-md-offset-4"
         style="width: 25%;margin-left: 37%">
        <div class="login-panel panel panel-default">
            <div class="panel-heading">图书后台管理系统</div>
            <div class="panel-body">
                <form role="form" method="post" id="userform">
                    <fieldset>
                        <div class="form-group">
                            <input class="form-control" placeholder="用户名" id="username" name="username" type="username"
                                   autofocus="">
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="密码" id="password" name="password" type="password"
                                  onkeydown="EnterPress()">
                        </div>
                        <span id="txtid"></span><br>
                        <input type="button" id="submit" value="登录" class="btn btn-primary"/>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModaldelete" style="margin-top: 10%" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabeldelete" aria-hidden="true">
    <div class="modal-dialog" style="width:400px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabeldelete">
                    登录错误
                </h4>
            </div>
            <div class="modal-body" style="color: #000">
                <span>您的密码或用户名错误，请重新登录！</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">
                    <a href="#" style="text-decoration: none; color: #fff">确定</a>
                </button>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/chart.min.js"></script>
<script src="js/chart-data.js"></script>
<script src="js/easypiechart.js"></script>
<script src="js/easypiechart-data.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script>
    $(function () {
        $("#submit").click(function () {
            var value = $("#username").val();
            var value1 = $("#password").val();
            $.ajax({
                url: "validation.action",
                data: {username: value, password: value1},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result) {
                        location.href = "index.jsp";
                    }
                    else {
                        $('#myModaldelete').modal('show');
                    }
                }
            })
        })

    });
    function EnterPress(e) { //传入 event
        var e = e || window.event;
        if (e.keyCode == 13) {
            var value = $("#username").val();
            var value1 = $("#password").val();
            $.ajax({
                url: "validation.action",
                data: $("#userform").serialize(),
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result) {
                        location.href = "index.jsp";
                    }
                    else {
                        $('#myModaldelete').modal('show');
                    }
                }
            })
        }
    }
</script>
</body>

</html>
