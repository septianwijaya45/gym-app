<?php

namespace App\Http\Controllers;

use App\Models\JadwalSesi;
use App\Models\KelasSenam;
use App\Models\Pelatih;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class KelasSenamController extends Controller
{
    public function index()
    {
        $kelassenam = DB::select("
            SELECT ks.*, concat(js.start, '-', js.finish) as sesi, p.nama as nama_pelatih
            FROM kelas_senams ks, jadwal_sesies js, pelatihs p
            WHERE ks.jadwal_sesi_id = js.id
                AND ks.pelatih_id = p.id
        ");
        $no = 1;
        return view('kelassenam.index', compact(['kelassenam', 'no']));
    }

    public function insert()
    {
        $pelatih = Pelatih::all();
        $jadwalSesi = JadwalSesi::all();
        return view('kelassenam.insert', compact(['pelatih', 'jadwalSesi']));
    }

    public function store(Request $request)
    {
        $validate = Validator::make($request->all(),[
            'jadwal_sesi_id'     => 'required',
            'pelatih_id'         => 'required',
            'nama'               => 'required',
            'harga'               => 'required',
            'diskon'               => 'required',
            'hari'               => 'required',
        ], [
            'jadwal_sesi_id.required'             => 'Nama Harus Diisi!',
            'pelatih_id.required'             => 'Nama Harus Diisi!',
            'nama.required'             => 'Nama Harus Diisi!',
            'harga.required'             => 'Nama Harus Diisi!',
            'diskon.required'             => 'Nama Harus Diisi!',
            'hari.required'             => 'Nama Harus Diisi!',
        ]);

        if($validate->fails()){
            Session::put('sweetalert', 'warning');
            return redirect()->back()->with('alert', 'Gagal Mengubah Data Pelatih!')->withErrors($validate);
        }

        KelasSenam::insert([
            'jadwal_sesi_id'    => $request->jadwal_sesi_id,
            'pelatih_id'        => $request->pelatih_id,
            'nama'              => $request->nama,
            'harga'             => $request->harga,
            'diskon'            => $request->diskon,
            'hari'              => json_encode($request->hari),
            'created_at'        => Carbon::now(),
            'updated_at'        => Carbon::now()
        ]);

        Session::put('sweetalert', 'success');
        return redirect()->route('a.kelassenam')->with('alert', 'Sukses Menambahkan Data');
    }

    public function edit($id)
    {
        $kelassenam = KelasSenam::find($id);
        $pelatih = Pelatih::all();
        $jadwalSesi = JadwalSesi::all();
        return view('kelassenam.edit', compact(['kelassenam', 'pelatih', 'jadwalSesi']));
    }

    public function update(Request $request, $id)
    {
        $validate = Validator::make($request->all(),[
            'jadwal_sesi_id'     => 'required',
            'pelatih_id'         => 'required',
            'nama'               => 'required',
            'harga'               => 'required',
            'diskon'               => 'required',
            'hari'               => 'required',
        ], [
            'jadwal_sesi_id.required'             => 'Nama Harus Diisi!',
            'pelatih_id.required'             => 'Nama Harus Diisi!',
            'nama.required'             => 'Nama Harus Diisi!',
            'harga.required'             => 'Nama Harus Diisi!',
            'diskon.required'             => 'Nama Harus Diisi!',
            'hari.required'             => 'Nama Harus Diisi!',
        ]);

        if($validate->fails()){
            Session::put('sweetalert', 'warning');
            return redirect()->back()->with('alert', 'Gagal Mengubah Data Data!')->withErrors($validate);
        }

        KelasSenam::where('id', $id)->update([
            'jadwal_sesi_id'    => $request->jadwal_sesi_id,
            'pelatih_id'        => $request->pelatih_id,
            'nama'              => $request->nama,
            'harga'             => $request->harga,
            'diskon'            => $request->diskon,
            'hari'              => json_encode($request->hari),
            'updated_at'        => Carbon::now()
        ]);

        Session::put('sweetalert', 'success');
        return redirect()->route('a.kelassenam')->with('alert', 'Sukses Mengubah Data');
    }

    public function destroy($id)
    {
        $kelassenam = KelasSenam::find($id);
        if($kelassenam){
            KelasSenam::where('id', $id)->delete();
        }
    }
}
