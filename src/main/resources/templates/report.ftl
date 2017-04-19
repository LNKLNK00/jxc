<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">
    <#include "/common/common.ftl">
    <title>销售报表</title>
    
    <!--dynamic table-->
    <link href="${basePath}/js/advanced-datatable/css/demo_page.css" rel="stylesheet" />
    <link href="${basePath}/js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
    <link rel="stylesheet" href="${basePath}/js/data-tables/DT_bootstrap.css" />
    
    <!--pickers css-->
    <link rel="stylesheet" type="text/css" href="${basePath}/js/bootstrap-datepicker/css/datepicker-custom.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}/js/bootstrap-timepicker/css/timepicker.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}/js/bootstrap-colorpicker/css/colorpicker.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}/js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}/js/bootstrap-datetimepicker/css/datetimepicker-custom.css" />
    
    <link href="${basePath}/css/style.css" rel="stylesheet">
    <link href="${basePath}/css/style-responsive.css" rel="stylesheet">
    
    <link href="${basePath}/js/toast/css/toastr.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${basePath}/js/html5shiv.js"></script>
    <script src="${basePath}/js/respond.min.js"></script>
    <![endif]-->
</head>

<body style="background:white;">
        <section class="panel">
            <header class="panel-heading custom-tab dark-tab">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#report1" data-toggle="tab">订单明细</a>
                    </li>
                    <li class="">
                        <a href="#report2" data-toggle="tab">出售商品明细</a>
                    </li>
                    <li class="">
                        <a href="#report3" data-toggle="tab">商品销售排行</a>
                    </li>
                    <li class="">
                        <a href="#report4" data-toggle="tab">月度销售报表</a>
                    </li>
                </ul>
            </header>
            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane active" id="report1">
                        <div class="adv-table">
                            <table  class="display table table-bordered table-striped" id="dynamic-table">
                                <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>订单编号</th>
                                        <th>订单总价</th>
                                        <th>订单收益</th>
                                        <th>下单时间</th>
                                        <th>操作人</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody">
                                    <#if orderList?exists>
                                        <#list orderList as order>
                                           <tr class='gradeA'>
                                                <td>${order_index+1}</td>
                                                <td>${order.orderNo}</td>
                                                <td>${order.price}</td>
                                                <td>${order.profit}</td>
                                                <td>${order.createTime}</td>
                                                <td>${order.userName}</td>
                                           </tr>
                                        </#list>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane" id="report2">
                        <div class="adv-table">
                            <table  class="display table table-bordered table-striped" id="dynamic-table2">
                                <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>订单编号</th>
                                        <th>名称</th>
                                        <th>规格</th>
                                        <th>单位</th>
                                        <th>生产厂家</th>
                                        <th>进价</th>
                                        <th>售价</th>
                                        <th>下单数量</th>
                                        <th>下单时间</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody2">
                                    <#if productList?exists>
                                        <#list productList as product>
                                           <tr class='gradeA'>
                                                <td>${product_index+1}</td>
                                                <td>${product.orderNo}</td>
                                                <td>${product.productName}</td>
                                                <td>${product.norms}</td>
                                                <td>${product.unit}</td>
                                                <td>${product.factory}</td>
                                                <td>${product.bid}</td>
                                                <td>${product.price}</td>
                                                <td>${product.num}</td>
                                                <td>${product.createTime}</td>
                                           </tr>
                                        </#list>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane" id="report3">
                        <div class="form-group">
                            <label class="control-label col-md-1">查询时间:</label>
                            <div class="col-md-4">
                                <div class="input-group input-large custom-date-range">
                                    <input id="startDate" type="date" class="form-control dpd1" name="from">
                                    <span class="input-group-addon">至</span>
                                    <input id="endDate" type="date" class="form-control dpd2" name="to">
                                </div>
                            </div>
                            <button style="margin-left:60px;" id ="saleQuery" class="btn btn-success btn-lg"><i class="fa fa-search"></i>查询</button>
                        </div>
                        <div class="adv-table" id="table3">
                            <table  class="display table table-bordered table-striped" id="dynamic-table3">
                                <thead>
                                    <tr>
                                        <th>排名</th>
                                        <th>商品名称</th>
                                        <th>规格</th>
                                        <th>单位</th>
                                        <th>生产厂家</th>
                                        <th>进价</th>
                                        <th>售价</th>
                                        <th>出售数量</th>
                                        <th>总金额</th>
                                        <th>总收益</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody3">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane" id="report4">
                        <div class="form-group">
                            <label class="control-label col-md-1">查询时间:</label>
                            <div class="col-md-4">
                                <div class="input-group input-large custom-date-range">
                                    <input id="startMonth" type="month" class="form-control dpd1" name="from">
                                    <span class="input-group-addon">至</span>
                                    <input id="endMonth" type="month" class="form-control dpd2" name="to">
                                </div>
                            </div>
                            <button style="margin-left:40px;" id ="monthQuery" class="btn btn-success btn-lg"><i class="fa fa-search"></i>查询</button>
                        </div>
                        <div class="adv-table" id="table4">
                            <table  class="display table table-bordered table-striped" id="dynamic-table4">
                                <thead>
                                    <tr>
                                        <th>月份</th>
                                        <th>订单笔数</th>
                                        <th>总金额</th>
                                        <th>总收益</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody4">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="${basePath}/js/jquery-1.10.2.min.js"></script>
