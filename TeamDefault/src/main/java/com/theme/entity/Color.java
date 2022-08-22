package com.theme.entity;

public class Color {
	private int Col;
	private String ColName;
	private String ColRGB;
	private String Colhtml;
	
	public Color() {
		super();
	}
	
	public Color(int col, String colName, String colRGB, String colhtml) {
		super();
		Col = col;
		ColName = colName;
		ColRGB = colRGB;
		Colhtml = colhtml;
	}

	public int getCol() {
		return Col;
	}

	public void setCol(int col) {
		Col = col;
	}

	public String getColName() {
		return ColName;
	}

	public void setColName(String colName) {
		ColName = colName;
	}

	public String getColRGB() {
		return ColRGB;
	}

	public void setColRGB(String colRGB) {
		ColRGB = colRGB;
	}

	public String getColhtml() {
		return Colhtml;
	}

	public void setColhtml(String colhtml) {
		Colhtml = colhtml;
	}

	@Override
	public String toString() {
		return "Color [Col=" + Col + ", ColName=" + ColName + ", ColRGB=" + ColRGB + ", Colhtml=" + Colhtml + "]";
	}
	
	
	
}
