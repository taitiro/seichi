package com.darakeru.seichi.model;

import java.io.IOException;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringEscapeUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.darakeru.checkparam.CheckStr;
import com.darakeru.seichi.SeichiProperties;

/**
 * The persistent class for the work database table.
 * 
 */
public class ConfirmWorkBean implements Serializable {
    private static final long serialVersionUID = 1L;
    private static final SeichiProperties conf = new SeichiProperties();
    /**
     * Wikpediaのエンドポイント
     */
    public static final String WIKIPEDIA_URL = "http://ja.wikipedia.org/w/api.php?action=opensearch&limit=1&format=xml&search=";
    /**
     * Yahoo Category Search APIのエンドポイント
     */
    private static final String YAHOO_URL = "http://dir.yahooapis.jp/Category/V1/directorySearch?type=2&results=3&appid=" 
     + conf.getYahooApiKey() + "&query=";
    /**
     * Yahoo Category Search APIのエンドポイント
     */
    private static final String AMAZON_URL = "http://ecs.amazonaws.jp/onca/xml?";
    public static final String AMAZON_URL_HEADER = "GET\necs.amazonaws.jp\n/onca/xml\n";
    /** 
     * ASIN(Amazon Standard Identification Number)の桁数
     */
    private static final int ASIN_LENGTH = 10;
    // SAXReaderを生成
    private SAXReader reader = new SAXReader();
    /** 
     * Wikipediaが受け付けない文字
     */
    public static String[] WIKIPEDIA_PRE_REPLACE = { "！", "？" };
    /** 
     * Wikipediaが受け付ける文字
     */
    public static String[] WIKIPEDIA_AFTER_REPLACE = { "!", "?" };

    private String img;

    private String name;

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

    private String wikipedia;

    private String workdesc;

    public ConfirmWorkBean() {
    }

    public String getImg() {
        return this.img;
    }

    public void setImg(String img) {
        this.img = new CheckStr(img).urlCheck() ? img : "";
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = StringEscapeUtils.escapeHtml4(name);
    }

    public String getProductid1() {
        return this.productid1;
    }

    public void setProductid1(String productid1) {
        this.productid1 = (productid1.length() == ASIN_LENGTH) ? productid1 : "";
    }

    public String getProductid2() {
        return this.productid2;
    }

    public void setProductid2(String productid2) {
        this.productid2 = (productid2.length() == ASIN_LENGTH) ? productid2 : "";
    }

    public String getProductid3() {
        return this.productid3;
    }

    public void setProductid3(String productid3) {
        this.productid3 = (productid3.length() == ASIN_LENGTH) ? productid3 : "";
    }

    public String getProductid4() {
        return this.productid4;
    }

    public void setProductid4(String productid4) {
        this.productid4 = (productid4.length() == ASIN_LENGTH) ? productid4 : "";
    }

    public String getProductid5() {
        return this.productid5;
    }

