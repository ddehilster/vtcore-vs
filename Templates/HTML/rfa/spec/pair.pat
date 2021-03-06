###############################################
# FILE:     PAIR.PAT (pass 0)
# SUBJ:     Automatically generated RFA file.
# AUTH:     VisualText
# CREATED:  11:01:36 08/29/01
# MODIFIED: 
# NOTE:     
###############################################
@RECURSE listarg

@POST
	rfaarg("1")
	single()
@RULES
_ARG [base] <- _NONLIT @@
_ARG [base] <- _LIT @@
_ARG [base] <- _STR @@
_ARG [base] <- _NUM @@

@@RECURSE listarg

@RECURSE argtolist

@POST
	rfaargtolist("1")
	single()
@RULES
_LIST <- _ARG @@

@@RECURSE argtolist


@POST
	rfapair("1", "3")
	single()
@RULES
_PAIR [base] <- _LIT \= [trig] _xWILD [min=1 max=1 match=("_LIT" "_NONLIT" "_STR" "_NUM" "_LIST") recurse=(listarg argtolist)] @@

