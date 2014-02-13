package com.darakeru.seichi;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class SeichiProperties {
    private Properties configuration = new Properties();
    private String urlRoot;
    private String instagramClientId;
    private String facebookToken;
    private String foursquareClientId;
    private String foursquareClientSecretId;
    private String twitterConsumerKey;
    private String twitterConsumerSecretKey;
    private String twitterToken;
    private String amazonApiAccessKey;
    private String amazonApiSecretKey;
    private String versionDate;
    private int latlngScale;
    private int asinLength;
    private boolean apiLimit;
    private long apiInterval;
    private String bingAccountKey;
    
    public SeichiProperties() {
        try {
            InputStream inputStream = new FileInputStream(new File( Thread.currentThread().getContextClassLoader().getResource("").getPath() , "seichi.properties"));
            configuration.load(inputStream);
            this.urlRoot = configuration.getProperty("URL_ROOT");
            this.amazonApiAccessKey = configuration.getProperty("AMAZON_API_ACCESS_KEY");
            this.amazonApiSecretKey = configuration.getProperty("AMAZON_API_SECRET_KEY");
            this.apiInterval = Long.parseLong(configuration.getProperty("API_INTERVAL"));
            this.apiLimit = Boolean.valueOf(configuration.getProperty("API_LIMIT"));
            this.asinLength = Integer.parseInt(configuration.getProperty("ASIN_LENGTH"));
            this.facebookToken = configuration.getProperty("FACEBOOK_TOKEN");
            this.foursquareClientId = configuration.getProperty("FOURSQUARE_CLIENT_ID");
            this.foursquareClientSecretId = configuration.getProperty("FOURSQUARE_CLIENT_SECRET_ID");
            this.instagramClientId = configuration.getProperty("INSTAGRAM_CLIENT_ID");
            this.latlngScale = Integer.parseInt(configuration.getProperty("LATLNG_SCALE"));
            this.twitterConsumerKey = configuration.getProperty("TWITTER_CONSUMER_KEY");
            this.twitterConsumerSecretKey = configuration.getProperty("TWITTER_CONSUMER_SECRET_KEY");
            this.twitterToken = configuration.getProperty("TWITTER_TOKEN");
            this.urlRoot = configuration.getProperty("URL_ROOT");
            this.versionDate = configuration.getProperty("VERSION_DATE");
            this.bingAccountKey = configuration.getProperty("BING_ACCOUNT_KEY");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public String getUrlRoot() {
        return urlRoot;
    }
    public String getInstagramClientId() {
        return instagramClientId;
    }
    public String getFacebookToken() {
        return facebookToken;
    }
    public String getFoursquareClientId() {
        return foursquareClientId;
    }
    public String getFoursquareClientSecretId() {
        return foursquareClientSecretId;
    }
    public String getTwitterConsumerKey() {
        return twitterConsumerKey;
    }
    public String getTwitterConsumerSecretKey() {
        return twitterConsumerSecretKey;
    }
    public String getTwitterToken() {
        return twitterToken;
    }
    public String getAmazonApiAccessKey() {
        return amazonApiAccessKey;
    }
    public String getAmazonApiSecretKey() {
        return amazonApiSecretKey;
    }
    public String getVersionDate() {
        return versionDate;
    }
    public int getLatlngScale() {
        return latlngScale;
    }
    public int getAsinLength() {
        return asinLength;
    }
    public boolean isApiLimit() {
        return apiLimit;
    }
    public long getApiInterval() {
        return apiInterval;
    }

    public String getBingAccountKey() {
        return bingAccountKey;
    }
}