sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("I am Joyce of the Temple of Solusek Ro. I am the guardian of four of the items of the elementalist. If you are a magician, ask me about the [Robe of the Elements], the [Clay Bracelet], the [Earthen Boots] or the [Circlet of Mist]");
	}
	elsif ($text=~/circlet of mist/i) {
		quest::say("The Circlet of Mist is a beautiful hoop that would look good atop your head. It produces a fine gleam, and is known to increase your mental power. Are you [interested in the circlet]?");
	}
	elsif ($text=~/interested in the circlet/i) {
		quest::say("I will be needing the proper components to craft the circlet of mist. I will be needing a Globe of Mist which can be found on festering hags, a Water Ring from a Tidal Lord in Dagnor's Cauldron, a Ring of Evoluoy from an alligator in Feerrott, and a Sapphire, I will craft it for you.");
	}
	elsif ($text=~/clay bracelet/i) {
		quest::say("The clay bracelet is a wonderful piece of jewelry to wear on your wrist. It provides fine protection, enhances your resistance to magic, and lets you call forth a mystic eye to help you in your travels. Are you [interested in the bracelet]?");
	}
	elsif ($text=~/interested in the bracelet/i) {
		quest::say("I will make you a clay bracelet, but you will need to bring me the proper components. I will need each of the four runes of clay. Three of them can be found in the Rathe Mountains, held by gnomish necromancers. The fourth one is somewhere in the Ocean of Tears, held by a goblin headmaster. Bring me these four components, and I will make you a clay bracelet.");
	}
	elsif ($text=~/earthen boots/i) {
		quest::say("Earthen Boots are a fine adornment for the feet of any Magician. They have a wonderful brown color, and are known to enhance the stamina of any Magician who wears them. As an added bonus, animals do not tend to notice those who wear Earthen Boots. Are you [interested in the boots]?");
	}
	elsif ($text=~/interested in the boots/i) {
		quest::say("I will make you a pair of earthen boots, but you will need to retrieve for me the proper components to craft these. I will be needing a Stone Marker which can be found on a Glyphed Guard in Castle Mistmoore, a Heart of Stone from a Stone Skeleton, a pair of Soiled Boots which can be found on a froglok Tonta Knight in Guk, and a Cats Eye Agate. Bring me these items and I will craft your earthen boots.");
	}
	elsif ($text=~/robe of the elements/i) {
		quest::say("The Robe of the Elements is a fine cloak for a Magician. It provides protection from the elements, protection from melee attacks and aids the Magician with her focus. Are you [interested in the robe]?");
	}
	elsif ($text=~/interested in the robe/i) {
		quest::say("I will make for you the Robe of the Elements, but I will be needing the proper components. I will be needing a fire goblin skin, a frost goblin skin, a Twice-Woven Cloak which can be found on Faerie Guards in the Faydark, and a scroll of elemental armor. Return to me with these items and I will craft your robe.");
	}
}

sub EVENT_ITEM {
	#:: Match a 10545 - Globe of Mist, a 10547 - Ring of Evoluoy, a 10034 - Sapphire, and a 10546 - Water Ring
	if (plugin::takeItems(10545 => 1, 10547 => 1, 10034 => 1, 10546 => 1)) {
		quest::say("Astounding! You found all four components that I need to make the Circlet of Mist. Wasn't that ring annoying? I always find goblins hard to deal with. Well done! Take this circlet with my complements.");
		#:: Give a 2358 - Circlet of Mist
		quest::summonitem(2358);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 10);		#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 10539 - Rune of Clay, a 10542 - Rune of Clay, a 10540 - Rune of Clay, and a 10541 - Rune of Clay
	elsif (plugin::takeItems(10539 => 1, 10542 => 1, 10540 => 1, 10541 => 1)) {
		quest::say("One, two, three.. all four runes of clay! I knew you looked competent. I am very impressed! Please take the clay bracelet that you have earned.");
		#:: Give a 2359 - Clay Bracelet
		quest::summonitem(2359);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 5);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 10543 - Stone Marker, a 10026 - Cat's Eye Agate, a 10544 - Heart of Stone, and a 2363 - Soiled Boots
	elsif (plugin::takeItems(10543 => 1, 10026 => 1, 10544 => 1, 2363 => 1)) {
		quest::say("Marker, heart, boots and gem. All four items that I need to cobble earthen boots for you. Well done! Take these boots, and may they serve you well!");
		#:: Give a 2357 - Earthen Boots
		quest::summonitem(2357);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 5);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 2361 - Fire Goblin Skin, a 2362 - Frost Goblin Skin, a 15109 - Spell: Elemental Armor, and a 2360 - Twice-Woven Cloak
	elsif (plugin::takeItems(2361 => 1, 2362 => 1, 15109 => 1, 2360 => 1)) {
		quest::say("Oh, you brought me all of the components! I knew you could do it. It is my pleasure to give you a Robe of the Elements.");
		#:: Give a 1356 - Robe of the Elements
		quest::summonitem(1356);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 5);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
