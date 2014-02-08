package com.darakeru.apiClient.twitter;

public class OneTweet {
    
    /** tweetの本文 */
    private String comment;
    /** tweetをした人間のスクリーンネーム */
    private String name;
    /** tweetのURL */
    private String url;
    
    public OneTweet() {
        // TODO 自動生成されたコンストラクター・スタブ
    }
    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
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


}
