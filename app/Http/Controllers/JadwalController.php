<?php

namespace App\Http\Controllers;

use App\Models\JadwalSesi;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class JadwalController extends Controller
{
    public function index()
    {
        $jadwal = JadwalSesi::all();
        $no = 1;
        return view('jadwal.index', compact(['jadwal', 'no']));
    }

    public function insert()
    {
        return view('jadwal.insert');
    }

    public function store(Request $request)
    {
        $validate = Validator::make($request->all(),[
            'nama_sesi'      => 'required',
            'start'          => 'required',
            'finish'         => 'required'
        ], [
            'nama_sesi.required'     => 'Nama Harus Diisi!',
            'start.required'         => 'Email Harus Diisi!',
            'finish.required'        => 'Asal Kota Harus Diisi!'
        ]);

        if($validate->fails()){
            Session::put('sweetalert', 'warning');
            return redirect()->back()->with('alert', 'Gagal Mengubah Data Pelatih!')->withErrors($validate);
        }

        JadwalSesi::insert([
            'nama_sesi'     => $request->nama_sesi,
            'start'         => $request->start,
            'finish'        => $request->finish,
            'created_at'    => Carbon::now(),
            'updated_at'    => Carbon::now()
        ]);

        Session::put('sweetalert', 'success');
        return redirect()->route('a.jadwal')->with('alert', 'Sukses Menambahkan Data');
    }

    public function edit($id)
    {
        $jadwalsesi = JadwalSesi::find($id);
        return view('jadwal.edit', compact(['jadwalsesi']));
    }

    public function update(Request $request, $id)
    {
        $validate = Validator::make($request->all(),[
            'nama_sesi'              => 'required',
            'start'             => 'required',
            'finish'         => 'required'
        ], [
            'nama_sesi.required'             => 'Nama Harus Diisi!',
            'start.required'            => 'Email Harus Diisi!',
            'finish.required'        => 'Asal Kota Harus Diisi!'
        ]);

        if($validate->fails()){
            Session::put('sweetalert', 'warning');
            return redirect()->back()->with('alert', 'Gagal Mengubah Data Pelatih!')->withErrors($validate);
        }

        JadwalSesi::where('id', $id)->update([
            'nama_sesi'     => $request->nama_sesi,
            'start'         => $request->start,
            'finish'        => $request->finish,
            'updated_at'    => Carbon::now()
        ]);

        Session::put('sweetalert', 'success');
        return redirect()->route('a.jadwal')->with('alert', 'Sukses Mengedit Data');
    }

    public function destroy($id)
    {
        $jadwal = JadwalSesi::find($id);
        if($jadwal){
            JadwalSesi::where('id', $id)->delete();
        }
    }
}
