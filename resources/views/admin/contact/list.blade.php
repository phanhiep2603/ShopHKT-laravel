@extends('admin.master')
@section('content')
<div class="col-lg-12">
    <h1 class="page-header">Mailbox
        <small>List Mail</small>
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
                    <h3 class="card-title">List Contacts</h3>
                </div>
                <div class="card-body">
                    <table class="table table-striped table-bordered table-hover" id="example1">
                        <thead>
                            <tr align="center">
                                <th>ID</th>
                                <th>Customer</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Date Contact</th>
                                <th>Note</th>
                                <th>Status</th>
                                <th>Action</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($contact as $key => $item)
                            <tr class="" align="center">
                                <td>{!! $key + 1 !!}</td>
                                <td>{!! $item->name !!}</td>
                                <td>{!! $item->email !!}</td>
                                <td>{!! $item->phone !!}</td>
                                <td>{!! $item->date_contact !!}</td>
                                <td>{!! $item->note !!}</td>
                                <td>
                                    @if($item->status == 0)
                                        New Mail
                                    @elseif($item->status == 1)
                                        Seen
                                    @elseif($item->status == 2)
                                        Solve
                                    @endif

                                </td>
                                <td class="center"><a class="btn btn-primary" href="{!! URL::route('admin.contact.getEdit', $item->id) !!}">Detail</a></td>
                                <td class="center"><a class="btn btn-danger" id="delete" href="javascript:" ref="{{$item->id}}" ref1="delete">Delete</a></td>
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