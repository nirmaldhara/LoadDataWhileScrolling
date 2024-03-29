package com.codewale.example.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.codewale.example.Dao.CountryDAO;

public class CountryAction {
	
	
	private List countyList=new ArrayList<String>();
	
	public List getCountyList() {
		return countyList;
	}

	public void setCountyList(List countyList) {
		this.countyList = countyList;
	}

	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		
       int row=Integer.parseInt(request.getParameter("row"));
       int noofrecord=Integer.parseInt(request.getParameter("noofrecord"));
       System.out.println(row);
       CountryDAO cDAO= new CountryDAO();
       List clist=cDAO.getCountry(row,noofrecord);
       setCountyList(clist);
       request.setAttribute("countyList", countyList);
		return "country";

	}

}
