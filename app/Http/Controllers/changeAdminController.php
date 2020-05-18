<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\UserRequest;
use App\Http\Requests\LoginRequest;
use App\User;
use Hash;
use Auth;
use Alert;


class changeAdminController extends Controller
{
    public function ChangePassword()
    {
        return view('admin.change');
    }
    public function ChangePasswordSuccessfully(Request $request)
    {         
            $password = $request->password; 
            $user = Auth::user();
            $user->password = Hash::make($request->password);
            $user->save();
            Alert::error('Your Username or Password incorrect', 'Login Fail!');
		    return redirect('admin/dashboard');
        
    }
}
