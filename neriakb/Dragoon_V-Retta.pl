my $count = 0;

sub EVENT_SPAWN {
	quest::settimer("checks",120);
}

sub EVENT_TIMER {
	$count++;
	if (($count == 1) && ($zonetime > 800 || $zonetime < 1999)) {
		quest::start(35);
	}
	elsif (($count == 1) && ($zonetime < 800 || $zonetime > 1999)) {
		quest::stop;
		quest::moveto(-639,-85,-24.75,16.5);
	}
	elsif ($count == 2 ) {
		$count = 0;
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Join us in celebrating my promotion to the rank of Dragoon!  I shall still respect all of you scum.");
	}
	elsif ($text=~/who.*king/i) {
		quest::say("The mighty empire of the Teir'Dal is ruled by King Naythox Thex.  All hail Thex!");
	}
	elsif ($text=~/who.*the dead/i) {
		quest::say("The Dead are the shadowknights and necromancers of Neriak.  They were formed by Queen Cristanos herself.  Even among the Teir'Dal they are feared and they keep to themselves within the Lodge of the Dead in the Third Gate.  I have heard they take orders only from the queen.");
	}
	elsif ($text=~/where.*lodge of the dead/i) {
		quest::say("The Dead are the shadowknights and necromancers of Neriak.  They were formed by Queen Cristanos herself.  Even among the Teir'Dal they are feared and they keep to themselves within the Lodge of the Dead in the Third Gate.  I have heard they take orders only from the queen.");
	}
	elsif ($text=~/who.*queen cristanos/i) {
		quest::say("Queen Cristanos is the queen of Neriak, of course!  She was the one who formed the necromancers and shadowknights into the guild called the Dead.");
	}
	elsif ($text=~/what.*indigo brotherhood/i) {
		quest::say("In the Commons Quarter can be found the Indigo Brotherhood, Teir'Dal warriors.  They are the armies of King Naythox Thex and serve as the trainers of the Dreadguard and dragoons.  Why the masters chose to build the Cauldron of Hate in that area and not the Third Gate is an amazement to me.");
	}
	elsif ($text=~/what.*cauldron of hate/i) {
		quest::say("In the Commons Quarter can be found the Indigo Brotherhood, Teir'Dal warriors.  They are the armies of King Naythox Thex and serve as the trainers of the Dreadguard and dragoons.  Why the masters chose to build the Cauldron of Hate in that area and not the Third Gate is an amazement to me.");
	}
	elsif ($text=~/what.*commons quarter/i) {
		quest::say("You are in the Commons Quarter.  This quarter is designated for all common Teir'Dal.  You can find an abundance of merchants as well as the arena and warriors guild here.");
	}
	elsif ($text=~/what.*warriors guild/i) {
		quest::say("Within this area you will find the Cauldron of Hate which is home to the Teir'Dal warriors.");
	}
}
