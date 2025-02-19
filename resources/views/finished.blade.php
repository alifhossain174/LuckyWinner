<div class="section-title">Giveaway Winners</div>
<div class="finished-rewards swiper">
    <div class="swiper-wrapper">

        @if(count($giveawayWinners) > 0)
            @foreach ($giveawayWinners as $giveawayWinner)
            <div class="swiper-slide">
                <div class="reward-card">
                    <div class="reward-amount">{{$giveawayWinner->prize_money}}</div>
                    <div class="reward-currency">USD</div>
                    <div class="user-tag">{{$giveawayWinner->user_name}}</div>
                </div>
            </div>
            @endforeach
        @else
            <h5 style="padding-left: 18px; font-size: 16px; font-weight: 500;">No Winner Found !</h5>
        @endif

    </div>
</div>
