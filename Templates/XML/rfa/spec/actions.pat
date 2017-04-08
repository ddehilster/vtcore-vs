###############################################
# FILE:     ACTIONS.PAT (pass 0)
# SUBJ:     Automatically generated RFA file.
# AUTH:     VisualText
# CREATED:  08:32:21 08/29/01
# MODIFIED: 
# NOTE:     
###############################################
@RECURSE littoaction

@POST
	rfalittoaction("1")
	single()
@RULES
_ACTION <- _LIT @@

@@RECURSE littoaction

@RECURSE littoaction

@POST
	rfalittoaction("1")
	single()
@RULES
_ACTION <- _LIT @@

@@RECURSE littoaction

@RECURSE littopre

@POST
	rfalittopre("1")
	single()
@RULES
_ACTION <- _LIT @@

@@RECURSE littopre


@POST
	rfaactions("2")
	single()
@RULES
_POSTS [base] <- _soPOST _xWILD [match=("_LIT" "_ACTION") recurse=(littoaction)] _eoPOST [opt] @@
_CHECKS [base] <- _soCHECK _xWILD [match=("_LIT" "_ACTION") recurse=(littoaction)] _eoCHECK [opt] @@

@POST
	rfapres("2")
	single()
@RULES
_PRES [base] <- _soPRE _xWILD [match=("_LIT" "_ACTION") recurse=(littopre)] _eoPRE [opt] @@

