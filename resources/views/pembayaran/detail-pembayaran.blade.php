@extends('layouts.app')
@section('title', 'Detail Pembayaran')

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
                    <h1 class="m-0">Detail Pembayaran</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Home</a></li>
                        <li class="breadcrumb-item">Pembayaran</li>
                        <li class="breadcrumb-item active">Detail Pembayaran</li>
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
                        <h3 class="card-title">Detail Pembayaran</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    {{-- <form action="{{route('m.pembayaranCheckout', $id)}}" method="POST" enctype="multipart/form-data" autocomplete="off"> --}}
                        {{-- @csrf --}}
                        <div class="card-body">
                            <div class="form-group">
                                <label for="kode">Nama Kelas</label>
                                <input type="text" name="nama" class="form-control" id="nama" placeholder="Ketik Nama Pelatih"  value="{{$dtPembayaran->nama_kelas}}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="kode">Harga Kelas</label>
                                <input type="text" name="nama" class="form-control" id="nama" placeholder="Ketik Nama Pelatih"  value="{{$dtPembayaran->harga}}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="kode">Sesi Kelas</label>
                                <input type="text" name="nama" class="form-control" id="nama" placeholder="Ketik Nama Pelatih"  value="{{$dtPembayaran->nama_sesi}}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="kode">Jam Kelas</label>
                                <input type="text" name="nama" class="form-control" id="nama" placeholder="Ketik Nama Pelatih"  value="{{$dtPembayaran->jam}}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="kode">Nama Pelatih</label>
                                <input type="text" name="nama" class="form-control" id="nama" placeholder="Ketik Nama Pelatih"  value="{{$dtPembayaran->nama_pelatih}}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="kode">Total Harga</label>
                                <input type="text" name="nama" class="form-control" id="nama" placeholder="Ketik Nama Pelatih"  value="{{$dtPembayaran->total_harga}}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="kode">Diskon</label>
                                <input type="text" name="nama" class="form-control" id="nama" placeholder="Ketik Nama Pelatih"  value="{{$dtPembayaran->diskon}}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="kode">Paket Mulai</label>
                                <input type="text" name="nama" class="form-control" id="nama" placeholder="Ketik Nama Pelatih"  value="{{$dtPembayaran->paket_mulai}}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="kode">Paket Selesai</label>
                                <input type="text" name="nama" class="form-control" id="nama" placeholder="Ketik Nama Pelatih"  value="{{$dtPembayaran->paket_selesai}}" readonly>
                            </div>
                        </div>
                        <!-- /.card-body -->
    
                        <div class="card-footer">
                            <button type="submit" id="pay-button" class="btn btn-primary w-100">Bayar</button>
                        </div>
                    {{-- </form> --}}
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@stop

@section('footer')
<script src="https://app.sandbox.midtrans.com/snap/snap.js" data-client-key="SB-Mid-client-YdopWKHULdZpjv32"></script>
<script type="text/javascript">
    document.getElementById('pay-button').onclick = function(){
        let order = <?= json_encode($dtPembayaran); ?>;
        let member = <?= json_encode($member); ?>;
        let user = <?= json_encode($anggotaUser); ?>;
    // SnapToken acquired from previous step
    snap.pay('<?=$snapToken?>', {
        // Optional
        onSuccess: function(result){
        /* You may add your own js here, this is just example */ 
            // document.getElementById('result-json').innerHTML += JSON.stringify(result, null, 2);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                url: "{{ route('m.payment') }}",
                method: "POST",
                data: {
                    id: <?= $id ?>
                },
                success: function(response){
                    window.location.href = "{{route('m.pembayaran')}}"
                }
            })
        },
        // Optional
        onPending: function(result){
        /* You may add your own js here, this is just example */ 
            // document.getElementById('result-json').innerHTML += JSON.stringify(result, null, 2);
            console.log('masuk pending')
        },
        // Optional
        onError: function(result){
        /* You may add your own js here, this is just example */ 
            // document.getElementById('result-json').innerHTML += JSON.stringify(result, null, 2);
            console.log('masuk sukses')
        }
    });
    };
</script>
@endsection