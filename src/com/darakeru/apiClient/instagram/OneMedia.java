package com.darakeru.apiClient.instagram;

public class OneMedia {

    /** 写真の画像URL */
    private String image;
    /** 写真の掲載されているURL */
    private String url;
    /** 写真を投稿したユーザー名 */
    private String name;
    /** 写真を投稿した際のコメント */
    private String comment;
    
    public OneMedia() {
        //NOP
    }
    
    public String getImage() {
        return image;
    }
    
    public void setImage(String image) {
        this.image = image;
    }
    
    public String getUrl() {
        return url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getComment() {
        return comment;
    }
    
    public void setComment(String comment) {
        this.comment = comment;
    }

}
