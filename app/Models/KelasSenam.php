<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KelasSenam extends Model
{
    use HasFactory;
    protected $table = 'kelas_senams';
    protected $fillable = [
        'jadwal_sesi_id', 'pelatih_id', 'nama', 'harga', 'diskon', 'hari'
    ];
}
