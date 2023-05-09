<?php

namespace App\Http\Controllers;

use App\Models\Pembayaran;
use App\Models\PendaftaranKelas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PembayaranController extends Controller
{
    public function index()
    {
        $pembayaran = DB::select("
            SELECT a.nama as nama_anggota, ks.nama as nama_kelas, p.id, p.total_dibayar, p.bukti_transfer, p.status_konfirmasi
            FROM anggotais a, kelas_senams ks, pembayaran p, pendaftaran_kelases pk
            WHERE a.id = p.anggota_id AND pk.id = p.pendaftaran_kelas_id AND ks.id = pk.kelas_senam_id
        ");
        $no = 1;

        return view('pembayaran.index', compact(['pembayaran', 'no']));
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
