###############################################
# FILE:     NODES.PAT (pass 0)
# SUBJ:     Automatically generated RFA file.
# AUTH:     VisualText
# CREATED:  11:01:36 08/29/01
# MODIFIED: 
# NOTE:     
###############################################

@POST
	rfanodes("2", "nodes")
	single()
@RULES
_NODES [base] <- _soNODES _NONLIT [star] _eoNODES [opt] @@

