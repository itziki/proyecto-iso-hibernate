package iso3.pt;

import java.util.*;

// dipina: introducido implements Serializable, para poder guardar LanguageDesigner en Session
public class LanguageDesigner implements java.io.Serializable, Comparable {
	private String fullName;
	private String nationality;
	private String language;
	
	public LanguageDesigner(){
	}

	public LanguageDesigner(String fullName, String nationality, String language) {
		super();
		this.fullName = fullName;
		this.nationality = nationality;
		this.language = language;
	}

	// added by dipina so that LanguageDesigner objects can be ordered
	public int compareTo(Object o) {
		LanguageDesigner temp = (LanguageDesigner)o;
		return this.fullName.compareTo(temp.fullName);
	}
	
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	
	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	
	public String toString(){
		return "(" + this.fullName + "|" + this.nationality + "|" + this.language + ")";
	}
}
