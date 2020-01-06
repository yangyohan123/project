package model;
import java.util.Date;

public class Board {
	private int border_num;
	private String thema;
	private String subject;
	private String content;
	private String file;
	private Date date;
	private int views;
	private String id;
	private String name;
	private int typenum;
	private String nickname;
	private int cnt;
	private String profile;
	
	
	public int getBorder_num() {
		return border_num;
	}
	public void setBorder_num(int border_num) {
		this.border_num = border_num;
	}
	public String getThema() {
		return thema;
	}
	public void setThema(String thema) {
		this.thema = thema;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTypenum() {
		return typenum;
	}
	public void setTypenum(int typenum) {
		this.typenum = typenum;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	@Override
	public String toString() {
		return "Board [border_num=" + border_num + ", thema=" + thema + ", subject=" + subject + ", content=" + content
				+ ", file=" + file + ", date=" + date + ", views=" + views + ", id=" + id + ", name=" + name
				+ ", typenum=" + typenum + ", nickname=" + nickname + ", cnt=" + cnt + ", profile=" + profile + "]";
	}
	
	
	
	
	
	
}
