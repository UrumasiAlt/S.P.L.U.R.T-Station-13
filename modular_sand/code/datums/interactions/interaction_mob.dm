/mob/living/proc/has_hands()
	return FALSE

/mob/living/has_hands()
	return TRUE

/mob/living/proc/has_mouth()
	return TRUE

/mob/living/proc/mouth_is_free()
	return TRUE

/mob/living/proc/foot_is_free()
	return TRUE

/mob/living/carbon/human/has_mouth()
	var/obj/item/bodypart/head/headass
	for(var/obj/item/bodypart/head/shoeonhead in bodyparts)
		headass = shoeonhead
	if(headass)
		return TRUE
	return FALSE

/mob/living/carbon/human/mouth_is_free()
	return !wear_mask

/mob/living/carbon/human/foot_is_free()
	return !shoes
