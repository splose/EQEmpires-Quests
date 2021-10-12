sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("I am the Fairie Princess, Joleena. You may stay amongst my people, but do not nibble from our homes.");
	}
	if ($text=~/fairie gold dust/i) {
		quest::say("You wish the magical Fairie Gold Dust? Hmmph!! I refuse to offer it to any of the giants of Faydwer. How can I trust any of you? You have crept up upon my me and snatched one of my wings from my back. There will be no Fairie Gold Dust until my wing has been returned to me. You may not be the stalker who snatched my [wing], but all you giants are similar. Prove me wrong and return my wing.");
	}
	if ($text=~/wing/i) {
		quest::say("I did not see the swift giant, I was blinded by the sun glaring off his balding head. I do remember the smell of rust and refuse. How he got past my Clockwork Guardian, Gearheart, is a mystery to us all.");
	}
}

sub EVENT_ITEM {
	#:: Match a 12339 - Glimmering Fairie Wing
	if (plugin::takeItems(12339 => 1)) {
		quest::say("My wing!! I am so happy!! Thank you $name. You have proved that I can trust giants once again. Please take a Pouch of Fairie Gold Dust. Its magical properties are desired by all.");
		#:: Give a 12333 - Pouch of Gold Dust
		quest::summonitem(12333);
		#:: Ding!
		quest::ding();
		#:: Grant a moderate amount of experience
		quest::exp(1500);
		#:: Set faction
		quest::faction(388, 100); 	#:: + Fairie
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
