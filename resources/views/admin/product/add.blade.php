@extends('admin.master')
@section('content')
<style type="text/css">
    #insertSize {
        margin-top: 50px;
    }
</style>
<div class="col-lg-12">
    @include('admin.blocks.error')
    <h1 class="page-header">Product
        <small>Add</small>
    </h1>
</div>
<!-- /.col-lg-12 -->
<section class="content">
        <div class="col-lg-12">
            <div class="card card-primary">
                    <div class="card-header">
                    <h3 class="card-title">Add Product</h3>
                    </div>
                <div class="card-body">
                    <form action="{!! url('/admin/product/add') !!}" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                                <div class="form-group">
                                    <label>Category Parent</label>
                                    <select class="form-control" name="sltParent">
                                        <option value="">Please Choose Category</option>
                                        <?php cate_parent($cate,0,"--",old('sltParent')); ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input class="form-control" name="txtName" placeholder="Please Enter Product Name" value="{!! old('txtName') !!}" required />
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input class="form-control" name="txtPrice" placeholder="Please Enter Product Price" value="{!! old('txtPrice') !!}" required />
                                </div>
                                <div class="form-group">
                                    <label>Intro</label>
                                    <textarea class="form-control" rows="3" name="txtIntro" required>{!! old('txtIntro') !!}</textarea>
                                    <script type="text/javascript">CKEDITOR.replace("txtIntro")</script>
                                </div>
                                <div class="form-group">
                                    <label>Content</label>
                                    <textarea class="form-control" rows="3" name="txtContent" required>{!! old('txtContent') !!}</textarea>
                                    <script type="text/javascript">CKEDITOR.replace("txtContent")</script>
                                </div>
                                <div class="form-group">
                                    <label>Images</label>
                                    <input type="file" name="fImages" value="{!! old('fImages') !!}" required>
                                </div>
                                <div class="form-group">
                                    <label>Product Keywords</label>
                                    <input class="form-control" name="txtKeywords" placeholder="Please Enter Product Keywords" value="{!! old('txtKeywords') !!}" required />
                                </div>
                                <div class="form-group">
                                    <label>Product Description</label>
                                    <textarea class="form-control" rows="3" name="txtDescription" placeholder="Please Enter Product Description" required>{!! old('txtDescription') !!}</textarea>
                                    <script type="text/javascript">CKEDITOR.replace("txtDescription")</script>
                                </div>
                                
                                @for($i = 1; $i <= 5 ; $i++)
                                <div class="form-group">
                                    <label>Product Image Detail {!! $i !!}</label>
                                    <input type="file" name="fProductDetail[]"/>
                                </div>
                                @endfor
                                <div id="insertSize"></div>
                                <button type="button" id="addSizes" class="btn btn-primary" required>Add Sizes</button>
                                <div><br></div>

                                <button type="submit" class="btn btn-danger">Product Add</button>
                                <button type="reset" class="btn btn-warning">Reset</button> 
                    </form>
                </div>
            </div>
               
        </div>
        <!-- /.row -->
</section>
    <!-- /.content -->

@endsection()