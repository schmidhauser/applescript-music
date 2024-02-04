-- (c) 2023 · Andreas U. Schmidhauser

tell application "Music"
	-- Check if the Music player is currently playing
	if player state is playing then
		-- Save the original sound volume
		set originalVolume to sound volume
		
		-- Set the target volume to 0 (mute)
		set targetVolume to 0
		
		-- Calculate the volume decrease step based on the original volume
		-- (The choice of division determines how many steps or iterations
		-- the script will take to decrease the volume from its original level
		-- to the target volume.)
		set volumeDecreaseStep to originalVolume / 14
		
		-- Gradually decrease the volume until it's close to the target volume
		repeat while sound volume > targetVolume + 3
			-- Decrease the sound volume by the calculated step
			set sound volume to sound volume - volumeDecreaseStep
			
			-- Pause for 1 second
			delay 1
		end repeat
		
		-- Stop playback
		stop
		
		-- Restore the original sound volume
		set sound volume to originalVolume
		
		-- Skip to the next track
		next track
		
		-- Start playing the new track
		play
	end if
end tell
