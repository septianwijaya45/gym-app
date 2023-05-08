<?php

namespace App\Http\Controllers;

use App\Models\Pelatih;
use Illuminate\Http\Request;

class PelatihController extends Controller
{
    public function index()
    {
        $pelatih = Pelatih::all();
        $no = 1;
        return view('pelatih.index', compact(['pelatih', 'no']));
    }

    public function detail()
    {
        # code...
    }

    public function insert()
    {
        return view('pelatih.insert');
    }
}
