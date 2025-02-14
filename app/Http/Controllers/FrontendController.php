<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

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
                    }
                }
                $userInfo->image = 'user_images/'.$userInfo->refferal_code.'.jpg';
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

        return view('index');
    }

    public function userProfile(){
        return view('profile');
    }

    public function updateProfile(Request $request){
        User::where('id', 1)->update([
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
        $referrals = User::where('ref_refferal_code', 0)->get();
        return view('referal', compact('referrals'));
    }

    public function wallet(){
        $withdraws = DB::table('with_draws')->where('user_id', 1)->orderBy('id', 'desc')->get();
        return view('wallet', compact('withdraws'));
    }

}
