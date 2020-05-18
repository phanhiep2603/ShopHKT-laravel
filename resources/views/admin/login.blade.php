<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 3 | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <base href="{{asset('')}}">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{asset('plugins/fontawesome-free/css/all.min.css')}}">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="{{asset('plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{asset('dist/css/adminlte.min.css')}}">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300italic,400italic,600,600italic' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="{{asset('admin/dist/css/sweetalert2.css')}}">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
  
<link href="{!! url('user/css/flexslider.css') !!}" type="text/css" media="screen" rel="stylesheet">
<link href="{!! url('user/css/jquery.fancybox.css') !!}" rel="stylesheet">
<link href="{!! url('user/css/cloud-zoom.css') !!}" rel="stylesheet">
<link href="{!! url('user/css/portfolio.css') !!}" rel="stylesheet">
<link rel="stylesheet" href="{!! url('user/css/font-awesome.min.css') !!}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

  
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a><b>Admin</b> Shop HKT</a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
  @include('sweet::alert')
    <div class="card-body login-card-body">   
      <p class="login-box-msg">Sign in to session admin</p>

      <form action="admin/login" method="POST">
      <input type="hidden" name="_token" value="{!! csrf_token() !!}">
        <div class="input-group mb-3">
        <input type="text" name="txtUsername" placeholder="Username" class="form-control" value="{!! old('txtUsername') !!}">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="txtPass" placeholder="Password" class="form-control">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div>
            <p class="mb-1">
            <a href="forgotPassword">I forgot my password</a>
            </p>
            <p class="mb-0">
            <a href="register" class="text-center">Register a new membership</a>
            </p>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
          </div>
          <!-- /.col -->
        </div>
      </form>
      
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->
@section('script')
<script src="{!! url('admin/js/sweetalert2.js') !!}"></script>
@endsection()

</body>
</html>
