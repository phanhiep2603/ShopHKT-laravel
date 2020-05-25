@extends('admin.master')
@section('controller', 'category')
@section('Add','acction')
@section('content')
<div class="col-lg-12">
    @include('admin.blocks.error')
    <h1 class="page-header">Category
        <small>Add</small>
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
                    <h3 class="card-title">Add Category</h3>
                </div>
            <div class="card-body">
                <div class="col-lg-7" style="padding-bottom:120px">
                    <form action="{!! route('admin.cate.getAdd') !!}" method="POST">
                        <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                        <div class="form-group">
                            <label>Category Parent</label>
                            <select class="form-control" name="sltParent">
                                <option value="0">Please Choose Category</option>
                                <?php cate_parent($parent); ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Category Name</label>
                            <input class="form-control" name="txtCateName" placeholder="Please Enter Category Name" required/>
                        </div>
                        <div class="form-group">
                            <label>Category Keywords</label>
                            <input class="form-control" name="txtKeywords" placeholder="Please Enter Category Keywords" required/>
                        </div>
                        <div class="form-group">
                            <label>Category Description</label>
                            <textarea class="form-control" rows="3" name="txtDescription" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Category Add</button>
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