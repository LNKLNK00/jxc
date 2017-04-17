<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="keywords" content="admin, dashboard, bootstrap, template, flat, modern, theme, responsive, fluid, retina, backend, html5, css, css3">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">
  <#include "/common/common.ftl">
  <title>芦洲兽药管理系统</title>

  <!--icheck-->
  <link href="js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
  <link href="js/iCheck/skins/square/square.css" rel="stylesheet">
  <link href="js/iCheck/skins/square/red.css" rel="stylesheet">
  <link href="js/iCheck/skins/square/blue.css" rel="stylesheet">

  <!--dashboard calendar-->
  <link href="css/clndr.css" rel="stylesheet">

  <!--Morris Chart CSS -->
  <link rel="stylesheet" href="js/morris-chart/morris.css">

  <!--common-->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">




  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="sticky-header">

<section>
    <!-- left side start-->
    <div class="left-side sticky-left-side">

        <!--logo and iconic logo start-->
        <div class="logo">
            <a href="index.html"><img src="images/logo.png" alt=""></a>
        </div>

        <div class="logo-icon text-center">
            <a href="index.html"><img src="images/logo_icon.png" alt=""></a>
        </div>
        <!--logo and iconic logo end-->

        <div class="left-side-inner">

            <!--sidebar nav start-->
            <ul class="nav nav-pills nav-stacked custom-nav">
                <li id="menu-1" url="${basePath}/home.html"><a><i class="fa fa-home"></i> <span>主页</span></a></li>
                <li id="menu-2" url="${basePath}/product/index.html"><a><i class="fa fa-tasks"></i> <span>商品管理</span></a></li>
                <li id="menu-3" url="${basePath}/stock/index.html"><a><i class="fa fa-truck"></i> <span>库存管理</span></a></li>
                <li id="menu-4" url="${basePath}/order/index.html"><a><i class="fa fa-shopping-cart"></i> <span>销售管理</span></a></li>
                <li id="menu-5" url="${basePath}/report/index.html"><a><i class="fa fa-bar-chart-o"></i> <span>销售报表</span></a></li>
            </ul>
            <!--sidebar nav end-->

        </div>
    </div>
    <!-- left side end-->
    
    <!-- main content start-->
    <div class="main-content" style="min-height:100%;height:100%;">

        <!-- header section start-->
        <div class="header-section">

            <!--toggle button start-->
            <a class="toggle-btn"><i class="fa fa-bars"></i></a>
            <!--toggle button end-->

            <!--notification menu start -->
            <div class="menu-right">
                <ul class="notification-menu">
                    <li>
                        <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <img src="images/avatar-mini.jpg" alt="" />
                            ${USERINFO.username}
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                            <li><a href="${basePath}/logout.html"><i class="fa fa-sign-out"></i> 退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
	        <section class="panel">
	           <header class="panel-heading custom-tab" id="panel-heading">
	               <ul class="nav nav-tabs">
	                   <li id="title-1" onclick="changeTab(this);" class="active"><a href="#home-1" data-toggle="tab">主页</a></li>
	               </ul>
	           </header>
	           <div class="panel-body">
	               <div class="tab-content">
	                   <div class="tab-pane active" id="home-1">
                            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${basePath}/home.html" frameborder="0" data-id="" seamless></iframe>
	                   </div>
	               </div>
	           </div>
	       </section>
            <!--notification menu end -->

        </div>
        <!-- header section end-->
        
    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>

<!--common scripts for all pages-->
<script src="js/scripts.js"></script>
<script type="text/javascript">
    initIframe();
	window.onresize=function(){ 
		initIframe();
	} 
	
	$(".toggle-btn").click(function(){
		initIframe();
	});
    
	$(".custom-nav li").click(function(){
		var id = $(this).attr("id").replace("menu-","");
		if($("#title-"+id).length>0){
			$("#title-"+id).addClass("active").siblings().removeClass("active");
			$("#home-"+id).addClass("active").siblings().removeClass("active");
		}else{
			var title = $(this).find("span").text();
			var url = $(this).attr("url");
			var title = $("<li id='title-"+id+"'><a href='#home-"+id+"' data-toggle='tab'>"+title+" <i onclick='removeTab(this);' class='fa fa-times-circle'></i></a></li>");
			$(".nav-tabs").append(title);
			var home = $(".tab-content").html() + "<div class='tab-pane' id='home-"+id+"'><iframe class='J_iframe' name='iframe0' width='100%' height='100%' src='"+url+"' frameborder='0' data-id='' seamless></iframe></div>";
			$(".tab-content").html(home);
			initIframe();
			$("#title-"+id).addClass("active").siblings().removeClass("active");
			$("#home-"+id).addClass("active").siblings().removeClass("active");
		}
	});
	
	function removeTab(obj){
		$(obj).parent().parent().remove();
		var id = $(obj).parent().parent().attr("id").replace("title-","");
		$("#home-"+id).remove();
		$("#title-" + 1).addClass("active").siblings().removeClass("active");
        $("#home-" + 1).addClass("active").siblings().removeClass("active");
    }
	
	function initIframe(){
		$(".J_iframe").css("height",$(window).height()-50);
        $(".J_iframe").css("width",$(window).width()-$(".left-side").width());
	}
</script>
</body>
</html>
