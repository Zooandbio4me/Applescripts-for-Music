to ExtractString(AllText, LeftEdge, RightEdge, nthValue)
	set saveTID to text item delimiters
	set text item delimiters to LeftEdge
	set SecondChunk to text item (1 + nthValue) of AllText
	set text item delimiters to RightEdge
	set ExtractedValue to text item 1 of SecondChunk
	set text item delimiters to saveTID
	return ExtractedValue
end ExtractString

on theSplit(theString, theDelimiter)
	set oldDelimiters to AppleScript's text item delimiters
	set AppleScript's text item delimiters to theDelimiter
	set theArray to every text item of theString
	set AppleScript's text item delimiters to oldDelimiters
	return theArray
end theSplit

to replaceText(find, replace, subject)
	set prevTIDs to text item delimiters of AppleScript
	set text item delimiters of AppleScript to find
	set subject to text items of subject

	set text item delimiters of AppleScript to replace
	set subject to subject as text
	set text item delimiters of AppleScript to prevTIDs

	return subject
end replaceText

to QueryDiscogs(ArtistSong, nthItem)

	set Token to "jrfzqtvVfuQOfNYGRsaRxHxdaRtCgxeTZduAzVQv"
	--	you can find your API key at https://www.discogs.com/settings/developers
	set baseURL to "\"https://api.discogs.com/database/search?"
	set AdditionalFilters to "&type=master&format_exact=Single\""
	set AuthString to " -H \"Authorization: Discogs token=" & Token & "\""
	set UserAgent to " --user-agent \"CertunaScript/0.1\""
	set QueryString to "q=" & replaceText(" ", "+", ArtistSong)
	set curl_command to "curl " & baseURL & QueryString & AdditionalFilters & AuthString & UserAgent
	set return to do shell script curl_command
	delay 0.3 -- do not remove, Discogs rate limits API requests to 60 per minute
	set return to my replaceText("\"", "", return)
	set Title to my ExtractString(return, "title: ", ", ", nthItem)
	set ReleaseYear to my ExtractString(return, "year: ", ", ", nthItem)
	set Genres to my ExtractString(return, "genre: [", "],", nthItem)
	set Styles to my ExtractString(return, "style: [", "],", nthItem)

	return {Title, ReleaseYear, Genres, Styles}

end QueryDiscogs

set WriteMultipleGenres to true
set WriteYear to false
set WriteGenres to false
set ManualGenre to false

set Question to display dialog "Do you want to update Year, Genre or both?" buttons {"Year", "Genre", "Both"} default button 3
if button returned of Question is "Year" or button returned of Question is "Both" then
	set WriteYear to true
end if
if button returned of Question is "Genre" or button returned of Question is "Both" then
	set WriteGenres to true
	set Question to display dialog "Choose a Genre per song manually, write one Genre automatically, or write all (multiple) Genres?" buttons {"Choose Genre", "One Genre (Auto)", "Multiple Genres (Auto)"} default button 2
	if button returned of Question is not "Multiple Genres (Auto)" then
		set WriteMultipleGenres to false
	end if
	if button returned of Question is "Choose Genre" then
		set ManualGenre to true
	end if
end if



set Question to display dialog "Write the Discogs Artist - Title to the Comments field?" buttons {"Yes", "No"} default button 2
if button returned of Question is "Yes" then
	set WriteToComments to true
else
	set WriteToComments to false
end if

tell application "Music"
	--tell application "iTunes" --replace the previous line with this if you're on Mojave or earlier
	if selection is not {} then
		set theselectedtracks to selection
		set FilesCounter to 0
		set TagsWrittenCounter to 0
		repeat with thetrack in theselectedtracks
			set FilesCounter to FilesCounter + 1
			try
				set fixed indexing to true
				set ArtistString to my replaceText("& ", "", (get artist of thetrack))
				try
					set ArtistString to first item of my theSplit(ArtistString, " ft ")
				end try
				set SongString to (get name of thetrack)
				try
					set SongString to first item of my theSplit(SongString, " (")
				end try
				set ArtistSong to ArtistString & " " & SongString

				set QueryAnswer to my QueryDiscogs(ArtistSong, 1)
				set ReleaseYear to second item of QueryAnswer
				set ReleaseGenres to third item of QueryAnswer
				set ReleaseGenres to my replaceText(", ", ";", ReleaseGenres)
				set ReleaseStyles to fourth item of QueryAnswer
				set ReleaseStyles to my replaceText(", ", ";", ReleaseStyles)

				set ReleaseGenresStyles to ReleaseGenres
				if ReleaseStyles is not "" then
					set ReleaseGenresStyles to ReleaseGenresStyles & ";" & ReleaseStyles
				end if

				if ManualGenre is true then
					set DialogText to "Choose genre for " & (get artist of thetrack) & " - " & (get name of thetrack)
					if ReleaseGenresStyles contains ";" then
						set GenreArray to my theSplit(ReleaseGenresStyles, ";")
					else
						set first item of GenreArray to ReleaseGenresStyles
					end if
					if length of GenreArray is 1 then
						set GenreStringToWrite to first item of GenreArray
					else
						if length of GenreArray is 2 then
							set GenrePicker to display dialog DialogText buttons {first item of GenreArray, second item of GenreArray} default button 2
						else
							set GenrePicker to display dialog DialogText buttons {first item of GenreArray, second item of GenreArray, third item of GenreArray} default button 2
						end if
						set GenreStringToWrite to button returned of GenrePicker
					end if

				else
					if WriteMultipleGenres is false then
						if ReleaseStyles contains ";" then
							set GenreStringToWrite to first item of theSplit(ReleaseStyles, ";")
						else
							set GenreStringToWrite to ReleaseStyles
						end if
					else
						set GenreStringToWrite to ReleaseGenresStyles

					end if
				end if


				set frontmost to true
				tell thetrack
					set YearWritten to false
					set GenresWritten to false
					if ReleaseYear is not "" and WriteYear is true then
						set year to ReleaseYear
						set YearWritten to true
					end if
					if GenreStringToWrite is not "" and WriteGenres is true then
						set genre to GenreStringToWrite
						set GenresWritten to true
					end if
					if YearWritten is true or GenresWritten is true then
						set TagsWrittenCounter to TagsWrittenCounter + 1
						if WriteToComments is true then
							if comment = "" then
								set comment to first item of QueryAnswer
							else
								set comment to comment & ";" & first item of QueryAnswer
							end if
						end if
					end if
				end tell
			end try
		end repeat
		set DialogText to "Done: " & TagsWrittenCounter & " tags written"
		display dialog DialogText buttons {"ok"}
	end if
end tell
