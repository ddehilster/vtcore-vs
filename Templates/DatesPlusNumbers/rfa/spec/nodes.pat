###############################################
# FILE:     NODES.PAT (pass 0)
# SUBJ:     Automatically generated RFA file.
# AUTH:     VisualText
# CREATED:  08:20:34 08/29/01
# MODIFIED: 
# NOTE:     
###############################################

@POST
	rfanodes("2", "nodes")
	single()
@RULES
_NODES [base] <- _soNODES _NONLIT [star] _eoNODES [opt] @@

