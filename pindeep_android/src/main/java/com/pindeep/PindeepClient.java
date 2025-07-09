package com.pindeep;

import okhttp3.*;
import org.json.JSONObject;
import java.io.IOException;

public class PindeepClient {
    private final String apiKey;
    private final String baseUrl;
    private final OkHttpClient client;

    public PindeepClient(String apiKey, String baseUrl) {
        this.apiKey = apiKey;
        this.baseUrl = baseUrl.endsWith("/") ? baseUrl : baseUrl + "/";
        this.client = new OkHttpClient();
    }

    public void createLink(JSONObject json, Callback callback) {
        RequestBody body = RequestBody.create(json.toString(), MediaType.get("application/json"));
        Request request = new Request.Builder()
                .url(baseUrl + "create.php")
                .addHeader("X-API-KEY", apiKey)
                .post(body)
                .build();
        client.newCall(request).enqueue(callback);
    }

    public void getStats(String code, Callback callback) {
        Request request = new Request.Builder()
                .url(baseUrl + "stats.php?code=" + code)
                .addHeader("X-API-KEY", apiKey)
                .build();
        client.newCall(request).enqueue(callback);
    }
}