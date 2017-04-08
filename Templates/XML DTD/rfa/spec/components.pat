###############################################
# FILE:     COMPONENTS.PAT (pass 0)
# SUBJ:     Automatically generated RFA file.
# AUTH:     VisualText
# CREATED:  08:31:31 08/29/01
# MODIFIED: 
# NOTE:     
###############################################

@POST
	rfaname("1")
	single()
@RULES
_LIT [base] <- _xALPHA @@

@POST
	rfanonlit("2")
	single()
@RULES
_NONLIT [base] <- \_ _xALPHA @@

@RULES
_ARROW [base] <- \< \- @@

@POST
	rfanum("1")
	single()
@RULES
_NUM [base] <- _xNUM @@

@RULES
_ENDRULE [base] <- \@ \@ _xWHITE @@

@POST
	noop()
@RULES
_xNIL <- _xWILD [min=1 max=1 fail=("\@")] @@

@RULES
_soRULES [base] <- \@ RULES @@
_soPOST [base] <- \@ POST @@
_soCHECK [base] <- \@ CHECK @@
_soPRE [base] <- \@ PRE @@
_soNODES [base] <- \@ NODES @@
_soMULTI [base] <- \@ MULTI @@
_soPATH [base] <- \@ PATH @@
_soCODE [base] <- \@ CODE @@
_soSELECT [base] <- \@ SELECT @@
_soRECURSE [base] <- \@ RECURSE @@
_eoPOST [base] <- \@ \@ POST @@
_eoCHECK [base] <- \@ \@ CHECK @@
_eoPRE [base] <- \@ \@ PRE @@
_eoRULES [base] <- \@ \@ RULES @@
_eoRECURSE [base] <- \@ \@ RECURSE @@
_eoSELECT [base] <- \@ \@ SELECT @@
_eoNODES [base] <- \@ \@ NODES @@
_eoMULTI [base] <- \@ \@ MULTI @@
_eoPATH [base] <- \@ \@ PATH @@
_eoCODE [base] <- \@ \@ CODE @@
_ENDRULE [base] <- \@ \@ @@

