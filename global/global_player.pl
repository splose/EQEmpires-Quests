sub EVENT_ZONE {
	if($client->GetHP() == $client->GetMaxHP()) {
		plugin::Data($client, 2, "FullHP", 1, "30S");
	}
}

sub EVENT_DISCOVER_ITEM {
    #:: Create a scalar variable to store the item link
    $discovereditem = quest::varlink($itemid);
    #:: Shout the discovery to all zones
   # quest::shout2("$name has discovered $discovereditem!  Yay!");
	quest::worldwidemessage(15, "$name has discovered $discovereditem!");
}

sub EVENT_SAY {
	
	#plugin::IncrementPlayerCount($client);
	
	if($text=~/#/i) {
		plugin::GM_Commands($text);
		plugin::HandleDoorCommands();
		#$client->Message(15, "" . plugin::GetZoneExpansion($zonesn) . "");
	}
	if($text=~/#laz/i) {
		my @arg = split(' ', $text);
		if(!$arg[1]) {
			$client->Message(15, "Gear List:");
			$client->Message(15, "-------------------");
			$client->Message(15, "Earring: " . quest::varlink($_) . "") for (68949, 68958); #:: Soothing Earstone of Striated Clay -> Aug1: Blessed Shard + Jeweled Stud of Madness -> Aug1: Ashen Claystone of Aegis
			$client->Message(15, "Neck: " . quest::varlink(68808) . "");
			$client->Message(15, "Face: " . quest::varlink(69069) . "");
			$client->Message(15, "Head: " . quest::varlink(69087) . "");
			$client->Message(15, "Ring: " . quest::varlink($_) . "") for (68842, 69061);
			$client->Message(15, "Wrist: " . quest::varlink($_) . "") for (68854, 69126);
			$client->Message(15, "Arms: " . quest::varlink(69168) . "");
			$client->Message(15, "Gloves: " . quest::varlink(68852) . "");
			$client->Message(15, "Shoulder: " . quest::varlink(69130) . "");
			$client->Message(15, "Chest: " . quest::varlink(68960) . "");
			$client->Message(15, "Back: " . quest::varlink(69165) . "");
			$client->Message(15, "Waist: " . quest::varlink(67625) . "");
			$client->Message(15, "Legs: " . quest::varlink(69146) . "");
			$client->Message(15, "Feet: " . quest::varlink(69177) . "");
			$client->Message(15, "Prim: " . quest::varlink(69110) . "");
			$client->Message(15, "Sec: " . quest::varlink(69156) . "");
			$client->Message(15, "Shield: " . quest::varlink(69161) . "");
			$client->Message(15, "Range: " . quest::varlink(68713) . "");
			$client->Message(15, "Charm: " . quest::varlink(52138) . "");
		}
		elsif ($arg[1] eq "Confirm") {		
			$client->SummonItem(68949, -1, 1, 68667);	#:: Soothing Earstone of Striated Clay -> Aug1: Blessed Shard (68667)
			$client->SummonItem(68958, -1, 1, 68693);	#:: Jeweled Stud of Madness -> Aug1: Ashen Claystone of Aegis
			$client->SummonItem(68808, -1, 1, 67685);	#:: Bloodied Ritual Trinket -> Aug1: Black Gemstone of Pain
			$client->SummonItem(69069, -1, 1, 68629);	#:: Stained Fur Mask -> Aug1: Scarred Token of Resistance
			$client->SummonItem(69087, -1, 1, 68692);	#:: Crown of the Forsaken -> Aug1: Opaque Sapphire of Bulwark
			$client->SummonItem(68842, -1, 1, 69093);	#:: Divine Crystal Ring -> Aug1: Ruby of Steadfastness
			$client->SummonItem(69061, -1, 1, 68013);	#:: Gem-Studded Band of Struggle -> Aug1: Focused Prism of Accuracy
			$client->SummonItem(68854, -1, 1, 68050);	#:: Vadd's Bracer of Elite Combat -> Aug1:  Focus Shard of Enhanced Protection
			$client->SummonItem(69126, -1, 1, 68017);	#:: Xxeric’s Battleworn Bracer -> Aug1: Scion Stone of Disruption
			$client->SummonItem(69168, -1, 1, 68049);	#:: Armguards of Insidious Corruption -> Aug1: Guardian’s Stone of Enhanced Protection
			$client->SummonItem(68852, -1, 1, 68048);	#:: Vadd’s Gauntlets of Elite Combat -> Aug1: Experimental Gem of Enhanced 
			$client->SummonItem(69130, -1, 1, 68014);	#:: Pauldron of Dark Auspices -> Aug1: Glowing Stone of Precision
			$client->SummonItem(68960, -1, 1, 69140);	#:: Vadd’s Chestplate of Elite Combat -> Aug1: Glinting Onyx of Might
			$client->SummonItem(69165, -1, 1, 68015);	#:: Shroud of the Legion -> Aug1: Researcher’s Exacting Ore
			$client->SummonItem(67625, -1, 1, 68023);	#:: Assistant Researcher’s Symbol -> Aug1: Jagged Froststone of Enchantments
			$client->SummonItem(69146, -1, 1, 69141);	#:: Greaves of the Tunat’Muram -> Aug1: Shimmering Granite
			$client->SummonItem(69177, -1, 1, 68024);	#:: Nightmarish Boots of Conflict -> Aug1: Warden’s Stone of Prowess
			$client->SummonItem(69110, -1, 1, 42204);	#:: BBOB + Anger Aug
			$client->SummonItem(69156, -1, 1, 42204);	#:: Death's Head Mace + Anger Aug
			$client->SummonItem(69161, -1, 1, 68107);	#:: Aegis of Midnight + AC Aug
			$client->SummonItem(68713, -1, 1, 68940);	#:: Achromatic Aneukian Orb -> Aug1: Keledrix's Sandstone of Fortitude
			$client->SummonItem(52138, -1, 1, 41000);	#:: Chiseled Jade Figurine -> Aug1: Adventurer’s Stone (LDoN Charm Aug)
		}
		
	}
	if($text=~/#door/i) {
		plugin::HandleDoorCommands();
	}
	if($text=~/#model/i) {
		my @arg = split(' ', $text);
		my %Models = (
		"Coral" => [12674..12699,12807..12832],
		"Mermaid" => [12726..12805],
		"Swashbuckler" => [67900..67919],
		"SwashbucklerRaid" => [67920..67939],
		"ArxMentis" => [12700..12778,112708],
		"Allyrian" => [101294..101339],
		"RingofScale" => [101227..101260,101360..101385],
		"RingofScaleRaid" => [101386..101411],
		"Halloween" => [101061..101068],
		"AnastiSulGood" => [101015..101025,101069,101070,101077],
		"Disease" => [101050..101060,101075,101076,101080],
		"Dwarven" => [101038..101049,101073,101074,101079],
		"Health" => [101026..101037,101071,101072,101078,101033,101071,101072,101078],
		"Nightmare" => [101186..101202],
		"NightmareBlue" => [101203..101219,101223],
		"BloodironGreen" => [101168..101185,101221],
		"BloodironRed" => [101150..101167,101220],
		"BloodironBlue" => [101270..101289],
		"BloodironBlueRaid" => [101340..101359],
		"SKU26" => [101437..101524],
		"DwarvenTwo" => [101532..101723],
		"COV"	=> [101808..101918,101926]
		);
		if($arg[1] && grep( /$arg[1]/, keys %Models)) {
			foreach my $model (@{$Models{$arg[1]}}) {
				plugin::Message("File: " . $arg[1] . " - $model :Pri[" . quest::saylink("#model Apply $model 7",1,"X") . "]Sec:[" . quest::saylink("#model Apply $model 8",1,"X") . "]]");
			}
		} elsif ($arg[3] && $arg[2] && $arg[1] eq "Apply") {
			quest::wearchange($arg[3],$arg[2]);
			#$npc->SetEntityVariable("CurrModel",$arg[1]);
			plugin::Message("Changing your secondary slot model to: $arg[2]");
		} else {
			plugin::Message("You may view models from the following files:");
			my $n=0;
			foreach $key (keys %Models) {
				plugin::Message("File ($n): [" . quest::saylink("#model $key",1,"$key") . "]");
				$n++;
			}
		}
	}
	return 1;	#:: Remove 'command not recognized' without using the db rule
}

