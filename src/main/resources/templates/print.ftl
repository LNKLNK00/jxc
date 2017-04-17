<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">
    <#include "/common/common.ftl">
    <title>销售订单打印</title>
    
    <!--dynamic table-->
    <link href="${basePath}/js/advanced-datatable/css/demo_page.css" rel="stylesheet" />
    <link href="${basePath}/js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
    <link rel="stylesheet" href="${basePath}/js/data-tables/DT_bootstrap.css" />

    <link href="${basePath}/css/style.css" rel="stylesheet">
    <link href="${basePath}/css/style-responsive.css" rel="stylesheet">
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${basePath}/js/html5shiv.js"></script>
    <script src="${basePath}/js/respond.min.js"></script>
    <![endif]-->
</head>

<body style="background:white;">
    <div class="text-center" style="margin:30px;">
        <font style="font-size:28px;">芦洲兽药店销售订单</font><br/><br/>
    </div>
    <div class="wrapper">
        <div class="panel">
            <table class="table table-bordered table-invoice">
                <thead>
                    <#if printDto?exists>
                        <tr>
                            <td class="text-left" colspan="2">订单编号：${printDto.orderNo}</td>
                            <td class="text-left" colspan="4">成交时间：${printDto.createTime}</td>
                        </tr>
                        <tr>
                            <td class="text-left" colspan="2">操作人：${printDto.userName}</td>
                            <td class="text-left" colspan="4">联系电话：189 7950 6444(刘)</td>
                        </tr>
                    </#if>
                    <tr>
                        <th>商品名称</th>
                        <th class="text-center">规格</th>
                        <th class="text-center">单位</th>
                        <th class="text-center">单价</th>
                        <th class="text-center">数量</th>
                        <th class="text-center">小计</th>
                    </tr>
                </thead>
                <tbody id="tbody" style="border:1px #ddd solid;">
                    <#if printDto?exists>
                        <#list printDto.productList as product>
                            <tr>
                                <td>${product.productName}</td>
                                <td class="text-center">${product.norms}</td>
                                <td class="text-center">${product.unit}</td>
                                <td class="text-center">${product.price}元</td>
                                <td class="text-center">${product.num}</td>
                                <td class="text-center">${product.total}元</td>
                            </tr>
                        </#list>
                        <tr><td class="text-center" colspan="6">订单总价：${printDto.price}元</td></tr>
                    </#if>
                </tbody>
            </table>
        </div>
    </div>  
    
<!-- Placed js at the end of the document so the pages load faster -->
<script src="${basePath}/js/jquery-1.10.2.min.js"></script>
<script src="${basePath}/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${basePath}/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${basePath}/js/bootstrap.min.js"></script>
<script src="${basePath}/js/modernizr.min.js"></script>
<script src="${basePath}/js/jquery.nicescroll.js"></script>

<!--dynamic table-->
<script type="text/javascript" language="javascript" src="${basePath}/js/advanced-datatable/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="${basePath}/js/data-tables/DT_bootstrap.js"></script>

<script type="text/javascript">
    window.print();
</script>
</body>
</html>