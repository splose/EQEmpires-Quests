sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, friend. I am the keeper of the [Boots of Ro]. Please rest here with us in our camp of righteousness. No harm can come to you while we paladins keep watch.");
	}
	elsif ($text=~/boots of ro/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("If you desire the mold needed for smithing the Boots of Ro, then first, you shall prove your power. I have long sought an ancient holy weapon called the brazen brass kilij. I have heard rumors of detailed plans on how to make it, coming from Faydwer. Seek out the kilij plans. Bring them to me and you shall have the mold.");
		}
		else {
			quest::say("You and I must be brothers and serve the Lord of Underfoot. Go to Kaladim and serve her cathedral. When you think you are ready. then ask Lord Datur if you are an [honored member] of the temple. If the answer is yes, then I will trust you.");
		}
	}
	elsif ($text=~/chalice of conquest/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("You must be the one Sir Dru of Kaladim sent to retrieve the candlestick which was broken in the [orc onslaught]. I have only this piece in my possession as the other portion was taken by an [odd druid] of these mountains. Should you reclaim it, I am sure the maker of the candlestick can patch it together.");
			#:: Give a 12276 - Stem of Candlestick
			quest::summonitem(12276);
		}
		else {
			quest::say("How dare you approach a member of the Clerics of Underfoot?! Dogs such as you lie in the same bed as aviaks and ogres!!");
		}
	}
	elsif ($text=~/candle of bravery/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("The Candle of Bravery is ceremonial and is lit when one sips from the [Chalice of Conquest]. The candlestick was left with a fellow Paladin of Underfoot in the Rathe Mountains. The candle itself was lost and I do not know where Priestess Ghalea purchases them.");
		}
		else {
			quest::say("How dare you approach a member of the Clerics of Underfoot?! Dogs such as you lie in the same bed as aviaks and ogres!!");
		}
	}
	elsif ($text=~/orc onslaught/i) {
		quest::say("The orcs attempted to take the hill, as they do on a frequent basis. We repelled them, of course, but a [blue orc] rushed off with the [Chalice of Conquest]. Where he came from, I do not know. He was no part of the battle!! I believe he just found an opportune moment to loot our camp.");
	}
	elsif ($text=~/blue orc/i) {
		quest::say("I had a visiting ranger track him to his camp near Lake Rathetear. I spied the camp and saw his lifeless body near two other blue orcs. Apparently, he must have taken a fatal blow, but had enough stamina to make it to his camp. I returned the following day with my fellow paladins and found the camp long gone. The ranger, who was still with us, found two sets of tracks leading away. We found [orc remnants].");
	}
	elsif ($text=~/orc remnants/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Here. We found this worthless orc bracelet with the name Klunga on it. There was also an orc shovel and a bag of Cauldron prawns. We left them, of course. The camp has now been taken over by the green-skinned orcs. I would advise you to stay clear of this camp in Lake Rathe.");
			#:: Give a 12280 - Klunga's Bracelet
			quest::summonitem(12280);
		}
		else {
			quest::say("How dare you approach a member of the Clerics of Underfoot?! Dogs such as you lie in the same bed as aviaks and ogres!!");
		}
	}
	elsif ($text=~/odd druid/i) {
		quest::say("The mountains have been plagued not only by beasts, but by evil druids!! They attempt to force all men from this land. One has stolen the foot of the candlestick which holds the [Candle of Bravery]. I remember that battle cry of hers, 'Long live the green!!'.");
	}
}

sub EVENT_ITEM {
	#:: Match a 12206 - Kilij Plans
	if (plugin::takeItems(12206 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Ahh!! The kilij!! The legend was true. As for you.. the mold for the Boots of Ro. Go and speak with Thomas for the final component. Ask him of 'Lord Searfire'.  Brell be with you.");
			#:: Give a 12304 - Mold of the Boots of Ro
			quest::summonitem(12304);
			#:: Set factions
			quest::faction(227, 20);		#:: + Clerics of Underfoot
			quest::faction(274, 20);		#:: + Kazon Stormhammer
			quest::faction(293, 15);		#:: + Miners guild 249
			#:: Grant a small amount of experience
			quest::exp(100);
		}
		else {
			quest::say("How dare you approach a member of the Clerics of Underfoot?! Dogs such as you lie in the same bed as aviaks and ogres!!");
			#:: Return a 12206 - Kilij Plans
			quest::summonitem(12206);
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
