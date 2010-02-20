<!--- TODO: add search functionality --->
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
					<h2>Aliquam tempus</h2>
					<p>Mauris vitae nisl nec metus placerat perdiet est. Phasellus dapibus semper consectetuer hendrerit.</p>
				</li>
				<li>
					<h2>Categories</h2>
					<ul>
						<cfoutput query="categories">
						<li>#linkTo(text="#Category#", action="homeCat", key="#categories.categoryID#")#</a></li>
						</cfoutput>
					</ul>
				</li>
				<li>
					<h2>Blogroll</h2>
					<ul>
						<cfoutput query="entries">
						<li>#linkTo(text="#title#", action="homeDet", key="#entryID#")#</li>
						</cfoutput>
					</ul>
				</li>
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