<h1>Editing comment</h1>

<cfoutput>

			#errorMessagesFor("comment")#
	
			#startFormTag(action="update", key=params.key)#
		
						
						#select(objectName="comment", property="entryID", label="Entry", options=entries)#
					
						#textArea(objectName='comment', property='comment', label='Comment')#
					
						#textField(objectName='comment', property='name', label='Name')#
					
						#textField(objectName='comment', property='email', label='Email')#
					
						#textField(objectName='comment', property='url', label='Url')#
						
						Date Created: #comment.dateCreated#<br><br>
					
				
				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
