package com.kh.libreria.member.model.vo;

public class Email {
	
	private String subject;
	private String text;
	private String from;
	private String to;
	private String ep_key;
	
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getEp_key() {
		return ep_key;
	}
	public void setEp_key(String ep_key) {
		this.ep_key = ep_key;
	}
	@Override
	public String toString() {
		return "Email [subject=" + subject + ", text=" + text + ", from=" + from + ", to=" + to + ", ep_key=" + ep_key
				+ "]";
	}
	
	
}
