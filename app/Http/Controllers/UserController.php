<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Http\Requests\UserRequest;
use App\Http\Requests\LoginRequest;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use App\Charts\UserChart;
use App\User;
use Hash;
use Auth;
use Alert;
use App\Order;
use App\Order_detail;
use App\Contact;
use App\Product;
use DB;
use Carbon\Carbon;

class UserController extends Controller
{	use AuthenticatesUsers;
    public function getList(){
    	$user = User::all();
    	return view('admin.user.list',compact('user'));
    }
    public function getAdd(){
    	return view('admin.user.add');
    }
    public function getDangnhapAdmin(){
	return view('admin.login');
    }
    public function getDashboard()
    {
	
	$count_order = DB::table('orders')->where('status',0)->get();
	$count_mail = DB::table('contacts')->where('status',0)->get();
	$count_user = DB::table('users')->where('status',0)->get();
	$count_product = DB::table('products')->where('status',1)->get();
	$order = DB::table('orders')
		->join('users','users.id','=','orders.user_id')
		->select('users.fullname','users.phone','users.email','users.address','orders.date_order','orders.total','orders.note','orders.status')
		->get();
	$totaltoday =0;
	$totalweek = 0;
	$totalmonth = 0;
	$now = Carbon::now();
	$week = Carbon::now()->addWeek(-1);
	$month = Carbon::now()->addMonth(-1);

	$billtoday = DB::table('orders')->where('status',3)->whereDate('date_order', today())->get();
	$billweek = DB::table('orders')->where('status',3)->whereBetween('date_order',[$week,$now])->get();
	$billmonth = DB::table('orders')->where('status',3)->whereBetween('date_order',[$month,$now])->get();
	foreach($billtoday as $today)
	{
		$totaltoday +=$today->total;
	}
	foreach($billweek as $week)
	{
		$totalweek +=$week->total;
	}
	foreach($billmonth as $month)
	{
		$totalmonth +=$month->total;
	}

	$data_order = collect([]);
	for ($days_backwards = 7; $days_backwards >= 0; $days_backwards--) {
		$data_order->push(Order::whereDate('created_at', today()->subDays($days_backwards))->count());
	    }

	$Chart = new UserChart;
        $Chart->labels(['7 day ago','6 day ago','5 day ago','4 day ago','3 day ago','2 day ago', 'Yesterday', 'Today']);
	$Chart->dataset('Orders of Last week', 'bar', $data_order )
			->options([
				'borderColor' => '#ff0000',
				'borderWidth' => 1,
				'backgroundColor' => [
				'rgba(255, 99, 132, 1)',
				'rgba(54, 162, 235, 1)',
				'rgba(255, 206, 86, 1)',
				'rgba(75, 192, 192, 1)',
				'rgba(153, 102, 255, 1)',
				'rgba(255, 159, 64, 1)',
				'rgba(253, 23, 23, 1)'
				],
				]);
	$Chart->height(500);
	
	$now1 = Carbon::now();
	$week1 = Carbon::now()->addWeek(-1);
	$month1 = Carbon::now()->addMonth(-1);

	$today_user = DB::table('users')->where('level',2)->whereDate('created_at', today())->count();
	$lastweek_user = DB::table('users')->where('level',2)->whereBetween('created_at',[$week1,$now1])->count();
	$lastmonth_user = DB::table('users')->where('level',2)->whereBetween('created_at',[$month1,$now1])->count();
		
	
	$ChartUser = new UserChart;
        $ChartUser->labels(['Last Month', 'Last Week', 'Today']);
	$ChartUser->dataset('Users', 'pie',[$lastmonth_user,$lastweek_user,$today_user] )
			->options([
				'borderColor' => '#ff0000',
				'borderWidth' => 1,
				'backgroundColor' => [
				'rgba(255, 99, 132, 1)',
				'rgba(75, 192, 192, 1)',
				'rgba(255, 159, 64, 1)',
				],
				]);
	$ChartUser->height(500);

	return view('admin.dashboard',compact('count_order','count_mail','count_user','count_product','order','totalweek','totalmonth',
	'totaltoday','Chart','ChartUser'));
    }

    public function postDangnhapAdmin(LoginRequest $request){
	if(Auth::attempt(['username'=>$request->txtUsername,'password'=>$request->txtPass], $request->remember))
	{	
		Alert::success('Login Success, Welcome');
		return redirect('admin/dashboard');
	}
	else
	{
		
		Alert::error('Your Username or Password incorrect', 'Login Fail!');
		return redirect('admin/login')->withInput();;
	}
    }
    public function postAdd(UserRequest $request){
    	$user = new User();
    	$user->username = $request->txtUser;
    	$user->fullname = $request->txtFName;
    	$user->email = $request->txtEmail;
    	$user->password = Hash::make($request->txtPass);
    	$user->gender = $request->rdoGender;
    	$user->address = $request->txtAddress;
    	$user->phone = $request->txtPhone;
    	$user->level = $request->rdoLevel;
    	$user->status = "Offline";
	$user->remember_token = $request->_token;
    	$user->save();
    	return redirect()->route('admin.user.list')->with(['flash_level'=>'success','flash_message'=>'Add User Complete Success!']);
    }
    public function getDelete($id){
    	$user_current_login = Auth::user()->id;
    	$user = User::find($id);
    	if (($id == 1) || ($user_current_login != 1 && $user["level"] == 1)) {
    		return redirect()->route('admin.user.list')->with(['flash_level'=>'danger','flash_message'=>'Access Denied!']);
    	}else{
    		$user->delete($id);
    		return redirect()->route('admin.user.list')->with(['flash_level'=>'success','flash_message'=>'Delete User Complete Success!']);
    	}
    }
    public function getEdit($id){
    	$user_edit = User::find($id);
    	if ((Auth::user()->id != 1) && ($id == 1 || ($user_edit['level'] == 1 && (Auth::user()->id != $id)))) {
    		return redirect()->route('admin.user.list')->with(['flash_level'=>'danger','flash_message'=>'Access Denied!']);
    	}
    	return view('admin.user.edit',compact('user_edit','id'));
    }
    public function postEdit($id,Request $request){
    	$user = User::find($id);
    	if($request->input('txtPass')){
    		$this->validate($request,
    			[
    				'txtRePass' => 'required|same:txtPass'
    			],
    			[
    				'txtRePass.required' => 'Please Enter RePassword',
            		'txtRePass.same'    => 'Two Password Don\'t Match'
    			]
    		);
    		$pass = $request->input('txtPass');
    		$user->password = Hash::make($pass);
    	}
    	$user->fullname = $request->txtFName;
    	$user->email = $request->txtEmail;
    	$user->gender = $request->rdoGender;
    	$user->address = $request->txtAddress;
    	$user->phone = $request->txtPhone;
    	if($request->input('rdoLevel')){
    		$user->level = $request->rdoLevel;
  		}
    	$user->save();
    	return redirect()->route('admin.user.list')->with(['flash_level'=>'success','flash_message'=>'Edit User Complete Success!']);
    }
}
