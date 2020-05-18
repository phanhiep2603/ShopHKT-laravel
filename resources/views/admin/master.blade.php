<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Admin Shop HKT | Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{asset('plugins/fontawesome-free/css/all.min.css')}}">
    <!-- Ionicons -->
    <link rel="stylesheet" href="{{asset('css/ionicons.min.css')}}>
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet" href="{{asset('plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css')}}">
    <!-- iCheck -->
    <link rel="stylesheet" href="{{asset('plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}">
    <!-- JQVMap -->
    <link rel="stylesheet" href="{{asset('plugins/jqvmap/jqvmap.min.css')}}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{asset('dist/css/adminlte.min.css')}}">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="{{asset('plugins/overlayScrollbars/css/OverlayScrollbars.min.css')}}">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="{{asset('plugins/daterangepicker/daterangepicker.css')}}">
    <!-- summernote -->
    <link rel="stylesheet" href="{{asset('plugins/summernote/summernote-bs4.css')}}">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <link href="{!! url('user/css/flexslider.css') !!}" type="text/css" media="screen" rel="stylesheet">
    <link href="{!! url('user/css/cloud-zoom.css') !!}" rel="stylesheet">
    <link href="{!! url('user/css/portfolio.css') !!}" rel="stylesheet">
    <link rel="stylesheet" href="{!! url('user/css/font-awesome.min.css') !!}">
    <link rel="stylesheet" href="{{asset('plugins/sweetalert2/sweetalert2.css')}}"> 
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300italic,400italic,600,600italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Crete+Round' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Crete+Round' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="{{ asset('admin/js/ckeditor/ckeditor.js') }}"></script>
    <script type="text/javascript" src="{{ asset('admin/js/ckfinder/ckfinder.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}">
    <link href="{{ asset('admin/bower_components/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        var baseURL = "{!! url('/') !!}";
    </script>
    <script type="text/javascript" src="{{ asset('admin/js/func_ckfinder.js') }}"></script>
 
    

    @yield('css')
    
</head>

<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="{!! url('admin/dashboard') !!}" class="nav-link">Home</a>
            </li>
        </ul>
        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <!-- Admin Dropdown Menu -->         
                <div class ="dropdown open">                   
                        <button class="btn btn-outline-dark btn-sm dropdown-toggle text-left" type="button" id="triggleId" data-toggle="dropdown"
                        aria-expanded="false">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            @if(Auth::check())
                            {{Auth::user()->username}}
                            @endif
                        </button>
                        <div class="dropdown-menu" aria-labelledby="triggleId">
                            <a class="dropdown-item" href="{!! route('admin.changePassword') !!}" @if(Auth::check()) {{Auth::user()->username}} @endif>Change Password</a>
                            <div class="dropdown-divider"></div>
                            <a href="{!! url('logout') !!}" class="dropdown-item">Logout <i class="fa fa-sign-out" aria-hidden="true"></i></a>
                        </div>                     
                </div>                     
                <li class="nav-item">
                    <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                        <i class="fas fa-cog"></i>
                    </a>
                </li>           
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <!-- <div class="image">
                    <img src="{{asset('dist/img/user2-160x160.jpg')}}" class="img-circle elevation-2" alt="User Image">
                </div> -->
                <div class="info">
                    <a href="{!! url('/') !!}" class="d-block"><h3>Shop HKT</h3></a>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    
                    <li class="nav-header">EXAMPLES</li>
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-copy"></i>
                            <p>
                                Bill
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <?php
                                    $count_order = DB::table('orders')->where('status',0)->get();
                                    $count_mail = DB::table('contacts')->where('status',0)->get();
                                ?>
                                <a href="{!! url('admin/bill/list') !!}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>List Bill</p>
                                    <span class="badge badge-info right"> {!! count($count_order) !!}</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-copy"></i>
                            <p>
                                Product
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="{!! url('admin/product/add') !!}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>New Product</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{!! url('admin/product/list') !!}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>List Products</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-copy"></i>
                            <p>
                                Category
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="{!! url('admin/cate/add') !!}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Add Category</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{!! url('admin/cate/list') !!}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>List Category</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-copy"></i>
                            <p>
                                Users
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="{!! url('admin/user/add') !!}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>New User</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{!! url('admin/user/list') !!}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>List Users</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="fa fa-envelope"></i>
                            <p>
                                Mailbox
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="{!! url('admin/contact/list') !!}" class="nav-link">
                                <i class="fa fa-envelope"></i>
                                <p>Mailbox</p>
                                    <span class="badge badge-info right"> {!! count($count_mail) !!}</span>
                                </a>
                            </li>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">@yield('header')@include('sweet::alert')</h1>
                    </div><!-- /.col -->
                    <!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                
                    <div class="col-lg-12">
                        @if(Session::has('flash_message'))
                            <div class="alert alert-{!! Session::get('flash_level') !!}">
                                {!! Session::get('flash_message') !!}
                            </div>
                        @endif
                    </div>
                    <!-- Phan noi dung-->
                    @yield('content')
                    <!-- Ket thuc noi dung-->
                </div>
           
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="{{asset('plugins/jquery/jquery.min.js')}}"></script>
<!-- jQuery UI 1.11.4 -->
<script src="{{asset('plugins/jquery-ui/jquery-ui.min.js')}}"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="{{asset('plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
<!-- ChartJS -->
<script src="{{asset('plugins/chart.js/Chart.min.js')}}"></script>
<!-- Sparkline -->
<script src="{{asset('plugins/sparklines/sparkline.js')}}"></script>
<!-- JQVMap -->
<script src="{{asset('plugins/jqvmap/jquery.vmap.min.js')}}"></script>
<script src="{{asset('plugins/jqvmap/maps/jquery.vmap.usa.js')}}"></script>
<!-- jQuery Knob Chart -->
<script src="{{asset('plugins/jquery-knob/jquery.knob.min.js')}}"></script>
<!-- daterangepicker -->
<script src="{{asset('plugins/moment/moment.min.js')}}"></script>
<script src="{{asset('plugins/daterangepicker/daterangepicker.js')}}"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="{{asset('plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js')}}"></script>
<!-- Summernote -->
<script src="{{asset('plugins/summernote/summernote-bs4.min.js')}}"></script>
<!-- overlayScrollbars -->
<script src="{{asset('plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js')}}"></script>
<!-- AdminLTE App -->
<script src="{{asset('dist/js/adminlte.js')}}"></script>
<script src="{{asset('plugins/sweetalert2/sweetalert2.all.min.js')}}"></script>



