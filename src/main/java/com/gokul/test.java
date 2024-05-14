package com.gokul;

import java.util.HashMap;

public class test {
	public static void main(String[] args) {
		CommonCredentials cc = new CommonCredentials();
		HashMap hm = new HashMap();
		hm = cc.getresultset("Gokul R", "");
		System.out.println(hm);
		String str = cc.insertUser("Gokul", "abcd");
		System.out.println(str);
	}

}
