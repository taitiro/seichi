package com.darakeru.seichi.model;

import com.darakeru.seichi.Parameter;

import java.io.Serializable;

import javax.persistence.*;

import org.apache.commons.lang3.StringEscapeUtils;

import com.darakeru.checkparam.CheckStr;

import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the place database table.
 * 
 */
@Entity
@NamedQuery(name="Place.findAll", query="SELECT p FROM Place p")
public class Place implements Serializable {
	private static final long serialVersionUID = 1L;
    /** 
     * ASIN(Amazon Standard Identification Number)の桁数
     */
    private static final int ASIN_LENGTH = 10;

	@Id
	private int placeid;

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

	private String twitterid;

	private String url1;

	private String url2;

	private String url3;

	private String urlname1;

	private String urlname2;

	private String urlname3;

    private int instagramid;

	//bi-directional one-to-one association to Placeinfo
	@OneToOne(mappedBy="place")
	private Placeinfo placeinfo;

	//bi-directional many-to-one association to Placetag
	@OneToMany(mappedBy="place", fetch = FetchType.EAGER)
	private List<Placetag> placetags;

	//bi-directional many-to-one association to Placework
	@OneToMany(mappedBy="place", fetch = FetchType.EAGER)
	private List<Placework> placeworks;

	public Place() {
	}

	public int getPlaceid() {
		return this.placeid;
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
        this.lat = new BigDecimal(lngStr);
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
        this.productid1 = (productid1.length() == ASIN_LENGTH ) ? productid1 : "" ;
    }

    public String getProductid2() {
        return this.productid2;
    }

    public void setProductid2(String productid2) {
        this.productid2 = (productid2.length() == ASIN_LENGTH ) ? productid2 : "" ;
    }

    public String getProductid3() {
        return this.productid3;
    }

    public void setProductid3(String productid3) {
        this.productid3 = (productid3.length() == ASIN_LENGTH ) ? productid3 : "" ;
    }

    public String getProductid4() {
        return this.productid4;
    }

    public void setProductid4(String productid4) {
        this.productid4 = (productid4.length() == ASIN_LENGTH ) ? productid4 : "" ;
    }

    public String getProductid5() {
        return this.productid5;
    }

    public void setProductid5(String productid5) {
        this.productid5 = (productid5.length() == ASIN_LENGTH ) ? productid5 : "" ;
    }

	public String getTwitterid() {
		return this.twitterid;
	}

	public void setTwitterid(String twitterid) {
		this.twitterid = twitterid;
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

	public Placeinfo getPlaceinfo() {
		return this.placeinfo;
	}

	public void setPlaceinfo(Placeinfo placeinfo) {
		this.placeinfo = placeinfo;
	}

	public List<Placetag> getPlacetags() {
		return this.placetags;
	}

	public void setPlacetags(List<Placetag> placetags) {
		this.placetags = placetags;
	}

	public Placetag addPlacetag(Placetag placetag) {
		getPlacetags().add(placetag);
		placetag.setPlace(this);

		return placetag;
	}

	public Placetag removePlacetag(Placetag placetag) {
		getPlacetags().remove(placetag);
		placetag.setPlace(null);

		return placetag;
	}

	public List<Placework> getPlaceworks() {
		return this.placeworks;
	}

	public void setPlaceworks(List<Placework> placeworks) {
		this.placeworks = placeworks;
	}

	public Placework addPlacework(Placework placework) {
		getPlaceworks().add(placework);
		placework.setPlace(this);

		return placework;
	}

	public Placework removePlacework(Placework placework) {
		getPlaceworks().remove(placework);
		placework.setPlace(null);

		return placework;
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
    
    @Override
    public String toString() {
        return "Name : " + this.name + "\n"
                + "Address : " + this.address + "\n"
                + "Latitude : " + this.lat + "\n"
                + "Longtitude : " + this.lng + "\n"
                + "Facebook ID : " + this.facebookid + "\n"
                + "Foursqare ID : " + this.foursquareid + "\n"
                + "Google Reference : " + this.googleid + "\n"
                + "Image URL : " + this.img + "\n"
                + "Instagram Location ID : " + this.instagramid + "\n"
                + "Place Description : " + this.placedesc + "\n"
                + "Product ID 1 : " + this.productid1 + "\n"
                + "Product ID 2 : " + this.productid2 + "\n"
                + "Product ID 3 : " + this.productid3 + "\n"
                + "Product ID 4 : " + this.productid4 + "\n"
                + "Product ID 5 : " + this.productid5 + "\n"
                + "URL1 : " + this.url1 + " (Name : " + this.urlname1 + "  \n"
                + "URL2 : " + this.url2 + " (Name : " + this.urlname2 + "  \n"
                + "URL3 : " + this.url3 + " (Name : " + this.urlname3 + "  \n";
    }
}