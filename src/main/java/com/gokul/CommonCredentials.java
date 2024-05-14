package com.gokul;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class CommonCredentials {
	public HashMap getresultset(String username, String password) {
		HashMap htValues = new HashMap();

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@10.54.6.10:6065:BOIMAIN", "GBM", "gbm");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt
					.executeQuery("select USER_ID,password from USER_PROFILE_GOKUL where user_id='" + username + "'");
			ResultSetMetaData rsmd = rs.getMetaData();

			System.out.println("Connection Established ");
			int iHashCount;
			iHashCount = 0;
			String sColumnValue = "";

			try {
				while (rs.next()) {
					iHashCount++;
					ArrayList vColumnValues = new ArrayList();
					// System.out.println(rs.getString(1));
					for (int i = 1; i <= rsmd.getColumnCount(); i++) {
						sColumnValue = rs.getString(rsmd.getColumnName(i));
						if (sColumnValue != null) {
							vColumnValues.add(sColumnValue);
						} else {
							vColumnValues.add("");
						}
					}
					htValues.put(Integer.toString(iHashCount), vColumnValues);
				}
				rs.close();
				stmt.close();
			} catch (Exception e) {
				System.out.println("Error in Getting Result  " + e);
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (stmt != null)
						stmt.close();
					if (conn != null)
						conn.close();
				} catch (SQLException sqlException) {
					System.out.println("In Finally block  " + sqlException);
				}
			}
		} catch (Exception e) {
			System.out.println("In Catch block  " + e);
		}
		return htValues;
	}

	public String insertUser(String username, String password) {
		String usr = "";
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@10.54.6.10:6065:BOIMAIN", "GBM", "gbm");
			Statement stmt = conn.createStatement();
			int rs = stmt.executeUpdate("INSERT INTO user_profile_gokul VALUES ('" + username + "',fn_encode_base64 ('"+ password + "'),sysdate,sysdate)");
			if (rs > 0) {
				ResultSet rs1 = stmt
						.executeQuery("select user_id from user_profile_gokul where user_id='" + username + "'");
				ResultSetMetaData rsmd = rs1.getMetaData();

				while (rs1.next()) {
						usr = rs1.getString(1);
				}
			} else {
				System.out.println("Failed to Insert");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return usr;
	}
}