sub EVENT_CAST_BEGIN {
	if($spell_id == 35527) { 
		$client->Message(15, "" . $client->GetAALevel(30201) . "");
		if($client->GetAALevel(30201)) {	#Master's Synergy
			$client->SpellFinished(35673,$client,-1);
		}
	} elsif($spell_id == 28509) {
		if($client->GetAALevel(30200)) {	#Outrider's Synergy
			$client->SpellFinished(35670,$client,-1);
		}
	}
	
}

sub EVENT_ENTERZONE {
	if(plugin::GetZoneExpansion($zonesn) <= 3) {	#:: Velious and below only
		if(!plugin::HasWaypoint($client,$zonesn)) {
			plugin::AddWaypoint($client,$zonesn);
		} else {
			$client->Message(15, "Has waypoint already");
		}
	} else {
		$client->Message(15, "Else");
	}
	if(!plugin::Data($client, 3, "FirstLogin")) {
		plugin::FirstLogin($client);
	}
}

sub EVENT_LEVEL_UP {
	plugin::Level_Up();
}

sub EVENT_TARGET_CHANGE {
	if ($status >= 100) {
		if ($client->GetTarget() && $client->GetTarget()->IsClient()) {
			plugin::ClientTargetInfo();
		} elsif ($client->GetTarget() && $client->GetTarget()->IsNPC()) {
			plugin::NPCTargetInfo();
		}
	}
}

