package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the work database table.
 * 
 */
@Entity
@NamedQuery(name="Work.findAll", query="SELECT w FROM Work w")
public class Work implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int workid;

	private String name;

	private String productid0;

	private String productid1;

	private String productid2;

	private String productid3;

	private String productid4;

	@Lob
	private String workdesc;

	public Work() {
	}

	public int getWorkid() {
		return this.workid;
	}

	public void setWorkid(int workid) {
		this.workid = workid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProductid0() {
		return this.productid0;
	}

	public void setProductid0(String productid0) {
		this.productid0 = productid0;
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

	public String getWorkdesc() {
		return this.workdesc;
	}

	public void setWorkdesc(String workdesc) {
		this.workdesc = workdesc;
	}

}