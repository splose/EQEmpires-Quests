sub EVENT_TARGET_CHANGE {
	if ($ulevel > 52) {
		if ($status < 80) {
			if ($client->GetTarget()->GetCleanName() eq "Lord Nagafen") {
				quest::ze(0, "I will not fight you, but I will banish you!");
				#:: Move the client to Everfrost Peaks at the specified coordinates
				$client->MovePC(30, -7024, 2020, -60.7, 0);
			}
		}
	}
}
