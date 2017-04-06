<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">
    <#include "/common/common.ftl">
    <title>商品管理</title>
    
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
        <div class="row" style="padding:15px;">
            <a href="#addProduct" class="btn btn-primary" data-toggle="modal">添加商品</a>
        </div>
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
                                        <th>进价</th>
                                        <th>售价</th>
                                        <th>库存数量</th>
                                        <th>生产厂家</th>
                                        <th>状态</th>
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
                                                <td>${product.bid}</td>
                                                <td>${product.price}</td>
                                                <td>${product.num}</td>
                                                <td>${product.factory}</td>
                                                <td>
                                                    <#if product.status = 1>
                                                                                                                    上架
                                                    </#if>
                                                    <#if product.status = 0>
                                                                                                                    下架
                                                    </#if>
                                                </td>
                                                <td>${product.createTime}</td>
                                                <td>${product.updateTime!''}</td>
                                                <td>
                                                    <#if product.status = 1>
                                                        <button data-dismiss='modal' onclick="updateStatus(${product.id},0)" class='btn btn-danger' type='button'>下架</button>
                                                    </#if>
                                                    <#if product.status = 0>
                                                        <button data-dismiss='modal' onclick="updateStatus(${product.id},1)" class='btn btn-success' type='button'>上架</button>
                                                    </#if>
                                                    <a href="#updateProduct" onclick="initUpdateParam('${product.id}','${product.names}','${product.norms}','${product.unit}','${product.factory}');" data-toggle="modal" class='btn btn-success'>修改</a>
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
        
        <div class="modal fade in" id="addProduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">添加商品</h4>
                    </div>
                    <div class="modal-body">
                        <form id="form-add" class="form-horizontal" action="#">
                            <div class="form-group">
                                <label class="control-label col-md-4">商品名称</label>
                                <div class="col-md-6">
                                    <input size="50" type="text" id="names" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4">商品规格</label>
                                <div class="col-md-6">
                                    <input size="20" type="text" id="norms" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4">单位</label>
                                <div class="col-md-6">
                                    <input size="2" type="text" id="unit" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4">进价</label>
                                <div class="col-md-6">
                                    <input size="8" onkeyup="checkNum(this)" id="bid" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4">售价</label>
                                <div class="col-md-6">
                                    <input size="8" onkeyup="checkNum(this)" id="price" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4">生产厂家</label>
                                <div class="col-md-6">
                                    <input size="30" class="form-control" id="factory">
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
        
        <div class="modal fade in" id="updateProduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">修改商品信息</h4>
                    </div>
                    <div class="modal-body">
                        <form id="form-add" class="form-horizontal" action="#">
                            <div class="form-group">
                                <label class="control-label col-md-4">商品名称</label>
                                <div class="col-md-6">
                                    <input type="hidden" id="update_id">
                                    <input size="50" type="text" id="update_names" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4">商品规格</label>
                                <div class="col-md-6">
                                    <input size="20" type="text" id="update_norms" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4">单位</label>
                                <div class="col-md-6">
                                    <input size="2" type="text" id="update_unit" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4">生产厂家</label>
                                <div class="col-md-6">
                                    <input size="30" class="form-control" id="update_factory">
                                </div>
                            </div>
                            <div classs="col-md-12" id="update_msg" style="color: #a94442;height:20px;height:30px;text-align:center;">
                                
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button id="update-add" class="btn btn-primary" type="button">提交</button>
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
        "aaSorting": [[ 10, "desc" ]]
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
        var names = $("#names").val();
        var norms = $("#norms").val();
        var unit = $("#unit").val();
        var bid = $("#bid").val();
        var price = $("#price").val();
        var factory = $("#factory").val();
        if(names==''||norms==''||unit==''||bid==''||price==''){
            $("#add_msg").html("请将信息填完整！");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "${basePath}/product/addProduct",
            data: {names:names,norms:norms,unit:unit,bid:bid,price:price,factory:factory},
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
    $("#update-add").on("click",function(){
        var id = $("#update_id").val();
        var names = $("#update_names").val();
        var norms = $("#update_norms").val();
        var unit = $("#update_unit").val();
        var factory = $("#update_factory").val();
        if(names==''||norms==''||unit==''){
            $("#update_msg").html("请将信息填完整！");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "${basePath}/product/updateProduct",
            data: {id:id,names:names,norms:norms,unit:unit,factory:factory},
            dataType: "json",
            success: function(data){
                if(data.code==0){
                    location.reload();
                }else{
                    $("#update_msg").html(data.message);
                    return false;
                }
            }
        });
    });
} );
function updateStatus(id,status){
    $.ajax({
        type: "POST",
        url: "${basePath}/product/updateStatus",
        data: {id:id,status:status},
        dataType: "json",
        success: function(data){
            if(data.code==0){
                location.reload();
            }else{
                //Toast(data.message,"error");
            }
        }
    });
}
function initUpdateParam(id,names,norms,unit,factory){
    $("#update_id").val(id);
    $("#update_names").val(names);
    $("#update_norms").val(norms);
    $("#update_unit").val(unit);
    $("#update_factory").val(factory);
}
function initTable(){
    $.ajax({
        type: "POST",
        url: "${basePath}/product/selectAllProduct",
        data: null,
        dataType: "json",
        beforeSend: function(XMLHttpRequest) {
            
        },
        success: function(data){
            if(data.code==0){
                changeHtml(data.data);
            }else{
                //Toast(data.message,"error");
            }
        },
        complete: function(XMLHttpRequest, textStatus) {
            
        }
    });
}
</script>
</body>
</html>