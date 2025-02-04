/obj/item/organ/genital/belly //I know, I know a belly aint a genital. but it is in the sake of code.
	name 					= "belly"
	desc 					= "You see a belly on their midsection."
	icon_state 				= "belly"
	icon 					= 'icons/obj/genitals/breasts.dmi' // I have no idea why it's set up like this on hyper
	zone 					= "chest"
	slot 					= ORGAN_SLOT_BELLY
	w_class 				= 3
	size 					= 0
	var/size_name 			= "flat"
	var/statuscheck			= FALSE
	shape					= "Pair" //Name doesn't matter unless we get more belly shapes
	genital_flags 			= UPDATE_OWNER_APPEARANCE | GENITAL_UNDIES_HIDDEN | CAN_CUM_INTO | HAS_EQUIPMENT
	masturbation_verb 		= "massage"
	var/size_cached			= 0
	var/prev_size //former size value, to allow update_size() to early return should be there no significant changes.
	var/sent_full_message	= TRUE //defaults to 1 since they're full to start
	//var/inflatable			= FALSE //For inflation connoisseurs //This is handled with the BELLY_INFLATION cit toggle now
	layer_index = BELLY_LAYER_INDEX


/obj/item/organ/genital/belly/on_life()
	if(QDELETED(src))
		return
	if(!owner)
		return

/obj/item/organ/genital/belly/modify_size(modifier, min = -INFINITY, max = INFINITY)
	var/new_value = clamp(size_cached + modifier, min, max)
	if(new_value == size_cached)
		return
	prev_size = size_cached
	size_cached = new_value
	size = round(size_cached)
	update()
	..()

/obj/item/organ/genital/belly/update_size()//wah
	var/rounded_size = round(size)
	var/list/belly_names = list("stomach", "belly", "gut", "midsection", "rolls")
	if(size < 0)//I don't actually know what round() does to negative numbers, so to be safe!!fixed
		if(owner)
			to_chat(owner, "<span class='warning'>You feel your [pick(belly_names)] go completely flat.</span>")
		QDEL_IN(src, 1)
		return

	if(owner) //Because byond doesn't count from 0, I have to do this.
		var/mob/living/carbon/human/H = owner
		var/r_prev_size = round(prev_size)
		if (rounded_size > r_prev_size)
			to_chat(H, "<span class='warning'>Your guts [pick("swell up to", "gurgle into", "expand into", "plump up into", "grow eagerly into", "fatten up into", "distend into")] a larger midsection.</span>")
		else if (rounded_size < r_prev_size)
			to_chat(H, "<span class='warning'>Your guts [pick("shrink down to", "decrease into", "wobble down into", "diminish into", "deflate into", "contracts into")] a smaller midsection.</span>")

/obj/item/organ/genital/belly/update_appearance()
	var/lowershape = lowertext(shape)

	//Reflect the size of dat ass on examine.
	switch(round(size))
		if(1)
			size_name = "average"
		if(2)
			size_name = "round"
		if(3)
			size_name = "squishable"
		if(4)
			size_name = "fat"
		if(5)
			size_name = "sagging"
		if(6)
			size_name = "gigantic"
		if(7)
			size_name = pick("massive","unfathomably bulging","enormous","very generous","humongous","big bubbly")
		else
			size_name = "nonexistent"

	desc = "You see a [size_name] [round(size) >= 4 ? "belly, it bounces around and gurgles as [owner] walks" : "belly in [owner.p_their()] midsection"]."

	var/icon_size = size
	icon_state = "belly_[lowershape]_[icon_size]"
	if(owner)
		if(owner.dna.species.use_skintones && owner.dna.features["genitals_use_skintone"])
			if(ishuman(owner)) // Check before recasting type, although someone fucked up if you're not human AND have use_skintones somehow...
				var/mob/living/carbon/human/H = owner // only human mobs have skin_tone, which we need.
				color = SKINTONE2HEX(H.skin_tone)
				//if(!H.dna.skin_tone_override)
				//	icon_state += "_s"
		else
			color = "#[owner.dna.features["belly_color"]]"

/obj/item/organ/genital/belly/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.species.use_skintones && D.features["genitals_use_skintone"])
		color = SKINTONE2HEX(H.skin_tone)
	else
		color = "#[D.features["belly_color"]]"
	size = D.features["belly_size"]
	prev_size = size
	size_cached = size
	toggle_visibility(D.features["belly_visibility"], FALSE)
