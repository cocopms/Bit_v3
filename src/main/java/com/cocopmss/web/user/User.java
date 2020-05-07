package com.cocopmss.web.user;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class User {
	private String userid, passwd, name, ssn, addr,
			profile, email, phoneNumber, registerDate;
	
	//분실물 ID, 습득물품명, 습득일자, 습득물분류, 습득위치(지하철)
		public String toString() {
			return String.format("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s",userid, passwd, name, ssn, addr,
					profile, email, phoneNumber, registerDate);
		}
}