<?php

namespace App\Http\Controllers\Auth;
use App\Http\Requests\RequestResetPassword;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Alert;
use Illuminate\Http\Request;
use Auth;
use App\User;
use Carbon\Carbon;
use Mail;


class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
    */

    use SendsPasswordResetEmails;

    public function __construct()
    {
        $this->middleware('guest');
    }
    public function getFormResetPassword()
    {
        return view('auth.passwords.email');
    }
    
    public  function postResetPassword(Request $request)
    {
        $email = $request->email;
            
            $user = User::where('email',$email)->first();
        if(!$user)
        {
            Alert::error('Your Email does not exist ', 'Fail!');
          return redirect()->back()->withInput();;

        }else{

            $code = bcrypt(md5(time().$email));
            $user->code = $code;
            $user->time_code = Carbon::now();
            $user->save();
         
            $url = route('get.link.reset.password',['code'=> $user->code,'email'=>$email]);

            $data = [
                'route' => $url
            ];
            Mail::send('email.reset_password', $data, function($message) use($email){
                $message->to($email, 'Visitor')->subject(' Reset Your Pasword ');
            });

            Alert::success('Link reset password sent your E-Mail');
            return redirect('index');
        }
    }
    public function ResetPassword(Request $request)
    {
            $code = $request->code;
            $email = $request->email;
            $user = User::where([
                'code' => $code,
                'email' => $email,
            ])->first();
            
            if(!$user)
            {
                Alert::error('Link reset your Password is wrong, Please try later', 'Sorry!');
                return redirect('/login');
            }
            return view('auth.passwords.reset');
    }
    public function saveRequestPasword(Request $request)
    {
        if ($request->password)
        {
            $code = $request->code;
            $email = $request->email;
                
            $user = User::where([
                'code' => $code,
                'email' => $email,
            ])->first();
           
           
            if(!$user)
            {
                Alert::error('Link reset your Password is wrong, Please try later', 'Sorry!');
                return redirect('/');
            }

            $user->password = Hash::make($request->password);
            $user->save();

            Alert::success('Your password has been successfully changed!, You can login  ');
            return redirect('login');

        }
    }
    
}
