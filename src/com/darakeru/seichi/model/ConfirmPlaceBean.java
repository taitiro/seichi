package com.darakeru.seichi.model;

import java.io.IOException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.LinkedHashMap;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;

import org.apache.commons.lang3.StringEscapeUtils;

import com.darakeru.checkparam.CheckStr;
import com.darakeru.seichi.Parameter;

public class ConfirmPlaceBean implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * Foursquareのエンドポイント
     */
    public static final String FOURSQUARE_SEARCH_URL = "https://api.foursquare.com/v2/venues/search?";
    /**
     * Instagramのエンドポイント
     */
    public static final String INSTAGRAM_SEARCH_URL = "https://api.instagram.com/v1/locations/search?";
    /**
     * Facebookのエンドポイント
     */
    private static final String FACEBOOK_SEARCH_URL = "https://graph.facebook.com/search?";
    
    private String address;

    private long facebookid;

    private String foursquareid;

    private String googleid;

    private String img;

    private BigDecimal lat;

    private BigDecimal lng;

    private String name;

    private String placedesc;

    private String productid1;

    private String productid2;

    private String productid3;

    private String productid4;

    private String productid5;

    private String url1;

    private String url2;

    private String url3;

    private String urlname1;

    private String urlname2;

    private String urlname3;

    private int instagramid;
    
    private int workid = 0;
    
    private LinkedHashMap<Long, String> facebookids;

    private LinkedHashMap<String, String> foursquareids;

    private LinkedHashMap<Integer, String> instagramids;
    
    public ConfirmPlaceBean() {
        super();
        setFacebookids(new LinkedHashMap<Long, String>());
        setFoursquareids(new LinkedHashMap<String, String>());
        setInstagramids(new LinkedHashMap<Integer, String>());
    }

    @Override
    public String toString() {
        return "Name : " + this.getName() + "\n"
                + "lat : " + this.getLat() + "\n"
                + "lng : " + this.getLng() + "\n"
                + "Address : " + this.getAddress() + "\n"
                + "Google Reference : " + this.getGoogleid() + "\n"
                + "Image URL : " + this.getImg() + "\n"
                + "Place Description : " + this.getPlacedesc() + "\n"
                + "Product ID 1 : " + this.getProductid1() + "\n"
                + "Product ID 2 : " + this.getProductid2() + "\n"
                + "Product ID 3 : " + this.getProductid3() + "\n"
                + "Product ID 4 : " + this.getProductid4() + "\n"
                + "Product ID 5 : " + this.getProductid5() + "\n"
                + "URL1 : " + this.getUrl1() + " (Name : " + this.getUrlname1() + " ） \n"
                + "URL2 : " + this.getUrl2() + " (Name : " + this.getUrlname2() + " ） \n"
                + "URL3 : " + this.getUrl3() + " (Name : " + this.getUrlname3() + " ） \n"
                + "FacebookID : " + this.getFacebookid() + "\n"
                + "FoursquareID : " + this.getFoursquareid() + "\n"
                + "InstagramID : " + this.getInstagramid() + "\n";
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = StringEscapeUtils.escapeHtml4(address);
    }

    public long getFacebookid() {
        return this.facebookid;
    }

    public void setFacebookid(long facebookid) {
        this.facebookid = facebookid;
    }
    
    public void setFacebookid(String facebookid) {
        this.facebookid = Long.parseLong(facebookid);
    }

    public String getFoursquareid() {
        return this.foursquareid;
    }

    public void setFoursquareid(String foursquareid) {
        this.foursquareid = foursquareid;
    }

    public String getGoogleid() {
        return this.googleid;
    }

    public void setGoogleid(String googleid) {
        this.googleid = googleid;
    }

    public String getImg() {
        return this.img;
    }

    public void setImg(String img) {
        this.img = new CheckStr(img).urlCheck() ? img : "";
    }

    public BigDecimal getLat() {
        return this.lat;
    }

    public void setLat(String latStr) throws NumberFormatException {
        this.lat = new BigDecimal(latStr);
        this.lat.setScale(Parameter.LATLNG_SCALE);
    }
    
    public BigDecimal getLng() {
        return this.lng;
    }

    public void setLng(String lngStr) throws NumberFormatException {
        this.lng = new BigDecimal(lngStr);
        this.lng.setScale(Parameter.LATLNG_SCALE);
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = StringEscapeUtils.escapeHtml4(name);
    }

    public String getPlacedesc() {
        return this.placedesc;
    }

    public void setPlacedesc(String placedesc) {
        this.placedesc = StringEscapeUtils.escapeHtml4(placedesc);
    }

    public String getProductid1() {
        return this.productid1;
    }

    public void setProductid1(String productid1) {
        this.productid1 = (productid1.length() == Parameter.ASIN_LENGTH ) ? productid1 : "" ;
    }

    public String getProductid2() {
        return this.productid2;
    }

    public void setProductid2(String productid2) {
        this.productid2 = (productid2.length() == Parameter.ASIN_LENGTH ) ? productid2 : "" ;
    }

    public String getProductid3() {
        return this.productid3;
    }

    public void setProductid3(String productid3) {
        this.productid3 = (productid3.length() == Parameter.ASIN_LENGTH ) ? productid3 : "" ;
    }

    public String getProductid4() {
        return this.productid4;
    }

    public void setProductid4(String productid4) {
        this.productid4 = (productid4.length() == Parameter.ASIN_LENGTH ) ? productid4 : "" ;
    }

    public String getProductid5() {
        return this.productid5;
    }

    public void setProductid5(String productid5) {
        this.productid5 = (productid5.length() == Parameter.ASIN_LENGTH ) ? productid5 : "" ;
    }

    public String getUrl1() {
        return this.url1;
    }

    public void setUrl1(String url1) {
        this.url1 = new CheckStr(url1).urlCheck() ? url1 : "";
    }

    public String getUrl2() {
        return this.url2;
    }

    public void setUrl2(String url2) {
        this.url2 = new CheckStr(url2).urlCheck() ? url2 : "";
    }

    public String getUrl3() {
        return this.url3;
    }

    public void setUrl3(String url3) {
        this.url3 = new CheckStr(url3).urlCheck() ? url3 : "";
    }

    public String getUrlname1() {
        return this.urlname1;
    }

    public void setUrlname1(String urlname1) {
        this.urlname1 = StringEscapeUtils.escapeHtml4(urlname1);
    }

    public String getUrlname2() {
        return this.urlname2;
    }

    public void setUrlname2(String urlname2) {
        this.urlname2 = StringEscapeUtils.escapeHtml4(urlname2);
    }

    public String getUrlname3() {
        return this.urlname3;
    }

    public void setUrlname3(String urlname3) {
        this.urlname3 = StringEscapeUtils.escapeHtml4(urlname3);
    }

    public int getInstagramid() {
        return instagramid;
    }

    public void setInstagramid(int instagramid) {
        this.instagramid = instagramid;
    }

    public void setInstagramid(String instagramidStr) {
        this.instagramid = Integer.parseInt(instagramidStr);
    }
    
    public LinkedHashMap<Long, String> getFacebookids() {
        return facebookids;
    }

    public void setFacebookids(LinkedHashMap<Long, String> facebookids) {
        this.facebookids = facebookids;
    }

    public void addFacebookids(long key, String value) {
        this.facebookids.put(key, StringEscapeUtils.escapeHtml4(value));
    }

    public LinkedHashMap<String, String> getFoursquareids() {
        return foursquareids;
    }

    public void setFoursquareids(LinkedHashMap<String, String> foursquareids) {
        this.foursquareids = foursquareids;
    }

    public void addFoursquareids(String key, String value) {
        this.foursquareids.put(key, StringEscapeUtils.escapeHtml4(value));
    }

    public LinkedHashMap<Integer, String> getInstagramids() {
        return instagramids;
    }

    public void setInstagramids(LinkedHashMap<Integer, String> instagramids) {
        this.instagramids = instagramids;
    }

    public void addInstagramids(int key, String value) {
        this.instagramids.put(key, StringEscapeUtils.escapeHtml4(value));
    }


    public void setFoursquareid() throws IOException {
        String urlStr = FOURSQUARE_SEARCH_URL;
        urlStr += ("ll=" + this.getLat().toPlainString() + "," + this.getLng().toPlainString());
        urlStr += ("&client_id=" + Parameter.FOURSQUARE_CLIENT_ID);
        urlStr += ("&client_secret=" + Parameter.FOURSQUARE_CLIENT_SECRET_ID);
        urlStr += ("&v=" + Parameter.VERSION_DATE);
        //System.out.println("get url : " + urlStr);
        URL url = new URL(urlStr);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        try {
            con.connect();
            if (con.getResponseCode() == 200) {
                JsonReader jsonReader = Json.createReader(con.getInputStream());
                JsonObject object = jsonReader.readObject();
                JsonArray venues = object.getJsonObject("response").getJsonArray("venues");
                for (int i = 0; i < venues.size(); i++) {
                    String id = venues.getJsonObject(i).getString("id");
                    String name = venues.getJsonObject(i).getString("name");
                    this.addFoursquareids(id, name);
                    if (i == 0) {
                        this.setFoursquareid(id);
                    }
                }
            } else {
                System.out.println("Error "+ con.getResponseCode() + " : " + con.getResponseMessage());
                this.addFoursquareids("", "Error");
                this.setFoursquareid("");
            }
        } finally {
            con.disconnect();
        }
    }

    public void setInstagramid() throws IOException {
        String urlStr = INSTAGRAM_SEARCH_URL;
        urlStr += ("lat=" + this.getLat().toPlainString());
        urlStr += ("&lng=" + this.getLng().toPlainString());
        urlStr += ("&client_id=" + Parameter.INSTAGRAM_CLIENT_ID);
        //System.out.println("get url : " + urlStr);
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
                    String idStr = datas.getJsonObject(i).getString("id");
                    int id = Integer.parseInt(idStr);
                    String name = datas.getJsonObject(i).getString("name");
                    this.addInstagramids(id, name);
                    if (i == 0) {
                        this.setInstagramid(id);
                    }
                }
            } else {
                System.out.println("Error "+ con.getResponseCode() + " : " + con.getResponseMessage());
                this.addInstagramids(0, "Error");
                this.setInstagramid(0);
            }
        } finally {
            con.disconnect();
        }
    }

    public void setFacebookid() throws IOException {
        String urlStr = FACEBOOK_SEARCH_URL;
        urlStr += ("type=place");
        urlStr += ("&center=" + this.getLat().toPlainString() + "," + this.getLng().toPlainString());
        urlStr += ("&access_token=" + Parameter.FACEBOOK_TOKEN);
        //System.out.println("get url : " + urlStr);
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
                    String idStr = datas.getJsonObject(i).getString("id");
                    long id = Long.parseLong(idStr);
                    String name = datas.getJsonObject(i).getString("name");
                    this.addFacebookids(id, name);
                    if (i == 0) {
                        this.setFacebookid(id);
                    }
                }
            } else {
                System.out.println("Error "+ con.getResponseCode() + " : " + con.getResponseMessage());
                this.addFacebookids(0, "Error");
                this.setFacebookid(0);
            }
        } finally {
            con.disconnect();
        }
    }

    public int getWorkid() {
        return workid;
    }

    public void setWorkid(int workid) {
        this.workid = workid;
    }
    
    public void setWorkid(String workidStr) {
        this.workid = Integer.parseInt(workidStr);
    }

}