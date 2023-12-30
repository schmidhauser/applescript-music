-- Handler to delete characters from the specified location in a string
on myDeleteCharacters(originalString, numCharactersToDelete, deleteLocation)
	set len to length of originalString
	
	if numCharactersToDelete ³ len then
		return ""
	else
		if deleteLocation is "From the Beginning" then
			return text (numCharactersToDelete + 1) thru len of originalString
		else -- "From the End"
			return text 1 thru (len - numCharactersToDelete) of originalString
		end if
	end if
end myDeleteCharacters

-- Get the selected tracks in Music
tell application "Music"
	set selectedTracks to selection
	if selectedTracks is {} then
		display dialog "Please select some tracks in the Music app before running this script." buttons {"OK"} default button "OK"
		return
	end if
end tell

-- Choose the tag to delete characters from
set tagOptions to {"Title", "Album", "Album Artist", "Artist/Director", "Category", "Comments", "Composer", "Episode ID", "Grouping", "Show", "Movement", "Work"}
set chosenTag to choose from list tagOptions with prompt "Choose the tag to delete characters from:" default items {"Title"} without multiple selections allowed and empty selection allowed

if chosenTag is false then
	return -- User canceled
end if
set chosenTag to item 1 of chosenTag

-- Ask for the number of characters to delete
set numCharactersToDelete to text returned of (display dialog "Enter the number of characters to delete:" default answer "")

-- Convert the input to a number
try
	set numCharactersToDelete to numCharactersToDelete as integer
on error
	display dialog "Please enter a valid number." buttons {"OK"} default button "OK"
	return
end try

-- Ask where to delete characters from: beginning or end
set deleteLocation to choose from list {"From the Beginning", "From the End"} with prompt "Choose where to delete characters:" default items {"From the End"} without multiple selections allowed and empty selection allowed

if deleteLocation is false then
	return -- User canceled
end if
set deleteLocation to item 1 of deleteLocation

-- Delete characters from the chosen tag for each selected track
tell application "Music"
	repeat with currentTrack in selectedTracks
		set currentTag to {}
		if chosenTag is "Title" then
			set currentTag to name of currentTrack
		else if chosenTag is "Album" then
			set currentTag to album of currentTrack
		else if chosenTag is "Album Artist" then
			set currentTag to album artist of currentTrack
		else if chosenTag is "Artist/Director" then
			set currentTag to artist of currentTrack
		else if chosenTag is "Category" then
			set currentTag to category of currentTrack
		else if chosenTag is "Comments" then
			set currentTag to comment of currentTrack
		else if chosenTag is "Composer" then
			set currentTag to composer of currentTrack
		else if chosenTag is "Episode ID" then
			set currentTag to episode ID of currentTrack
		else if chosenTag is "Grouping" then
			set currentTag to grouping of currentTrack
		else if chosenTag is "Show" then
			set currentTag to show of currentTrack
		else if chosenTag is "Movement" then
			set currentTag to movement of currentTrack
		else if chosenTag is "Work" then
			set currentTag to work of currentTrack
		end if
		
		-- Delete characters from the chosen location
		set newTag to my myDeleteCharacters(currentTag, numCharactersToDelete, deleteLocation)
		
		-- Update the tag with the new value
		if chosenTag is "Title" then
			set name of currentTrack to newTag
		else if chosenTag is "Album" then
			set album of currentTrack to newTag
		else if chosenTag is "Album Artist" then
			set album artist of currentTrack to newTag
		else if chosenTag is "Artist/Director" then
			set artist of currentTrack to newTag
		else if chosenTag is "Category" then
			set category of currentTrack to newTag
		else if chosenTag is "Comments" then
			set comment of currentTrack to newTag
		else if chosenTag is "Composer" then
			set composer of currentTrack to newTag
		else if chosenTag is "Episode ID" then
			set episode ID of currentTrack to newTag
		else if chosenTag is "Grouping" then
			set grouping of currentTrack to newTag
		else if chosenTag is "Show" then
			set show of currentTrack to newTag
		else if chosenTag is "Movement" then
			set movement of currentTrack to newTag
		else if chosenTag is "Work" then
			set work of currentTrack to newTag
		end if
	end repeat
end tell
