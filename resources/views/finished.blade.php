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
            <div class="swiper-slide">
                <div class="reward-card">
                    <div class="reward-amount">0.0</div>
                    <div class="reward-currency">USD</div>
                    <div class="user-tag">user******</div>
                </div>
            </div>
        @endif

    </div>
</div>
