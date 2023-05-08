<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class KelasSenamSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('kelas_senams')->delete();
        DB::table('kelas_senams')->insert([
            [
                'jadwal_sesi_id'       => 2,
                'pelatih_id'            => 1,
                'nama'                  => 'Aerobic Pemula',
                'harga'                 => 120000,
                'diskon'                => 10,
                'hari'                  => json_encode(['Senin', 'Sabtu']),
                'created_at'            => Carbon::now(),
                'updated_at'            => Carbon::now()
            ],
            [
                'jadwal_sesi_id'       => 1,
                'pelatih_id'            => 2,
                'nama'                  => 'Aerobic Koreo',
                'harga'                 => 120000,
                'diskon'                => 10,
                'hari'                  => json_encode(['Rabu', 'Minggu']),
                'created_at'            => Carbon::now(),
                'updated_at'            => Carbon::now()
            ],
            [
                'jadwal_sesi_id'       => 2,
                'pelatih_id'            => 3,
                'nama'                  => 'Yoga',
                'harga'                 => 10000,
                'diskon'                => 0,
                'hari'                  => json_encode(['Kamis']),
                'created_at'            => Carbon::now(),
                'updated_at'            => Carbon::now()
            ],
            [
                'jadwal_sesi_id'       => 1,
                'pelatih_id'            => 4,
                'nama'                  => 'Aerobic Zumba',
                'harga'                 => 120000,
                'diskon'                => 10,
                'hari'                  => json_encode(['Jumat']),
                'created_at'            => Carbon::now(),
                'updated_at'            => Carbon::now()
            ],
        ]);
    }
}
