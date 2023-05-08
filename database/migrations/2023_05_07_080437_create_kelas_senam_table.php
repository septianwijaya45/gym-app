<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('kelas_senams', function (Blueprint $table) {
            $table->id();
            $table->foreignId('jadwal_sesi_id')
                    ->references('id')
                    ->on('jadwal_sesies')->onUpdate('cascade')->onDelete('cascade');
            $table->foreignId('pelatih_id')
                ->references('id')
                ->on('pelatihs')->onUpdate('cascade')->onDelete('cascade');
            $table->string('nama');
            $table->integer('harga');
            $table->integer('diskon');
            $table->json('hari');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('kelas_senam');
    }
};
