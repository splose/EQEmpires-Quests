sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello. It is dangerous out in the woods. You should go to Rivervale. It's at the end of the path. You will find good times there. Travel safely, my friend!");
	}
	elsif ($text=~/shard/i) {
		quest::say("Searching for that blasted emerald shard, are you? That thing has done nothing but bring me bad luck!! I would gladly give it to you if you would do a [small favor] for me.");
	}
	elsif ($text=~/small favor/i) {
		#:: Match if Amiable or better for Deeppockets
		if ($faction <= 4) {
			quest::say("I have been tracked here by a bounty hunter named Slaythe. I have heard reports of his presence beyond the Great Wall. Please seek him out and bring me some body part of his as proof of his passing. Do this and the emerald shard is yours.");
			#:: Spawn a Misty Thicket >> Slaythe (33146)
			quest::unique_spawn(33146, 0, 0, 893.00, 664.00, -34.73);
		}
		#:: Match if indifferent or better for Deeppockets
		elsif ($faction <= 5) {
			quest::say("When the blood of many Runnyeye goblins has covered your blade, then I shall find you worthy to speak of such matters.");
		}
		else {
			quest::say("You are no ally of the Rivervale Deeppockets!! Leave at once!!");
		}
	}
	elsif ($text=~/second piece of the gem/i) {
		#:: Match if Amiable or better for Deeppockets
		if ($faction <= 4) {
			quest::say("The second emerald shard was hidden in the forest near Kelethin. I heard one of the local guilds found it and now call it the Gem of Tunare. You will have to ask around in Kelethin about it. Good luck.");
		}
		#:: Match if indifferent or better for Deeppockets
		elsif ($faction <= 5) {
			quest::say("When the blood of many Runnyeye goblins has covered your blade, then I shall find you worthy to speak of such matters.");
		}
		else {
			quest::say("You are no ally of the Rivervale Deeppockets!! Leave at once!!");
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 13110 - Bloody Shank
	if (plugin::takeItems(13110 => 1 )) {
		quest::say("AHH!! You have been sent by the Highkeep Guards!! You will never take Bronin Higginsbot alive!!");
		#:: Set factions
		quest::faction(241, -25);	#:: - Deeppockets
		quest::faction(223, -25);	#:: - Circle Of Unseen Hands
		quest::faction(292, 25);	#:: + Merchants of Rivervale
		quest::faction(336, -25);	#:: - Coalition of Tradefolk Underground
		quest::faction(329, -25);	#:: - Carson McCabe
		#:: Attack the player that triggered this event
		quest::attack($name);
	}
	#:: Match if Amiable or better for Deeppockets and a 12192 - Froglok Leg
	elsif (($faction <= 4) && (plugin::takeItems(12192 => 1 ))) {
		quest::say("So I see you have defeated Slaythe. I shall sleep much better now that he is gone. I placed the emerald shard in one of the Highkeep strongboxes in Highpass. Give the bank clerk's assistant, Kiolna this key. There is a [second piece of the gem] which I hid near Kelethin. You will need it to complete the gem. I hope it brings you better luck than I.");
		#:: Give a 12193 - H.K. 106
		quest::summonitem(12193);
		#:: Grant a small amount of experience
		quest::exp(500);
		#:: Set factions
		quest::faction(241, 10);		#:: + Deeppockets
		quest::faction(223, 10);		#:: + Circle Of Unseen Hands
		quest::faction(292, -10);	#:: - Merchants of Rivervale
		quest::faction(336, 10);		#:: + Coalition of Tradefolk Underground
		quest::faction(329, 10);		#:: + Carson McCabe
	}
	#:: Match if Indifferent or worse for Deeppockets and a 12192 - Froglok Leg
	elsif (($faction > 4) && (plugin::takeItems(12192 => 1))) {
		quest::say("You are no ally of the Rivervale Deeppockets!! Leave at once!!");
		#:: Give back a 12192 - Froglok Leg
		quest::summonitem(12192);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
