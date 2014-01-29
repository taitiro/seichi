package com.darakeru.seichi.test;

import java.io.InputStream;
import java.io.PrintStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;

import org.apache.commons.codec.binary.Base64;

public class TwitterAuth {

    public static final String CONSUMER_KEY = "";
    public static final String CONSUMER_SECRET_KEY = "";
    public static final String ENC = "utf-8";
    public static final String TWITTER_AUTH_URL = "https://api.twitter.com/oauth2/token";
    public static final String TWITTER_CONTENT_TYPE = "application/x-www-form-urlencoded;charset=UTF-8";
    public static final String TWITTER_REQUEST_BOSY = "grant_type=client_credentials";

    public static void main(String[] args) {
        try {
            HttpURLConnection con = (HttpURLConnection) new URL(TWITTER_AUTH_URL).openConnection();
            String rawAuth = URLEncoder.encode(CONSUMER_KEY, ENC) + ":"
                    + URLEncoder.encode(CONSUMER_SECRET_KEY, ENC);
            String beforeAuth = "BASIC " + Base64.encodeBase64String(rawAuth.getBytes(ENC));
            System.out.println("beforeAuth: " + beforeAuth);
            String afterAuth = "";
            con.setDoOutput(true);
            con.setRequestMethod("POST");
            con.setRequestProperty("Authorization", beforeAuth);
            con.setRequestProperty("Content-Type", TWITTER_CONTENT_TYPE);
            con.connect();
            // POSTパラメータを設定（方法２）PrintStreamを利用
            try (PrintStream ps = new PrintStream(con.getOutputStream())) {
                ps.print(TWITTER_REQUEST_BOSY);
            }
            if(con.getResponseCode() == 200){
                JsonReader jsonReader = Json.createReader(con.getInputStream());
                JsonObject object = jsonReader.readObject();
                afterAuth = object.getString("access_token");
            }else{
                System.out.println("サーバーからエラーが帰ってきました(" + con.getResponseCode() + ") : " + con.getResponseMessage());
            }
            con.disconnect();
            System.out.println("帰ってきた認証コード : " + afterAuth);

        } catch (Exception e) {
            System.out.println("ダメでしたー");
            e.printStackTrace();
        }
    }
}
