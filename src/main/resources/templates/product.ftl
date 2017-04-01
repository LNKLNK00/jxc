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
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body style="background:white;">
        <div class="row" style="padding:15px;">
            <div class="col-lg-12">
                <label>名称:  </label><input placeholder="名称" />
                <label>名称:  </label><input placeholder="名称" />
                <button class="btn btn-primary" type="button">查询</button>
                <a class="btn btn-success" data-toggle="modal" href="#addPsroduct">添加商品</a>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <section class="panel">
                    <div class="panel-body">
                        <div class="adv-table">
                            <table  class="display table table-bordered table-striped" id="dynamic-table">
                                <thead>
                                    <tr>
                                        <th>Rendering engine</th>
                                        <th>Browser</th>
                                        <th>Platform(s)</th>
                                        <th class="hidden-phone">Engine version</th>
                                        <th class="hidden-phone">CSS grade</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="gradeX">
                                        <td>Trident</td>
                                        <td>Internet
                                            Explorer 4.0</td>
                                        <td>Win 95+</td>
                                        <td class="center hidden-phone">4</td>
                                        <td class="center hidden-phone">X</td>
                                    </tr>
                                    <tr class="gradeC">
                                        <td>Trident</td>
                                        <td>Internet
                                            Explorer 5.0</td>
                                        <td>Win 95+</td>
                                        <td class="center hidden-phone">5</td>
                                        <td class="center hidden-phone">C</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Trident</td>
                                        <td>Internet
                                            Explorer 5.5</td>
                                        <td>Win 95+</td>
                                        <td class="center hidden-phone">5.5</td>
                                        <td class="center hidden-phone">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Trident</td>
                                        <td>Internet
                                            Explorer 6</td>
                                        <td>Win 98+</td>
                                        <td class="center hidden-phone">6</td>
                                        <td class="center hidden-phone">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Trident</td>
                                        <td>Internet Explorer 7</td>
                                        <td>Win XP SP2+</td>
                                        <td class="center hidden-phone">7</td>
                                        <td class="center hidden-phone">A</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Rendering engine</th>
                                        <th>Browser</th>
                                        <th>Platform(s)</th>
                                        <th class="hidden-phone">Engine version</th>
                                        <th class="hidden-phone">CSS grade</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        
        <div class="modal fade in" id="addPsroduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Datepicker in Modal</h4>
                    </div>
                    <div class="modal-body">
                        <form action="#" class="form-horizontal ">
                            <div class="form-group">
                                <label class="control-label col-md-4"> Date time picker</label>
                                <div class="col-md-6">
                                    <input size="16" type="text" value="2012-06-15 14:45" readonly="" class="form_datetime form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4">Default Datepicker</label>
                                <div class="col-md-6 col-xs-11">
                                    <input class="form-control form-control-inline input-medium default-date-picker" size="16" type="text" value="">
                                    <span class="help-block">Select date</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4">Start with years viewMode</label>
                                <div class="col-md-6 col-xs-11">

                                    <div data-date-viewmode="years" data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-append date dpYears">
                                        <input type="text" readonly="" value="12-02-2012" size="16" class="form-control">
                                                  <span class="input-group-btn add-on">
                                                    <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                  </span>
                                    </div>
                                    <span class="help-block">Select date</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4">Months Only</label>
                                <div class="col-md-6 col-xs-11">
                                    <div data-date-minviewmode="months" data-date-viewmode="years" data-date-format="mm/yyyy" data-date="102/2012" class="input-append date dpMonths">
                                        <input type="text" readonly="" value="02/2012" size="16" class="form-control">
                                                  <span class="input-group-btn add-on">
                                                    <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                  </span>
                                    </div>


                                    <span class="help-block">Select month only</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4">Date Range</label>
                                <div class="col-md-6">
                                    <div class="input-group input-large custom-date-range" data-date="13/07/2013" data-date-format="mm/dd/yyyy">
                                        <input type="text" class="form-control dpd1" name="from">
                                        <span class="input-group-addon">To</span>
                                        <input type="text" class="form-control dpd2" name="to">
                                    </div>
                                    <span class="help-block">Select date range</span>
                                </div>
                            </div>
                        </form>
                    </div>


                    <form class="form-horizontal  " action="#">
                        <div class="form-group">
                            <label class="control-label col-md-4">Default Timepicker</label>
                            <div class="col-md-6">
                                <div class="input-group bootstrap-timepicker">
                                    <input type="text" class="form-control timepicker-default">
                                        <span class="input-group-btn">
                                        <button class="btn btn-default" type="button"><i class="fa fa-clock-o"></i></button>
                                        </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-4">24hr Timepicker</label>
                            <div class="col-md-6">
                                <div class="input-group bootstrap-timepicker">
                                    <input type="text" class="form-control timepicker-24">
                                        <span class="input-group-btn">
                                        <button class="btn btn-default" type="button"><i class="fa fa-clock-o"></i></button>
                                        </span>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-primary" type="button">提交</button>
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
<!--dynamic table initialization -->
<script src="${basePath}/js/dynamic_table_init.js"></script>
<script type="text/javascript">
    
</script>
</body>
</html>