<?php

use App\Http\Controllers\AnggotaController;
use App\Http\Controllers\AudienceController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\PelatihController;
use App\Http\Controllers\PemasukkanController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/


Route::get('/', function () {
    return redirect()->route('loginpage');
});

Route::get('login', [LoginController::class, 'index'])->name('loginpage');
Route::post('login', [LoginController::class, 'login'])->name('login');
Route::get('logout', [LoginController::class, 'logout'])->name('logout');

Route::group(['middleware' => ['web', 'auth', 'roles']], function(){
    Route::get('dashboard', [DashboardController::class, 'index'])->name('dashboard');

    Route::group(['roles' => 'Pemilik', 'prefix' => 'Pemilik'], function(){
        // Module Pelatih
        Route::group(['prefix' => 'Pelatih'], function(){
            Route::get('', [PelatihController::class, 'index'])->name('pelatih');
            Route::get('detail/{id}', [PelatihController::class, 'detail'])->name('pelatih.detail');
        });

        // Module Anggota
        Route::group(['prefix' => 'Anggota'], function(){
            Route::get('', [AnggotaController::class, 'index'])->name('anggota');
            Route::get('detail/{id}', [AnggotaController::class, 'detail'])->name('anggota.detail');
            // Route::get('data', [AnggotaController::class, 'indexData'])->name('anggota.data');
            // Route::post('', [AnggotaController::class, 'store'])->name('anggota.add');
            // Route::get('{uuid}', [AnggotaController::class, 'edit'])->name('anggota.edit');
            // Route::put('{uuid}', [AnggotaController::class, 'update'])->name('anggota.update');
            // Route::delete('{uuid}', [AnggotaController::class, 'delete'])->name('anggota.delete');
        });

        // Module Audience
        Route::group(['prefix' => 'Audience'], function(){
            Route::get('', [AudienceController::class, 'index'])->name('audience');
            Route::get('detail/{id}', [AudienceController::class, 'detail'])->name('audience.detail');
            // Route::get('data', [AnggotaController::class, 'indexData'])->name('anggota.data');
            // Route::post('', [AnggotaController::class, 'store'])->name('anggota.add');
            // Route::get('{uuid}', [AnggotaController::class, 'edit'])->name('anggota.edit');
            // Route::put('{uuid}', [AnggotaController::class, 'update'])->name('anggota.update');
            // Route::delete('{uuid}', [AnggotaController::class, 'delete'])->name('anggota.delete');
        });

        // Module Pemasukkan
        Route::group(['prefix' => 'Pemasukkan'], function(){
            Route::get('', [PemasukkanController::class, 'index'])->name('pemasukkan');
            // Route::get('data', [AnggotaController::class, 'indexData'])->name('anggota.data');
            // Route::post('', [AnggotaController::class, 'store'])->name('anggota.add');
            // Route::get('{uuid}', [AnggotaController::class, 'edit'])->name('anggota.edit');
            // Route::put('{uuid}', [AnggotaController::class, 'update'])->name('anggota.update');
            // Route::delete('{uuid}', [AnggotaController::class, 'delete'])->name('anggota.delete');
        });
    });

    Route::group(['roles' => 'Admin', 'prefix' => 'Admin'], function(){
        // Module Pelatih
        Route::group(['prefix' => 'Pelatih'], function(){
            Route::get('', [PelatihController::class, 'index'])->name('a.pelatih');
            Route::get('data', [PelatihController::class, 'indexData'])->name('a.pelatih.data');
            Route::post('', [PelatihController::class, 'store'])->name('a.pelatih.add');
            Route::get('{uuid}', [PelatihController::class, 'edit'])->name('a.pelatih.edit');
            Route::put('{uuid}', [PelatihController::class, 'update'])->name('a.pelatih.update');
            Route::delete('{uuid}', [PelatihController::class, 'delete'])->name('a.pelatih.delete');
        });
    });
});
