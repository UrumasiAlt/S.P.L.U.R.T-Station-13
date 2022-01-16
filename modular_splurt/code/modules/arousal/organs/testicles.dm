/obj/item/organ/genital/testicles/get_features(mob/living/L)
	if(!ishuman(L))
		return ..()
	var/mob/living/carbon/human/H = L
	var/datum/dna/D = H.dna
	fluid_id = D.features["balls_fluid"]
	. = ..()

