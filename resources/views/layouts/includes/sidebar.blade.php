 <!-- Main Sidebar Container -->
 <aside class="main-sidebar sidebar-light-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{route('dashboard')}}" class="brand-link">
        <img src="" alt="Gym App" class="brand-image img-circle elevation-3"
            style="opacity: .8">
        <span class="brand-text font-weight-light">Gym App</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="{{Auth::user()->getImage()}}" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="" class="d-block">{{Auth::user()->username}}</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        @if(Auth::user()->role_id == 1)
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">
                    <li class="nav-item">
                        <a href="{{ route('loginpage') }}"
                            class="nav-link {{ request()->is('login') ? ' active' : '' }}">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Dashboard
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('pelatih') }}" class="nav-link">
                            <i class="nav-icon fas fa-user"></i>
                            <p>
                                Pelatih
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('anggota') }}" class="nav-link">
                            <i class="nav-icon fas fa-users"></i>
                            <p>
                                Anggota
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('audience') }}" class="nav-link">
                            <i class="nav-icon fas fa-users"></i>
                            <p>
                                Audience
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('pemasukkan') }}" class="nav-link">
                            <i class="nav-icon fas fa-money-bill"></i>
                            <p>
                                Pemasukkan
                            </p>
                        </a>
                    </li>
                </ul>
            </nav>
        @elseif(Auth::user()->role_id == 2)
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                data-accordion="false">
                    <li class="nav-item">
                        <a href="{{ route('loginpage') }}"
                            class="nav-link {{ request()->is('login') ? ' active' : '' }}">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Dashboard
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-film"></i>
                            <p>
                                Pelatih
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-film"></i>
                            <p>
                                Master Jadwal 
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-film"></i>
                            <p>
                                Master Kelas Senam 
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-film"></i>
                            <p>
                                Pembayaran
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-film"></i>
                            <p>
                                Anggota
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-film"></i>
                            <p>
                                Events
                            </p>
                        </a>
                    </li>
                </ul>
            </nav>
        @elseif(Auth::user()->role_id == 3)
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">
                    <li class="nav-item">
                        <a href="{{ route('loginpage') }}"
                            class="nav-link {{ request()->is('login') ? ' active' : '' }}">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Dashboard
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-film"></i>
                            <p>
                                Pelatih
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-film"></i>
                            <p>
                                Anggota
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-film"></i>
                            <p>
                                Audience
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-film"></i>
                            <p>
                                Pemasukkan
                            </p>
                        </a>
                    </li>
                </ul>
            </nav>
        @elseif(Auth::user()->role_id == 4)
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                data-accordion="false">
                <li class="nav-item">
                    <a href="{{ route('loginpage') }}"
                        class="nav-link {{ request()->is('login') ? ' active' : '' }}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-film"></i>
                        <p>
                            Kelas Senam
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-film"></i>
                        <p>
                            Pelatih
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-film"></i>
                        <p>
                            Daftar Kelas Senam
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-film"></i>
                        <p>
                            Pembayaran
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-film"></i>
                        <p>
                            Event
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        @elseif(Auth::user()->role_id == 5)
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">
                    <li class="nav-item">
                        <a href="{{ route('loginpage') }}"
                            class="nav-link {{ request()->is('login') ? ' active' : '' }}">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Dashboard
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-film"></i>
                            <p>
                                Pelatih
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-film"></i>
                            <p>
                                Jadwal & Harga Kelas Senam
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-film"></i>
                            <p>
                                Daftar Kelas Senam
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-film"></i>
                            <p>
                                Pembayaran
                            </p>
                        </a>
                    </li>
                </ul>
            </nav>
        @endif
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
