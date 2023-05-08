<?php

namespace App\Http\Controllers;

use App\Models\Anggota;
use Illuminate\Http\Request;

class AnggotaController extends Controller
{
    public function index()
    {
        $anggota = Anggota::all();
        $no = 1;
        return view('anggota.index', compact(['anggota', 'no']));
    }

    public function detail()
    {
        # code...
    }
}
