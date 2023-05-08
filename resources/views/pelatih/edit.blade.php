@extends('layouts.app')
@section('title', 'Edit Pelatih')

@section('content')
<div class="content-wrapper">
    @if(Session::has('alert'))
      @if(Session::get('sweetalert')=='success')
        <div class="swalDefaultSuccess">
        </div>
      @elseif(Session::get('sweetalert')=='error')
        <div class="swalDefaultError">
        </div>
        @elseif(Session::get('sweetalert')=='warning')
        <div class="swalDefaultWarning">
        </div>
      @endif
    @endif
    
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Edit Pelatih</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Home</a></li>
                        <li class="breadcrumb-item">Pelatih</li>
                        <li class="breadcrumb-item active">Edit Data</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Edit Pelatih {{$pelatih->nama}}</h3>
                        <div class="card-tools">
                            @if (Auth::user()->role_id == 2)
                                <a href="{{ route('a.pelatih') }}" class="btn btn-warning btn-sm">Kembali</a>
                            @endif
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form action="{{route('a.pelatih.update', $pelatih->id)}}" method="POST" enctype="multipart/form-data" autocomplete="off">
                        @csrf
                        @method('PUT')
                        <div class="card-body">
                            <div class="form-group">
                                <label for="kode">Nama</label>
                                <input type="text" name="nama" class="form-control @error('nama') is-invalid @enderror" id="nama" placeholder="Ketik Nama Pelatih"  value="{{ (old('nama')) ? old('nama') : $pelatih->nama }}">
    
                                @error('nama')
                                    <div class="invalid-feedback">
                                        {{$message}}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="kode">Email</label>
                                <input type="email" name="email" class="form-control @error('email') is-invalid @enderror" id="email" placeholder="Ketik Email Pelatih"  value="{{ (old('email')) ? old('email') : $user->email }}">
    
                                @error('email')
                                    <div class="invalid-feedback">
                                        {{$message}}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="nama">Asal Kota</label>
                                <input type="text" name="asal_kota" id="asal_kota" class="form-control @error('asal_kota') is-invalid @enderror" placeholder="Ketik Asal Kota" value="{{ (old('asal_kota')) ? old('asal_kota') : $pelatih->asal_kota }}">
    
                                @error('asal_kota')
                                    <div class="invalid-feedback">
                                        {{$message}}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="plant">Alamat</label>
                                <textarea name="alamat" id="alamat" cols="10" rows="3" class="form-control @error('alamat') is-invalid @enderror" placeholder="Ketik Alamat Pelatih">{{ (old('alamat')) ? old('alamat') : $pelatih->alamat }}</textarea>
    
                                @error('alamat')
                                    <div class="invalid-feedback">
                                        {{$message}}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="tempat_lahir">Tempat Lahir</label>
                                <input type="text" name="tempat_lahir" id="tempat_lahir" class="form-control @error('tempat_lahir') is-invalid @enderror" placeholder="Ketik Asal Kota" value="{{ (old('tempat_lahir')) ? old('tempat_lahir') : $pelatih->tempat_lahir }}">
    
                                @error('tempat_lahir')
                                    <div class="invalid-feedback">
                                        {{$message}}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="tgl_lahir">Tanggal Lahir</label>
                                <input type="date" name="tgl_lahir" id="tgl_lahir" class="form-control @error('tgl_lahir') is-invalid @enderror" placeholder="Ketik Asal Kota" value="{{ old('tgl_lahir') ? old('tgl_lahir') : $pelatih->tgl_lahir }}">
    
                                @error('tgl_lahir')
                                    <div class="invalid-feedback">
                                        {{$message}}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="jenis_kelamin">Jenis Kelamin</label>
                                <select name="jenis_kelamin" id="jenis_kelamin" class="form-control @error('jenis_kelamin') is-invalid @enderror">
                                    <option value="" selected disabled>Pilih Jenis Kelamin</option>
                                    <option value="Laki-Laki" @if($pelatih->jenis_kelamin == 'Laki-Laki') selected @endif>Laki-Laki</option>
                                    <option value="Perempuan" @if($pelatih->jenis_kelamin == 'Perempuan') selected @endif>Perempuan</option>
                                </select>
    
                                @error('jenis_kelamin')
                                    <div class="invalid-feedback">
                                        {{$message}}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="no_telp">No Telepon</label>
                                <input type="number" name="no_telp" id="no_telp" class="form-control @error('no_telp') is-invalid @enderror" placeholder="Ketik Nomor Telepon" value="{{ (old('no_telp')) ? old('no_telp') : $pelatih->no_telp }}">
    
                                @error('no_telp')
                                    <div class="invalid-feedback">
                                        {{$message}}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="jenis_pelatih">Jenis Pelatih</label>
                                <select name="jenis_pelatih" id="jenis_pelatih" class="form-control @error('jenis_pelatih') is-invalid @enderror">
                                    <option value="" selected disabled>Pilih Jenis Pelatih</option>
                                    <option value="Aerobic Pemula" @if($pelatih->jenis_pelatih == 'Aerobic Pemula') selected @endif>Aerobic Pemula</option>
                                    <option value="Aerobic Koreo" @if($pelatih->jenis_pelatih == 'Aerobic Koreo') selected @endif>Aerobic Koreo</option>
                                    <option value="Yoga" @if($pelatih->jenis_pelatih == 'Yoga') selected @endif>Yoga</option>
                                    <option value="Aerobic Zumba" @if($pelatih->jenis_pelatih == 'Aerobic Zumba') selected @endif>Aerobic Zumba</option>
                                </select>
    
                                @error('jenis_pelatih')
                                    <div class="invalid-feedback">
                                        {{$message}}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="status_kepelatihan">Status Kepelatihan</label>
                                <select name="status_kepelatihan" id="status_kepelatihan" class="form-control @error('status_kepelatihan') is-invalid @enderror">
                                    <option value="" selected disabled>Pilih Status Kepelatihan</option>
                                    <option value="1" @if($pelatih->status_kepelatihan == 1) selected @endif>Aktif</option>
                                    <option value="0" @if($pelatih->status_kepelatihan == 0) selected @endif>Tidak Aktif</option>
                                </select>
    
                                @error('status_kepelatihan')
                                    <div class="invalid-feedback">
                                        {{$message}}
                                    </div>
                                @enderror
                            </div>
                        </div>
                        <!-- /.card-body -->
    
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary w-100">Submit</button>
                        </div>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@stop