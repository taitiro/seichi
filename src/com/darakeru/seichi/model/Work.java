package com.darakeru.seichi.model;

import java.io.Serializable;

import javax.persistence.*;

import org.apache.commons.lang3.StringEscapeUtils;

import com.darakeru.checkparam.CheckStr;

import java.util.List;


/**
 * The persistent class for the work database table.
 * 
 */
@Entity
@Table(name="work")
@NamedQueries({
    @NamedQuery(name="Work.findAll", query="SELECT w FROM work w "),
    @NamedQuery(name="Work.findByName", query="SELECT w FROM work w WHERE (w.name like :name) OR (w.workdesc like :name) "),
    @NamedQuery(name="Work.findIdAndName", query="SELECT w.workid, w.name FROM work w ORDER BY w.workid")
    })
public class Work implements Serializable {
	private static final long serialVersionUID = 1L;
	/** 
	 * ASIN(Amazon Standard Identification Number)の桁数
	 */
	private static final int ASIN_LENGTH = 10;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int workid;

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

	//bi-directional many-to-one association to Placework
	@OneToMany(mappedBy="work", fetch = FetchType.EAGER)
	private List<Placework> placeworks;

	//bi-directional one-to-one association to Workinfo
	@OneToOne(mappedBy="work")
	private Workinfo workinfo;

	//bi-directional many-to-one association to Worktag
	@OneToMany(mappedBy="work", fetch = FetchType.EAGER)
	private List<Worktag> worktags;

	public Work() {
	}

	public int getWorkid() {
		return this.workid;
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

	public List<Placework> getPlaceworks() {
		return this.placeworks;
	}

	public void setPlaceworks(List<Placework> placeworks) {
		this.placeworks = placeworks;
	}

	public Placework addPlacework(Placework placework) {
		getPlaceworks().add(placework);
		placework.setWork(this);

		return placework;
	}

	public Placework removePlacework(Placework placework) {
		getPlaceworks().remove(placework);
		placework.setWork(null);

		return placework;
	}

	public Workinfo getWorkinfo() {
		return this.workinfo;
	}

	public void setWorkinfo(Workinfo workinfo) {
		this.workinfo = workinfo;
	}

	public List<Worktag> getWorktags() {
		return this.worktags;
	}

	public void setWorktags(List<Worktag> worktags) {
		this.worktags = worktags;
	}

	public Worktag addWorktag(Worktag worktag) {
		getWorktags().add(worktag);
		worktag.setWork(this);

		return worktag;
	}

	public Worktag removeWorktag(Worktag worktag) {
		getWorktags().remove(worktag);
		worktag.setWork(null);

		return worktag;
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
}