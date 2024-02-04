-- (c) 2023 · Andreas U. Schmidhauser

tell application "Music"
	set initialVolume to get the sound volume
	
	-- Repeat the following block while the sound volume is greater than 0
	repeat while get the sound volume > 0
		-- Decrease the current sound volume by 3 units
		set newVolume to (get the sound volume) - 3
		
		-- Ensure the new volume is not less than 0
		if newVolume < 0 then
			set newVolume to 0
		end if
		
		-- Set the system sound volume to the new calculated volume
		set the sound volume to newVolume
		
		delay 1
	end repeat
	
	stop
	
	set the sound volume to initialVolume
end tell
