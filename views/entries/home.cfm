<!--- TODO: add userDet page and link the authors name to it --->
<!--- TODO: show count on comments - isn't there a better way than this? comments link to an anchor on the homeDet page --->

<div id="content">

			<cfoutput query="entries">
			<cfset commentCount = model("Comments").count(where="entryID=#entries.entryID#")>
			
			<div class="post">			
				<h2 class="title">#linkTo(text="#title#", action="homeDet", key="#entryID#")#</h2>
				<p class="meta"><span class="date">#dateFormat(dateCreated, 'mmmm d, yyyy')#</span><span class="posted">Posted by <a href="">#fname# #lname#</a></span></p>
				<div style="clear: both;">&nbsp;</div>
				<div class="entry">
					<p>#left(body, 530)#...</p>
					<p class="links">#linkTo(text="Read More", action="homeDet", key="#entryID#")#&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;#linkTo(text="Comments", action="homeDet", key="#entryID#")# (#commentCount#)</p>
				</div>
			</div>
			</cfoutput>


<div style="clear: both;">&nbsp;</div>
		</div>
		<!-- end #content -->
		


<cfoutput>#includePartial("sideBar")#</cfoutput>
