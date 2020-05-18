@extends('admin.master')
@section('content')
<div class="col-lg-12">
    <h1 class="page-header">Dashboard
    </h1>
</div>
<section class="content">
      <div class="container-fluid">
      
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>{!! count($count_order) !!}</h3>

                <p>New Orders</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="{!! url('admin/bill/list') !!}" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3>{!! count($count_mail) !!}</h3>
                <p>Mailbox</p>
              </div>
              <div class="icon">
                <i class="ion ion-email"></i>
              </div>
              <a href="{!! url('admin/contact/list') !!}" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>{!! count($count_user) !!}</h3>

                <p>User Registrations</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="{!! url('admin/user/list') !!}" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3>{!! count($count_product) !!}</h3>

                <p>Product</p>
              </div>
              <div class="icon">
                <i class="ion ion-heart"></i>
              </div>
              <a href="admin/product/list" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
        <!-- Main row -->
      
      <div class="row">
        <div class="col-md-12">
          <div class="card card-primary">
            <div class="card-header">   
              <h3 class="card-title">New Order</h3>
              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                  <i class="fas fa-minus"></i></button>
              </div>           
            </div> 
            
              <div class="card-body table-responsive p-0">  
                <table class="table table-hover table-valign-middle">
                  <thead>
                  <tr>
                    <th scope="col">Fullname</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Date Order</th>
                    <th scope="col">Total Money</th>
                    <th scope="col">Note</th>
                    <th scope="col">Status</th>
                  </tr>
                  </thead>
                  <tbody>

                    @foreach($order as $od)
                      
                    <tr>
                      <td> {{$od->fullname }} </td>
                      <td> {{$od->phone }} </td>
                      <td> {{$od->email }} </td>
                      <td> {{$od->address }} </td>
                      <td> {{$od->date_order }} </td>
                      <td> {{$od->total }} </td>
                      <th scope="row"> {{$od->note }} </th>
                      <th scope="row">
                          @if($od->status == 0)
                            <span class="badge badge-warning">Pending</span>
                          @elseif($od->status == 1)
                            <span class="badge badge-warning">Not Delivered Yet</span>
                          @elseif($od->status == 2)
                            <span class="badge badge-success">Shipped</span>
                          @elseif($od->status == 3)
                            <span class="badge badge-danger">Delivered</span>
                          @endif
                        </th>
                    </tr>
        	        @endforeach
                  </tbody>
                </table>
              
              </div>
          </div>
            <!-- /.card-body -->
        </div>
      </div>
          <!-- /.card -->
        <div class="row">
          <!-- Left col -->
          <section class="col-lg-12 ">
            
            <div class="card card-danger">
              <div class="card-header">
                <h3 class="card-title">
                  <i class="fas fa-chart-pie mr-1"></i>
                  Total Money Delivered
                </h3>
                <div class="card-tools">
                  
                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                    <i class="fas fa-minus"></i>
                    </button>
                  
                </div>
              </div><!-- /.card-header -->
              <div class="card-body">
                <table class="table table-hover table-valign-middle ">
                    <thead>
                    <tr>
                      <th scope="col">Today</th>
                      <th scope="col">Last Week</th>
                      <th scope="col">Last Month</th>
                    </tr>
                    </thead>
                    <tbody>
                      <tr>
                          <td> {{$totaltoday }}&#160VNĐ </td>
                          <td> {{$totalweek }}&#160VNĐ </td>
                          <td> {{$totalmonth }}&#160VNĐ </td>
                      </tr>
                    </tbody>
                </table> 
              </div><!-- /.card-body -->
            </div>
          </section>
        </div>
        <!-- /.card-body --> 
      <div class="row">
          <div class="col-lg-6">
            <div class="card card-warning">
              <div class="card-header border-0">
                <h3 class="card-title">
                  <i class="fas fa-map-marker-alt mr-1"></i>
                  Chart Order Last Week
                </h3>
                <!-- card tools -->
                <div class="card-tools">
                  <button type="button"
                          class="btn btn-primary btn-sm"
                          data-card-widget="collapse"
                          data-toggle="tooltip"
                          title="Collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
                <!-- /.card-tools -->
              </div>
              <div class="card-body">
                      <div style="width:100%;">
                      {!! $Chart->container() !!}
                      </div>
              </div>
            </div>
          </div>
        <div class="col-lg-6">
          <div class="card card-info">
            <div class="card-header">
              <h3 class="card-title">All User</h3>
                    <div class="card-tools">
                      <span class="badge badge-danger">Total:</span>
                      <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                    </div>
            </div>
                  <div class="card-body">
                      <div style="width:100%;">
                        {!! $ChartUser->container() !!}
                      </div>
                  </div>
          </div>
          </div> 
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>

@endsection