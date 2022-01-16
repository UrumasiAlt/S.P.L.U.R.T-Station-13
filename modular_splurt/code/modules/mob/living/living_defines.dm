/mob/living
	var/list/internal_organs = list()	//List of /obj/item/organ in the mob. They don't go in the contents for some reason I don't want to know.
	var/list/internal_organs_slot = list() //Same as above, but stores "slot ID" - "organ" pairs for easy access.
	var/datum/dna/dna = null // Required so organs don't error
