<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Weather App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('/images/nature.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
        }
        .card {
            background: rgba(255, 255, 255, 0.85);
            border-radius: 15px;
        }
        .quote {
            font-style: italic;
            text-align: center;
            margin-top: 10px;
            color: green;
            font-weight: 500;
            animation: fadeIn 3s ease-in;
        }
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center align-items-center" style="height: 100%;">
    <div class="card p-4 shadow" style="min-width: 400px;">
        <h2 class="text-center mb-3">🌿 Weather Finder</h2>
        <form action="/getWeather" method="post">
            <div class="mb-3">
                <input type="text" name="city" class="form-control" placeholder="Enter City (e.g., Chennai)" required>
            </div>
            <div class="d-grid">
                <button class="btn btn-success">Check Weather</button>
            </div>
        </form>
        <c:if test="${not empty error}">
            <div class="alert alert-danger mt-3">${error}</div>
        </c:if>
        <div class="quote">"🌱 Plant Trees, Save World"</div>
    </div>
</div>

</body>
</html>
