<!--- TODO: add userDet page and link the authors name to it --->
<!--- TODO: show count on comments and link to an anchor on the homeDet page --->

<div id="content">

<!---<cfdump var="#entries#">
<cfabort>--->
			<cfoutput query="entries">
			<div class="post">			
				<h2 class="title">#linkTo(text="#title#", action="homeDet", key="#entryID#")#</h2>
				<p class="meta"><span class="date">#dateFormat(dateCreated, 'mmmm d, yyyy')#</span><span class="posted">Posted by <a href="">#fname# #lname#</a></span></p>
				<div style="clear: both;">&nbsp;</div>
				<div class="entry">
					<p>#body#</p>
					<p class="links">#linkTo(text="Read More", action="homeDet", key="#entryID#")#&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;#linkTo(text="Comments", action="homeDet", key="#entryID#")#</p>
				</div>
			</div>
			</cfoutput>
		


<div style="clear: both;">&nbsp;</div>
		</div>
		<!-- end #content -->
		


<cfoutput>#includePartial("sideBar")#</cfoutput>
