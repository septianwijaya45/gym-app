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
        Schema::table('pemasukkans', function (Blueprint $table) {
            $table->foreignId('pendaftaran_kelas_id')
                ->references('id')
                ->on('pendaftaran_kelases')
                ->onUpdate('cascade')
                ->onDelete('cascade')
                ->after('user_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('pemasukkans', function (Blueprint $table) {
            //
        });
    }
};
