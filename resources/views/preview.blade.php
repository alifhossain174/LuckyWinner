<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Preview Page</title>
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body styling */
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #1c1c1c, #000000);
            color: #fff;
            text-align: center;
        }

        /* Container styling */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100vh;
        }

        /* Section styling */
        .single-section {
            width: 90%;
            max-width: 400px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        /* Button styling */
        a {
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            border: none;
            background: #ffffff;
            color: red;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        a:hover {
            background: red;
            color: #ffffff;
        }
    </style>
</head>

<body>
    <div class="container">
        <section class="single-section">
            <h1 style="margin-bottom: 20px;">Welcome to {{env('APP_NAME')}}</h1>
            {{-- <p>Ton & Dogs Miner is a Telegram Mini App to earn Dogs Tokens! You can instantly withdraw the amount of Ton & Dogs you earn daily. </p> --}}
            <a href="https://t.me/{{env('TELEGRAM_BOT_USERNAME')}}">Get Started</a>
        </section>
    </div>
</body>

</html>
