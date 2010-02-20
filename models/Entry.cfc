<cfcomponent extends="Model" output="false">

	<cffunction name="init">
		<cfset belongsTo(name="user", foreignKey="userid")>
		<cfset belongsTo(name="category", foreignKey="categoryid")>
		<cfset hasMany("comments")>		
	</cffunction>

</cfcomponent>
