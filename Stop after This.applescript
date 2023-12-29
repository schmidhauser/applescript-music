tell application "Music"
	if player state is playing then
		try
			set curTrack to current track
			if class of curTrack is URL track then return
			set curPos to player position
			stop
			play curTrack with once
			set player position to curPos
		end try
	end if
end tell