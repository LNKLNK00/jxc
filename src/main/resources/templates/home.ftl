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
                                    <div class="value">230</div>
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
                                    <div class="value">3490</div>
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
                                    <div class="value">22014</div>
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
                                    <div class="value">390</div>
                                    <div class="title">上架商品总数</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--statistics end-->
                </div>
                <div class="col-md-6">
                    <!--more statistics box start-->
                    <div class="panel deep-purple-box">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-7 col-sm-7 col-xs-7">
                                    <div id="graph-donut" class="revenue-graph"><svg height="220" version="1.1" width="443" xmlns="http://www.w3.org/2000/svg" style="overflow: hidden; position: relative;"><desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.1.2</desc><defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs><path fill="none" stroke="#4acacb" d="M221.5,176.66666666666669A66.66666666666667,66.66666666666667,0,0,0,263.07879551323236,57.88811835950217" stroke-width="2" opacity="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path><path fill="#4acacb" stroke="none" d="M221.5,179.66666666666669A69.66666666666667,69.66666666666667,0,0,0,264.9498413113278,55.54308368567977L280.7497836063561,35.7405686622906A95,95,0,0,1,221.5,205Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><path fill="none" stroke="#6a8bc0" d="M263.07879551323236,57.88811835950217A66.66666666666667,66.66666666666667,0,0,0,159.45101113025743,85.6203481426209" stroke-width="2" opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1;"></path><path fill="#6a8bc0" stroke="none" d="M264.9498413113278,55.54308368567977A69.66666666666667,69.66666666666667,0,0,0,156.65880663111903,84.52326380903884L128.42651669538617,73.43052221393134A100,100,0,0,1,283.8681932698485,31.832177539253266Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><path fill="none" stroke="#5ab6df" d="M159.45101113025743,85.6203481426209A66.66666666666667,66.66666666666667,0,0,0,179.91301928453285,162.10534981569367" stroke-width="2" opacity="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path><path fill="#5ab6df" stroke="none" d="M156.65880663111903,84.52326380903884A69.66666666666667,69.66666666666667,0,0,0,178.0416051523368,164.45009055739988L162.2385524804593,184.25012348736345A95,95,0,0,1,133.08019086061685,75.25899610323478Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><path fill="none" stroke="#fe8676" d="M179.91301928453285,162.10534981569367A66.66666666666667,66.66666666666667,0,0,0,221.47905604932066,176.66666337679857" stroke-width="2" opacity="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path><path fill="#fe8676" stroke="none" d="M178.0416051523368,164.45009055739988A69.66666666666667,69.66666666666667,0,0,0,221.4781135715401,179.6666632287545L221.47015487028193,204.99999531193794A95,95,0,0,1,162.2385524804593,184.25012348736345Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="221.5" y="100" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: 800; font-stretch: normal; font-size: 15px; line-height: normal; font-family: Arial;" font-size="15px" font-weight="800" transform="matrix(1.1009,0,0,1.1009,-22.3532,-11.2018)" stroke-width="0.9083333333333333"><tspan dy="6" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Unique Visits</tspan></text><text x="221.5" y="120" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 14px; line-height: normal; font-family: Arial;" font-size="14px" transform="matrix(1.3889,0,0,1.3889,-86.1389,-43.5556)" stroke-width="0.7199999999999999"><tspan dy="5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">approx. 15%</tspan></text></svg></div>

                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-5">
                                    <ul class="bar-legend">
                                        <li><span class="blue"></span> Open rate</li>
                                        <li><span class="green"></span> Click rate</li>
                                        <li><span class="purple"></span> Share rate</li>
                                        <li><span class="red"></span> Unsubscribed rate</li>
                                    </ul>
                                </div>
                            </div>
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
                                    <h4>销售图表</h4>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="clearfix">
                                        <div id="main-chart-legend" class="pull-right"><table style="font-size:smaller;color:#545454"><tbody><tr><td class="legendColorBox"><div style="border:1px solid #000000;padding:1px"><div style="width:4px;height:0;border:5px solid rgb(90,188,223);overflow:hidden"></div></div></td><td class="legendLabel">销量</td><td class="legendColorBox"><div style="border:1px solid #000000;padding:1px"><div style="width:4px;height:0;border:5px solid rgb(255,134,115);overflow:hidden"></div></div></td><td class="legendLabel">销售额</td></tr></tbody></table></div>
                                    </div>

                                    <div id="main-chart">
                                        <div id="main-chart-container" class="main-chart" style="padding: 0px; position: relative;">
                                        <canvas class="flot-base" width="1060" height="300" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 1060px; height: 300px;"></canvas><div class="flot-text" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);"><div class="flot-x-axis flot-x1-axis xAxis x1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 96px; top: 279px; left: 21px; text-align: center;">0</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 96px; top: 279px; left: 124px; text-align: center;">1</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 96px; top: 279px; left: 227px; text-align: center;">2</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 96px; top: 279px; left: 329px; text-align: center;">3</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 96px; top: 279px; left: 432px; text-align: center;">4</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 96px; top: 279px; left: 535px; text-align: center;">5</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 96px; top: 279px; left: 638px; text-align: center;">6</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 96px; top: 279px; left: 741px; text-align: center;">7</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 96px; top: 279px; left: 843px; text-align: center;">8</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 96px; top: 279px; left: 946px; text-align: center;">9</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 96px; top: 279px; left: 1046px; text-align: center;">10</div></div><div class="flot-y-axis flot-y1-axis yAxis y1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div class="flot-tick-label tickLabel" style="position: absolute; top: 264px; left: 13px; text-align: right;">0</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 231px; left: 1px; text-align: right;">100</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 198px; left: 1px; text-align: right;">200</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 165px; left: 1px; text-align: right;">300</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 132px; left: 1px; text-align: right;">400</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 99px; left: 1px; text-align: right;">500</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 66px; left: 1px; text-align: right;">600</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 33px; left: 1px; text-align: right;">700</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 0px; left: 1px; text-align: right;">800</div></div></div><canvas class="flot-overlay" width="1060" height="300" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 1060px; height: 300px;"></canvas></div>
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

