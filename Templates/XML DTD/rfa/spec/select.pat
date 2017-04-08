###############################################
# FILE:     SELECT.PAT (pass 0)
# SUBJ:     Automatically generated RFA file.
# AUTH:     VisualText
# CREATED:  08:31:31 08/29/01
# MODIFIED: 
# NOTE:     
###############################################

@POST
	rfaselect("2")
	single()
@RULES
_SELECT [base] <- _soSELECT [opt] _NODES _eoSELECT [opt] @@
_SELECT [base] <- _soSELECT [opt] _MULTI _eoSELECT [opt] @@
_SELECT [base] <- _soSELECT [opt] _PATH _eoSELECT [opt] @@

