<cfset this.rootDir = GetDirectoryFromPath(GetBaseTemplatePath())>
<cfset this.name = "8e5f2ce6_114d_40e9_a9c5_e9580b4580e2">
<cfset this.sessionManagement = true>
<cfif StructKeyExists(server, "railo")>
	<cfinclude template="../config/app.cfm">
	<cfinclude template="global/appfunctions.cfm">
	<cfinclude template="controller/appfunctions.cfm">
	<cfinclude template="events/onapplicationstart.cfm">
	<cfinclude template="events/onsessionstart.cfm">
	<cfinclude template="events/onrequeststart.cfm">
	<cfinclude template="events/onrequest.cfm">
	<cfinclude template="events/onrequestend.cfm">
	<cfinclude template="events/onsessionend.cfm">
	<cfinclude template="events/onapplicationend.cfm">
	<cfinclude template="events/onmissingtemplate.cfm">
	<cfinclude template="events/onerror.cfm">
<cfelse>
	<cfinclude template="config/app.cfm">
	<cfinclude template="wheels/global/appfunctions.cfm">
	<cfinclude template="wheels/controller/appfunctions.cfm">
	<cfinclude template="wheels/events/onapplicationstart.cfm">
	<cfinclude template="wheels/events/onsessionstart.cfm">
	<cfinclude template="wheels/events/onrequeststart.cfm">
	<cfinclude template="wheels/events/onrequest.cfm">
	<cfinclude template="wheels/events/onrequestend.cfm">
	<cfinclude template="wheels/events/onsessionend.cfm">
	<cfinclude template="wheels/events/onapplicationend.cfm">
	<cfinclude template="wheels/events/onmissingtemplate.cfm">
	<cfinclude template="wheels/events/onerror.cfm">
</cfif>
