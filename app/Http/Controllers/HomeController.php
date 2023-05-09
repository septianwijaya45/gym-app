<?php

namespace App\Http\Controllers;

use App\Models\Anggota;
use App\Models\KelasSenam;
use App\Models\Pelatih;
use App\Models\PendaftaranKelas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    public function index()
    {
        $kelasSenin = KelasSenam::join('jadwal_sesies', 'jadwal_sesies.id', '=', 'kelas_senams.jadwal_sesi_id')
                        ->join('pelatihs', 'pelatihs.id', '=', 'kelas_senams.pelatih_id')
                        ->select('jadwal_sesies.start', 'jadwal_sesies.finish', 'kelas_senams.nama as nama_kelas', 'pelatihs.nama as nama_pelatih')
                        ->whereRaw("JSON_CONTAINS(hari, '\"Senin\"')")->get();
        $kelasSelasa = KelasSenam::join('jadwal_sesies', 'jadwal_sesies.id', '=', 'kelas_senams.jadwal_sesi_id')
                        ->join('pelatihs', 'pelatihs.id', '=', 'kelas_senams.pelatih_id')
                        ->select('jadwal_sesies.start', 'jadwal_sesies.finish', 'kelas_senams.nama as nama_kelas', 'pelatihs.nama as nama_pelatih')
                        ->whereRaw("JSON_CONTAINS(hari, '\"Selasa\"')")->get();
        $kelasRabu = KelasSenam::join('jadwal_sesies', 'jadwal_sesies.id', '=', 'kelas_senams.jadwal_sesi_id')
                        ->join('pelatihs', 'pelatihs.id', '=', 'kelas_senams.pelatih_id')
                        ->select('jadwal_sesies.start', 'jadwal_sesies.finish', 'kelas_senams.nama as nama_kelas', 'pelatihs.nama as nama_pelatih')
                        ->whereRaw("JSON_CONTAINS(hari, '\"Rabu\"')")->get();
        $kelasKamis = KelasSenam::join('jadwal_sesies', 'jadwal_sesies.id', '=', 'kelas_senams.jadwal_sesi_id')
                        ->join('pelatihs', 'pelatihs.id', '=', 'kelas_senams.pelatih_id')
                        ->select('jadwal_sesies.start', 'jadwal_sesies.finish', 'kelas_senams.nama as nama_kelas', 'pelatihs.nama as nama_pelatih')
                        ->whereRaw("JSON_CONTAINS(hari, '\"Kamis\"')")->get();
        $kelasJumat = KelasSenam::join('jadwal_sesies', 'jadwal_sesies.id', '=', 'kelas_senams.jadwal_sesi_id')
                        ->join('pelatihs', 'pelatihs.id', '=', 'kelas_senams.pelatih_id')
                        ->select('jadwal_sesies.start', 'jadwal_sesies.finish', 'kelas_senams.nama as nama_kelas', 'pelatihs.nama as nama_pelatih')
                        ->whereRaw("JSON_CONTAINS(hari, '\"Jumat\"')")->get();
        $kelasSabtu = KelasSenam::join('jadwal_sesies', 'jadwal_sesies.id', '=', 'kelas_senams.jadwal_sesi_id')
                        ->join('pelatihs', 'pelatihs.id', '=', 'kelas_senams.pelatih_id')
                        ->select('jadwal_sesies.start', 'jadwal_sesies.finish', 'kelas_senams.nama as nama_kelas', 'pelatihs.nama as nama_pelatih')
                        ->whereRaw("JSON_CONTAINS(hari, '\"Sabtu\"')")->get();
        $kelasMinggu = KelasSenam::join('jadwal_sesies', 'jadwal_sesies.id', '=', 'kelas_senams.jadwal_sesi_id')
                        ->join('pelatihs', 'pelatihs.id', '=', 'kelas_senams.pelatih_id')
                        ->select('jadwal_sesies.start', 'jadwal_sesies.finish', 'kelas_senams.nama as nama_kelas', 'pelatihs.nama as nama_pelatih')
                        ->whereRaw("JSON_CONTAINS(hari, '\"Minggu\"')")->get();

        $countKelas = Count(KelasSenam::all());
        $countPelatih = Count(Pelatih::all());
        $countAnggota = Count(Anggota::all());
        $countTerdaftar = Count(PendaftaranKelas::all());

        $pelatih = DB::select("
            SELECT p.nama, u.image
            FROM pelatihs p, users u
            WHERE u.id = p.user_id
        ");
        return view('home.index', compact([
            'pelatih', 
            'countKelas', 
            'countPelatih', 
            'countAnggota', 
            'countTerdaftar',
            'kelasSenin',
            'kelasSelasa',
            'kelasRabu',
            'kelasKamis',
            'kelasJumat',
            'kelasSabtu',
            'kelasMinggu'
        ]));
    }
}
