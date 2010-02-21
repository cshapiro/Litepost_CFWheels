<!--- entries by category --->

<div id="content">
<cfoutput><p>Blog entries for #catname.category#</p></cfoutput>

			<cfoutput query="catentries">
			<cfset commentCount = model("Comments").count(where="entryID=#catentries.entryID#")>
			<div class="post">			
				<h2 class="title">#linkTo(text="#title#", action="homeDet", key="#entryID#")#</h2>
				<p class="meta"><span class="date">#dateFormat(dateCreated, 'mmmm d, yyyy')#</span><span class="posted">Posted by <a href="">#fname# #lname#</a></span></p>
				<div style="clear: both;">&nbsp;</div>
				<div class="entry">
					<p>#left(body, 530)#</p>
					<p class="links">#linkTo(text="Read More", action="homeDet", key="#entryID#")#&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;#linkTo(text="Comments", action="homeDet", key="#entryID#")# <cfif commentCount neq 0>(#commentCount#)</cfif></p>
				</div>
			</div>
			</cfoutput>
		


<div style="clear: both;">&nbsp;</div>
		</div>
		<!-- end #content -->
		


<cfoutput>#includePartial("sideBar")#</cfoutput>