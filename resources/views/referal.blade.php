@extends('master')

@section('header_css')
    <link rel="stylesheet" href="{{ url('assets') }}/css/referal.css">
@endsection

@section('content')

    @push('user-info')
    <div class="user-info" id="user_info_render">
        @include('user_info')
    </div>
    @endpush

    <div class="invite-container">

        <h1>Invite Friends!</h1>
        <p>You and your friend will receive bonuses</p>

        <div class="invite-box">
            <div class="invite-section">
                <i class="fas fa-gift" style="color: #05FF65;"></i>
                <p><strong style="display: block; font-size: 16px; margin-bottom: 5px;">Invite a friend</strong><span>0.1 USDT</span> for you and your friend. <br><br>Your friend must be need to join our community channel.</p>
            </div>
            <div class="button-container">
                @php
                    $loggedInUserReferralCode = Auth::user()->refferal_code;
                    $referralLink = 'https://t.me/' . env('TELEGRAM_BOT_USERNAME') . '?start=' . $loggedInUserReferralCode;
                @endphp
                <button id="inviteButton" class="invite-button"
                    onclick="clickToCopyReferalCode('{{ $referralLink }}')">Invite a friend</button>
                <button class="copy-button" onclick="clickToCopyReferalCode('{{ $referralLink }}')"><i class="fas fa-copy"
                        style="font-size: 20px;"></i></button>
            </div>
        </div>
        <p>Referral friends and referral balance only withdrawal when your friend join into our community </p>
        <p class="friend-list-header" style="position: relative">List of your friends
            ({{ App\Models\User::where('ref_refferal_code', $loggedInUserReferralCode)->where('community_joined', 1)->count() }}/{{ count($referrals) }}) <button
                id="reloadButton"
                style="position: absolute; top: -1px; left: 92%; background: transparent; border: none; font-size: 18px; cursor:pointer; color: #c44569;"><span
                    class="icon"><i class="fas fa-sync-alt"></i></span></button></p>

        @if($referrals && count($referrals) > 0)
        @foreach ($referrals as $referral)
            <div class="friend-item">
                <div class="friend-info">

                    @if($referral->image && file_exists(public_path($referral->image)))
                        <img src="{{url($referral->image)}}" alt="" loading="lazy">
                    @else
                        <img src="{{url('assets')}}/images/logo.png" alt="" loading="lazy"/>
                    @endif

                    <p>{{ $referral->name }}<br>
                        <span style="color: white">Community Joined: @if($referral->community_joined == 1) <span style="color: #05FF65">Yes</span> @else <span style="color: red">No</span> @endif</span>
                        <br><span>{{ number_format($referral->balance, 2) }} USDT</span>
                    </p>
                </div>
                <div class="friend-bonus">
                    <p style="font-size: 16px; color: white;">+0.1</p>
                </div>
            </div>
        @endforeach
        @else
        <div class="friend-item">
            <div class="friend-info">
                <p>No referal friends found!</p>
            </div>
            <div class="friend-bonus">
            </div>
        </div>
        @endif

    </div>
@endsection

@section('footer_js')
    <script>
        function clickToCopyReferalCode(link) {
            navigator.clipboard.writeText(link);
            toastr.success("Refferal link Copied")
        }

        document.getElementById('inviteButton').addEventListener('click', function() {
            const inviteMessage = "Hey, check out this cool app: https://t.me/{{ env('TELEGRAM_BOT_USERNAME') }}?start={{ $loggedInUserReferralCode }}";
            const encodedMessage = encodeURIComponent(inviteMessage); // Encode the message for URL safety
            const telegramShareLink = `https://telegram.me/share/url?url=${encodedMessage}`;
            window.open(telegramShareLink, '_blank');
        });

        document.getElementById('reloadButton').addEventListener('click', function() {
            const icon = this.querySelector('.icon'); // Select the icon within the button

            // Add the rotate animation class to the icon
            icon.classList.add('rotate-animation');

            // Wait for 2 seconds, then reload the page
            setTimeout(function() {
                // Optionally remove the rotate animation class
                icon.classList.remove('rotate-animation');

                // Reload the page
                location.reload();
            }, 2000);
        });

        Telegram.WebApp.onEvent('backButtonClicked', function() {
            window.history.back();
        });

    </script>
@endsection
