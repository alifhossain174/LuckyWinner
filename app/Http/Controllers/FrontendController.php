<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Telegram\Bot\Laravel\Facades\Telegram;

class FrontendController extends Controller
{
    public function index(){

        if(Auth::user()){

            $userInfo = User::where('id', Auth::user()->id)->first();

            if($userInfo->banned == 1){
                return abort(403);
            }

            if($userInfo->image == null){
                $photoUrl = null;
                $response = file_get_contents("https://api.telegram.org/bot".env('TELEGRAM_BOT_TOKEN')."/getUserProfilePhotos?user_id=$userInfo->refferal_code");
                $responseData = json_decode($response, true);
                if ($responseData['ok'] && $responseData['result']['total_count'] > 0) {
                    $fileId = $responseData['result']['photos'][0][0]['file_id'];
                    $fileResponse = file_get_contents("https://api.telegram.org/bot".env('TELEGRAM_BOT_TOKEN')."/getFile?file_id=$fileId");
                    $fileResponseData = json_decode($fileResponse, true);

                    if ($fileResponseData['ok']) {
                        $filePath = $fileResponseData['result']['file_path'];
                        $photoUrl = "https://api.telegram.org/file/bot".env('TELEGRAM_BOT_TOKEN')."/$filePath";

                        $imageContent = file_get_contents($photoUrl);
                        $savePath = public_path('user_images/') . $userInfo->refferal_code . '.jpg'; // Adjust the path as needed
                        file_put_contents($savePath, $imageContent);
                        $userInfo->image = 'user_images/'.$userInfo->refferal_code.'.jpg';
                    }
                }
            }

            // if(!$userInfo->last_ad_showed_at){
            //     $userInfo->last_ad_showed_at = date("Y-m-d");
            //     $userInfo->total_ad_showed = 0;
            // }
            // if($userInfo->last_ad_showed_at && $userInfo->last_ad_showed_at != date("Y-m-d")){
            //     $userInfo->last_ad_showed_at = date("Y-m-d");
            //     $userInfo->total_ad_showed = 0;
            // }

            $userInfo->save();
        }

        $giveawayWinners = DB::table('giveaway_members')
                            ->leftJoin('users', 'giveaway_members.user_id', 'users.id')
                            ->select('giveaway_members.*', 'users.name as user_name')
                            ->orderBy('giveaway_members.id', 'desc')
                            ->skip(0)
                            ->limit(20)
                            ->get();

        $currentGiveways = DB::table('giveaways')->where('status', 1)->get();

        return view('index', compact('giveawayWinners', 'currentGiveways'));
    }

    public function userProfile(){
        return view('profile');
    }

    public function updateProfile(Request $request){

        User::where('id', Auth::user()->id)->update([
            'name' => $request->name,
            'email' => $request->email,
            'contact' => $request->phone,
            'country' => $request->country,
            'updated_at' => Carbon::now()
        ]);

        Toastr::success("Profile Updated");
        return back();
    }

    public function userReferal(){
        $referrals = User::where('ref_refferal_code', Auth::user()->refferal_code)->get();
        return view('referal', compact('referrals'));
    }

    public function wallet(){
        $withdraws = DB::table('with_draws')->where('user_id', Auth::user()->id)->orderBy('id', 'desc')->get();
        $webSettings = DB::table('web_settings')->where('id', 1)->first();
        return view('wallet', compact('withdraws', 'webSettings'));
    }

    public function withdrawAmount(Request $request){

        $authenticatedUser = Auth::user();
        User::where('id', $authenticatedUser->id)->update([
            'wallet_address' => $request->wallet_address,
        ]);

        if(!$request->balance){
            Toastr::error("Please select a balance");
            return back();
        }

        $webSettings = DB::table('web_settings')->where('id', 1)->first();
        if($request->balance < $webSettings->minimum_withdraw_points_limit){
            Toastr::error("Not Allowed");
            return back();
        }
        if($authenticatedUser->balance < $request->balance){
            Toastr::error("Not Enough Balance");
            return back();
        }

        DB::table('with_draws')->insert([
            'user_id' => $authenticatedUser->id,
            'trx' => $request->balance,
            'current_referals' => 0,
            'payment_title' => "Balance Withdraw",
            'user_wallet_address' => $request->wallet_address,
            'status' => 0,
            'terminal' => mt_rand(1, 3),
            'created_at' => Carbon::now()
        ]);

        User::where('id', $authenticatedUser->id)->update([
            'balance' => $authenticatedUser->balance - $request->balance
        ]);

        Toastr::success("Withdrawal Request Submitted. Please wait for Approval.");
        return back();

    }

