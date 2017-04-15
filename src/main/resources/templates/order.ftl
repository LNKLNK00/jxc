<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">
    <#include "/common/common.ftl">
    <title>销售管理</title>
    
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
    <div class="wrapper">

        <div class="panel">
            <table class="table table-bordered table-invoice">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>商品名称</th>
                        <th class="text-center">规格</th>
                        <th class="text-center">单位</th>
                        <th class="text-center">单价</th>
                        <th class="text-center">数量</th>
                        <th class="text-center">小计</th>
                    </tr>
                </thead>
                <tbody id="tbody">
                    
                </tbody>
            </table>
        </div>
        <div class="text-center">
            <a href="#addProduct" class="btn btn-success btn-lg" data-toggle="modal"><i class="fa fa-plus"></i>选择商品</a>
            <!--<a class="btn btn-success btn-lg"><i class="fa fa-check"></i>提交订单</a>
            <a class="btn btn-primary btn-lg" target="_blank" href="invoice_print.html"><i class="fa fa-print"></i>打印订单</a>
            -->
        </div>
    </div>  
    
    <div class="modal fade in" id="addProduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
        <div class="modal-dialog" style="width:1000px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">选择商品</h4>
                </div>
                <div class="modal-body">
                    <table  class="display table table-bordered table-striped" id="dynamic-table">
                        <thead>
                            <tr>
                                <th>名称</th>
                                <th>规格</th>
                                <th>单位</th>
                                <th>单价</th>
                                <th>生产厂家</th>
                                <th>库存数量</th>
                                <th>购买数量</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                            <#if productList?exists>
                                <#list productList as product>
                                   <#if (product.num>0)>
                                       <tr class='gradeA'>
                                            <td>${product.names}</td>
                                            <td>${product.norms}</td>
                                            <td>${product.unit}</td>
                                            <td>${product.price}</td>
                                            <td>${product.factory}</td>
                                            <td>${product.num}</td>
                                            <td><input value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" /></td>
                                            <td>
                                                <a onclick="addOrder(this)" class='btn btn-success'>添加</a>
                                            </td>
                                       </tr>
                                   </#if>
                                </#list>
                            </#if>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-primary" type="button">关闭</button>
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

<!--pickers plugins-->
<script type="text/javascript" src="${basePath}/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="${basePath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${basePath}/js/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="${basePath}/js/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="${basePath}/js/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="${basePath}/js/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>

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

    /*
     * Insert a 'details' column to the table
     */
    var nCloneTh = document.createElement( 'th' );
    var nCloneTd = document.createElement( 'td' );
    nCloneTd.innerHTML = '<img src="images/details_open.png">';
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
            this.src = "images/details_open.png";
            oTable.fnClose( nTr );
        }
        else
        {
            /* Open this row */
            this.src = "images/details_close.png";
            oTable.fnOpen( nTr, fnFormatDetails(oTable, nTr), 'details' );
        }
    } );
    
    $("#submit-add").on("click",function(){
        var id = $("#productId").val();
        var num = $("#num").val();
        if(num <= 0){
            $("#add_msg").html("数量必须大于0！");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "${basePath}/stock/addStock",
            data: {id:id,num:num},
            dataType: "json",
            success: function(data){
                if(data.code==0){
                    location.reload();
                }else{
                    $("#add_msg").html(data.message);
                    return false;
                }
            }
        });
    });
} );
function addOrder(obj){
    var tbody = $("#tbody");
    var tr = $(obj).parent().parent();
    var num = tr.children().eq(5).html();
    var count = tr.children().eq(6).children(":first").val();
    if(count <= 0){
        toastr.warning("请输入购买数量！");
        return false;
    }
    if(num < count){
        toastr.warning("购买数量不能大于库存！");
        return false;
    }
    var newTr = $("<tr></tr>");
    <tr>
        <td>1</td>
        <td>泻立停</td>
        <td class="text-center">10粒/盒</td>
        <td class="text-center">盒</td>
        <td class="text-center">20</td>
        <td class="text-center">1</td>
        <td class="text-center">20</td>
    </tr>
    toastr.info("添加成功！");
}
</script>
</body>
</html>