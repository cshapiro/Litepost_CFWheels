<!--- TODO: add anchor to comments (coming from home page) --->
<!--- entries by id --->
<!--- add link to user --->
<cfset makecomment.entryID = "#params.key#">
<div id="content">

<cfoutput>		
<h1>#entry.title#</h1>
<em>by: #entry.user.fname# #entry.user.lname#</em><br>
Posted: #dateFormat(entry.dateCreated, 'mmmm d, yyyy')#<br><br>				
<p>#entry.body#</p>						
</cfoutput>

<h3>Comments</h3><br>

<cfoutput query="thiscomments">
<div class="comments">
<p>#comment#<br><em>Posted by</em> #linkTo(text="#name#", action="mailto:#email#")# website: #url# Created: #dateCreated#</p>
</div>
</cfoutput>
<br><br>
<h3>Add a Comment</h3>
<!--- TODO: make comment, name and email required --->
<cfoutput>
	#startFormTag(action="createNewComment")#
	#errorMessagesFor("makecomment")#
	
							#textField(objectName='makecomment', property='name', label='Name')#
						
							#textField(objectName='makecomment', property='email', label='Email')#
						
							#textField(objectName='makecomment', property='url', label='Website')#
						
							#textArea(objectName='makecomment', property='comment', label='Comment')#
							
							#hiddenField(objectName="makecomment", property="entryID")#
							
	#submitTag(value="Add your comment")#
					
				#endFormTag()#
							
</cfoutput>
<div style="clear: both;">&nbsp;</div>
		</div>
		<!-- end #content -->

						
<cfoutput>#includePartial("sideBar")#</cfoutput>