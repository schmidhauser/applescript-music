# AppleScript Scripts for macOS Music

Though moribund for many years, AppleScript remains the sole (more or less) reliable tool to control macOS and many of its apps such as Music. It’s unclear what will replace it. Automator, too, is on its way out; Shortcuts cannot compare since it is considerably less powerful. So it’s in AppleScript we trust.

##	Scripts  

* [Add Characters to Start of Track Title](https://github.com/schmidhauser/applescript-music/blob/main/Add%20Characters%20to%20Start%20of%20Track%20Title.applescript)\
Use this to add (say) “BWV 988 – ” to the start of all of an album’s tracks in case you don’t like it if they only say “Aria”, etc. (Suggested shortcut: `⌥⌘S`.)

* [Crop Characters](https://github.com/schmidhauser/applescript-music/blob/main/Crop%20Characters.applescript)\
Delete one or many characters from either the beginning or the end of any tag. (Suggested shortcut: `⌥⌘C`.)

* [Search-and-Replace Tag Text](https://github.com/schmidhauser/applescript-music/blob/main/Search-and-Replace%20Tag%20Text.applescript)\
Search any string anywhere, and replace it with something else. (Suggested shortcut: `⌥⌘R`.)

* [Albumize Selection](https://github.com/schmidhauser/applescript-music/blob/main/Albumize%20Selection.applescript)\
An example use case: when I added Quatuor Ébène’s recording of the SQs by Debussy, Ravel, and Fauré to my Music library, I made an ‘album’ out of each of the three works. (Suggested shortcut: `⌥⌘A`.)

* [Add PDF to Album](https://github.com/schmidhauser/applescript-music/blob/main/Add%20PDF%20to%20Album.applescript)\
Select a track from the album to which you’d like to add the PDF file as track, and then run the script *twice* in immediate succession – I’m afraid I’m unable to make it work in one run. (Suggested shortcut: `⌥⌘P`.)

* [Fade and Stop](https://github.com/schmidhauser/applescript-music/blob/main/Fade%20and%20Stop.applescript)\
A simple stop sometimes feels too savage. (Suggested shortcut: `⌥⌘.`.)

* [Fade and Play Next](https://github.com/schmidhauser/applescript-music/blob/main/Fade%20and%20Play%20Next.applescript)\
A variation on the above. (Suggested shortcut: `⌥⇧⌘.`.)

* [Toggle Checkmarks of Selection](https://github.com/schmidhauser/applescript-music/blob/main/Toggle%20Checkmark.applescript)\
Allows you to keep certain tracks in your library, while not having to listen to them when (say) you’re selecting an album. (Suggested shortcut: `⌥⌘X`.)

* [Open Scripts Folder](https://github.com/schmidhauser/applescript-music/blob/main/Open%20Scripts%20Folder.applescript)\
This opens the folder at `~/Library/Music/Scripts`. (Suggested shortcut: `⌥⇧⌘S`.)

##		Format  

The scripts are uncompiled, whence the extension `applescript`. This prevents occasional errors when saving and allows one to use version control. It also makes it easy to quicklook a file. ([Peek](https://www.bigzlabs.com/peek.html) colours them nicely.)

The script files are encoded in UTF-16. To force the Unicode conversion in Script Editor, I used a Greek colon (·) in each script’s initial line. If you remove the character in Script Editor and then resave the file, it will be automatically re-encoded in MacRoman. Script Editor can work with either encoding; but whenever all characters are within the ASCII set, Script Editor will use the MacRoman encoding. GitHub, on the other hand, automatically converts MacRoman to UTF-8. For simplicity’s sake, and to prevent conversion errors, I use UTF-16.

##	Installation  

1. Download the zip file on the right under **Releases**, and unzip it.
2. Create a folder called **Scripts** within the **Music** folder of your user library – either manually or by running the following command in your terminal: `mkdir -p $HOME/Library/Music/Scripts/`. (Nothing will happen to the folder if it already exists.)
3. Move the scripts you’d like to use from where you downloaded them to your **Scripts** folder. (The user library is generally hidden: if you type `⇧⌘.`, you can see all hidden files and folders, including your user library; type the same keystrokes again, and they’re again hidden.)
4. Reopen macOS Music. You’ll now see a new menu with a scroll icon to the left of the **Help** menu. AppleScript scripts appear here: one can select them, assign them to shortcuts, and so forth, just as if they were ordinary menu items.
