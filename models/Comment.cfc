<cfcomponent extends="Model" output="false">

	<cffunction name="init">
		<cfset belongsTo("entry")>
		<cfset validatesPresenceOf( properties="comment,name,email")>
		<cfset validatesFormatOf("email")>
	</cffunction>

</cfcomponent>
