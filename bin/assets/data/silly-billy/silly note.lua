function onCountdownStarted()
	runHaxeCode([[
		for (strum in game.opponentStrums)
		{
			strum.cameras = [game.camGame];
			strum.scrollFactor.set(1, 1);
			strum.scale.x = 0.9;
            strum.scale.y = 0.9;
		}
		for (note in game.unspawnNotes) 
		{
			if (!note.mustPress) {
				note.cameras = [game.camGame];
				note.scrollFactor.set(1, 1);
				note.scale.x = 0.9;
				note.scale.y = 0.9;
			if (note.isSustainNote) {
				note.scale.y = 2.5;
			} 
		}
		};
	]])
	end