@extends('user.master')

@section('content')
<div class="container">
 <!--  breadcrumb --> 
 <ul class="breadcrumb">
        <li>
          <a href="#">Home</a>
          <span class="divider">/</span>
        </li>
        <li class="active">Reset Pasword</li>
      </ul>

      <div class="row">  
        <div class="col-lg-12">
          <h1 class="heading1"><span class="maintext">Reset Pasword</span></h1>
          <section class="returncustomer">
            <h2 class="heading2">Reset Pasword </h2>
              @include('admin.blocks.error')
                    <form class="form-vertical" method="POST">
                        {{ csrf_field() }}
                    <fieldset>
                        
                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label for="password" class="control-label">New Password:</label>

                            <div class="col-md-6">
                                <input id="email" type="password" class="form-control" placeholder="Password" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('password_confirmation') ? ' has-error' : '' }}">
                            <label for="password-confirm" class="control-label">Confirm New Password:</label>
                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" placeholder="Confirm Password" name="password_confirm" required>

                                @if ($errors->has('password_confirm'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password_confirm') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-orange">
                                    Reset Password
                                </button>
                            </div>
                        </div>
                    </fieldset>
                    </form>
          </section>
        </div>
      </div>
    </div>
</div>
@endsection
