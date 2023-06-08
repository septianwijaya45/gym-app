<?php

namespace App\Http\Controllers;

use App\Models\Anggota;
use App\Models\Pembayaran;
use App\Models\PendaftaranKelas;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class PembayaranController extends Controller
{
    public function index()
    {
        if(Auth::user()->role_id == 4 || Auth::user()->role_id == 5){
            $pembayaran = DB::select("
                SELECT a.nama as nama_anggota, ks.nama as nama_kelas, p.id, p.total_dibayar, p.bukti_transfer, p.status_konfirmasi
                FROM anggotais a, kelas_senams ks, pembayaran p, pendaftaran_kelases pk
                WHERE a.id = p.anggota_id AND pk.id = p.pendaftaran_kelas_id AND ks.id = pk.kelas_senam_id AND pk.user_id = '".Auth::user()->id."'
            ");

            $belumDibayar = DB::select("
                SELECT ks.nama as nama_kelas, ks.harga, js.nama_sesi, CONCAT(js.start, ' - ', js.finish) as jam, p.nama as nama_pelatih, pk.total_harga, CONCAT(pk.persen_diskon, ' | ', pk.total_diskon) as diskon, pk.status_pembayaran, pk.paket_mulai, pk.paket_selesai, pk.id
                FROM pendaftaran_kelases pk , kelas_senams ks, jadwal_sesies js, pelatihs p
                WHERE  pk.kelas_senam_id = ks.id AND ks.jadwal_sesi_id = js.id AND ks.pelatih_id = p.id
                    AND pk.user_id = '".Auth::user()->id."'
            ");
            $no = 1;
            $noBP = 1;
            return view('pembayaran.index', compact(['pembayaran', 'no', 'belumDibayar', 'noBP']));
        }else{
            $pembayaran = DB::select("
                SELECT a.nama as nama_anggota, ks.nama as nama_kelas, p.id, p.total_dibayar, p.bukti_transfer, p.status_konfirmasi
                FROM anggotais a, kelas_senams ks, pembayaran p, pendaftaran_kelases pk
                WHERE a.id = p.anggota_id AND pk.id = p.pendaftaran_kelas_id AND ks.id = pk.kelas_senam_id
            ");
            $belumDibayar = [];
            $no = 1;
            $noBP = 1;
            return view('pembayaran.index', compact(['pembayaran', 'belumDibayar', 'no', 'noBP']));
        }

    }

    public function detailPembayaran($id)
    {
        $dtPembayaran = PendaftaranKelas::join('kelas_senams', 'kelas_senams.id', '=', 'pendaftaran_kelases.kelas_senam_id')
                        ->join('jadwal_sesies', 'jadwal_sesies.id', '=', 'kelas_senams.jadwal_sesi_id')
                        ->join('pelatihs', 'pelatihs.id', '=', 'kelas_senams.pelatih_id')
                        ->select("kelas_senams.nama as nama_kelas", DB::raw("CONCAT('Rp ', kelas_senams.harga) as harga"), "jadwal_sesies.nama_sesi", DB::raw("CONCAT(jadwal_sesies.start, ' - ', jadwal_sesies.finish) as jam"), "pelatihs.nama as nama_pelatih", DB::raw("CONCAT('Rp ', pendaftaran_kelases.total_harga) as total_harga"), DB::raw("CONCAT(pendaftaran_kelases.persen_diskon, '%', ' | ', 'Rp ', pendaftaran_kelases.total_diskon) as diskon"), "pendaftaran_kelases.status_pembayaran", "pendaftaran_kelases.paket_mulai", "pendaftaran_kelases.paket_selesai", "pendaftaran_kelases.id", "pendaftaran_kelases.total_harga as t_harga", "pendaftaran_kelases.total_diskon as t_diskon")
                        ->first();
        $anggota = Anggota::where('user_id', Auth::user()->id)->first();
        $anggotaUser = User::where('id', Auth::user()->id)->first();

        $name = explode(" ", $anggota->nama);
        if(count($name) > 1){
            $lastName = array_pop($name);
            $firstName = implode(" ", $name);
        }else{
            $firstName = $anggota->nama;
            $lastName = '';
        }

        // Set your Merchant Server Key
        \Midtrans\Config::$serverKey = 'SB-Mid-server-V1UK_TucGXhatg0QgVEcz4JT';
        // Set to Development/Sandbox Environment (default). Set to true for Production Environment (accept real transaction).
        \Midtrans\Config::$isProduction = false;
        // Set sanitization on (default)
        \Midtrans\Config::$isSanitized = true;
        // Set 3DS transaction for credit card to true
        \Midtrans\Config::$is3ds = true;

        $member = [
            'first_name'       => $firstName,
            'last_name'        => $lastName,
            'email'            => $anggotaUser->email,
            'phone'            => $anggota->no_telp,
            'billing_address'  => $anggota->alamat
            // 'shipping_address' => $shipping_address
        ];

        $hargaDiskon = intval($dtPembayaran->t_harga) - intval($dtPembayaran->t_diskon);

        $params = [
            'transaction_details' => array(
                'order_id' => rand(),
                'gross_amount'  => $hargaDiskon,
            ),
            // 'item_details'        => $items,
            'customer_details'    => $member
        ];

        $snapToken = \Midtrans\Snap::getSnapToken($params);

        return view('pembayaran.detail-pembayaran', compact(['dtPembayaran', 'id', 'snapToken', 'member', 'anggotaUser']));
    }

    public function payment(Request $request)
    {
        $id = $request->id;
        $pendaftaranKelas = PendaftaranKelas::where('id', $id)->first();
        $anggota = Anggota::where('user_id', Auth::user()->id)->first();

        DB::beginTransaction();
        Pembayaran::insert([
            'anggota_id'            => $anggota->id,
            'pendaftaran_kelas_id'  => $pendaftaranKelas->id,
            'total_dibayar'         => $pendaftaranKelas->total_harga - $pendaftaranKelas->total_diskon,
            'status_konfirmasi'     => 0,
            'created_at'            => Carbon::now(),
            'updated_at'            => Carbon::now()
        ]);

        PendaftaranKelas::where('id', $id)->update([
            'status_pembayaran' => 1
        ]);
        DB::commit();

        Session::put('sweetalert', 'success');
        return redirect()->route('m.pembayaran')->with('alert', 'Sukses Menambahkan Data');
    }

    public function acceptPayment($id)
    {
        $pembayaran = Pembayaran::where('id', $id);
        if($pembayaran){
            $pembayaranData = $pembayaran->first();
            PendaftaranKelas::where('id', $pembayaranData->pendaftaran_kelas_id)->update(['status_pembayaran' => 1]);
            $pembayaran->update(['status_konfirmasi' => 1]);
        }
    }

    public function rejectPayment($id)
    {
        $pembayaran = Pembayaran::where('id', $id);
        if($pembayaran){
            $pembayaranData = $pembayaran->first();
            PendaftaranKelas::where('id', $pembayaranData->pendaftaran_kelas_id)->update(['status_pembayaran' => 2]);
            $pembayaran->update(['status_konfirmasi' => 2]);
        }
    }
}
