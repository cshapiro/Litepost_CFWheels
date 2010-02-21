<!--- TODO: not sure whether to group these by entries, or to just put a link to the entry on the row  --->
<h1>Listing comments</h1>

<cftable query="comments" colHeaders="true" HTMLTable="true">
<cfset entryname = model("Entry").findAll(properties="title", where="entryID=#comments.entryID#")>	
					<cfcol header="Comment ID" text="#commentID#" />
				
					<!--- TODO: hook this up to the entry name --->
					<cfcol header="Entry ID" text="#entryname.title#" />
				
					<cfcol header="Comment" text="#left(comment, 300)#" />
				
					<cfcol header="Name" text="#name#" />
				
					<!---<cfcol header="Email" text="#email#" />--->
				
					<!---<cfcol header="Url" text="#url#" />--->
				
					<cfcol header="Date Created" text="#dateFormat(dateCreated, 'm/dd/yyyy')# #timeFormat(dateCreated, 'h:mm tt')#" />
				
	<cfcol header="" text="#linkTo(text='Show', action='show', key=commentID)#" />
	<cfcol header="" text="#linkTo(text='Edit', action='edit', key=commentID)#" />
	<cfcol header="" text="#linkTo(text='Delete', action='delete', key=commentID, confirm='Are you sure?')#" />
</cftable>

<cfoutput>
	<p>#linkTo(text="New comment", action="new")#</p>
</cfoutput>
