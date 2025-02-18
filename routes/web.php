<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\FrontendController;
use App\Http\Controllers\TelegramController;
use App\Http\Controllers\WebsiteVisitController;


// Auth::routes();
Auth::routes([
    'login' => false,
    'register' => false, // Registration Routes...
    'reset' => false, // Password Reset Routes...
    'verify' => false, // Email Verification Routes...
]);

Route::get('/clear/all', function () {
    Artisan::call('config:clear');
    Artisan::call('view:clear');
    return "Cleared!";
})->middleware(['throttle:20,1']);


Route::get('/', [FrontendController::class, 'index'])->name('HomePage');
Route::get('/webapp', [FrontendController::class, 'index'])->name('Index');
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Route::post('/store-chat-id', [TelegramController::class, 'storeChatId']);
Route::post('/telegram/webhook', [TelegramController::class, 'webhookHandler']);
Route::get('/hide/preloader', [TelegramController::class, 'hidePreloader']);


Route::group(['middleware' => ['auth', 'UserBlockStatus']], function () {

    Route::get('user/profile', [FrontendController::class, 'userProfile'])->name('UserProfile')->middleware(['throttle:100,1']);
    Route::post('update/profile', [FrontendController::class, 'updateProfile'])->name('UpdateProfile')->middleware(['throttle:20,1']);
    Route::get('check/community/join/status', [FrontendController::class, 'checkCommiunityJoinedStatus'])->name('CheckCommiunityJoinedStatus');
    Route::post('claim/website/point', [WebsiteVisitController::class, 'claimWebsitePoint'])->name('ClaimWebsitePoint');

    Route::get('wallet', [FrontendController::class, 'wallet'])->name('Wallet')->middleware(['throttle:100,1']);
    Route::post('withdraw/amount', [FrontendController::class, 'withdrawAmount'])->name('WithdrawAmount')->middleware(['throttle:20,1']);
    Route::get('user/referal', [FrontendController::class, 'userReferal'])->name('UserReferal')->middleware(['throttle:100,1']);
    Route::get('website/visit/page', [WebsiteVisitController::class, 'websiteVisitPage'])->name('WebsiteVisitPage')->middleware(['throttle:100,1']);
    Route::get('join/giveaway/{slug}', [FrontendController::class, 'joinGiveaway'])->name('JoinGiveaway')->middleware(['throttle:100,1']);

});
