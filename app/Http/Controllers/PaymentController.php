<?php

namespace App\Http\Controllers;

use App\Models\PendaftaranKelas;
use Illuminate\Http\Request;
use Midtrans\Config;
use Midtrans\Notification;
use App\Services\Midtrans\CreateSnapTokenService; 

class PaymentController extends Controller
{
    public function process(PendaftaranKelas $pendaftaranKelas)
    {
        $snapToken = $pendaftaranKelas->snap_token;
         if (is_null($snapToken)) {
             // If snap token is still NULL, generate snap token and save it to database

             $midtrans = new CreateSnapTokenService($pendaftaranKelas);
             $snapToken = $midtrans->getSnapToken();

             $pendaftaranKelas->snap_token = $snapToken;
             $pendaftaranKelas->save();
         }

         return view('orders.show', compact('order', 'snapToken'));
    }

    public function notification(Request $request)
    {
        // Handle Midtrans notification
        $notification = new Notification();
        $status = $notification->transaction_status;
        $orderId = $notification->order_id;

        // Process the notification and update your database
        // ...

        return response('OK');
    }
}
