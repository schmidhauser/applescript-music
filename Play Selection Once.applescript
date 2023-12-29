tell application "Music"
	set sel to selection
	if sel is not {} and length of sel is 1 then play item 1 of selection with once
end tell