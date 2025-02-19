<div class="section-title">Current Giveaways</div>
<div class="giveaway-container">

    {{-- loop here --}}
    @if(count($currentGiveways) > 0)
    @foreach ($currentGiveways as $currentGiveway)
        <div class="giveaway-card">
            <div class="giveaway-amount">
                <h5>{{$currentGiveway->prize_amount}}</h5>
                <span>USDT</span>
            </div>
            <div class="giveaway-info">
                <div>
                    <strong style="display: block">{{$currentGiveway->title}}</strong>
                    <small>{{$currentGiveway->title}}</small>
                </div>
                <div class="participants" data-endtime="{{ $currentGiveway->end_at }}">
                    <i class="fas fa-users" style="color: gold"></i> {{DB::table('giveaway_members')->where('giveaway_id', $currentGiveway->id)->count()}}
                    <span class="countdown"></span>  <!-- Countdown will be placed here -->

                    @php
                        $memberInfo = DB::table('giveaway_members')
                                        ->where('giveaway_id', $currentGiveway->id)
                                        ->where('user_id', Auth::user()->id)
                                        ->first();
                    @endphp

                    @if($currentGiveway->type == 1)
                        @php
                            $randomWebsite = DB::table('websites')->inRandomOrder()->first();
                        @endphp
                        <strong class="giveaway_ad_view_btn" onclick="visitRandomWebsiteForGiveaway('{{$randomWebsite->link}}', '{{$currentGiveway->id}}')">
                            <i class="fas fa-eye" style="color: gold"></i> View Ads:
                            <span style="color:white" id="adViewsCount-{{$currentGiveway->id}}">{{$memberInfo ? $memberInfo->completed_count : 0}}/{{$currentGiveway->eligibility_count}}</span>
                        </strong>
                    @else
                        <strong class="giveaway_ad_view_btn" onclick="referralLinkforGiveaway('{{$currentGiveway->slug}}')">
                            <i class="far fa-copy" style="color: gold"></i> Referral:
                            <span style="color:white">{{$memberInfo ? $memberInfo->completed_count : 0}}/{{$currentGiveway->eligibility_count}}</span>
                        </strong>
                    @endif
                </div>

                @auth

                    @if($memberInfo && $memberInfo->completed_count == $memberInfo->required_count)
                        <a href="javascript:void(0)" class="join-button">Joined</a>
                    @else
                        <a href="{{url('join/giveaway')}}/{{$currentGiveway->slug}}" onclick="showLoader()" class="join-button">Join Now</a>
                    @endif

                @endauth

            </div>
        </div>
    @endforeach
    @else
        <div class="giveaway-card">
            <h5>No Giveaway Found !</h5>
        </div>
    @endif
    {{-- loop here --}}


    <script>

        function referralLinkforGiveaway(giveawaySlug){
            const inviteMessage = "Hey, check out this cool app: https://t.me/{{ env('TELEGRAM_BOT_USERNAME') }}?giveaway="+giveawaySlug;
            const encodedMessage = encodeURIComponent(inviteMessage); // Encode the message for URL safety
            const telegramShareLink = `https://telegram.me/share/url?url=${encodedMessage}`;
            window.open(telegramShareLink, '_blank');
        }

        document.addEventListener("DOMContentLoaded", function() {
            function startCountdown() {
                document.querySelectorAll('.participants').forEach(function(element) {
                    let endTime = new Date(element.getAttribute('data-endtime')).getTime();
                    let countdownSpan = element.querySelector('.countdown');

                    function updateCountdown() {
                        let now = new Date().getTime();
                        let timeLeft = endTime - now;

                        if (timeLeft <= 0) {
                            countdownSpan.innerHTML = "⏳ Expired";
                            return;
                        }

                        let days = Math.floor(timeLeft / (1000 * 60 * 60 * 24));
                        let hours = Math.floor((timeLeft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                        let minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
                        let seconds = Math.floor((timeLeft % (1000 * 60)) / 1000);

                        countdownSpan.innerHTML = `⏳ ${days}d ${hours}h ${minutes}m ${seconds}s`;
                    }

                    updateCountdown();
                    setInterval(updateCountdown, 1000);
                });
            }

            startCountdown();
        });
    </script>

</div>
