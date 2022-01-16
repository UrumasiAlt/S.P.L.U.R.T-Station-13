// Stop silly descriptions of AI in the interaction menu
/mob/living/silicon/ai
	has_anus = FALSE

/mob/living/silicon/ai/has_anus()
	return FALSE

/mob/living/silicon/ai/has_hands()
	return FALSE

/mob/living/silicon/ai/has_mouth()
	return FALSE

/mob/living/silicon/ai/mouth_is_free()
	return FALSE

/mob/living/silicon/ai/foot_is_free()
	return FALSE

/mob/living/silicon/ai/is_bottomless()
	return FALSE

/mob/living/silicon/ai/is_topless()
	return FALSE
