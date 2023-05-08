<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JadwalSesi extends Model
{
    use HasFactory;
    protected $table = 'jadwal_sesies';
    protected $fillable = [
        'nama_sesi', 'start', 'finish', 'total_jam'
    ];
}
