<div class="header">
    <div class="profile-section">
        <div class="profile-icon">
            <a href="{{ url('user/profile') }}">
                @php
                    $userImage = Auth::user()->image ?? 'assets/images/user_icon.png';
                    $imagePath = file_exists(public_path($userImage)) ? url($userImage) : url('assets/images/user_icon.png');
                @endphp
                <img src="{{ $imagePath }}" alt="" loading="lazy">
            </a>
        </div>
        <div class="profile-name">
            {{ Auth::user()->name ?? 'Mr. Robert Danny' }}
            @auth
                <input type="hidden" id="user_id" value="{{ Auth::user()->id }}">
            @else
                <input type="hidden" id="user_id" value="">
            @endguest
        </div>
    </div>
    <div class="balance">USDT {{ number_format(Auth::user()->balance, 2) ?? 0.00 }}</div>
</div>

<style>

</style>