sub EVENT_WARP {
	#:: plugin::Sentinel($client,$previous_x,$previous_y,$previous_z,$zone_long_name,$client->Admin());
	my $instance_id = $client->GetInstanceID();
    my $zone_long_name = plugin::Zone("LN", $zonesn);
	if($status <= 255) {
		plugin::Sentinel_Rewind($client,$zone_id,$instance_id,$x,$previous_y,$previous_z);
		#:: plugin::Sentinel($client,$previous_x,$previous_y,$previous_z,$zone_long_name,$client->Admin());		#:: RoN version that allows you to warp ~8-10 times 
		#quest::settimerMS("SentinelKick",250);	#:: Have to wait a bit on the kick otherwise when the client logs back in they'll be in their intended warp location
	}
}

sub EVENT_TIMER {
	if($timer eq "SentinelKick") {
		quest::stoptimer("SentinelKick");
		plugin::ServerAnnounce("[Sentinel] :: $name has been KICKED for warping in $zonesn.");
		$client->Kick();
	}
}

#sub EVENT_ENTERZONE { #message only appears in Cities / Pok and wherever the Wayfarer Camps (LDON) is in.  This message won't appear in the player's home city.
# 	if($ulevel >= 15 && !defined($qglobals{Wayfarer})) {
# 		if($client->GetStartZone()!=$zoneid && ($zoneid == 1 || $zoneid == 2 || $zoneid == 3 || $zoneid == 8 || $zoneid == 9 || $zoneid == 10 || $zoneid == 19 || $zoneid == 22 || $zoneid == 23 || $zoneid == 24 || $zoneid == 29 || $zoneid == 30 || $zoneid == 34 || $zoneid == 35 || $zoneid == 40 || $zoneid == 41 || $zoneid == 42 || $zoneid == 45 || $zoneid == 49 || $zoneid == 52 || $zoneid == 54 || $zoneid == 55 || $zoneid == 60 || $zoneid == 61 || $zoneid == 62 || $zoneid == 67 || $zoneid == 68 || $zoneid == 75 || $zoneid == 82 || $zoneid == 106 || $zoneid == 155 || $zoneid == 202 || $zoneid == 382 || $zoneid == 383 || $zoneid == 392 || $zoneid == 393 || $zoneid == 408)) {
# 			$client->Message(15,"A mysterious voice whispers to you, 'If you can feel me in your thoughts, know this -- something is changing in the world and I reckon you should be a part of it. I do not know much, but I do know that in every home city and the wilds there are agents of an organization called the Wayfarers Brotherhood. They are looking for recruits . . . If you can hear this message, you are one of the chosen. Rush to your home city, or search the West Karanas and Rathe Mountains for a contact if you have been exiled from your home for your deeds, and find out more. Adventure awaits you, my friend.'");
#		}
#	}
#}

