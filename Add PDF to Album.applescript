-- (c) 2023 · Andreas U. Schmidhauser

-- Get the selected audio track in Music
tell application "Music"
	set selectedTracks to selection
	if selectedTracks is {} then
		display dialog "Please select an audio track in the Music app before running this script." buttons {"OK"} default button "OK"
		return
	end if
	set audioTrack to item 1 of selectedTracks
end tell

-- Prompt the user to select a PDF file
set pdfFilePath to choose file with prompt "Select the PDF file you want to import:" of type {"com.adobe.pdf"}

-- Import the PDF file into the Music library
tell application "Music"
	set pdfTrack to add pdfFilePath to library playlist 1
	
	-- Get the properties of the selected audio track
	set trackArtist to artist of audioTrack
	set trackAlbum to album of audioTrack
	set trackComposer to composer of audioTrack
	set trackGrouping to grouping of audioTrack
	set trackGenre to genre of audioTrack
	set trackYear to year of audioTrack
	
	-- Set properties to match the selected audio track
	set artist of pdfTrack to trackArtist
	set album of pdfTrack to trackAlbum
	set composer of pdfTrack to trackComposer
	set grouping of pdfTrack to trackGrouping
	set genre of pdfTrack to trackGenre
	set year of pdfTrack to trackYear
end tell
