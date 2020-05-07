package com.cocopmss.web.admin;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Admin {
	private String employeeNumber, name, passwd, position, profile, registerDate, phoneNumber, email;

	public String toString() {
		return String.format("%s,%s,%s,%s,%s,%s,%s,%s",
				employeeNumber,passwd,name,position,profile,email,phoneNumber,registerDate);
	}
}