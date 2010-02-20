
<cfoutput>

<h1>Login</h1>

#flash("error")#

#startFormTag(action="signin")#

#textField(label="Username", objectName="user", property="username")#

#passwordField(label="Password", objectName="user", property="password")#

<div>
	#submitTag(value="Sign in")#
</div>

#endFormTag()#

</cfoutput>