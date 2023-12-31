-- (c) 2023 · Andreas U. Schmidhauser

-- Get the selected tracks in Music
tell application "Music"
	set selectedTracks to selection
	if selectedTracks is {} then
		display dialog "Please select some tracks in the Music app before running this script." buttons {"OK"} default button "OK"
		return
	end if
end tell

-- Ask for the characters to add
set charactersToAdd to text returned of (display dialog "Enter the characters to add at the start:" default answer "")

-- Add characters to the start of the song title for each selected track
tell application "Music"
	repeat with currentTrack in selectedTracks
		set currentTitle to name of currentTrack
		set newTitle to charactersToAdd & currentTitle
		set name of currentTrack to newTitle
	end repeat
end tell
