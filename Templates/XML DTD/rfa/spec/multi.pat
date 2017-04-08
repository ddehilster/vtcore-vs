###############################################
# FILE:     MULTI.PAT (pass 0)
# SUBJ:     Automatically generated RFA file.
# AUTH:     VisualText
# CREATED:  08:31:31 08/29/01
# MODIFIED: 
# NOTE:     
###############################################

@POST
	rfanodes("2", "multi")
	single()
@RULES
_MULTI [base] <- _soMULTI _NONLIT [star] _eoMULTI [opt] @@