<script src="{{ url('admin/bower_components/jquery/dist/jquery.min.js') }}"></script>
<script src="{!! url('user/js/jquery.js') !!}"></script> 
<script src="{!! url('user/js/bootstrap.js') !!}"></script> 
<script src="{!! url('user/js/respond.min.js') !!}"></script> 
<script src="{!! url('user/js/application.js') !!}"></script> 
<script src="{!! url('user/js/bootstrap-tooltip.js') !!}"></script>
<script defer src="{!! url('user/js/jquery.flexslider.js') !!}"></script> 
<script type="text/javascript" src="{!! url('user/js/jquery.tweet.js') !!}"></script> 
<script  src="{!! url('user/js/cloud-zoom.1.0.2.js') !!}"></script> 
<script  type="text/javascript" src="{!! url('user/js/jquery.validate.js') !!}"></script> 
<script type="text/javascript"  src="{!! url('user/js/jquery.carouFredSel-6.1.0-packed.js') !!}"></script> 
<script type="text/javascript"  src="{!! url('user/js/jquery.mousewheel.min.js') !!}"></script> 
<script type="text/javascript"  src="{!! url('user/js/jquery.touchSwipe.min.js') !!}"></script> 
<script type="text/javascript"  src="{!! url('user/js/jquery.ba-throttle-debounce.min.js') !!}"></script> 
<script src="{!! url('user/js/jquery.isotope.min.js') !!}"></script> 
<script src="{!! url('user/js/myscript.js') !!}"></script>
<script src="{{ asset('admin/js/myscript.js') }}"></script>
<script src="{{ asset('admin/bower_components/jquery/dist/jquery.min.js') }}"></script>

<!-- Bootstrap Core JavaScript -->
<script src="{{ asset('admin/bower_components/bootstrap/dist/js/bootstrap.min.js') }}"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="{{ asset('admin/bower_components/metisMenu/dist/metisMenu.min.js') }}"></script>



<script src="{{ asset('plugins/jquery/jquery.min.js') }}"></script>
<script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
<script src="{{ asset('plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
<script src="{{ asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>

    <script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true,
      "autoWidth": false,
    });
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>

@yield('script')
</body>
</html>
