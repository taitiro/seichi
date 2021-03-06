package com.darakeru.seichi.model;

import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the placework database table.
 * 
 */
@Entity
@Table(name="placework")
@NamedQuery(name="Placework.findAll", query="SELECT p FROM Placework p")
public class Placework implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int placeworkid;

	//bi-directional many-to-one association to Place
	@ManyToOne
	@JoinColumn(name="placeid")
	private Place place;

	//bi-directional many-to-one association to Work
	@ManyToOne
	@JoinColumn(name="workid")
	private Work work;

	public Placework() {
	}

	public int getPlaceworkid() {
		return this.placeworkid;
	}

	public void setPlaceworkid(int placeworkid) {
		this.placeworkid = placeworkid;
	}

	public Place getPlace() {
		return this.place;
	}

	public void setPlace(Place place) {
		this.place = place;
	}

	public Work getWork() {
		return this.work;
	}

    public void setWork(Work work) {
        this.work = work;
    }

}