<%@page import="java.util.List,org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="org.codehaus.jackson.JsonGenerationException"%>
<% 
List countryList=(List) request.getAttribute("countyList");
try{
	if(countryList!=null && countryList.size()>0){
for(int i=0;i<countryList.size();i++){
	out.println("<div class='postitem'><a href=''#' style='text-decoration: none'>"+countryList.get(i)+"-"+i+"</a></div>");
}
}
}

catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}



%>