sub EVENT_COMBINE_VALIDATE {
	# $validate_type values = { "check_zone", "check_tradeskill" }
	# criteria exports:
	#	"check_zone"		=> zone_id
	#	"check_tradeskill"	=> tradeskill_id (not active)
	if ($recipe_id == 10344) {
		if ($validate_type =~/check_zone/i) {
			if ($zone_id != 289 && $zone_id != 290) {
				return 1;
			}
		}
	}
	
	return 0;
}

sub EVENT_COMBINE_SUCCESS {
    if ($recipe_id =~ /^1090[4-7]$/) {
        $client->Message(1,
            "The gem resonates with power as the shards placed within glow unlocking some of the stone's power. ".
            "You were successful in assembling most of the stone but there are four slots left to fill, ".
            "where could those four pieces be?"
        );
    }
    elsif ($recipe_id =~ /^10(903|346|334)$/) {
        my %reward = (
            melee  => {
                10903 => 67665,
                10346 => 67660,
                10334 => 67653
            },
            hybrid => {
                10903 => 67666,
                10346 => 67661,
                10334 => 67654
            },
            priest => {
                10903 => 67667,
                10346 => 67662,
                10334 => 67655
            },
            caster => {
                10903 => 67668,
                10346 => 67663,
                10334 => 67656
            }
        );
        my $type = plugin::ClassType($class);
        quest::summonitem($reward{$type}{$recipe_id});
        quest::summonitem(67704); # Item: Vaifan's Clockwork Gemcutter Tools
        $client->Message(1,"Success");
    }
}

sub EVENT_CONNECT {
	
	plugin::Changelog();
	plugin::IncrementPlayerCount($client);
	
    # the main key is the ID of the AA
    # the first set is the age required in seconds
    # the second is if to ignore the age and grant anyways live test server style
    # the third is enabled
    my %vet_aa = (
        481 => [31536000, 1, 1], ## Lesson of the Devote 1 yr
        482 => [63072000, 1, 1], ## Infusion of the Faithful 2 yr
        483 => [94608000, 1, 1], ## Chaotic Jester 3 yr
        484 => [126144000, 1, 1], ## Expedient Recovery 4 yr
        485 => [157680000, 1, 1], ## Steadfast Servant 5 yr
        486 => [189216000, 1, 1], ## Staunch Recovery 6 yr
        487 => [220752000, 1, 1], ## Intensity of the Resolute 7 yr
        511 => [252288000, 1, 1], ## Throne of Heroes 8 yr
        2000 => [283824000, 1, 1], ## Armor of Experience 9 yr
        8081 => [315360000, 1, 1], ## Summon Resupply Agent 10 yr
        8130 => [346896000, 1, 1], ## Summon Clockwork Banker 11 yr
        453 => [378432000, 1, 1], ## Summon Permutation Peddler 12 yr
        182 => [409968000, 1, 1], ## Summon Personal Tribute Master 13 yr
        600 => [441504000, 1, 1] ## Blessing of the Devoted 14 yr
    );
    my $age = $client->GetAccountAge();
    for (my ($aa, $v) = each %vet_aa) {
        if ($v[2] && ($v[1] || $age >= $v[0])) {
            $client->GrantAlternateAdvancementAbility($aa, 1);
        }
    }
}

sub EVENT_CLICKDOOR {
    if($status > 200) {
       plugin::HandleDoorClick();
    }
}

#sub EVENT_CLICKDOOR {
#	if($status > 100) {
#		plugin::HandleDoorClick();
#	}
#}
