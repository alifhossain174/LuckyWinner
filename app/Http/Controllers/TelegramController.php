<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;
use Telegram\Bot\Laravel\Facades\Telegram;

class TelegramController extends Controller
{
    public function webhookHandler(Request $request)
    {

        $secretToken = env('TELEGRAM_SECRET_TOKEN');
        if ($request->header('X-Telegram-Bot-Api-Secret-Token') !== $secretToken) {
            abort(403, 'Invalid secret token.');
            exit();
        }

        try {

            $update = $request->all();
            // if (isset($update['message']) && $update['message']['text'] === '/start') {
            if (isset($update['message']) && str_contains($update['message']['text'], 'start')) {

                $chatId = $update['message']['chat']['id'];
                $firstName = $update['message']['from']['first_name'];
                $lastName = $update['message']['from']['last_name'] ?? null;
                $telegramId = $update['message']['from']['id'];

                if(DB::table('users')->where('chat_id', $telegramId)->exists()){

                    // Send a welcome message
                    Telegram::sendMessage([
                        'chat_id' => $chatId,
                        'text' => "Hi ".$firstName." ".$lastName,
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

                } else {

                    // previous approach
                    $message = $update['message']['text'];
                    $referrerId = null;
                    $giveawaySlug = null;
                    $userChatId = null;

                    if (strpos($message, '/start ') !== false) {

                        $startData = str_replace('/start ', '', $message);
                        // Check if the start parameter contains encoded giveaway and user data
                        if (strpos($startData, 'giveaway_') !== false && strpos($startData, '_user_') !== false) {
                            // Extract giveaway and user ID using explode
                            $parts = explode('_', $startData);
                            $giveawaySlug = $parts[1]; // Giveaway ID
                            $userChatId = $parts[3];     // User ID
                        } else {
                            // Fallback for simple referrer ID case
                            $referrerId = intval($startData);
                        }

                    }

                    if($giveawaySlug && $userChatId){
                        $giveaway = DB::table('giveaways')->where('slug', $giveawaySlug)->first();
                        if($giveaway){
                            $userInfoForGiveway = DB::table('users')->where('chat_id', $userChatId)->first();
                            if($userInfoForGiveway){
                                $giveawayMember = DB::table('giveaway_members')->where('giveaway_id', $giveaway->id)->where('user_id', $userInfoForGiveway->id)->first();
                                if(!$giveawayMember){
                                    DB::table('giveaway_members')->insert([
                                        'giveaway_id' => $giveaway->id,
                                        'user_id' => $userInfoForGiveway->id,
                                        'prize_money' => $giveaway->prize_amount,
                                        'required_count' => $giveaway->eligibility_count,
                                        'completed_count' => 1,
                                        'status' => 0,
                                        'created_at' => Carbon::now()
                                    ]);
                                } else {
                                    DB::table('giveaway_members')->where('giveaway_id', $giveaway->id)->where('user_id', $userInfoForGiveway->id)->update([
                                        'completed_count' => $giveawayMember->completed_count + 1,
                                        'updated_at' => Carbon::now()
                                    ]);
                                }
                            }
                        }
                    }


                    $photoUrl = null;

                    // Fetch user profile photos
                    $response = Http::get("https://api.telegram.org/bot".env('TELEGRAM_BOT_TOKEN')."/getUserProfilePhotos", [
                        'user_id' => $telegramId
                    ]);

                    $responseData = $response->json();
                    if ($responseData['ok'] && $responseData['result']['total_count'] > 0) {
                        $fileId = $responseData['result']['photos'][0][0]['file_id'];

                        // Fetch file path
                        $fileResponse = Http::get("https://api.telegram.org/bot".env('TELEGRAM_BOT_TOKEN')."/getFile", [
                            'file_id' => $fileId
                        ]);

                        $fileResponseData = $fileResponse->json();
                        if ($fileResponseData['ok']) {
                            $filePath = $fileResponseData['result']['file_path'];
                            $photoUrl = "https://api.telegram.org/file/bot".env('TELEGRAM_BOT_TOKEN')."/$filePath";

                            // Download image using cURL
                            $imageContent = Http::get($photoUrl)->body();
                            $savePath = public_path('user_images/') . $telegramId . '.jpg';
                            file_put_contents($savePath, $imageContent);
                        }
                    }

                    DB::table('users')->insert([
                        'name' => $firstName." ".$lastName,
                        'image' => 'user_images/'.$telegramId.'.jpg', //$photoUrl
                        'email' => $telegramId."@telegram.com",
                        'password' => Hash::make($telegramId),
                        'chat_id' => $chatId,
                        'balance' => 0,
                        'fixed_balance' =>  0,
                        'refferal_balance' => 0, //will be given later after community join
                        'refferal_code' => $telegramId,
                        'ref_refferal_code' => $referrerId,
                        'total_ad_showed' => 0,
                        'created_at' => Carbon::now()
                    ]);

                    // Send a welcome message
                     Telegram::sendMessage([
                        'chat_id' => $chatId,
                        'text' => "Hi ".$firstName." ".$lastName,
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
                }

            }

            return response()->json(['status' => 'success']);

        } catch (\Exception $e) {

            Log::error('Exception occurred: ' . $e->getMessage(), [
                'file' => $e->getFile(),
                'line' => $e->getLine(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 200);
        }

    }

    public function storeChatId(Request $request)
    {
        $chatId = $request->input('chat_id');
        $user = User::where('chat_id', $chatId)->first();
        if ($user) {
            Auth::login($user);
            $userInfo_HTML = view('user_info')->render();
            $finished_HTML = view('finished')->render();
            $current_HTML = view('current')->render();

            return response()->json([
                'status' => true,
                'rendered_user_info' => $userInfo_HTML,
                'rendered_finished' => $finished_HTML,
                'rendered_current' => $current_HTML,
            ]);
        }
        return response()->json(['status' => false]);
    }

    public function hidePreloader(){
        session(['preloader' => 0]);
        return response()->json(['status' => 'success']);
    }
}
