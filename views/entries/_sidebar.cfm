<!--- TODO: add search functionality --->
<!--- TODO: create an archive section --->
<div id="sidebar">
			<ul>
				<li>
					<div id="search" >
					<form method="get" action="#">
						<div>
							<input type="text" name="s" id="search-text" value="" />
							<input type="submit" id="search-submit" value="GO" />
						</div>
					</form>
					</div>
					<div style="clear: both;">&nbsp;</div>
				</li>
				<li>
					<h2>Layout and Sidebar</h2>
					<p>I'm using the master layout in the views/layout.cfm file. If you want to edit things like the header text, and meta title, you will do so there.</p>
					<p>To edit the sidebar, go to views/entries/_sidebar.cfm. The sidebar is an includePartial()</p>
				</li>
				<li>
					<h2>Categories</h2>
					<ul>
						<cfoutput query="categories">
						<cfset entryCount = model("Entry").count(where="categoryID=#categories.categoryID#")>
						<li>#linkTo(text="#Category#", action="homeCat", key="#categories.categoryID#")#</a> (#entryCount#)</li>
						</cfoutput>
					</ul>
				</li>
				<li>
					<h2>Recent Comments</h2>
					<ul>
					<cfoutput query="comments">
					<li>Blog Post:#title# Comment: #left(comment, 300)#<br>Posted by #linkTo(text="#name#", action="mailto:#email#")# on #dateFormat(dateCreated, 'mm/dd/yyyy')# </li>
					</cfoutput>
					</ul>
				</li>
				<!---<li>
					<h2>Recent Posts</h2>
					<ul>
						<cfoutput query="entries">
						<li>#linkTo(text="#title#", action="homeDet", key="#entryID#")#</li>
						</cfoutput>
					</ul>
				</li>--->
				<li>
					<h2>Links</h2>
					<ul>
						<cfoutput query="bookmarks">
						<li><a href="#Url#" target="_blank">#Name#</a></li>
						</cfoutput>
					</ul>
				</li>
			</ul>
		</div>
		<!-- end #sidebar -->