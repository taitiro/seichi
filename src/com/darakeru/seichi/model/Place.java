package com.darakeru.seichi.model;

import java.io.Serializable;

import javax.persistence.*;

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

	@Id
	private int placeid;

	private String address;

	private String img;

	private BigDecimal lat;

	private BigDecimal lng;

	private String name;

	@Lob
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

	//bi-directional one-to-one association to Placeinfo
	@OneToOne(mappedBy="place")
	private Placeinfo placeinfo;

	//bi-directional many-to-one association to Placetag
	@OneToMany(mappedBy="place")
	private List<Placetag> placetags;

	//bi-directional many-to-one association to Placework
	@OneToMany(mappedBy="place",fetch = FetchType.EAGER)
	private List<Placework> placeworks;

	public Place() {
	}

	public int getPlaceid() {
		return this.placeid;
	}

	public void setPlaceid(int placeid) {
		this.placeid = placeid;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public BigDecimal getLat() {
		return this.lat;
	}

	public void setLat(BigDecimal lat) {
		this.lat = lat;
	}

	public BigDecimal getLng() {
		return this.lng;
	}

	public void setLng(BigDecimal lng) {
		this.lng = lng;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPlacedesc() {
		return this.placedesc;
	}

	public void setPlacedesc(String placedesc) {
		this.placedesc = placedesc;
	}

	public String getProductid1() {
		return this.productid1;
	}

	public void setProductid1(String productid1) {
		this.productid1 = productid1;
	}

	public String getProductid2() {
		return this.productid2;
	}

	public void setProductid2(String productid2) {
		this.productid2 = productid2;
	}

	public String getProductid3() {
		return this.productid3;
	}

	public void setProductid3(String productid3) {
		this.productid3 = productid3;
	}

	public String getProductid4() {
		return this.productid4;
	}

	public void setProductid4(String productid4) {
		this.productid4 = productid4;
	}

	public String getProductid5() {
		return this.productid5;
	}

	public void setProductid5(String productid5) {
		this.productid5 = productid5;
	}

	public String getUrl1() {
		return this.url1;
	}

	public void setUrl1(String url1) {
		this.url1 = url1;
	}

	public String getUrl2() {
		return this.url2;
	}

	public void setUrl2(String url2) {
		this.url2 = url2;
	}

	public String getUrl3() {
		return this.url3;
	}

	public void setUrl3(String url3) {
		this.url3 = url3;
	}

	public String getUrlname1() {
		return this.urlname1;
	}

	public void setUrlname1(String urlname1) {
		this.urlname1 = urlname1;
	}

	public String getUrlname2() {
		return this.urlname2;
	}

	public void setUrlname2(String urlname2) {
		this.urlname2 = urlname2;
	}

	public String getUrlname3() {
		return this.urlname3;
	}

	public void setUrlname3(String urlname3) {
		this.urlname3 = urlname3;
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

}