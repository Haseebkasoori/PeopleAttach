<?php

namespace App\Http\Controllers;
use App\Mail\testMail;
use Illuminate\Support\Facades\Mail;

use Illuminate\Http\Request;

class MailController extends Controller
{
    public function sendMail(){
 //echo "Helllo";
        $details = [
            'title' => "EMail Sending",
            'body' => "Body"
        ];
        //echo "enter";
        Mail::to("sumailaabbas123@gmail.com")->send(new testMail($details));
        return "Email sent successfully!";
    }
}
