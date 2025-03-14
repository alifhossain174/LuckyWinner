<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{env('APP_NAME')}}</title>
    <link rel="stylesheet" href="{{ url('assets') }}/css/style-v5.css">
    <link rel="stylesheet" href="{{ url('assets') }}/css/toastr.min.css">
    <link rel="stylesheet" href="{{ url('assets') }}/css/all.min.css">
    <link rel="stylesheet" href="{{ url('assets') }}/css/swiper-bundle.min.css">

    @yield('header_css')
</head>

<body>

    <!-- Splash Screen start -->
    @if (!session()->has('preloader'))
        <div class="splash-screen">
            <div style="position: relative; width: 100%; height: 100%">
                <img src="{{ url('assets') }}/images/splash.jpg" style="width: 100%; height: 100%" alt="">
                <div class="progress-container-loader">
                    <div class="progress-bar-loader" id="progressBarLoader">0%</div>
                </div>
            </div>
        </div>
    @endif

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var progressBar = document.getElementById("progressBarLoader");
            if(progressBar){
                var duration = 1000;
                var interval = 20;
                var increment = interval / duration * 100;
                var width = 0;

                function updateProgress() {
                    width += increment;
                    if (width >= 100) {
                        width = 100;
                        clearInterval(timer);
                    }
                    progressBar.style.width = width + "%";
                    progressBar.textContent = Math.floor(width) + "%";
                }
                var timer = setInterval(updateProgress, interval);
            }
        });
    </script>
    <!-- Splash Screen end -->

    <div class="background-blur" style="display: none"></div>
    <div class="loader" style="display: none"></div>


    <div class="app-container">
        @stack('user-info')
        @yield('content')
    </div>


    {{-- bottom navigation --}}
    <nav class="bottom-navigation">
        <a href="{{ url('/') }}" onclick="showLoader()" class="nav-button {{ (Request::path() == '/' || Request::path() == 'webapp') ? 'active' : ''}}" style="text-decoration-line: none">
            <i class="fas fa-hand-holding-usd"></i>
            Giveaway
        </a>
        <a href="{{url('website/visit/page')}}" onclick="showLoader()" class="nav-button {{ (Request::path() == 'website/visit/page') ? 'active' : ''}}" style="text-decoration-line: none">
            <i class="fas fa-coins"></i>
            Web Visit
        </a>
        <a href="{{ url('user/referal') }}" onclick="showLoader()" class="nav-button {{ (Request::path() == 'user/referal') ? 'active' : ''}}" style="text-decoration-line: none">
            <i class="fas fa-users"></i>
            Refer
        </a>
        <a href="{{ url('wallet') }}" onclick="showLoader()" class="nav-button {{ (Request::path() == 'wallet') ? 'active' : ''}}" style="text-decoration-line: none">
            <i class="fas fa-wallet"></i>
            Wallet
        </a>
    </nav>


    <div class="modal" id="modal-community" style="display: none">
        <div class="modal-content" style="position: relative">
            <div class="modal-body" style="margin-top: 10px;">
                <img src="{{url('assets')}}/images/logo.png" style="width: 45px; height: 45px; margin-bottom: 10px" alt="" class="task-logo">
                <p id="task_title" style="color: white; text-shadow: 1px 1px 2px black;font-size: 18px; font-weight: 600; margin-bottom: 10px;">{{env('APP_NAME')}} - Community</p>
                <p id="task_description" style="color: white; text-shadow: 1px 1px 2px black; font-size: 14px; margin-bottom: 20px;">Join Our Community</p>
            </div>
            <div class="modal-footer">
                <a href="javascript:void(0)" onclick="hideCommunityJoinModal()" id="visit-btn" class="visit-btn" style="border-radius: 20px; box-shadow: 2px 2px 5px black; padding: 10px 30px;">Join Now</a>
            </div>
        </div>
    </div>


    <script src="{{url('assets')}}/js/jquery-3.6.0.min.js"></script>
    <script src="{{url('assets')}}/js/swiper-bundle.min.js"></script>
    <script src="{{url('assets')}}/js/telegram-web-app.js"></script>
    {{-- <script src="{{url('assets')}}/js/sad.min.js"></script> --}}
    <script>

        window.Telegram.WebApp.expand();
        checkCommunityJoinStatus();

        function checkCommunityJoinStatus(){
            $.ajax({
                url: '/check/community/join/status',
                method: 'GET',
                contentType: 'application/json',
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                success: function(data) {
                    if(data.status == false){
                        $("#modal-community").show();
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Request failed:', error);
                }
            });
        }

        function hideCommunityJoinModal(){
            $("#modal-community").hide();
            window.location.href = "https://t.me/{{env('TELEGRAM_CHANNEL')}}";
        }

        function showLoader(){
            $(".background-blur").show();
            $(".loader").show();
        }

        window.addEventListener("pageshow", function () {
            $(".background-blur").hide();
            $(".loader").hide();
        });

        document.addEventListener('DOMContentLoaded', function() {
            const swiper = new Swiper('.finished-rewards', {
                slidesPerView: 'auto',
                spaceBetween: 10,
                freeMode: true,
                grabCursor: true,
                touchEventsTarget: 'container',
                resistance: true,
                resistanceRatio: 0.85,
                breakpoints: {
                    320: {
                        slidesPerView: 3.1,
                    },
                    480: {
                        slidesPerView: 4.5,
                    },
                    768: {
                        slidesPerView: 5.5,
                    }
                }
            });
        });
    </script>


    @if (!session()->has('preloader'))
    <script>
        // Check if splash screen has been shown before
        window.addEventListener('load', function() {
            const splashScreen = document.querySelector('.splash-screen');
            const mainContent = document.querySelector('.app-container');

            setTimeout(function() {
                splashScreen.classList.add('slide-out'); // Trigger slide-out animation
                // Wait for the slide-out transition to complete
                setTimeout(function() {
                    splashScreen.style.display = 'none'; // Remove splash screen from view
                    mainContent.style.display = 'block'; // Show the main content

                    $.ajax({
                        url: '/hide/preloader',
                        method: 'GET',
                        contentType: 'application/json',
                        headers: {
                            'X-CSRF-TOKEN': '{{ csrf_token() }}'
                        },
                        success: function(data) {
                            console.log("Preloader will not show anymore")
                        },
                        error: function(xhr, status, error) {
                            console.error('Request failed:', error);
                        }
                    });

                }, 500); // Match this time with CSS transition duration
            }, 2000); // Minimum display time of 2 seconds
        });
    </script>
    @else
    <script>
        const mainContent = document.querySelector('.app-container');
        mainContent.style.display = 'block'; // Show the main content
    </script>
    @endif


    @guest
    <script>

        $(".background-blur").show();
        $(".loader").show();

        const tg = window.Telegram.WebApp;
        const initData = tg.initDataUnsafe;
        if(initData.user){
            const chatId = initData.user.id;
            var userId = $("#user_id").val();
            if (!userId && chatId) {

                console.log("Going In");

                $.ajax({
                    url: '/store-chat-id',
                    method: 'POST',
                    contentType: 'application/json',
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    data: JSON.stringify({
                        chat_id: chatId
                    }),
                    success: function(data) {

                        console.log(data);

                        if(data.status == true){
                            $(".background-blur").hide();
                            $(".loader").hide();

                            // $('#user_info_render').html(data.rendered_user_info);
                            // $('#finished_render').html(data.rendered_finished);
                            // $('#current_render').html(data.rendered_current);

                            setTimeout(() => {
                                $('#user_info_render').empty().append(data.rendered_user_info);
                                $('#finished_render').empty().append(data.rendered_finished);
                                $('#current_render').empty().append(data.rendered_current);
                            }, 500); // Small delay to ensure elements are available

                            checkCommunityJoinStatus();
                        }

                    },
                    error: function(xhr, status, error) {
                        console.error('Request failed:', error);
                    }
                });
            } else  {
                $(".background-blur").hide();
                $(".loader").hide();
            }
        } else {
                window.location.href = "{{env('APP_URL')}}/preview";
        }

    </script>
    @endguest


    @yield('footer_js')

    <script src="{{ url('assets') }}/js/toastr.min.js"></script>
    {!! Toastr::message() !!}

</body>
