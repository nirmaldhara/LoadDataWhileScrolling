package com.codewale.example.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class CountryDAO {
	
	public List getCountry(int pid, int noofrecord)
	{
      Connection connection=null;
		List contryList=new ArrayList();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			int start_no=pid*noofrecord;
			int end_no=(pid*noofrecord)+noofrecord;
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "CHRIST","CHRIST");
			Statement st=connection.createStatement();
		
			ResultSet rs= st.executeQuery("select * from (select countryname, rownum rnum from country) where rnum<="+end_no +" and rnum >="+start_no);
			while(rs.next())
			{
				contryList.add(rs.getString(1))	; 
				
			}
	}catch(Exception e){
		e.printStackTrace();
	}
		finally{
			try {
				
				connection.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
return contryList;
}
}
