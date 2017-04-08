###############################################
# FILE:     BIGTOK.PAT (pass 0)
# SUBJ:     Automatically generated RFA file.
# AUTH:     VisualText
# CREATED:  11:01:36 08/29/01
# MODIFIED: 
# NOTE:     
###############################################

@POST
	excise("1", "2")
@RULES
_xNIL <- \# _xWILD _xWILD [min=1 max=1 match=("\n" "_xEOF")] @@

@POST
	rfastr("2")
	single()
@RULES
_STR [base] <- \" _xWILD \" @@

