-- (c) 2024 · Andreas U. Schmidhauser

tell application "Music"
	-- Get the currently selected track
	set selectedTrack to selection
	if selectedTrack is not {} then
		set selectedTrack to item 1 of selectedTrack
		
		-- Save the original volume
		set originalVolume to sound volume
		
		-- Set the target volume to the original volume
		set targetVolume to originalVolume
		
		-- Set the initial volume to 0
		set sound volume to 0
		
		-- Calculate the volume increase step based on the original volume
		set volumeIncreaseStep to originalVolume / 20
		
		-- Play the selected track
		play selectedTrack
		
		-- Gradually increase the volume until it reaches the target volume
		repeat while sound volume < targetVolume - 3
			-- Increase the sound volume by the calculated step
			set sound volume to sound volume + volumeIncreaseStep
			
			-- Pause for a short duration
			delay 1
		end repeat
	end if
end tell
