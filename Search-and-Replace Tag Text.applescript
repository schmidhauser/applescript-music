-- Handler to perform search-and-replace on a string
on performSearchAndReplace(originalString, searchString, replaceString)
	set AppleScript's text item delimiters to searchString
	set stringParts to text items of originalString
	set AppleScript's text item delimiters to replaceString
	set newString to stringParts as string
	set AppleScript's text item delimiters to ""
	return newString
end performSearchAndReplace

-- Get the selected tracks in Music
tell application "Music"
	set selectedTracks to selection
	if selectedTracks is {} then
		display dialog "Please select some tracks in the Music app before running this script." buttons {"OK"} default button "OK"
		return
	end if
end tell

-- Choose the tag to perform search-and-replace
set tagOptions to {"Song Name", "Show", "Artist", "Album Artist", "Album", "Composer", "Comments", "Genre", "Grouping", "Movement", "Work"}
set chosenTag to choose from list tagOptions with prompt "Choose the tag for search-and-replace:" default items {"Song Name"} without multiple selections allowed and empty selection allowed

if chosenTag is false then
	return -- User canceled
end if
set chosenTag to item 1 of chosenTag

-- Ask for the search and replacement strings
set searchString to text returned of (display dialog "Enter the search string:" default answer "")
set replaceString to text returned of (display dialog "Enter the replacement string:" default answer "")

-- Perform search-and-replace on the chosen tag for each selected track
tell application "Music"
	repeat with currentTrack in selectedTracks
		set currentTag to {}
		if chosenTag is "Song Name" then
			set currentTag to name of currentTrack
		else if chosenTag is "Show" then
			set currentTag to show of currentTrack
		else if chosenTag is "Artist" then
			set currentTag to artist of currentTrack
		else if chosenTag is "Album Artist" then
			set currentTag to album artist of currentTrack
		else if chosenTag is "Album" then
			set currentTag to album of currentTrack
		else if chosenTag is "Composer" then
			set currentTag to composer of currentTrack
		else if chosenTag is "Comments" then
			set currentTag to comment of currentTrack
		else if chosenTag is "Genre" then
			set currentTag to genre of currentTrack
		else if chosenTag is "Grouping" then
			set currentTag to grouping of currentTrack
		else if chosenTag is "Movement" then
			set currentTag to movement of currentTrack
		else if chosenTag is "Work" then
			set currentTag to work of currentTrack
		end if
		
		-- Perform search-and-replace
		set newTag to my performSearchAndReplace(currentTag, searchString, replaceString)
		
		-- Update the tag with the new value
		if chosenTag is "Song Name" then
			set name of currentTrack to newTag
		else if chosenTag is "Show" then
			set show of currentTrack to newTag
		else if chosenTag is "Artist" then
			set artist of currentTrack to newTag
		else if chosenTag is "Album Artist" then
			set album artist of currentTrack to newTag
		else if chosenTag is "Album" then
			set album of currentTrack to newTag
		else if chosenTag is "Composer" then
			set composer of currentTrack to newTag
		else if chosenTag is "Comments" then
			set comment of currentTrack to newTag
		else if chosenTag is "Genre" then
			set genre of currentTrack to newTag
		else if chosenTag is "Grouping" then
			set grouping of currentTrack to newTag
		else if chosenTag is "Movement" then
			set movement of currentTrack to newTag
		else if chosenTag is "Work" then
			set work of currentTrack to newTag
		end if
	end repeat
end tell
