@extends('admin.master')
@section('content')
<div class="col-lg-12">
    <h1 class="page-header">Category
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
                    <h3 class="card-title">List Category</h3>
                </div>
            <div class="card-body">
                <table class="table table-striped table-bordered table-hover" id="example1">
                    <thead>
                        <tr align="center">
                            <th>ID</th>
                            <th>Name</th>
                            <th>Category Parent</th>
                            <th>Delete</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $stt = 0 ?>
                        @foreach($data as $item)
                        <?php $stt = $stt + 1 ?>
                        <tr class="odd gradeX" align="center">
                            <td>{!! $stt !!}</td>
                            <td>{!! $item["name"] !!}</td>
                            <td>
                                @if($item["parent_id"] == 0)
                                    {!! "None" !!}
                                @else
                                <?php
                                    $parent = DB::table('categories')->where('id',$item["parent_id"])->first();
                                    echo $parent->name;
                                ?>
                                @endif
                            </td>
                            <td class="center"><a class="btn btn-danger" id="delete" href="javascript:" ref="{{ $item['id'] }}" ref1="delete"> Delete</a></td>
                            <td class="center"><a class="btn btn-primary" href="{!! URL::route('admin.cate.getEdit', $item['id']) !!}">Edit</a></td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
<!-- /.content -->
@endsection()