    public void setProductid5(String productid5) {
        this.productid5 = (productid5.length() == ASIN_LENGTH) ? productid5 : "";
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

    public String getWikipedia() {
        return this.wikipedia;
    }

    public void setWikipedia(String wikipedia) {
        this.wikipedia = new CheckStr(wikipedia).urlCheck() ? wikipedia : "";
    }

    public String getWorkdesc() {
        return this.workdesc;
    }

    public void setWorkdesc(String workdesc) {
        this.workdesc = StringEscapeUtils.escapeHtml4(workdesc);
    }

    @Override
    public String toString() {
        return "Name : " + this.name + "\n"
                + "Image URL : " + this.img + "\n"
                + "Place Description : " + this.workdesc + "\n"
                + "Product ID 1 : " + this.productid1 + "\n"
                + "Product ID 2 : " + this.productid2 + "\n"
                + "Product ID 3 : " + this.productid3 + "\n"
                + "Product ID 4 : " + this.productid4 + "\n"
                + "Product ID 5 : " + this.productid5 + "\n"
                + "URL1 : " + this.url1 + " (Name : " + this.urlname1 + "  \n"
                + "URL2 : " + this.url2 + " (Name : " + this.urlname2 + "  \n"
                + "URL3 : " + this.url3 + " (Name : " + this.urlname3 + "  \n";
    }

    public void setUrl() throws IOException, DocumentException{
        String urlStr = YAHOO_URL;
        this.setUrl1("");
        this.setUrl2("");
        this.setUrl3("");
        this.setUrlname1("");
        this.setUrlname2("");
        this.setUrlname3("");
        URL url = new URL(urlStr + URLEncoder.encode(this.getName(), "utf-8"));
        Document root = reader.read(url);
        @SuppressWarnings("unchecked")
        List<Element> list = root.getRootElement().element("SiteSearchResults").elements("Item");
        for(Element oneItem : list){
            if(!this.getUrl3().equals("")){
                break;
            }else if(this.getUrl1().equals("")){
                this.setUrl1(oneItem.element("Url").getText());
                this.setUrlname1(oneItem.element("Title").getText());
            }else if( this.getUrl2().equals("") 
                    && !this.getUrl1().equals(oneItem.element("Url").getText()) ){
                this.setUrl2(oneItem.element("Url").getText());
                this.setUrlname2(oneItem.element("Title").getText());
            }else if(this.getUrl3().equals("")
                    && !this.getUrl1().equals(oneItem.element("Url").getText())
                    && !this.getUrl2().equals(oneItem.element("Url").getText())){
                this.setUrl3(oneItem.element("Url").getText());
                this.setUrlname3(oneItem.element("Title").getText());
            }
        }
    }

    public void setProductid() throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException, DocumentException, MalformedURLException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
        String rawUrlStr = "AWSAccessKeyId=" + conf.getAmazonApiAccessKey() 
                + "&AssociateTag="+ conf.getAmazonAssociateTag() 
                + "&Keywords=" + URLEncoder.encode(this.getName(), "utf-8") 
                + "&Operation=ItemSearch"
                + "&SearchIndex=All"
                + "&Service=AWSECommerceService" 
                + "&Timestamp=" + URLEncoder.encode(sdf.format(new Date()),"utf-8") + ".000Z" 
                + "&Version=" + conf.getVersionDate();
        Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
        SecretKeySpec secret_key = new SecretKeySpec(conf.getAmazonApiSecretKey().getBytes(), "HmacSHA256");
        sha256_HMAC.init(secret_key);
        String hash = Base64.encodeBase64String(sha256_HMAC.doFinal((AMAZON_URL_HEADER + rawUrlStr).getBytes()));
        String amazonApiSig = URLEncoder.encode(hash, "utf-8");
        String urlStr = AMAZON_URL + rawUrlStr + "&Signature=" + amazonApiSig;
        /*System.out.println(urlStr);*/
        URL url = new URL(urlStr);
        Document root = reader.read(url);
        @SuppressWarnings("unchecked")
        List<Element> list = root.getRootElement().element("Items").elements("Item");
        int i=1;
        for(Element oneItem : list){
            switch(i){
            case 1:
                this.setProductid1(oneItem.element("ASIN").getText());
                break;
            case 2:
                this.setProductid2(oneItem.element("ASIN").getText());
                break;
            case 3:
                this.setProductid3(oneItem.element("ASIN").getText());
                break;
            case 4:
                this.setProductid4(oneItem.element("ASIN").getText());
                break;
            case 5:
                this.setProductid5(oneItem.element("ASIN").getText());
                break;
            default:
                break;
            }
            if(i >= 5){
                break;
            }
            i++;
        }
    }

    public void setWikipedia() throws IOException, URISyntaxException, DocumentException {
        String urlStr = WIKIPEDIA_URL;
        String wikipediaTitle = this.getName();
        for (int i = 0; i < WIKIPEDIA_PRE_REPLACE.length; i++) {
            wikipediaTitle.replaceAll(WIKIPEDIA_PRE_REPLACE[i], WIKIPEDIA_AFTER_REPLACE[i]);
        }
        URL url = new URL(urlStr + URLEncoder.encode(wikipediaTitle, "utf-8"));
        Document root = reader.read(url);
        if (root.getRootElement().element("Section").element("Item").element("Url").getText() != null) {
            this.setWikipedia(root.getRootElement().element("Section").element("Item").element("Url").getText());
            if (this.getWorkdesc().equals("")) {
                this.setWorkdesc(root.getRootElement().element("Section").element("Item").element("Description")
                        .getText()
                        + "（[wikipedia](" + this.getWikipedia() + ")より）");
            }
        } else {
            this.setWikipedia("");
        }
    }
}