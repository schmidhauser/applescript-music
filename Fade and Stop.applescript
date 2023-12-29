(* 
The script starts by saving the initial volume of the system before reducing
the volume. It then enters a loop, gradually reducing the volume by 5 points
every second until the volume reaches 0. At that point, the script stops the
song and resets the volume back to the initial volume.
*)

tell application "Music"
	set initialVolume to get the sound volume
	repeat while get the sound volume > 0
		set newVolume to (get the sound volume) - 5
		if newVolume < 0 then
			set newVolume to 0
		end if
		set the sound volume to newVolume
		delay 1
	end repeat
	stop
	set the sound volume to initialVolume
end tell
