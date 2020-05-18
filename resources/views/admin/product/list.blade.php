@extends('admin.master')
@section('content')
<div class="col-lg-12">
    <h1 class="page-header">Product
        <small>List</small>
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
                    <h3 class="card-title">List Products</h3>
                </div>
                <div class="card-body">
                        <table class="table table-bordered table-striped" id="example1">
                            <thead>
                                <tr align="center">
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Price Sale</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                    <th>Category</th>
                                    <th>Delete</th>
                                    <th>Edit</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $stt = 0 ?>
                                @foreach($data as $item)
                                <tr class="odd gradeX" align="center">
                                    <td>{!! $stt = $stt + 1 !!}</td>
                                    <td>{!! $item["name"] !!}</td>
                                    <td>{!! number_format($item["price"],0,",",".") !!} $</td>
                                    <td>{!! number_format($item["price_new"],0,",",".") !!} $</td>
                                    <td>{!! $item['status']=='1' ? 'OverStock' : 'Out of Stock'!!}</td>
                                    <td>{!! \Carbon\Carbon::createFromTimestamp(strtotime($item["created_at"]))->diffForHumans(); !!}</td>
                                    <td>
                                        <?php $cate = DB::table('categories')->where('id',$item["cate_id"])->first(); ?>
                                        @if(!empty($cate->name))
                                            {!! $cate->name !!}
                                        @endif
                                    </td>
                                    <td class="center"><a class="btn btn-danger" onclick=" return xacnhanxoa('Are you sure you want to delete?')" href="{!! URL::route('admin.product.getDelete', $item['id']) !!}"> Delete</a></td>
                                    <td class="center"><a class="btn btn-primary" href="{!! URL::route('admin.product.getEdit', $item['id']) !!}">Edit</a></td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
@endsection()