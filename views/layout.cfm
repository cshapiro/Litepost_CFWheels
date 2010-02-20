<!--- Place HTML here that should be used as the default layout of your application --->
<html>
<head>
<title>CFWheels Blog based on Litepost</title>
<cfoutput>#stylesheetLinkTag("menu,style")#</cfoutput>
<!--- TODO: add ckeditor to all textareas --->
<!---<cfoutput>#javascriptIncludeTag("ckeditor/ckeditor.js")#</cfoutput>--->
</head>
	<body>
	<div id="wrapper">
	<div id="header-wrapper">	
	<div id="header">
		<div id="logo">
			<h1><a href="#">CFWheels Blog</a></h1>
			<p>Look Ma, no xml!</p>	
			<div id="menubuttons"><cfoutput>#linkTo(text="#imageTag("homebtn.png")#", controller="entries", action="home")##linkTo(text="#imageTag("loginbtn.png")#", controller="users",action="login")#</cfoutput></div>	
		<div style="clear: both;">&nbsp;</div>
		</div>
	</div>	
	</div>
	<!-- end #header -->
	<div id="page">
	<div id="page-bgtop">
	
	<div id="page-bgbtm">
	
		<cfif StructKeyExists(session, "user")>
		<cfoutput>
		<div id="newmenu">
		<ul>
		<li>#linkTo(text="Entries", controller="entries", action="index")#</li>
		<li>#linkTo(text="Categories", controller="categories", action="index")#</li>
		<li>#linkTo(text="Comments", controller="comments", action="index")#</li>
		<li>#linkTo(text="Users", controller="users", action="index")#</li>
		<li>#linkTo(text="Bookmarks", controller="bookmarks", action="index")#</li>
		<li>#linkTo(text="Logout", controller="users", action="logout")#</li>
		</ul>
		</div>
		</cfoutput>
		<div style="clear: both;">&nbsp;</div>
		</cfif>
		
		<cfoutput>#contentForLayout()#</cfoutput>
	
	
	
	<div style="clear: both;">&nbsp;</div>
	</div>
	</div>
	</div>
	<!-- end #page -->
</div>
	<div id="footer">
		<p>Copyright (c) 2010 Cathy Shapiro. All rights reserved. </p>
	</div>
	<!-- end #footer -->

	</body>
</html>