<script src="${basePath}/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${basePath}/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${basePath}/js/bootstrap.min.js"></script>
<script src="${basePath}/js/modernizr.min.js"></script>
<script src="${basePath}/js/jquery.nicescroll.js"></script>

<script src="${basePath}/js/toast/js/toastr.js"></script>
<script src="${basePath}/js/toast/js/toastr.setting.js"></script>

<!--dynamic table-->
<script type="text/javascript" language="javascript" src="${basePath}/js/advanced-datatable/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="${basePath}/js/data-tables/DT_bootstrap.js"></script>

<script type="text/javascript">
function fnFormatDetails ( oTable, nTr ){
    var aData = oTable.fnGetData( nTr );
    var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
    sOut += '<tr><td>Rendering engine:</td><td>'+aData[1]+' '+aData[4]+'</td></tr>';
    sOut += '<tr><td>Link to source:</td><td>Could provide a link here</td></tr>';
    sOut += '<tr><td>Extra info:</td><td>And any further details here (images etc)</td></tr>';
    sOut += '</table>';

    return sOut;
}

$(document).ready(function() {

    $('#dynamic-table').dataTable( {
        "aaSorting": [[ 0, "asc" ]]
    } );
    
    $('#dynamic-table2').dataTable( {
        "aaSorting": [[ 0, "asc" ]]
    } );
    
    /*
     * Insert a 'details' column to the table
     */
    var nCloneTh = document.createElement( 'th' );
    var nCloneTd = document.createElement( 'td' );
    nCloneTd.innerHTML = '<img src="${basePath}/images/details_open.png">';
    nCloneTd.className = "center";

    $('#hidden-table-info thead tr').each( function () {
        this.insertBefore( nCloneTh, this.childNodes[0] );
    } );

    $('#hidden-table-info tbody tr').each( function () {
        this.insertBefore(  nCloneTd.cloneNode( true ), this.childNodes[0] );
    } );

    /*
     * Initialse DataTables, with no sorting on the 'details' column
     */
    var oTable = $('#hidden-table-info').dataTable( {
        "aoColumnDefs": [
            { "bSortable": false, "aTargets": [ 0 ] }
        ],
        "aaSorting": [[1, 'asc']]
    });

    /* Add event listener for opening and closing details
     * Note that the indicator for showing which row is open is not controlled by DataTables,
     * rather it is done here
     */
    $(document).on('click','#hidden-table-info tbody td img',function () {
        var nTr = $(this).parents('tr')[0];
        if ( oTable.fnIsOpen(nTr) )
        {
            /* This row is already open - close it */
            this.src = "${basePath}/images/details_open.png";
            oTable.fnClose( nTr );
        }
        else
        {
            /* Open this row */
            this.src = "${basePath}/images/details_close.png";
            oTable.fnOpen( nTr, fnFormatDetails(oTable, nTr), 'details' );
        }
    } );
    
    $("#saleQuery").on("click",function(){
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();
        if(startDate==''||endDate==''){
            toastr.error("请选择时间！");
        }
        $.ajax({
            type: "POST",
            url: "${basePath}/report/saleQuery",
            data: {startDate:startDate,endDate:endDate},
            dataType: "json",
            success: function(data){
                if(data.code==0){
                    var div3 = $("#table3");
                    div3.html("");
                    var table = $("<table  class='display table table-bordered table-striped' id='dynamic-table3'></table");
                    var thead = $("<thead><tr><th>排名</th><th>商品名称</th><th>规格</th><th>单位</th><th>生产厂家</th><th>进价</th><th>售价</th><th>出售数量</th><th>总金额</th><th>总收益</th></tr></thead>");
                    var tbody = $("<tbody id='tbody3'></tbody>");
                    table.append(thead);
                    for(var i=0;i<data.data.length;i++){
                        var newTr = $("<tr></tr>");
                        var obj = data.data[i];
                        newTr.append($("<td>"+(i+1)+"</td>"));
                        newTr.append($("<td>"+obj.productName+"</td>"));
                        newTr.append($("<td>"+obj.norms+"</td>"));
                        newTr.append($("<td>"+obj.unit+"</td>"));
                        newTr.append($("<td>"+obj.factory+"</td>"));
                        newTr.append($("<td>"+obj.bid+"</td>"));
                        newTr.append($("<td>"+obj.price+"</td>"));
                        newTr.append($("<td>"+obj.num+"</td>"));
                        newTr.append($("<td>"+obj.totalPrice+"</td>"));
                        newTr.append($("<td>"+obj.profit+"</td>"));
                        tbody.append(newTr);
                    }
                    table.append(tbody);
                    div3.append(table);
                    $('#dynamic-table3').dataTable( {
                        "aaSorting": [[ 0, "asc" ]]
                    } );
                }else{
                    toastr.error(data.message);
                }
            }
        });
    });
    
    $("#monthQuery").on("click",function(){
        var startDate = $("#startMonth").val();
        var endDate = $("#endMonth").val();
        if(startDate==''||endDate==''){
            toastr.error("请选择时间！");
        }
        startDate = startDate + "-01";
        endDate = endDate + "-01";
        $.ajax({
            type: "POST",
            url: "${basePath}/report/monthQuery",
            data: {startDate:startDate,endDate:endDate},
            dataType: "json",
            success: function(data){
                if(data.code==0){
                    var div4 = $("#table4");
                    div4.html("");
                    var table = $("<table  class='display table table-bordered table-striped' id='dynamic-table4'></table");
                    var thead = $("<thead><tr><th>月份</th><th>订单笔数</th><th>总金额</th><th>总收益</th></tr></thead>");
                    var tbody = $("<tbody id='tbody4'></tbody>");
                    table.append(thead);
                    for(var i=0;i<data.data.length;i++){
                        var newTr = $("<tr></tr>");
                        var obj = data.data[i];
                        newTr.append($("<td>"+obj.month+"</td>"));
                        newTr.append($("<td>"+obj.num+"</td>"));
                        newTr.append($("<td>"+obj.price+"</td>"));
                        newTr.append($("<td>"+obj.profit+"</td>"));
                        tbody.append(newTr);
                    }
                    table.append(tbody);
                    div4.append(table);
                    $('#dynamic-table4').dataTable( {
                        "aaSorting": [[ 0, "asc" ]]
                    } );
                }else{
                    toastr.error(data.message);
                }
            }
        });
    });
} );
</script>
</body>
</html>