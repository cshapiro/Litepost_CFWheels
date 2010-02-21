<cfcomponent extends="Model" output="false">

	<cffunction name="init">
		<cfset belongsTo(name="entry", foreignKey="entryID")>
		<cfset validatesPresenceOf( properties="comment,name,email")>
		<cfset validatesFormatOf("email")>
	</cffunction>

</cfcomponent>
