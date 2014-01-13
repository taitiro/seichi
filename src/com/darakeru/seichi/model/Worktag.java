package com.darakeru.seichi.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the worktag database table.
 * 
 */
@Entity
@NamedQuery(name="Worktag.findAll", query="SELECT w FROM Worktag w")
public class Worktag implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int worktagid;

	private String name;

	//bi-directional many-to-one association to Work
	@ManyToOne
	@JoinColumn(name="workid")
	private Work work;

	public Worktag() {
	}

	public int getWorktagid() {
		return this.worktagid;
	}

	public void setWorktagid(int worktagid) {
		this.worktagid = worktagid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Work getWork() {
		return this.work;
	}

	public void setWork(Work work) {
		this.work = work;
	}

}