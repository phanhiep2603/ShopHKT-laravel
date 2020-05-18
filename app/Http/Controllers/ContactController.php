<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use Alert;
use App\Order_detail;
use App\Contact;
use DB;

class ContactController extends Controller
{
    public function getList() {
    	$contact = DB::table('contacts')->orderBy('id','DESC')->get();
		return view('admin.contact.list',compact('contact'));
		
	}
	public function getEdit($id){
        $customerInfo = DB::table('contacts')
        ->select('contacts.*','contacts.name as name','contacts.email as email','contacts.phone as phone','contacts.note as note')
        ->orderBy('contacts.id','desc')
        ->where('contacts.id', '=', $id)
        ->first();
		return view('admin.contact.detail',compact('customerInfo'));
	}
	public function postEdit(Request $request, $id)
    {
        $bill = Contact::find($id);
        $bill->status = $request->input('status');
        $bill->save();
        return redirect()->route('admin.contact.list')->with(['flash_level'=>'success','flash_message'=>'Update Order Complete Success!']);
    }
    public function getDelete($id)
    {
        $bill = Contact::find($id);
        $bill->delete();
        return redirect()->route('admin.contact.list')->with(['flash_level'=>'success','flash_message'=>'Delete Order Complete Success!']);
    }
}
