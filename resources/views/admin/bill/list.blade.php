@extends('admin.master')
@section('content')
<div class="col-lg-12">
    <h1 class="page-header">Bill
        <small>List Bill</small>
    </h1>
</div>
<!-- /.col-lg-12 -->
<section class="content">
    <div class="row">
        <div class="col-12">
                <div class="card card-primary">
                    <div class="card-header">
                    <h3 class="card-title">List Bills</h3>
                </div>
            <div class="card-body">  
                <table id="example1" class="table table-bordered table-hover">
                    <thead>
                        <tr align="center">
                            <th>ID</th>
                            <th>Customer</th>
                            <th>Address</th>
                            <th>Date Order</th>
                            <th>Email</th>
                            <th>Note</th>
                            <th>Status</th>
                            <th>Action</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $stt = 0 ?>
                        @foreach($customer as $item)
                        <?php $stt = $stt + 1 ?>
                        <tr class="" align="center">
                            <td>{!! $stt !!}</td>
                            <td>{!! $item->fullname !!}</td>
                            <td>{!! $item->address !!}</td>
                            <td>{!! $item->date_order !!}</td>
                            <td>{!! $item->email !!}</td>
                            <td>{!! $item->note !!}</td>
                            <td>
                                @if($item->status == 0)
                                    New Order
                                @elseif($item->status == 1)
                                    Not Delivered Yet
                                @elseif($item->status == 2)
                                    Shipped
                                @elseif($item->status == 3)
                                    Delivered
                                @endif
                            </td>
                            <td class="center"><a class="btn btn-danger" href="{!! URL::route('admin.bill.getEdit', $item->id) !!}">Detail</a></td>
                            <td class="center"><a class="btn btn-primary" onclick=" return xacnhanxoa('Are you sure you want to delete?')" href="{!! URL::route('admin.bill.getDelete', $item->id) !!}">Delete</a></td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
      <!-- /.container-fluid -->
</section>
    
<!-- /.content -->
@section('script')

@endsection()

@endsection()