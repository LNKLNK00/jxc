<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">
    <#include "/common/common.ftl">
    <title>登录</title>

    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-body">

<div class="container">

    <form class="form-signin" action="${basePath}/toLogin.html" method="POST">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">芦洲兽药管理系统</h1>
            <img src="images/login-logo.png"/>
        </div>
        
        <div class="login-wrap">
            <input type="text" name="username" id="username" class="form-control" placeholder="用户名" autofocus>
            <input type="password" name="password" id="password" class="form-control" placeholder="密码">
            <button class="btn btn-lg btn-login btn-block" type="submit">
                <i class="fa fa-check"></i>
            </button>
        </div>
        <div classs="col-md-12" id="msg" style="color: #a94442;height:20px;height:30px;text-align:center;">
            <#if error_message?exists>${error_message}</#if>
        </div>
    </form>

</div>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script type="text/javascript">
    $(".btn-login").on("click",function(){
        if($("#username").val()==''||$("#password").val()==''){
            $("#msg").html("用户名、密码不能为空！");
            return false;
        }
        return true;
    });
</script>
</body>
</html>