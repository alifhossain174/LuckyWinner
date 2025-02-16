@extends('master')

@section('header_css')
    <link rel="stylesheet" href="{{ url('assets') }}/css/wallet.css">
@endsection

@push('user-info')
    <div class="user-info" id="user_info_render">
        @include('user_info')
    </div>
@endpush

@section('content')

    <div class="withdraw-container" style="text-align: center;">
        <form action="{{url('withdraw/amount')}}" method="POST">
            @csrf
            <div class="content" style="text-align:left; padding-bottom: 15px; height: auto !important; margin-bottom: 18px; width: 100% !important;">
                @php
                    // $authenticatedUser = Auth::user();
                    $authenticatedUser = App\Models\User::where('id', 1)->first();
                @endphp

                <div class="ton-address">
                    <span class="address">
                        <span class="label"><img src="{{url('assets')}}/images/binance.png" loading="lazy" style="width: 14px; height: 14px; margin-right: 5px;">Binance ID:</span>
                        <input type="text" placeholder="Submit Your Binance ID" value="{{$authenticatedUser->wallet_address}}" required name="wallet_address" style="width: 100%;border-radius: 6px; padding: 8px; background: #dda6b5a8; border: none; font-size: 14px; color: white; border: 1px solid orange;">
                        <span class="label" style="margin-top: 10px">Withdraw Amount:</span>

                        <label class="balanceOption"><input type="radio" name="balance" value="100" @if(count($withdraws) == 0) checked @else disabled @endif> 100</label>
                        <label class="balanceOption"><input type="radio" name="balance" value="1000" @if(count($withdraws) > 0) checked @endif> 1000</label>
                        <label class="balanceOption"><input type="radio" name="balance" value="5000"> 5000</label>
                        <label class="balanceOption"><input type="radio" name="balance" value="10000"> 10000</label>
                        <label class="balanceOption"><input type="radio" name="balance" value="25000"> 25000</label>
                        <label class="balanceOption"><input type="radio" name="balance" value="50000"> 50000</label>
                        <label class="balanceOption"><input type="radio" name="balance" value="100000"> 100000</label>

                    </span>
                </div>

                <div class="amount" style="margin-top: 15px;">
                    <span class="label" style="font-weight: 500; font-size: 14px;">Balance : <span class="value">{{$authenticatedUser->balance}}</span></span>
                </div>
                <div class="withdrawal_date" >
                    <span class="label" style="font-weight: 500; font-size: 14px;">Minimum Withdraw Amount : <span class="value">@if(count($withdraws) == 0) 100 @else 1000 @endif</span></span>
                </div>

            </div>

            <button type="submit" style="font-size: 16px; padding: 8px; margin-top: 10px; background: #c44569; width: 60%; font-weight: 600; border-radius: 20px" class="invite-button">Withdraw</button>
        </form>
    </div>

    @php
        $referralLink = 'https://t.me/' . env('TELEGRAM_BOT_USERNAME') . '?start=' . $authenticatedUser->refferal_code;
    @endphp

    <h5 style="text-align: center; margin-top: 20px; margin-bottom: 10px; font-weight: 500;">Use the link below to refer your friends</h5>
    <div style="width: 100%; display: flex; justify-content: center; align-items: center; text-align: center;">
        <a href="javascript:void(0)" id="inviteButton" style="display: inline-block; text-decoration: none; text-align:center; float:left; width: 70%; margin-right: 5px" class="invite-button">Refer a Friend</a>
        <a href="javascript:void(0)" onclick="clickToCopyReferalCode('{{ $referralLink }}')" style="display: inline-block; text-decoration: none; text-align:center; float:left; width: 15%" class="invite-button"><i class="fas fa-copy" style="font-size: 14px;"></i></a>
    </div>

    <div class="payments">
        <h5>List of Payment</h5>
        <table class="paymentTable" border="1">
            <tr>
                <td>Date</td>
                <td>Amount</td>
                <td>Status</td>
            </tr>
            @foreach($withdraws as $withdraw)
            <tr>
                <td>{{date("Y-m-d", strtotime($withdraw->created_at))}}</td>
                <td>{{$withdraw->trx}}</td>
                <td>
                    @if($withdraw->status == 0)
                    Pending
                    @elseif($withdraw->status == 1)
                    <span style="color: lightgreen">Approved</span>
                    @else
                    <span style="color: red">Denied</span>
                    @endif
                </td>
            </tr>
            @endforeach
        </table>
    </div>

@endsection

@section('footer_js')
    <script>
        document.getElementById('inviteButton').addEventListener('click', function() {
            const inviteMessage = "Hey, check out this cool app: https://t.me/{{env('TELEGRAM_BOT_USERNAME')}}?start={{$authenticatedUser->refferal_code}}";
            const encodedMessage = encodeURIComponent(inviteMessage); // Encode the message for URL safety
            const telegramShareLink = `https://telegram.me/share/url?url=${encodedMessage}`;
            window.open(telegramShareLink, '_blank');
        });

        function clickToCopyReferalCode(link) {
            navigator.clipboard.writeText(link);
            toastr.success("Refferal link Copied")
        }

        Telegram.WebApp.onEvent('backButtonClicked', function() {
            window.history.back();
        });
    </script>
@endsection
