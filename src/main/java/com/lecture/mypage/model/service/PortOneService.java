package com.lecture.mypage.model.service;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

public class PortOneService {
	private static final String BASE_URL = "https://api.portone.io";
    private static final String API_KEY = "ItEQKi3rY7uvDS8l";
    private static final String API_SECRET = "";

    private String getAccessToken() throws Exception {
        URL url = new URL(BASE_URL + "/users/getToken");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setDoOutput(true);

        String requestBody = String.format("{\"imp_key\":\"%s\",\"imp_secret\":\"%s\"}", API_KEY, API_SECRET);
        connection.getOutputStream().write(requestBody.getBytes());

        InputStream is = connection.getInputStream();
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> response = mapper.readValue(is, Map.class);

        if ("0".equals(response.get("code").toString())) {
            Map<String, Object> data = (Map<String, Object>) response.get("response");
            return data.get("access_token").toString();
        }
        throw new RuntimeException("Failed to get access token");
    }

    public Map<String, Object> verifyPayment(String transactionId) throws Exception {
        String accessToken = getAccessToken();

        URL url = new URL(BASE_URL + "/payments/" + transactionId);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Authorization", accessToken);

        InputStream is = connection.getInputStream();
        ObjectMapper mapper = new ObjectMapper();
        return mapper.readValue(is, Map.class);
    }
}
