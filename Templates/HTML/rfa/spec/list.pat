###############################################
# FILE:     LIST.PAT (pass 0)
# SUBJ:     Automatically generated RFA file.
# AUTH:     VisualText
# CREATED:  11:01:36 08/29/01
# MODIFIED: 
# NOTE:     
###############################################
@RECURSE listarg

@POST
	rfaarg("1")
	single()
@RULES
_ARG [base] <- _NONLIT @@
_ARG [base] <- _LIT @@
_ARG [base] <- _STR @@
_ARG [base] <- _NUM @@

@@RECURSE listarg


@POST
	rfalist("2")
	single()
@RULES
_LIST [base] <- \( _xWILD [match=("_LIT" "_NONLIT" "_STR" "_NUM") recurse=(listarg)] \) @@

@POST
	rfarange("2", "3")
	single()
@RULES
_PREPAIR [base] <- \< _NUM _NUM \> @@

