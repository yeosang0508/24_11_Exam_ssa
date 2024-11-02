package com.example.demo.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class WeatherController {

    private static final String API_KEY = "f2f1129e95a5500d5d5bfd36fff1a9e4"; 

    @GetMapping("/usr/weather/write")
    public String showWeatherForm() {
        return "usr/weather/write"; 
    }
    
    private static final Map<String, String> cityMapping = new HashMap<>();
    static {
    	cityMapping.put("대전", "daejeon");
    	cityMapping.put("서울", "seoul");
    	cityMapping.put("부산", "busan");
    	cityMapping.put("광주", "gwangju");
    	cityMapping.put("인천", "incheon");
    	cityMapping.put("대구", "daegu");
    	cityMapping.put("울산", "ulsan");
    	cityMapping.put("수원", "suwon");
    	cityMapping.put("고양", "goyang");
    	cityMapping.put("용인", "yongin");
    	cityMapping.put("창원", "changwon");
    	cityMapping.put("성남", "seongnam");
    	cityMapping.put("청주", "cheongju");
    	cityMapping.put("천안", "cheonan");
    	cityMapping.put("전주", "jeonju");
    	cityMapping.put("안산", "ansan");
    	cityMapping.put("남양주", "namyangju");
    	cityMapping.put("안양", "anyang");
    	cityMapping.put("김해", "gimhae");
    	cityMapping.put("평택", "pyeongtaek");
    	cityMapping.put("포항", "pohang");
    	cityMapping.put("제주", "jeju");
    	cityMapping.put("김포", "gimpo");
    	cityMapping.put("의정부", "uiwangbu");
    	cityMapping.put("구미", "gumi");
    	cityMapping.put("광명", "gwangmyeong");
    	cityMapping.put("양산", "yangsan");
    	cityMapping.put("원주", "wonju");
    	cityMapping.put("울진", "uljin");
    	cityMapping.put("춘천", "chuncheon");


    }

    @GetMapping("/weather")
    public String getWeather(@RequestParam("city") String city, Model model) {
        String originalCity = city; 
        city = cityMapping.getOrDefault(city, city); 

        try {
            String encodedCity = URLEncoder.encode(city, StandardCharsets.UTF_8.name());
            String apiUrl = "http://api.openweathermap.org/data/2.5/weather?q=" + encodedCity
                            + "&appid=" + API_KEY + "&lang=kr&units=metric";


            RestTemplate restTemplate = new RestTemplate();
            String response = restTemplate.getForObject(apiUrl, String.class);


            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> data = mapper.readValue(response, Map.class);

     
            model.addAttribute("city", originalCity); 

           
            Map<String, Object> main = (Map<String, Object>) data.get("main");
            model.addAttribute("temp", main.get("temp"));
            model.addAttribute("feelsLike", main.get("feels_like"));
            model.addAttribute("tempMin", main.get("temp_min"));
            model.addAttribute("tempMax", main.get("temp_max"));
            model.addAttribute("humidity", main.get("humidity"));
            model.addAttribute("pressure", main.get("pressure"));

           
            Map<String, Object> wind = (Map<String, Object>) data.get("wind");
            model.addAttribute("windSpeed", wind.get("speed"));
            model.addAttribute("windDeg", wind.get("deg"));

           
            Map<String, Object> weather = ((List<Map<String, Object>>) data.get("weather")).get(0);
            model.addAttribute("description", weather.get("description"));

        } catch (HttpClientErrorException e) {
            
            model.addAttribute("error", "해당 도시를 찾을 수 없습니다. 올바른 도시 이름을 입력해 주세요.");
            return "usr/weather/write"; 
        } catch (Exception e) {
          
            e.printStackTrace();
            model.addAttribute("error", "날씨 정보를 가져오는 중 오류가 발생했습니다.");
            return "usr/weather/write"; 
        }

        return "usr/weather/detail"; 
    }
}