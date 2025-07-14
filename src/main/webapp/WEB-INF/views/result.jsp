<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Weather Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: url('/images/sun.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        .card {
            background: rgba(255, 255, 255, 0.85);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1s ease-in-out;
        }

        .quote {
            font-style: italic;
            text-align: center;
            margin-top: 15px;
            color: green;
            font-weight: 500;
        }

        .label {
            color: #333;
            font-weight: 500;
        }

        .value {
            color: #000;
            font-weight: bold;
        }

        .btn-success {
            background-color: #388e3c;
            border: none;
        }

        .btn-success:hover {
            background-color: #2e7d32;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center align-items-center" style="height: 100%;">
    <div class="card text-center" style="min-width: 400px;">
        <h3>🌞 Weather in <strong>${weather.name}</strong></h3>
        <hr>
        <p><span class="label">Description:</span> <span class="value">${weather.weather[0].description}</span></p>
        <p><span class="label">Temperature:</span> <span class="value">${weather.main.temp} °C</span></p>
        <p><span class="label">Humidity:</span> <span class="value">${weather.main.humidity}%</span></p>
        <p><span class="label">Wind Speed:</span> <span class="value">${weather.wind.speed} m/s</span></p>

        <div class="mt-4">
            <a href="/" class="btn btn-success px-4">🔙 Back</a>
        </div>

        <div class="quote">"🌱 Plant Trees, Save World"</div>
    </div>
</div>

</body>
</html>
