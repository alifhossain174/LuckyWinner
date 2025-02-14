@extends('master')

@push('user-info')
    <div class="user-info" id="user_info_render">
        @include('user_info')
    </div>
@endpush


@section('content')

    <div class="finished" id="finished_render">
        @include('finished')
    </div>

    <div class="current" id="current_render">
        @include('current')
    </div>

@endsection


@section('footer_js')
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            if (window.history && window.history.pushState) {
                // Simulate that the user is on the home page initially
                window.history.pushState({ page: 'home' }, '', window.location.href);

                window.addEventListener('popstate', function (event) {
                    if (event.state && event.state.page === 'home') {
                        // Handle back button press for returning to home page
                        goToHomePage();
                    } else {
                        // Push the home state back into the history
                        window.history.pushState({ page: 'home' }, '', window.location.href);
                    }
                });

                // Show the Telegram Web App BackButton if available
                if (Telegram.WebApp) {
                    Telegram.WebApp.BackButton.show();
                    Telegram.WebApp.BackButton.onClick(function () {
                        goToHomePage();
                    });
                }
            }
        });

        function goToHomePage() {
            if (Telegram.WebApp) {
                Telegram.WebApp.BackButton.hide(); // Hide the back button
                Telegram.WebApp.close(); // Close the web app and return to the Telegram chat
            } else {
                // Fallback for non-Telegram environments
                window.history.back(); // Navigate back in history
            }
        }
    </script>
@endsection