    public function checkCommiunityJoinedStatus(){

        if(Auth::user()){
            $botToken = env('TELEGRAM_BOT_TOKEN');
            $channelId = '@'.env('TELEGRAM_CHANNEL');

            $response = Http::get("https://api.telegram.org/bot{$botToken}/getChatMember", [
                'chat_id' => $channelId,
                'user_id' => Auth::user()->chat_id,
            ]);

            $data = $response->json();
            if ($response->successful() && isset($data['result']) && env('TELEGRAM_CHANNEL') != '') {

                $status = $data['result']['status'];
                if (in_array($status, ['member', 'administrator', 'creator'])) {

                    $userInfo = User::where('id', Auth::user()->id)->first();

                    // if referral bonus has not been distributed before
                    if($userInfo->ref_refferal_code != null){
                        $referredUser = User::where('refferal_code', $userInfo->ref_refferal_code)->first();
                        if($referredUser){

                            // bonus given to reffered user
                            $referredUser->balance = $userInfo->balance + 0.1;
                            $referredUser->fixed_balance = $userInfo->fixed_balance + 0.1;
                            $referredUser->refferal_balance = $userInfo->refferal_balance + 0.1;
                            $referredUser->save();

                            // bonus given to original user
                            $userInfo->balance = $userInfo->balance + 0.1;
                            $userInfo->fixed_balance = $userInfo->fixed_balance + 0.1;
                            $userInfo->refferal_balance = $userInfo->refferal_balance + 0.1;

                            // sending reffered user a message in telegram about that
                            Telegram::sendMessage([
                                'chat_id' => $referredUser->chat_id,
                                'text' => 'Congratulations! A new user registered using your referral code and has joined our Community! You Have Received 0.1 USDT',
                                'reply_markup' => json_encode([
                                    'inline_keyboard' => [
                                        [
                                            [
                                                'text' => 'Open App 🚀',
                                                'web_app' => ['url' => env('APP_URL')]
                                            ]
                                        ],
                                        [
                                            [
                                                'text' => 'Join Community 👥',
                                                'url' => 'https://t.me/'.env('TELEGRAM_CHANNEL')
                                            ]
                                        ]
                                    ]
                                ])
                            ]);

                            // inserting data into this table for referral challange related task
                            // ReferalHistory::insert([
                            //     'referal_provided_by' => $referredUser->id,
                            //     'referal_taken_by' => $userInfo->id,
                            //     'created_at' => Carbon::now()
                            // ]);

                        }
                    }

                    $userInfo->community_joined = 1;
                    $userInfo->save();

                    return response()->json(['status' => true]);
                } else {

                    User::where('id', Auth::user()->id)->update([
                        'community_joined' => 0
                    ]);

                    return response()->json(['status' => false]);
                }
            } else {
                return response()->json(['status' => true]);
            }
        } else {
            return response()->json(['status' => true]);
        }

    }

    public function joinGiveaway($slug){
        $giveaway = DB::table('giveaways')->where('slug', $slug)->first();

        if(DB::table('giveaway_members')->where('giveaway_id', $giveaway->id)->where('user_id', Auth::user()->id)->exists()){
            Toastr::error("Already Joined");
            return back();
        }

        if($giveaway->type == 2){
            $totalReferrals = DB::table('users')->where('ref_refferal_code', Auth::user()->refferal_code)->count();
            $alreadyUsedReferrals = DB::table('giveaway_members')
                                        ->leftJoin('giveaways', 'giveaway_members.giveaway_id', 'giveaways.id')
                                        ->where('giveaway_members.giveaway_id', $giveaway->id)
                                        ->where('giveaway_members.user_id', Auth::user()->id)
                                        ->where('giveaways.type', 2)
                                        ->sum('eligibility_count');

            if(($totalReferrals-$alreadyUsedReferrals) < $giveaway->eligibility_count){
                Toastr::error("More Referral Required");
                return back();
            }
        } else {
            $alreadyUsedAdsViews = DB::table('giveaway_members')
                                    ->leftJoin('giveaways', 'giveaway_members.giveaway_id', 'giveaways.id')
                                    ->where('giveaway_members.giveaway_id', $giveaway->id)
                                    ->where('giveaway_members.user_id', Auth::user()->id)
                                    ->where('giveaways.type', 1)
                                    ->sum('eligibility_count');

            if((Auth::user()->total_ad_showed - $alreadyUsedAdsViews) < $giveaway->eligibility_count){
                Toastr::error("More Ad Views Required");
                return back();
            }
        }

        DB::table('giveaway_members')->insert([
            'giveaway_id' => $giveaway->id,
            'user_id' => Auth::user()->id,
            'prize_money' => $giveaway->prize_amount,
            'status' => 0,
            'created_at' => Carbon::now()
        ]);

        Toastr::success("Successfully Joined");
        return back();
    }

}
