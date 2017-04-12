<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">
    <#include "/common/common.ftl">
    <title>进货管理</title>
    
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
                        <a href="#home2" data-toggle="tab">进货</a>
                    </li>
                    <li class="">
                        <a href="#about2" data-toggle="tab">进货明细</a>
                    </li>
                </ul>
            </header>
            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane active" id="home2">
                    
                        <div class="row">
                            <div class="col-sm-12">
                                <section class="panel">
                                    <div class="panel-body">
                                        <div class="adv-table">
                                            <table  class="display table table-bordered table-striped" id="dynamic-table">
                                                <thead>
                                                    <tr>
                                                        <th>序号</th>
                                                        <th>名称</th>
                                                        <th>规格</th>
                                                        <th>单位</th>
                                                        <th>库存数量</th>
                                                        <th>生产厂家</th>
                                                        <th>创建时间</th>
                                                        <th>修改时间</th>
                                                        <th>操作</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbody">
                                                    <#if productList?exists>
                                                        <#list productList as product>
                                                           <tr class='gradeA'>
                                                                <td>${product_index+1}</td>
                                                                <td>${product.names}</td>
                                                                <td>${product.norms}</td>
                                                                <td>${product.unit}</td>
                                                                <td>${product.num}</td>
                                                                <td>${product.factory}</td>
                                                                <td>${product.createTime}</td>
                                                                <td>${product.updateTime!''}</td>
                                                                <td>
                                                                    <a href="#addStock" onclick="initParam(${product.id})" data-toggle="modal" class='btn btn-success'>进货</a>
                                                                </td>
                                                           </tr>
                                                        </#list>
                                                    </#if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                        
                    </div>
                    <div class="tab-pane" id="about2">
                    
                        <div class="row">
                            <div class="col-sm-12">
                                <section class="panel">
                                    <div class="panel-body">
                                        <div class="adv-table">
                                            <table  class="display table table-bordered table-striped" id="dynamic-table2">
                                                <thead>
                                                    <tr>
                                                        <th>序号</th>
                                                        <th>名称</th>
                                                        <th>规格</th>
                                                        <th>单位</th>
                                                        <th>生产厂家</th>
                                                        <th>进货数量</th>
                                                        <th>进货时间</th>
                                                        <th>进货人</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbody">
                                                    <#if stockList?exists>
                                                        <#list stockList as stock>
                                                           <tr class='gradeA'>
                                                                <td>${stock_index+1}</td>
                                                                <td>${stock.productName}</td>
                                                                <td>${stock.norms}</td>
                                                                <td>${stock.unit}</td>
                                                                <td>${stock.factory}</td>
                                                                <td>${stock.num}</td>
                                                                <td>${stock.createTime}</td>
                                                                <td>${stock.userName}</td>
                                                           </tr>
                                                        </#list>
                                                    </#if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </section>

        <div class="modal fade in" id="addStock" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">进货</h4>
                    </div>
                    <div class="modal-body">
                        <form id="form-add" class="form-horizontal" action="#">
                            <div class="form-group">
                                <input type="hidden" id="productId"/>
                                <label class="control-label col-md-4">进货数量</label>
                                <div class="col-md-6">
                                    <input size="8" onkeyup="this.value=this.value.replace(/\D/g,'')" id="num" class="form-control">
                                </div>
                            </div>
                            <div classs="col-md-12" id="add_msg" style="color: #a94442;height:20px;height:30px;text-align:center;">
                                
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button id="submit-add" class="btn btn-primary" type="button">提交</button>
                        <button data-dismiss="modal" class="btn btn-primary" type="button">取消</button>
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

<!--pickers initialization-->
<script src="${basePath}/js/pickers-init.js"></script>

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
function initParam(id){
    $("#productId").val(id);
    $("#add_msg").html("");
    $("#num").val("");
}
</script>
</body>
</html>