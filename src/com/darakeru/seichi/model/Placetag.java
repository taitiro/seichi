package com.darakeru.seichi.model;

import java.io.Serializable;

import javax.persistence.*;

import org.apache.commons.lang3.StringEscapeUtils;


/**
 * The persistent class for the placetag database table.
 * 
 */
@Entity
@Table(name="placetag")
@NamedQuery(name="Placetag.findAll", query="SELECT p FROM Placetag p")
public class Placetag implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int placetagid;

	private String name;

	//bi-directional many-to-one association to Place
	@ManyToOne
	@JoinColumn(name="placeid")
	private Place place;

	public Placetag() {
	}

	public int getPlacetagid() {
		return this.placetagid;
	}

	public void setPlacetagid(int placetagid) {
		this.placetagid = placetagid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = StringEscapeUtils.escapeHtml4(name);
	}

	public Place getPlace() {
		return this.place;
	}

	public void setPlace(Place place) {
		this.place = place;
	}

}