package com.darakeru.seichi.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the workinfo database table.
 * 
 */
@Entity
@NamedQuery(name="Workinfo.findAll", query="SELECT w FROM Workinfo w")
public class Workinfo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int workid;

	private int accessnum;

	//bi-directional one-to-one association to Work
	@OneToOne
	@JoinColumn(name="workid")
	private Work work;

	public Workinfo() {
	}

	public int getWorkid() {
		return this.workid;
	}

	public void setWorkid(int workid) {
		this.workid = workid;
	}

	public int getAccessnum() {
		return this.accessnum;
	}

	public void setAccessnum(int accessnum) {
		this.accessnum = accessnum;
	}

	public Work getWork() {
		return this.work;
	}

	public void setWork(Work work) {
		this.work = work;
	}

}