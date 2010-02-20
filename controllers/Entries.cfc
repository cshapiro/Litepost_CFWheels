<cfcomponent extends="Controller" output="false">
	
	<!--- entries/home --->
	<cffunction name="home">
		<cfset entries = model("Entry").findAll(include="user")>
		<cfset categories = model("Category").findAll()>
		<!---<cfset comments = model("Comment").findAll()>--->
		<cfset bookmarks = model("Bookmark").findAll()>
	</cffunction>
	
	<cffunction name="homeDet">
		<cfset entry = model("Entry").findOne(where="entryID=#params.key#", include="user")>
		<cfset entries = model("Entry").findAll(include="user")>
		<cfset categories = model("Category").findAll()>
		<cfset comments = model("Comment").findAll(where="entryID=#params.key#")>
		<cfset comment = model("Comment").new()>
		<cfset bookmarks = model("Bookmark").findAll()>
		<!---<cfdump var="#entry#">
		<cfabort>--->
	</cffunction>
	
	<cffunction name="homeCat">
		<cfset catentries = model("Entry").findAll(where="categoryID=#params.key#", include="user")>
		<cfset catname = model("Category").findOne(where="categoryID=#params.key#")>
		<cfset entries = model("Entry").findAll(include="user")>
		<cfset categories = model("Category").findAll()>
		<cfset bookmarks = model("Bookmark").findAll()>
	</cffunction>
	
	<cffunction name="createNewComment">
		<!--- TODO: this doesn't work if the person doesn't fill in all the fields. It defaults to the 
		createNewComment page, which doesn't exist so it goes to the login page. I need it to reload and 
		display success or failure ...  --->
		<!--- TODO: I need to email the comment to me and I need to approve it before it will be posted
		so probably need to add some kind of flag to comments table --->
		<cfset comment = model("Comment").new(params.comment)>
		
		<!--- Verify that the comment creates successfully --->
		<cfif comment.save()>
			<cfset flashInsert(success="The comment was created successfully.")>
            <cfset redirectTo(controller="entries", action="home")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the comment.")>
			<cfset renderPage(controller="entries", action="homeDet", key="#comment.entryID#")>
		</cfif>
	</cffunction>
	
	<!--- entries/index --->
	<cffunction name="index">
		<cfset entries = model("Entry").findAll()>
	</cffunction>
	
	<!--- entries/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset entry = model("Entry").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(entry)>
	        <cfset flashInsert(error="Entry #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- entries/new --->
	<cffunction name="new">
		<cfset entry = model("Entry").new()>
		<cfset categories = model("Category").findAll()>
		<cfset users = model("User").findAll()>
	</cffunction>
	
	<!--- entries/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset entry = model("Entry").findByKey(params.key)>
    	<cfset categories = model("Category").findAll()>
		<cfset users = model("User").findAll()>
		<cfset comments = model("Comment").findALL(where="entryID = #params.key#")>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(entry)>
	        <cfset flashInsert(error="Entry #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- entries/create --->
	<cffunction name="create">
		<cfset entry = model("Entry").new(params.entry)>
		
		<!--- Verify that the entry creates successfully --->
		<cfif entry.save()>
			<cfset flashInsert(success="The entry was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the entry.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- entries/update --->
	<cffunction name="update">
		<cfset entry = model("Entry").findByKey(params.key)>
		
		<!--- Verify that the entry updates successfully --->
		<cfif entry.update(params.entry)>
			<cfset flashInsert(success="The entry was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the entry.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- entries/delete/key --->
	<cffunction name="delete">
		<cfset entry = model("Entry").findByKey(params.key)>
		
		<!--- Verify that the entry deletes successfully --->
		<cfif entry.delete()>
			<cfset flashInsert(success="The entry was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the entry.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
