<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">
    <#include "/common/common.ftl">
    <title>主页</title>
    <!--icheck-->
    <link href="${basePath}/js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
    <link href="${basePath}/js/iCheck/skins/square/square.css" rel="stylesheet">
    <link href="${basePath}/js/iCheck/skins/square/red.css" rel="stylesheet">
    <link href="${basePath}/js/iCheck/skins/square/blue.css" rel="stylesheet">
    
    <!--Morris Chart CSS -->
    <link rel="stylesheet" href="${basePath}/js/morris-chart/morris.css">
    
    <!--dashboard calendar-->
    <link href="${basePath}/css/clndr.css" rel="stylesheet">

    <link href="${basePath}/css/style.css" rel="stylesheet">
    <link href="${basePath}/css/style-responsive.css" rel="stylesheet">
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${basePath}/js/html5shiv.js"></script>
    <script src="${basePath}/js/respond.min.js"></script>
    <![endif]-->
</head>

<body style="background:white;">
    <div class="wrapper">
            <div class="row">
                <div class="col-md-6">
                    <!--statistics start-->
                    <div class="row state-overview">
                        <div class="col-md-6 col-xs-12 col-sm-6">
                            <div class="panel purple">
                                <div class="symbol">
                                    <i class="fa fa-gavel"></i>
                                </div>
                                <div class="state-value">
                                    <div class="value">${home.total}</div>
                                    <div class="title">订单总数</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 col-sm-6">
                            <div class="panel red">
                                <div class="symbol">
                                    <i class="fa fa-tags"></i>
                                </div>
                                <div class="state-value">
                                    <div class="value">${home.saleCount}</div>
                                    <div class="title">出售商品总数</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row state-overview">
                        <div class="col-md-6 col-xs-12 col-sm-6">
                            <div class="panel blue">
                                <div class="symbol">
                                    <i class="fa fa-money"></i>
                                </div>
                                <div class="state-value">
                                    <div class="value">${home.totalPrice}</div>
                                    <div class="title">总销售额</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 col-sm-6">
                            <div class="panel green">
                                <div class="symbol">
                                    <i class="fa fa-eye"></i>
                                </div>
                                <div class="state-value">
                                    <div class="value">${home.onLineCount}</div>
                                    <div class="title">上架商品种类</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--statistics end-->
                </div>
                <div class="col-md-6">
                    <!--more statistics box start-->
                    <div class="panel deep-purple-box">
                        <div class="panel-body" style="padding:0;">
                            <table class="table" style="margin-bottom:0;">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>商品名称</th>
                                        <th>销售数量</th>
                                        <th>销售金额</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <#if productList?exists>
                                        <#list productList as product>
                                            <tr>
                                                <td>${product_index+1}</td>
                                                <td>${product.productName}</td>
                                                <td>${product.num}</td>
                                                <td>${product.price}</td>
                                            </tr>
                                        </#list>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--more statistics box end-->
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-body">
                            <div class="row revenue-states">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <h4>近15日销售走势</h4>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                
                                    <div class="clearfix">
                                        <div id="main-chart-legend" class="pull-right">
                                            <table style="font-size:smaller;color:#545454">
                                                <tbody>
                                                    <tr>
                                                        <td class="legendColorBox">
                                                            <div style="border:1px solid #000000;padding:1px">
                                                                <div style="width:4px;height:0;border:5px solid rgb(90,188,223);overflow:hidden"></div>
                                                            </div>
                                                        </td>
                                                        <td class="legendLabel">销量</td>
                                                        <td class="legendColorBox">
                                                            <div style="border:1px solid #000000;padding:1px">
                                                                <div style="width:4px;height:0;border:5px solid rgb(255,134,115);overflow:hidden"></div>
                                                            </div>
                                                        </td>
                                                        <td class="legendLabel">销售额</td>
                                                     </tr>
                                                </tbody>
                                            </table>
                                          </div>
                                    </div>

                                    <div id="main-chart">
                                        <div id="main-chart-container" class="main-chart" style="padding: 0px; position: relative;">
                                        </div>
                                    </div>
                                    
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>

        </div>
    
<!-- Placed js at the end of the document so the pages load faster -->
<script src="${basePath}/js/jquery-1.10.2.min.js"></script>
<script src="${basePath}/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${basePath}/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${basePath}/js/bootstrap.min.js"></script>
<script src="${basePath}/js/modernizr.min.js"></script>
<script src="${basePath}/js/jquery.nicescroll.js"></script>

<!--easy pie chart-->
<script src="${basePath}/js/easypiechart/jquery.easypiechart.js"></script>
<script src="${basePath}/js/easypiechart/easypiechart-init.js"></script>

<!--Sparkline Chart-->
<script src="${basePath}/js/sparkline/jquery.sparkline.js"></script>
<script src="${basePath}/js/sparkline/sparkline-init.js"></script>

<!--icheck -->
<script src="${basePath}/js/iCheck/jquery.icheck.js"></script>
<script src="${basePath}/js/icheck-init.js"></script>

<!-- jQuery Flot Chart-->
<script src="${basePath}/js/flot-chart/jquery.flot.js"></script>
<script src="${basePath}/js/flot-chart/jquery.flot.tooltip.js"></script>
<script src="${basePath}/js/flot-chart/jquery.flot.resize.js"></script>


<!--Morris Chart-->
<script src="${basePath}/js/morris-chart/morris.js"></script>
<script src="${basePath}/js/morris-chart/raphael-min.js"></script>

<!--common scripts for all pages-->
<script src="${basePath}/js/scripts.js"></script>

<script type="text/javascript">

$(function() {
    var d1 = new Array();
    var d2 = new Array();
    var ticks = new Array();
    <#if chartList?exists>
       <#list chartList as chart>
           var num = [${chart_index},${chart.num}];
           var price = [${chart_index},${chart.price?string('#.##')}];
           var date = [${chart_index},'${chart.date}'];
           d1[${chart_index}] = num;
           d2[${chart_index}] = price;
           ticks[${chart_index}] = date;
       </#list>
    </#if>

    var data = ([{
        label: "订单笔数",
        data: d1,
        lines: {
            show: true,
            fill: true,
            fillColor: {
                colors: ["rgba(255,255,255,.4)", "rgba(183,236,240,.4)"]
            }
        }
    },
        {
            label: "销售金额",
            data: d2,
            lines: {
                show: true,
                fill: true,
                fillColor: {
                    colors: ["rgba(255,255,255,.0)", "rgba(253,96,91,.7)"]
                }
            }
        }
    ]);

    var options = {
        xaxis: {
                ticks: ticks
            },
        grid: {
            backgroundColor:
            {
                colors: ["#ffffff", "#f4f4f6"]
            },
            hoverable: true,
            clickable: true,
            tickColor: "#eeeeee",
            borderWidth: 1,
            borderColor: "#eeeeee"
        },
        // Tooltip
        tooltip: true,
        tooltipOpts: {
            content: "%s : %y",
            shifts: {
                x: -60,
                y: 25
            },
            defaultTheme: false
        },
        legend: {
            labelBoxBorderColor: "#000000",
            container: $("#main-chart-legend"), //remove to show in the chart
            noColumns: 0
        },
        series: {
            stack: true,
            shadowSize: 0,
            highlightColor: 'rgba(000,000,000,.2)'
        },
//        lines: {
//            show: true,
//            fill: true
//
//        },
        points: {
            show: true,
            radius: 3,
            symbol: "circle"
        },
        colors: ["#5abcdf", "#ff8673"]
    };
    var plot = $.plot($("#main-chart #main-chart-container"), data, options);
});
</script>
</body>
</html>