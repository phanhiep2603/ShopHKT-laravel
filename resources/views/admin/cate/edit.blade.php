@extends('admin.master')
@section('content')
<div class="col-lg-12">
    @include('admin.blocks.error')
    <h1 class="page-header">Category
        <small>Edit</small>
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
                    <h3 class="card-title">Edit Category</h3>
                </div>
                <div class="card-body">
                    <div class="col-lg-7" style="padding-bottom:120px">
                        <form action="" method="POST">
                            <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                            <div class="form-group">
                                <label>Category Parent</label>
                                <select class="form-control" name="sltParent">
                                    <option value="0">Please Choose Category</option>
                                    <?php cate_parent($parent,0,"--",$data["parent_id"]); ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Category Name</label>
                                <input class="form-control" name="txtCateName" placeholder="Please Enter Category Name" value="{!! old('txtCateName',isset($data) ? $data['name'] : null) !!}" required />
                            </div>
                            <div class="form-group">
                                <label>Category Keywords</label>
                                <input class="form-control" name="txtKeywords" placeholder="Please Enter Category Keywords" value="{!! old('txtKeywords',isset($data) ? $data['keywords'] : null) !!}" required/>
                            </div>
                            <div class="form-group">
                                <label>Category Description</label>
                                <textarea class="form-control" rows="3" name="txtDescription" required>{!! old('txtDescription',isset($data) ? $data['description'] : null) !!}</textarea>
                            </div>
                            <button type="submit" class="btn btn-danger">Category Edit</button>
                            <button type="reset" class="btn btn-warning">Reset</button>
                        <form>
                    </div>
                <!--/.col (right) -->
            </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
@endsection()