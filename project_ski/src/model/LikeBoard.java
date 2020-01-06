package model;

public class LikeBoard {
	private String id;
	private int border_num;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBorder_num() {
		return border_num;
	}
	public void setBorder_num(int border_num) {
		this.border_num = border_num;
	}
	@Override
	public String toString() {
		return "LikeBoard [id=" + id + ", border_num=" + border_num + "]";
	}
	
	
}
