/mob/living/silicon/Initialize(mapload)
	. = ..()
	give_genitals()

/mob/living/silicon/robot/give_genital(obj/item/organ/genital/G)
	G = new G(null, FALSE)
	G.get_features(src) // TODO: Borg genital customization?
	G.Insert(src)
	return G

/mob/living/silicon/robot/give_genitals(clean = FALSE)
	. = ..()
	if(clean)
		for(var/obj/item/organ/genital/G in internal_organs)
			qdel(G)
	give_genital(/obj/item/organ/genital/testicles)
	give_genital(/obj/item/organ/genital/penis)
	give_genital(/obj/item/organ/genital/vagina)
