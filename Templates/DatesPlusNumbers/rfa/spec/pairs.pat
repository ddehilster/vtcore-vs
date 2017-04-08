###############################################
# FILE:     PAIRS.PAT (pass 0)
# SUBJ:     Automatically generated RFA file.
# AUTH:     VisualText
# CREATED:  08:20:34 08/29/01
# MODIFIED: 
# NOTE:     
###############################################
@RECURSE littopair

@POST
	rfalittopair("1")
	single()
@RULES
_PAIR <- _LIT @@

@@RECURSE littopair


@POST
	rfapairs("2")
	single()
@RULES
_PAIRS [base] <- \[ _xWILD [match=("_LIT" "_PAIR" "\*") recurse=(littopair)] \] @@

