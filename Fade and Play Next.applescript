tell application "Music"
	if player state is playing then
		set originalVolume to sound volume
		set targetVolume to 0
		set volumeDecreaseStep to originalVolume / 12
		
		repeat while sound volume > targetVolume + 3
			set sound volume to sound volume - volumeDecreaseStep
			delay 1
		end repeat
		
		stop
		set sound volume to originalVolume
		next track
		play
	end if
end tell
