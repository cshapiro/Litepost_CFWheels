<h1>Editing entry</h1>

<cfoutput>

			#errorMessagesFor("entry")#
	
			#startFormTag(action="update", key=params.key)#
						
						#select(objectName="entry", property="userID", label="User", options=users)#
					
						#select(objectName="entry", property="categoryID", label="Category", options=categories)#
					
						#textField(objectName='entry', property='title', label='Title')#
					
						#textArea(objectName='entry', property='body', label='Body')#
					
						Date Created: #Entry.dateCreated#<br><br>
					
						Date Updated: #Entry.dateLastUpdated#<br><br>
						
				
				#submitTag()#
				
			#endFormTag()#
</cfoutput>



<cfif comments.recordcount gt 0>
<h1>Comments on this entry</h1>

<cftable query="comments" colHeaders="true" HTMLTable="true">
	
					<cfcol header="Comment ID" text="#comments.commentID#" />
				
					<!--- TODO: hook this up to the entry name --->
					<cfcol header="Entry ID" text="#comments.entryID#" />
				
					<cfcol header="Name" text="#comments.name#" />
				
					<cfcol header="Email" text="#comments.email#" />
				
					<cfcol header="Date Created" text="#comments.dateCreated#" />
				
	<cfcol header="" text="#linkTo(text='Show', controller="comments", action='show', key=commentID)#" />
	<cfcol header="" text="#linkTo(text='Edit', controller="comments", action='edit', key=commentID)#" />
	<cfcol header="" text="#linkTo(text='Delete', controller="comments", action='delete', key=commentID, confirm='Are you sure?')#" />
</cftable>
<br><br>
</cfif>
			

<cfoutput>#linkTo(text="Return to the listing", action="index")#</cfoutput>

