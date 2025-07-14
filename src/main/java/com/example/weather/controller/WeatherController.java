package com.example.weather.controller;

import com.example.weather.model.WeatherResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

@Controller
public class WeatherController {

    private final String API_KEY = "eba8e66989c8117b9f66597091acf866"; // Replace with your real key

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @PostMapping("/getWeather")
    public String getWeather(@RequestParam String city, Model model) {

        // Step 1: Try to correct the city name using OpenWeatherMap's `/find` API
        String correctedCity = correctCityName(city);
        if (correctedCity == null) {
            model.addAttribute("error", "City not found! Please check the spelling.");
            return "index"; // Stay on same page
        }

        // Step 2: Fetch weather data for corrected city
        String url = "https://api.openweathermap.org/data/2.5/weather?q=" + correctedCity +
                "&appid=" + API_KEY + "&units=metric";

        try {
            RestTemplate restTemplate = new RestTemplate();
            WeatherResponse response = restTemplate.getForObject(url, WeatherResponse.class);
            model.addAttribute("weather", response);
            return "result";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Unable to retrieve weather information. Try again later.");
            return "index";
        }
    }

    // 🔧 Helper method to correct spelling using OpenWeatherMap's /find endpoint
    @SuppressWarnings("unchecked")
    private String correctCityName(String city) {
        String url = "http://api.openweathermap.org/data/2.5/find?q=" + city +
                "&appid=" + API_KEY + "&type=like&sort=population&cnt=1";

        try {
            RestTemplate restTemplate = new RestTemplate();
            Map<String, Object> response = restTemplate.getForObject(url, Map.class);
            List<Map<String, Object>> list = (List<Map<String, Object>>) response.get("list");

            if (list != null && !list.isEmpty()) {
                Map<String, Object> firstResult = list.get(0);
                return (String) firstResult.get("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null; // Not found
    }
}
