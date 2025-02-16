@extends('master')

@section('header_css')
    <link rel="stylesheet" href="{{ url('assets') }}/css/website_visit.css">
    <style>
        .pagination {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-bottom: 20px;
        }
    </style>
@endsection

@section('content')
    <div class="website_visit_container">

        <!-- Header Section -->
        <header class="header">
            <div class="header-content">
                <img src="{{url('assets')}}/images/logo.png" alt="" class="logo" loading="lazy">
                <h1 style="font-size: 16px">Website Visit</h1>
            </div>
        </header>

        <!-- Tasks List -->
        <div class="task-list" style="padding-top: 0px">

            @php
                $availableSiteCount = 0;
            @endphp

            @foreach ($tasks as $taskItem)
            @if(!in_array($taskItem->id, $visitedWebsites))
                @php $availableSiteCount++; @endphp
                <div class="task-card">
                    {{-- <img src="{{env('ADMIN_URL').'/'.$taskItem->logo}}" style="width: 25px; height: 25px" alt="" class="task-logo" loading="lazy"> --}}
                    <img src="{{url('assets')}}/images/logo.png" style="width: 25px; height: 25px" alt="" class="task-logo" loading="lazy">
                    <div class="task-details">
                        <h2 style="font-size: 13px; margin-bottom: 3px; text-shadow: 1px 1px 1px black;">{{$taskItem->title}}</h2>
                        <p style="font-size: 11px; margin: 5px 0px;">{{$taskItem->description}}</p>
                        <p style="font-size: 13px; font-weight: 600;">USDT +0.1</p>
                    </div>
                    <div class="task-status" style="margin-left: 5px" id="task-status-{{$taskItem->id}}">
                        <a href="javascript:void(0)" onclick="visitWebsite('{{$taskItem->link}}', {{$taskItem->id}})" style="text-decoration: none; color: #05FF65; font-size: 14px; font-weight: 600; padding: 4px 6px; border: 2px dotted white; border-radius: 4px;">Visit</a>
                    </div>
                </div>
            @endif
            @endforeach

            @if($availableSiteCount == 0)
            <h5 style="text-align: center; font-size: 16px;">No Website to Visit</h5>
            @endif


            {{ $tasks->links() }}

        </div>

    </div>
@endsection

@section('footer_js')
    <script>

        function visitWebsite(websiteUrl, websiteId){

            $(".background-blur").show();
            $(".loader").show();

            $.ajax({
                url: '/claim/website/point',
                method: 'POST',
                contentType: 'application/json',
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                data: JSON.stringify({
                    website_id: websiteId
                }),
                success: function(response) {

                    $(".background-blur").hide();
                    $(".loader").hide();
                    window.open(websiteUrl, '_blank', 'noopener,noreferrer');

                    $("#task-status-"+websiteId).html("<a href='javascript:void(0)' style='text-decoration: none; color: #05FF65; font-size: 14px; padding: 4px 6px; border: 2px solid #c0c0c07d; border-radius: 4px;'>Visited</a>");
                    return false;

                },
                error: function(xhr, status, error) {
                    toastr.error("Something Went Wrong");
                    return false;
                }
            });

        }

        Telegram.WebApp.onEvent('backButtonClicked', function() {
            window.history.back();
        });

    </script>
@endsection
