package com.darakeru.apiClient.twitter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

public class OneTweet {
    
    /** twitterから帰ってくるの投稿日時の書式 */
    public static final SimpleDateFormat TWITTER_DF = new SimpleDateFormat("EEE MMM dd HH:mm:ss ZZZZ yyyy", Locale.ENGLISH);
    /** twitterの投稿日時のタイムゾーン */
    public static final String TWITTER_TIME_ZONE = "UTC";
    /**表示する投稿日時のタイムゾーン */
    public static final String MY_TIME_ZONE = "Asia/Tokyo";
    /** 表示する投稿日時の書式 */
    public static SimpleDateFormat myDf = new SimpleDateFormat("yyyy-mm-dd");
    
    /** tweetの本文 */
    private String comment;
    /** tweetをした人間の名前 */
    private String name;
    /** tweetをした人間のスクリーンネーム */
    private String screenName;
    /** tweetをした日時 */
    private String date;
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
    public String getScreenName() {
        return screenName;
    }
    public void setScreenName(String screenName) {
        this.screenName = screenName;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public void setDateByEnglish(String dateStr) throws ParseException {
        myDf.setTimeZone(TimeZone.getTimeZone(MY_TIME_ZONE));
        Date date = TWITTER_DF.parse(dateStr);
        this.date = myDf.format(date);
    }


}
