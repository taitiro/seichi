package com.darakeru.seichi.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the placeinfo database table.
 * 
 */
@Entity
@NamedQuery(name="Placeinfo.findAll", query="SELECT p FROM Placeinfo p")
public class Placeinfo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int placeid;

	private int accessnum;

	private int visitnum;

	//bi-directional one-to-one association to Place
	@OneToOne
	@JoinColumn(name="placeid")
	private Place place;

	public Placeinfo() {
	}

	public int getPlaceid() {
		return this.placeid;
	}

	public void setPlaceid(int placeid) {
		this.placeid = placeid;
	}

	public int getAccessnum() {
		return this.accessnum;
	}

	public void setAccessnum(int accessnum) {
		this.accessnum = accessnum;
	}

    public void addAccessnum() {
        this.accessnum++;
    }
    
	public int getVisitnum() {
		return this.visitnum;
	}

	public void setVisitnum(int visitnum) {
		this.visitnum = visitnum;
	}

	public Place getPlace() {
		return this.place;
	}

	public void setPlace(Place place) {
		this.place = place;
	}

}