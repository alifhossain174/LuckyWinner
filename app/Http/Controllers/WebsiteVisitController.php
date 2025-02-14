<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class WebsiteVisitController extends Controller
{
    public function wesbiteVisitPage(){
        $tasks = DB::table('websites')->orderBy('id', 'desc')->paginate(10);

        $visitedWebsites = DB::table('earnings')->where('user_id', 0)->where('created_at', 'LIKE', date("Y-m-d").'%')->where('website_id', '!=', null)->pluck('id')->toArray();
        return view('website_visit', compact('tasks', 'visitedWebsites'));
    }

    public function claimWebsitePoint(Request $request){

        if(!DB::table('earnings')->where('user_id', 0)->where('website_id', $request->website_id)->exists()){
            $userInfo = User::where('id', 1)->first();
            $userInfo->balance = $userInfo->balance + 0.1;
            $userInfo->fixed_balance = $userInfo->fixed_balance + 0.1;
            // $userInfo->mining_balance = $userInfo->mining_balance + 0.1;
            $userInfo->save();

            DB::table('earnings')->insert([
                'user_id' => 0,
                'website_id' => $request->website_id,
                'earning_from' => 3,
                'title' => 'Website Visit',
                'points' => 0.1,
                'created_at' => Carbon::now()
            ]);
        }

        return response()->json(['status' => 'success']);
    }
}
