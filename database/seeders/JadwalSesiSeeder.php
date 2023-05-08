<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class JadwalSesiSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('jadwal_sesies')->delete();
        DB::table('jadwal_sesies')->insert([
            [
                'nama_sesi'     => 'Sesi 1',
                'start'         => '08:30',
                'finish'        => '09:30',
                'total_jam'     => 1,
                'created_at'    => Carbon::now(),
                'updated_at'    => Carbon::now()
            ],
            [
                'nama_sesi'     => 'Sesi 2',
                'start'         => '15:00',
                'finish'        => '16:00',
                'total_jam'     => 1,
                'created_at'    => Carbon::now(),
                'updated_at'    => Carbon::now()
            ],
        ]);
    }
}
