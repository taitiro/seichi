package com.darakeru.seichi.model;

import java.io.Serializable;
import java.util.HashMap;

public class ConfirmPlaceBean extends Place implements Serializable {

    private HashMap<Long,String> facebookids;
    
    private HashMap<String,String> foursquareids;

    private HashMap<Integer,String> instagramids;

    private HashMap<String,String> twitterids;

	public ConfirmPlaceBean() {
        super();
	    setFacebookids(new HashMap<Long,String>());
        setFoursquareids(new HashMap<String,String>());
        setInstagramids(new HashMap<Integer,String>());
        setTwitterids(new HashMap<String,String>());
	}

    @Override
    public String toString() {
        return "Name : " + this.getName() + "\n"
                + "Address : " + this.getAddress() + "\n"
                + "Google Reference : " + this.getGoogleid() + "\n"
                + "Image URL : " + this.getImg() + "\n"
                + "Place Description : " + this.getPlacedesc() + "\n"
                + "Product ID 1 : " + this.getProductid1() + "\n"
                + "Product ID 2 : " + this.getProductid2() + "\n"
                + "Product ID 3 : " + this.getProductid3() + "\n"
                + "Product ID 4 : " + this.getProductid4() + "\n"
                + "Product ID 5 : " + this.getProductid5() + "\n"
                + "URL1 : " + this.getUrl1() + " (Name : " + this.getUrlname1() + "  \n"
                + "URL2 : " + this.getUrl2() + " (Name : " + this.getUrlname2() + "  \n"
                + "URL3 : " + this.getUrl3() + " (Name : " + this.getUrlname3() + "  \n";
    }

    public HashMap<Long,String> getFacebookids() {
        return facebookids;
    }

    public void setFacebookids(HashMap<Long,String> facebookids) {
        this.facebookids = facebookids;
    }


    public void addFacebookids(long key, String value) {
        this.facebookids.put(key, value);
    }

    public HashMap<String,String> getFoursquareids() {
        return foursquareids;
    }

    public void setFoursquareids(HashMap<String,String> foursquareids) {
        this.foursquareids = foursquareids;
    }

    public void addFacebookids(String key, String value) {
        this.foursquareids.put(key, value);
    }
    
    public HashMap<Integer,String> getInstagramids() {
        return instagramids;
    }

    public void setInstagramids(HashMap<Integer,String> instagramids) {
        this.instagramids = instagramids;
    }
    

    public void addInstagramids(int key, String value) {
        this.instagramids.put(key, value);
    }

    public HashMap<String,String> getTwitterids() {
        return twitterids;
    }

    public void setTwitterids(HashMap<String,String> twitterids) {
        this.twitterids = twitterids;
    }

    public void addTwitterids(String key, String value) {
        this.twitterids.put(key, value);
    }

    public void setFoursquareid() {
        // TODO 自動生成されたメソッド・スタブ
    }

    public void setFacebookid() {
        // TODO 自動生成されたメソッド・スタブ
        
    }
    
    public void setTwitterid() {
        // TODO 自動生成されたメソッド・スタブ
        
    }

    public void setInstagramid() {
        // TODO 自動生成されたメソッド・スタブ
        
    }
}