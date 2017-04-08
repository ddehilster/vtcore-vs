###############################################
# FILE:     RULE.PAT (pass 0)
# SUBJ:     Automatically generated RFA file.
# AUTH:     VisualText
# CREATED:  08:20:34 08/29/01
# MODIFIED: 
# NOTE:     
###############################################
@RECURSE rulelt

@POST
	rfanonlitelt("1")
	single()
@RULES
_ELEMENT [base] <- _NONLIT @@

@POST
	rfalitelt("1")
	single()
@RULES
_ELEMENT [base] <- _LIT @@
_ELEMENT [base] <- _NUM @@

@@RECURSE rulelt

@RECURSE sugg

@POST
	rfasugg("1")
	single()
@RULES
_SUGG <- _ELEMENT @@

@@RECURSE sugg

@RECURSE rulelt

@POST
	rfanonlitelt("1")
	single()
@RULES
_ELEMENT [base] <- _NONLIT @@

@POST
	rfalitelt("1")
	single()
@RULES
_ELEMENT [base] <- _LIT @@
_ELEMENT [base] <- _NUM @@

@@RECURSE rulelt

@RECURSE elt

@POST
	rfaelt("1")
	single()
@RULES
_ELT <- _ELEMENT @@

@@RECURSE elt

@RECURSE rulelts

@POST
	rfarulelts("1")
	single()
@RULES
_PHRASE [base] <- _ELT [plus] @@

@@RECURSE rulelts


@POST
	rfarule("1", "3")
	single()
@RULES
_RULE [base] <- _xWILD [min=1 max=1 match=("_LIT" "_NONLIT" "_ELEMENT") recurse=(rulelt sugg)] _ARROW [trig] _xWILD [recurse=(rulelt elt rulelts)] _ENDRULE @@

