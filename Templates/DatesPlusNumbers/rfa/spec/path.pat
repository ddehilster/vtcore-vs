###############################################
# FILE:     PATH.PAT (pass 0)
# SUBJ:     Automatically generated RFA file.
# AUTH:     VisualText
# CREATED:  08:20:34 08/29/01
# MODIFIED: 
# NOTE:     
###############################################

@POST
	rfanodes("2", "path")
	single()
@RULES
_PATH [base] <- _soPATH _NONLIT [star] _eoPATH [opt] @@

