@extends('master')

@section('header_css')
    <link rel="stylesheet" href="{{ url('assets') }}/css/profile.css">
@endsection

@section('content')
    <div class="profile-container">
        <div class="avatar-section">
            @auth
                @if(Auth::user()->image && file_exists(public_path(Auth::user()->image)))
                <img src="{{ url(Auth::user()->image) }}" style="width: 100px; height: 100px" alt="">
                @else
                <img src="{{url('assets')}}/images/user_icon.png" style="width: 100px; height: 100px; border: 2px solid silver" alt="">
                @endif
            @else
                <img src="{{url('assets')}}/images/user_icon.png" style="width: 100px; height: 100px; border: 2px solid silver" alt="">
            @endauth

            <h2>{{ Auth::user()->name ?? 'Guest' }}</h2>
        </div>

        <div class="form-container">
            <form action="{{ url('update/profile') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="name">Name</label>
                    <div class="gradient-border-container">
                        <input type="text" class="gradient-border-input" placeholder="Full Name" name="name" @if(Auth::user()) value="{{ Auth::user()->name }}" @endif id="name" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <div class="gradient-border-container">
                        <input type="email" class="gradient-border-input" placeholder="example@email.com" name="email" @if(Auth::user() && !str_contains(Auth::user()->email, "telegram.com")) value="{{ Auth::user()->email }}" @endif id="email" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <div class="gradient-border-container">
                        <input type="tel" class="gradient-border-input" placeholder="Mobile No." name="phone" @if(Auth::user()) value="{{ Auth::user()->contact }}" @endif id="phone" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="country">Country</label>
                    <div class="gradient-border-container">
                        <input type="text" class="gradient-border-input" placeholder="Country of residance" name="country" @if(Auth::user()) value="{{ Auth::user()->country }}" @endif id="country" required>
                    </div>
                </div>

                 <button type="submit" class="update-button">Update</button>
            </form>
        </div>
    </div>
@endsection


@section('footer_js')
    <script>

        Telegram.WebApp.onEvent('backButtonClicked', function() {
            window.history.back();
        });

    </script>
@endsection
