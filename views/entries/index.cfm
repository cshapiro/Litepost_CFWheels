<!--- TODO: list how many comments are made on each entry --->

<h1>Listing entries</h1>

<cftable query="entries" colHeaders="true" HTMLTable="true">
					
					<!--- TODO: hook this up to the entry name  --->
					<cfcol header="Entry ID" text="#entryID#" />
				
					<!--- TODO: hook this up to the user name --->
					<cfcol header="User ID" text="#userID#" />
				
					<!--- TODO: hook this up to the category name --->
					<cfcol header="Category ID" text="#categoryID#" />
				
					<cfcol header="Title" text="#title#" />
				
					<cfcol header="Date Created" text="#dateFormat(dateCreated, 'm/dd/yyyy')# #timeFormat(dateCreated, 'h:mm tt')#" />
				
					<cfcol header="Date Last Updated" text="#dateFormat(dateLastUpdated, 'm/dd/yyyy')# #timeFormat(dateLastUpdated, 'h:mm tt')#" />
				
	<cfcol header="" text="#linkTo(text='Show', action='show', key=entryID)#" />
	<cfcol header="" text="#linkTo(text='Edit', action='edit', key=entryID)#" />
	<cfcol header="" text="#linkTo(text='Delete', action='delete', key=entryID, confirm='Are you sure?')#" />
</cftable>

<cfoutput>
	<p>#linkTo(text="New entry", action="new")#</p>
</cfoutput>
