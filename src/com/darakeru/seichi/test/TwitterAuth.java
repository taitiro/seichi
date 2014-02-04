package com.darakeru.seichi.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.zip.GZIPInputStream;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;

import org.apache.commons.codec.binary.Base64;

import com.darakeru.seichi.Parameter;

public class TwitterAuth {

    public static final String CONSUMER_KEY = "";
    public static final String CONSUMER_SECRET_KEY = "";
    public static final String ENC = "utf-8";
    public static final String TWITTER_AUTH_URL = "https://api.twitter.com/oauth2/token";
    //public static final String TWITTER_AUTH_URL = "http://localhost/test.php";
    public static final String TWITTER_CONTENT_TYPE = "application/x-www-form-urlencoded;charset=UTF-8";
    public static final String TWITTER_REQUEST_BOSY = "grant_type=client_credentials";

    public static void main(String[] args) {
        try {
            HttpURLConnection con = (HttpURLConnection) new URL(TWITTER_AUTH_URL).openConnection();
            String rawAuth = URLEncoder.encode(Parameter.TWITTER_CONSUMER_KEY, ENC) + ":"
                    + URLEncoder.encode(Parameter.TWITTER_CONSUMER_SECRET_KEY, ENC);
            System.out.println("rawAuth: " + rawAuth);
            String beforeAuth = "Basic " + Base64.encodeBase64String(rawAuth.getBytes(ENC));
            System.out.println("beforeAuth: " + beforeAuth);
            String afterAuth = "";
            con.setDoOutput(true);
            con.setRequestMethod("POST");
            con.setRequestProperty("Authorization", beforeAuth);
            con.setRequestProperty("Accept-Encoding", "gzip" );
            con.setRequestProperty("Content-Type", TWITTER_CONTENT_TYPE);
            con.connect();
            // POSTパラメータを設定……PrintStreamを利用
            try (PrintStream ps = new PrintStream(con.getOutputStream())) {
                ps.print(TWITTER_REQUEST_BOSY);
            }
            if(con.getResponseCode() == 200){
                /*
                BufferedReader reader = new BufferedReader(new InputStreamReader(new GZIPInputStream(con.getInputStream())));
                String s;
                while ((s = reader.readLine()) != null) {
                    System.out.println(s);
                }
                reader.close();
                */
                
                JsonReader jsonReader = Json.createReader(new InputStreamReader(new GZIPInputStream( con.getInputStream() ), ENC ));
                JsonObject object = jsonReader.readObject();
                afterAuth = object.getString("access_token");
                
            }else{
                System.out.println("サーバーからエラーが帰ってきました(" + con.getResponseCode() + ") : " + con.getResponseMessage());
            }
            con.disconnect();
            System.out.println("帰ってきた認証コード : " + afterAuth);
            /*
            String urlStr = "";///
            System.out.println("get url : " + urlStr);
            URL url = new URL(urlStr);
            HttpURLConnection con2 = (HttpURLConnection) url.openConnection();
            con2.setRequestProperty("Authorization", "Bearer " + afterAuth);
            con2.setRequestMethod("GET");
            try {
                con2.connect();
                if (con2.getResponseCode() == 200) {
                    BufferedReader reader = new BufferedReader(new InputStreamReader(con2.getInputStream()));
                    String s;
                    while ((s = reader.readLine()) != null) {
                        System.out.println(s);
                    }
                    reader.close();
                    System.out.println("===END===");
                    JsonReader jsonReader = Json.createReader(con.getInputStream(),ENC);
                    JsonObject object = jsonReader.readObject();
                    JsonArray venues = object.getJsonObject("result").getJsonArray("places");
                    for (int i = 0; i < venues.size(); i++) {
                        String id = venues.getJsonObject(i).getString("id");
                        String name = venues.getJsonObject(i).getString("name");
                        System.out.println("id : " + id);
                        System.out.println("name : " + name);
                    }
                } else {
                    System.out.println("Error "+ con2.getResponseCode() + " : " + con2.getResponseMessage());
                    BufferedReader reader = new BufferedReader(new InputStreamReader(con2.getInputStream()));
                    String s;
                    while ((s = reader.readLine()) != null) {
                        System.out.println(s);
                    }
                    reader.close();
                    System.out.println("===END===");
                }
            } finally {
                con2.disconnect();
            }
            */
        } catch (Exception e) {
            System.out.println("ダメでしたー");
            e.printStackTrace();
        }
    }
}
