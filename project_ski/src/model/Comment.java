package model;

public class Comment {
	private int num;
	private String id;
	private String nickname;
	private String content;
	private String profile;
	private int typenum;
	private int border_num;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getTypenum() {
		return typenum;
	}
	public void setTypenum(int typenum) {
		this.typenum = typenum;
	}
	public int getBorder_num() {
		return border_num;
	}
	public void setBorder_num(int border_num) {
		this.border_num = border_num;
	}
	
	@Override
	public String toString() {
		return "Comment [num=" + num + ", id=" + id + ", nickname=" + nickname + ", content=" + content + ", profile="
				+ profile + ", typenum=" + typenum + ", border_num=" + border_num + "]";
	}
	
	

}
