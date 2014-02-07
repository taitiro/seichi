package com.darakeru.apiClient.twitter;

import java.io.Serializable;
import java.math.BigDecimal;

public class GeoTweetBean implements Serializable {

    private int id;
    private BigDecimal lat;
    private BigDecimal lng;
    
    public GeoTweetBean() {
        // TODO 自動生成されたコンストラクター・スタブ
    }

    public BigDecimal getLat() {
        return lat;
    }

    public void setLat(BigDecimal lat) {
        this.lat = lat;
    }

    public BigDecimal getLng() {
        return lng;
    }

    public void setLng(BigDecimal lng) {
        this.lng = lng;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
