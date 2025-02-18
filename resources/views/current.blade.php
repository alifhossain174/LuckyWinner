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
                <div class="participants">
                    <i class="fas fa-users" style="color: gold"></i> {{DB::table('giveaway_members')->where('giveaway_id', $currentGiveway->id)->count()}}
                    ⏰{{date("d/m/y h:i a", strtotime($currentGiveway->end_at))}}

                    @if($currentGiveway->type == 1)
                        <strong style="display: block; margin-top: 10px; font-size: 13px;">Ads View: <span style="color:gold">{{$currentGiveway->eligibility_count}}</span></strong>
                    @else
                        <strong style="display: block; margin-top: 10px; font-size: 13px;">Referral: <span style="color:gold">{{$currentGiveway->eligibility_count}}</span></strong>
                    @endif
                </div>

                @auth

                    @if(DB::table('giveaway_members')->where('giveaway_id', $currentGiveway->id)->where('user_id', Auth::user()->id)->exists())
                        <a href="javascript:void(0)" class="join-button">Joined</a>
                    @else
                        @if($currentGiveway->type == 2)
                            @php
                                $totalReferrals = DB::table('users')->where('ref_refferal_code', Auth::user()->refferal_code)->count();
                                $alreadyUsedReferrals = DB::table('giveaway_members')
                                                            ->leftJoin('giveaways', 'giveaway_members.giveaway_id', 'giveaways.id')
                                                            ->where('giveaway_members.giveaway_id', $currentGiveway->id)
                                                            ->where('giveaway_members.user_id', Auth::user()->id)
                                                            ->where('giveaways.type', 2)
                                                            ->sum('eligibility_count');
                            @endphp

                            @if(($totalReferrals-$alreadyUsedReferrals) >= $currentGiveway->eligibility_count)
                            <a href="{{url('join/giveaway')}}/{{$currentGiveway->slug}}" onclick="showLoader()" class="join-button">Join Now</a>
                            @else
                            <a href="javascript:void(0)" class="join-button">{{$totalReferrals-$alreadyUsedReferrals}}/{{$currentGiveway->eligibility_count}}</a>
                            @endif
                        @else
                            @php
                                $alreadyUsedAdsViews = DB::table('giveaway_members')
                                                            ->leftJoin('giveaways', 'giveaway_members.giveaway_id', 'giveaways.id')
                                                            ->where('giveaway_members.giveaway_id', $currentGiveway->id)
                                                            ->where('giveaway_members.user_id', Auth::user()->id)
                                                            ->where('giveaways.type', 1)
                                                            ->sum('eligibility_count');
                            @endphp

                            @if((Auth::user()->total_ad_showed - $alreadyUsedAdsViews) >= $currentGiveway->eligibility_count)
                            <a href="{{url('join/giveaway')}}/{{$currentGiveway->slug}}" onclick="showLoader()" class="join-button">Join Now</a>
                            @else
                            <a href="javascript:void(0)" class="join-button">{{Auth::user()->total_ad_showed - $alreadyUsedAdsViews}}/{{$currentGiveway->eligibility_count}}</a>
                            @endif
                        @endif
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

</div>
