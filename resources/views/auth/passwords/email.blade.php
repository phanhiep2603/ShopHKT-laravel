@extends('user.master')

@section('content')
<div class="container">
      <!--  breadcrumb --> 
      <ul class="breadcrumb">
        <li>
          <a href="#">Home</a>
          <span class="divider">/</span>
        </li>
        <li class="active">Forgot Pasword</li>
      </ul>
       <!-- Forgot Pasword-->
      <div class="row">  
        <div class="col-lg-12">
          <h1 class="heading1"><span class="maintext">Forgot Your Password</span></h1>
          <section class="returncustomer">
            <h2 class="heading2">Forgot Password </h2>
              @include('admin.blocks.error')
              <form class="form-vertical" method="POST">
                        {{ csrf_field() }}
                        
                    <fieldset>
                        <div class="control-group">
                                <label  class="control-label">E-Mail Address:</label>
                                <div class="controls">
                                    <input id="email" type="email" class="form-control" placeholder="E-Mail Address" name="email" value="{{ old('email') }}" required>

                                    @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                    @endif

                                </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-orange">
                                    Send Password Reset Link
                                </button>
                            </div>
                        </div>
                    </fieldset>
                </form>
          </section>
        </div>
    </div>
</div>
@endsection
