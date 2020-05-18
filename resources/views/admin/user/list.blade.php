@extends('admin.master')
@section('content')
<div class="col-lg-12">
    <h1 class="page-header">User
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
                    <h3 class="card-title">List Users</h3>
                </div>
                <div class="card-body">
                <table class="table table-striped table-bordered table-hover" id="example1">
                    <thead>
                        <tr align="center">
                            <th>ID</th>
                            <th>Username</th>
                            <th>Level</th>
                            <th>Status</th>
                            <th>Delete</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $stt = 0 ?>
                        @foreach($user as $item)
                        <?php $stt = $stt + 1 ?>
                        <tr class="odd gradeX" align="center">
                            <td>{!! $stt !!}</td>
                            <td>{!! $item["username"] !!}</td>
                            <td>
                                @if($item["id"] == 1)
                                    SupperAdmin
                                @elseif($item["level"] == 1)
                                    Admin
                                @else
                                    Member
                                @endif
                            </td>
                            <td>
                                @if($item->isOnline())
                                    <img src="{!! url('public/user/img/online.png') !!}" width="10" height="10"> Online
                                @else
                                    <img src="{!! url('public/user/img/offline.png') !!}" width="10" height="10"> Offline
                                @endif
                            </td>
                            <td class="center"><a class="btn btn-danger" onclick=" return xacnhanxoa('Are you sure you want to delete?')" href="{!! URL::route('admin.user.getDelete', $item['id']) !!}"> Delete</a></td>
                            <td class="center"><a class="btn btn-primary" href="{!! URL::route('admin.user.getEdit', $item['id']) !!}">Edit</a></td>
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