<!--Calendar-->
<script src="${basePath}/js/calendar/clndr.js"></script>
<script src="${basePath}/js/calendar/evnt.calendar.init.js"></script>
<script src="${basePath}/js/calendar/moment-2.2.1.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>

<!--common scripts for all pages-->
<script src="${basePath}/js/scripts.js"></script>

<script type="text/javascript">
// Use Morris.Area instead of Morris.Line
Morris.Donut({
    element: 'graph-donut',
    data: [
        {value: 40, label: 'New Visit', formatted: 'at least 70%' },
        {value: 30, label: 'Unique Visits', formatted: 'approx. 15%' },
        {value: 20, label: 'Bounce Rate', formatted: 'approx. 10%' },
        {value: 10, label: 'Up Time', formatted: 'at most 99.99%' }
    ],
    backgroundColor: false,
    labelColor: '#fff',
    colors: [
        '#4acacb','#6a8bc0','#5ab6df','#fe8676'
    ],
    formatter: function (x, data) { return data.formatted; }
});


$(function() {

    var d1 = [
        [0, 501],
        [1, 620],
        [2, 437],
        [3, 361],
        [4, 549],
        [5, 618],
        [6, 570],
        [7, 758],
        [8, 658],
        [9, 538],
        [10, 488]

    ];
    var d2 = [
        [0, 401],
        [1, 520],
        [2, 337],
        [3, 261],
        [4, 449],
        [5, 518],
        [6, 470],
        [7, 658],
        [8, 558],
        [9, 438],
        [10, 388]
    ];

    var data = ([{
        label: "销量",
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
            label: "销售额",
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
            content: "%s X: %x Y: %y",
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