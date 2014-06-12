<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<style type="text/css">
body {
	font-family: "Trebuchet MS", "Helvetica", "Arial",  "Verdana", "sans-serif";
	font-size: 62.5%;
}
</style>
<meta charset="utf-8">
  <title>jQuery UI Autocomplete - Remote JSONP datasource</title>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

  <style type='text/css'>
  
div.mousescroll {
overflow: hidden;
background-color:#ffffff;
word-wrap: break-word;
margin-bottom:5px;
border-bottom:1px solid #548FC1;
border:1px solid #9EE3FF;
border-bottom:2px solid #A6AEBF;
height:250px;

}
div.mousescroll:hover {
    overflow-y: scroll;
}
ul {
    list-style-type: none;
}
.postitem{
			border-top:1px dotted #D9F2FC;
			padding: 0.5em;
			
}
.postitem a{
			 color: #03597D;
			
}

.postitem:hover{
			background:#F7FCFE;
		}


  </style>

<script type="text/javascript">
var i=-1;
$(document).ready(function(){
		$('#autoupdateQuestions').scroll(function(){
			
		var elem = $('#autoupdateQuestions');
		console.log(elem.innerHeight()+elem.scrollTop()+"-----");
		console.log(elem[0].scrollHeight);
		if(elem.scrollTop() + elem.innerHeight()>=elem[0].scrollHeight){
	// alert("hi");
        i++;
			//alert("php/autoupdate.php?lastid="+i);
		    	$('div#loadmoreajaxloader').show();
				$.ajax({
				
				type: 'post',

				url: './getcountry',

				 data:{"row"  :""+i+"",
				       "noofrecord"  : ""+3+"",
				 },

				success: function(html){
					//alert(html.replace(/(\r\n|\n|\r)/gm,""));
						if(html.replace(/(\r\n|\n|\r)/gm,"")){
							$("#autoupdateQuestions").append(html);
							$('div#loadmoreajaxloader').hide();
						}else{
							$('div#loadmoreajaxloader').html('<center>No more data to show.</center>');
						}
					}
				});
		    }
		});
		});
  </script>
</head>
<body>
<h1>Struts 2 load data while scrolling down using  jquery ajax</h1>

<div class="mousescroll" id="autoupdateQuestions">
       <div class='postitem'><a href=''#' style='text-decoration: none'>test 1</a></div>
       <div class='postitem'><a href=''#' style='text-decoration: none'>test 2</a></div>
       <div class='postitem'><a href=''#' style='text-decoration: none'>test 3</a></div>
       <div class='postitem'><a href=''#' style='text-decoration: none'>test 4</a></div>
       <div class='postitem'><a href=''#' style='text-decoration: none'>test 5</a></div>
       <div class='postitem'><a href=''#' style='text-decoration: none'>test 6</a></div>
       <div class='postitem'><a href=''#' style='text-decoration: none'>test 7</a></div>
       <div class='postitem'><a href=''#' style='text-decoration: none'>test 8</a></div>
       <div class='postitem'><a href=''#' style='text-decoration: none'>test 9</a></div>
       <div class='postitem'><a href=''#' style='text-decoration: none'>test 10</a></div>
       <div class='postitem'><a href=''#' style='text-decoration: none'>test 11</a></div>
       <div class='postitem'><a href=''#' style='text-decoration: none'>test 12</a></div>
       <div class='postitem'><a href=''#' style='text-decoration: none'>test 13</a></div>
       
            </div>
			<div id="loadmoreajaxloader" style="display:none; background-color:#ffffff"><center><img src="images/ui-anim_basic_16x16.gif" /></center></div>

</body>
</html>