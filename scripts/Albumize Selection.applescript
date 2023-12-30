-- Get the selected tracks in Music
tell application "Music"
	set selectedTracks to selection
	if selectedTracks is {} then
		display dialog "Select some tracks in Music before running this script." buttons {"OK"} default button "OK"
		return
	end if
end tell

-- Ask for the album title
set albumTitle to text returned of (display dialog "Enter Album Title:" default answer "")

-- Set the album title and track number for each selected track
tell application "Music"
	repeat with i from 1 to count of selectedTracks
		set currentTrack to item i of selectedTracks
		set album of currentTrack to albumTitle
		set track number of currentTrack to i
	end repeat
end tell
