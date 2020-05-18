@extends('admin.master')
@section('content')
<div class="col-lg-12">
    <h1 class="page-header">Contact
        <small>Contact Detail</small>
    </h1>
</div>
<!-- /.col-lg-12 -->
<section class="content">
        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
            
                <!-- jquery  -->
                <div class="card card-primary">
                    <div class="card-header">
                    <h3 class="card-title">Contact Customer</h3>
                </div>
                <div class="card-body">   
                <div class="col-lg-3">
                    <div class=""   style="">
                        <h4></h4>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th class="col-md-4">Customer contact information</th>
                                <th class="col-md-5"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="info">
                                <td>Name</td>
                                <td>{!! $customerInfo->name !!}</td>
                            </tr>
                            <tr class="info">
                                <td>Phone Number</td>
                                <td>{!! $customerInfo->phone !!}</td>
                            </tr>
                            <tr class="info">
                                <td>Email</td>
                                <td>{!! $customerInfo->email !!}</td>
                            </tr>
                            <tr class="info">
                                <td>Note</td>
                                <td>{!! $customerInfo->note !!}</td>
                            </tr>
                            <tr class="info">
                                <td>Date Contact</td>
                                <td>{!! $customerInfo->date_contact !!}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-lg-12">
                <form action="" method="POST">
                    <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                    <div class="col-md-8"></div>
                    <div class="col-md-4">
                        <div class="form-inline">
                            <label>Status Solving: </label>
                            <select name="status" class="form-control input-inline" style="width: 200px">
                                <option value="0">New Mail</option>
                                <option value="1">Seen</option>
                                <option value="2">Solved</option>
                            </select>
                            <input type="submit" value="Submit" class="btn btn-primary">
                        </div>
                    </div>
                </form>
                </div>
                        <!--/.col (right) -->
                </div>
        <!-- /.row -->
                </div><!-- /.container-fluid -->
        </div>
</section>
<!-- /.content -->
@endsection()