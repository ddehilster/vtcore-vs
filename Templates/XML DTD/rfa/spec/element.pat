###############################################
# FILE:     ELEMENT.PAT (pass 0)
# SUBJ:     Automatically generated RFA file.
# AUTH:     VisualText
# CREATED:  08:31:31 08/29/01
# MODIFIED: 
# NOTE:     
###############################################

@POST
	rfaelement("1", "2")
	single()
@RULES
_ELEMENT [base] <- _NONLIT _PAIRS [trig] @@
_ELEMENT [base] <- _LIT _PAIRS [trig] @@
_ELEMENT [base] <- _NUM _PAIRS [trig] @@

