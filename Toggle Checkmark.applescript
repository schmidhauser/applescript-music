tell application "Music"
	set sel to selection
	if sel is not {} then
		repeat with aTrack in sel
			tell aTrack
				try
					set enabled to not (get enabled)
				end try
			end tell
		end repeat
	end if
end tell
