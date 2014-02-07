package com.darakeru.apiClient.instagram;

import java.io.IOException;
import java.io.Serializable;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;

import com.darakeru.seichi.Parameter;

public class LocationMediaBean implements Serializable {

    /** Imstagram Client ID */
    private final String CLIENT_ID = Parameter.INSTAGRAM_CLIENT_ID;
    /** Instagram Location Recent Media Endpoint
     * https://api.instagram.com/v1/locations/ロケーションID/media/recent?client_id=クライアントID
     * */
    public final String ENDPOINT_URL = "https://api.instagram.com/v1/locations/";
    public final String ENDPOINT_URL_SUFFIX = "/media/recent?client_id=";

    /** Instagram Location ID */
    private int id;
    /** コメント */
    private ArrayList<OneMedia> mediaArray;

    public LocationMediaBean(int id) throws IOException {
        this.setId(id);
        ArrayList<OneMedia> mediaArray = new ArrayList<>();
        String urlStr = ENDPOINT_URL;
        urlStr += String.valueOf(id);
        urlStr += ENDPOINT_URL_SUFFIX;
        urlStr += CLIENT_ID;
        URL url = new URL(urlStr);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        try {
            con.connect();
            if (con.getResponseCode() == 200) {
                JsonReader jsonReader = Json.createReader(con.getInputStream());
                JsonObject object = jsonReader.readObject();
                JsonArray datas = object.getJsonArray("data");
                for (int i = 0; i < datas.size(); i++) {
                    //今のところ写真のみ対応
                    if (datas.getJsonObject(i).getString("type").equals("image")) {
                        OneMedia thisMedia = new OneMedia();
                        thisMedia.setUrl(datas.getJsonObject(i).getString("link"));
                        thisMedia.setName(datas.getJsonObject(i).getJsonObject("user").getString("username"));
                        thisMedia.setImage(datas.getJsonObject(i).getJsonObject("images").getJsonObject("thumbnail").getString("url"));
                        if(datas.getJsonObject(i).isNull("caption")){
                            thisMedia.setComment("");
                        }else{
                            thisMedia.setComment(datas.getJsonObject(i).getJsonObject("caption").getString("text"));
                        }
                        mediaArray.add(thisMedia);
                    }
                }
            }
        } finally {
            con.disconnect();
        }
        this.setMediaArray(mediaArray);
    }

    public int getId() {
        return id;
    }

    private void setId(int id) {
        this.id = id;
    }

    public ArrayList<OneMedia> getMediaArray() {
        return mediaArray;
    }

    public void setMediaArray(ArrayList<OneMedia> mediaArray) {
        this.mediaArray = mediaArray;
    }

}
