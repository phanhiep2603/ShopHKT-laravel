@extends('admin.master')
@section('content')
<div class="col-lg-12">
    <h1 class="page-header">Change Pasword
        <small>
                Account:<i aria-hidden="true"></i>
                @if(Auth::check())
                {{Auth::user()->username}}
                @endif
        </small>
    </h1>
</div>
  <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- jquery  -->
            <div class="card card-primary">
              <div class="card-header">
              <h3 class="card-title">Enter your new password</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form role="form-vertical" method="POST">
              {{ csrf_field() }}
                <div class="card-body">
                  <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                    <label for="Password">New Password:</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="New Password" required>
                        @if ($errors->has('password'))
                                <span class="help-block">
                                <strong>{{ $errors->first('password') }}</strong>
                                </span>
                        @endif
                  </div>
                  <div class="form-group{{ $errors->has('password_confirmation') ? ' has-error' : '' }}">
                    <label for="confirm_password" class="control-label" >Confirm new Password:</label>
                    <input type="password" name="confirm_password" class="form-control" id="confirm_password" placeholder="Confirm new Password" required>
                        @if ($errors->has('password_confirm'))
                        <span class="help-block">
                        <strong>{{ $errors->first('password_confirm') }}</strong>
                        </span>
                        @endif
                  </div>                 
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
              </form>
            </div>
            <!-- /.card -->
            </div>
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-6">

          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
@endsection